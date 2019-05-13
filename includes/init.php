<?php
// vvv DO NOT MODIFY/REMOVE vvv

// check current php version to ensure it meets 2300's requirements
function check_php_version()
{
  if (version_compare(phpversion(), '7.0', '<')) {
    define(VERSION_MESSAGE, "PHP version 7.0 or higher is required for 2300. Make sure you have installed PHP 7 on your computer and have set the correct PHP path in VS Code.");
    echo VERSION_MESSAGE;
    throw VERSION_MESSAGE;
  }
}
check_php_version();

function config_php_errors()
{
  ini_set('display_startup_errors', 1);
  ini_set('display_errors', 0);
  error_reporting(E_ALL);
}
config_php_errors();

// open connection to database
function open_or_init_sqlite_db($db_filename, $init_sql_filename)
{
  if (!file_exists($db_filename)) {
    $db = new PDO('sqlite:' . $db_filename);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if (file_exists($init_sql_filename)) {
      $db_init_sql = file_get_contents($init_sql_filename);
      try {
        $result = $db->exec($db_init_sql);
        if ($result) {
          return $db;
        }
      } catch (PDOException $exception) {
        // If we had an error, then the DB did not initialize properly,
        // so let's delete it!
        unlink($db_filename);
        throw $exception;
      }
    } else {
      unlink($db_filename);
    }
  } else {
    $db = new PDO('sqlite:' . $db_filename);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $db;
  }
  return null;
}

function exec_sql_query($db, $sql, $params = array())
{
  $query = $db->prepare($sql);
  if ($query and $query->execute($params)) {
    return $query;
  }
  return null;
}

// ^^^ DO NOT MODIFY/REMOVE ^^^

// You may place any of your code here.
$db = open_or_init_sqlite_db('secure/init.sqlite', 'secure/init.sql');
$employee_number = 2;

//Next section of code referenced from Kyle Harms in INFO 2300 in a log-in log-out controller

define('SESSION_COOKIE_DURATION', 60*60*1);
$session_messages = array();

//Function create account
function create_account($username, $password) {
  global $db;
  global $employee_number;
  global $session_messages;

  if (empty($username) || empty($password)) {
    array_push($session_messages, "Missing Username or Password."); //if no input for username or password fields.
  } else {
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    $sql = "INSERT INTO users (username, password, admin) VALUES (:username_value, :password_value, :admin_value)";
    $params = array(
      ':username_value' => $username,
      ':password_value' => $hashed_password,
      ':admin_value' => $employee_number
    );

    $result = exec_sql_query($db, $sql, $params);
    if ($result) {
      array_push($session_messages, "Successfully Created Account.");
    } else {
      array_push($session_messages, "Error With Creating Account.");
    }
  }
}

//Function to log in user
function log_in($username, $password) {
  global $db;
  global $current_user;
  global $session_messages;


  //checking to ensure that user & pass are set, fetching username first before validating password
  if (isset($username) && isset($password)) {
    $sql = "SELECT * FROM users WHERE username = :username;";
    $params = array(
      ':username' => $username
    );

    $records = exec_sql_query($db, $sql, $params)->fetchAll();
    if ($records) {
      $account = $records[0];

      //verifying password
      if ( password_verify($password, $account['password']) ) {
        $session = session_create_id(); //NOTE: error in VS code here is simply a warning --  does not effect code


        //creating log of session info
        $sql = "INSERT INTO sessions (user_id, session) VALUES (:user_id, :session);";
        $params = array(
          ':user_id' => $account['id'],
          ':session' => $session
        );
        $result = exec_sql_query($db, $sql, $params);
        if ($result) {
          setcookie("session", $session, time() + SESSION_COOKIE_DURATION);

          $current_user = $account;
          return $current_user;
        } else {
          array_push($session_messages, "Failure with Log In."); //an error with the SQL query, not very likely from user problem
        }
      } else {
        array_push($session_messages, "Invalid username or password.");
      }
    } else {
      array_push($session_messages, "Invalid username or password.");
    }
  } else {
    array_push($session_messages, "No Username or Password Info Given");
  }
  $current_user = NULL;
  return NULL;
}

//function is used in session login
function find_user($user_id) {
  global $db;

  $sql = "SELECT * FROM users WHERE id = :user_id;";
  $params = array(
    ':user_id' => $user_id
  );
  $records = exec_sql_query($db, $sql, $params)->fetchAll();
  if ($records) {
    return $records[0];
  }
  return NULL;
}

function find_session($session) {
  global $db;

  if (isset($session)) {
    $sql = "SELECT * FROM sessions WHERE session = :session;";
    $params = array(
      ':session' => $session
    );
    $records = exec_sql_query($db, $sql, $params) ->fetchAll();
    if ($records) {
      return $records[0];
    }
  }
  return NULL;
}

function session_login() {
  global $db;
  global $current_user;

  if (isset($_COOKIE["session"])) {
    $session = $_COOKIE["session"];

    $session_record = find_session($session);

    if(isset($session_record)) {
      $current_user = find_user($session_record['user_id']);
      setcookie("session", $session, time() + SESSION_COOKIE_DURATION);
      return $current_user;
    }
  }
  $current_user = NULL;
  return NULL;
}

function is_user_logged_in($userType = '') {
  global $current_user;
  if ($userType == "") {
    return ($current_user != null);
  } else {
    return $current_user;
  }
}

function log_out() {
  global $current_user;
  setcookie('session', '', time() - SESSION_COOKIE_DURATION);
  $current_user = NULL;
  session_unset();
  session_destroy();
}

if (isset($_POST['login']) && isset($_POST['username']) && isset($_POST['password']) ) {
  $username = trim($_POST['username']);
  $password = trim($_POST['password']);

  log_in($username, $password);
} elseif (isset($_POST['create-account']) && isset($_POST['username']) && isset($_POST['password'])) {
  $username = trim($_POST['username']);
  $password = trim($_POST['password']);

  create_account($username, $password);
  } else {

  //just in case already logged in
  session_login();
}

if (isset($current_user) && (isset($_GET['logout']) || isset($_POST['logout']))) {
  log_out();
}



function display_menu_images($record){
  $imgname = 'uploads/images/menu/'.htmlspecialchars($record['id']).".jpg";
  // echo "<img class='menu_pic' src= 'uploads/images/menu/".htmlspecialchars($record["id"]).".jpg' alt='menu images' />";
  echo '<a href="menu.php?'.http_build_query(array('category'=>$record['category'])).'"><img class="menu_pic" src="'.$imgname.'" alt="'.htmlspecialchars($record['category']).'"/></a>';
}
function display_category($record){
  echo $record['category'];
}
?>
