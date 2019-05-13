<?php
 // INCLUDE ON EVERY TOP-LEVEL PAGE!
$nav_preorder_class='current_page';

include("includes/init.php");
include("includes/header.php");

if (isset($_GET['remove'])) {

    $new_string = '';
    $id = filter_input(INPUT_GET, 'remove', FILTER_VALIDATE_INT);

    $sql = "SELECT * FROM userorders WHERE user_id = :id;";
    $params = array(
        ':id' => $current_user['id']
    );
    $result = exec_sql_query($db, $sql, $params)->fetchAll();

    $list = $result[0]['dishes_list'];
    $order_items = explode(",",$list);
    // print_r($order_items);
    $index = array_search($id, $order_items);

    if (index !== false) {
        unset($order_items[$index]);
    }

    // print_r($order_items);


    foreach ($order_items as $item) {
        $new_string = $new_string.$item.',';
    }

    // print("newstring: ".$new_string);

    $new_string = rtrim($new_string,',');

    // print('new string: '.$new_string);

    $sql = "REPLACE INTO userorders (user_id, dishes_list) VALUES (:id, :order_string)";
    $params = array(
        ':id' => $current_user['id'],
        ':order_string' => $new_string
      );

    $result = exec_sql_query($db, $sql, $params);
}

function print_total_cost($user_id) {

    global $db;
    global $current_user;

    $total_cost = '0';

    $sql = "SELECT * FROM userorders WHERE user_id = :id;";
    $params = array(
        ':id' => $current_user['id']
    );
    $result = exec_sql_query($db, $sql, $params);

    $orders = $result->fetchAll();
    $order = $orders[0];
    $order_id = $order['dishes_list'];

    $order_items = explode(",",$order_id);

    foreach ($order_items as $item) {
        $sql = "SELECT * FROM dishes WHERE id = :item_id;";
        $params = array (
            ':item_id' => $item
        );
        $results = exec_sql_query($db, $sql, $params)->fetchAll();
        $result = $results[0];
        $price = $result['price'];
        $total_cost = $total_cost + $price;
    }

    echo $total_cost;
}

function print_order_item($item_id) {

    global $db;

    $sql = "SELECT * from dishes WHERE id = :id;";
    $params = array(':id' => $item_id);

    $records = exec_sql_query($db, $sql, $params)->fetchAll();

    echo '<div class="menu-item"> '.$records[0]['dish_name'].' | '.$records[0]['dish_description'].' | $'.$records[0]['price'].' | <a href="preorder.php?' . http_build_query( array( 'remove' => $records[0]['id'] ) ) . '"><strong>remove</strong></a></div>' . PHP_EOL;
  } ?>

<!DOCTYPE html>
<html lang="en">

<body>
    <main>
        <div class="margin"></div>
        <div id="pre-order_background_img">
            <h2 class="background_text">Pre-Order</h2>
        </div>

        <div class="content-container">
            <div id="padding" class="menu-container">

                <?php if (is_user_logged_in()) { ?>

                <p>Hello, <?php echo $current_user['username'] ?></p>
                <p>Your order is listed below | Please call <strong>(607) 256-8212</strong> to place the order | Your total will be <strong>$<?php print_total_cost($current_user['id']); ?></strong> plus tax.</p>

                <?php
                $sql = "SELECT * FROM userorders WHERE user_id LIKE '".$current_user['id']."'";
                $result = exec_sql_query($db, $sql);

                $orders = $result->fetchAll();
                $order = $orders[0];
                $order_id = $order['dishes_list'];
                if (strlen($order_id)>0) {
                    $order_items = explode(",",$order_id);
                    foreach($order_items as $item) {
                        print_order_item($item);
                    }
                }

                ?>

                <?php } else { ?>

                <p>You must be logged in to create and save an easy-to-use order. You can <em>log-in</em> or <em>create an account </em><a href="login.php">here</a>.</p>

                <?php } ?>

            </div>




        </div>

        <div class="margin"></div>
    </main>
</body>

<?php include("includes/footer.php"); ?>

</html>
