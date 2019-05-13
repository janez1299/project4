<?php
 // INCLUDE ON EVERY TOP-LEVEL PAGE!
$nav_login_class='current_page';

include("includes/init.php");
include("includes/header.php");

?>
<!DOCTYPE html>
<html lang="en">

<body>
    <main>
        <div class="margin"></div>
        <div id="login_background_img">
            <h2 class="background_text">User Page</h2>
        </div>

        <div class="content-container">
            <div id="padding" class="menu-container">
                <p>You can either create an account or log in on this page. By creating an account, you can create and store orders to make it easier when calling the restaurant. You can also track your favorite orders.</p>
                <p>To create an account, simply enter new information, and click 'create account.'</p>

                <?php if (is_user_logged_in()) { ?>

                <p>Hello, you are logged in as: <?php echo $current_user['username'] ?></p>

                <?php } else { ?>

                    <form id="loginForm" action="<?php echo htmlspecialchars( $_SERVER['PHP_SELF'] ); ?>"method="post">
                <ul>
                    <div class="inputs">
                        <li>
                        <label for="username">Username:</label>
                        <input id="username" type="text" name="username" />
                        </li>
                        <li>
                        <label for="password">Password:</label>
                        <input id="password" type="password" name="password" />
                        </li>
                    </div>
                    <div class="submit-button">
                        <li>
                        <button name="login" type="submit">Sign In</button>
                        </li>
                    </div>
                    <div class="create-account-button">
                        <li>
                        <button name="create-account" type="submit">Create Account</button>
                        </li>
                    </div>
                    <ul>
                        <?php
                        foreach ($session_messages as $message) {
                            echo '<div class="error-message"><strong>' . htmlspecialchars($message) . '</strong></div>';
                        }
                        ?>
                    </ul>
                </ul>
            </form>

                <?php } ?>

            </div>




        </div>

        <div class="margin"></div>
    </main>
</body>

<?php include("includes/footer.php"); ?>

</html>
