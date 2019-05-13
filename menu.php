<?php
 // INCLUDE ON EVERY TOP-LEVEL PAGE!
$nav_menu_class='current_page';

include("includes/init.php");
include("includes/header.php");

if (isset($_GET['id'])) {

    global $temp_order_array;

    $id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT); //filter get request to prevent injection

    $sql = "SELECT * FROM userorders WHERE user_id LIKE '".$current_user['id']."'";
    $result = exec_sql_query($db, $sql);

    if ($result) {
        $all_orders = $result->fetchAll();
        $user_order = $all_orders[0];

        $order_string = $user_order['dishes_list'];

        if (strlen($order_string)>0) {
            $order_string .= ','.$id;
        } else {
            $order_string .= $id;
        }

        $sql = "REPLACE INTO userorders (user_id, dishes_list) VALUES (:id, :order_string)";
        $params = array(
        ':id' => $current_user['id'],
        ':order_string' => $order_string
      );

        $result = exec_sql_query($db, $sql, $params);
    }
}

 //$menu_items = exec_sql_query($db, "SELECT * FROM dishes;")->fetchAll();

function print_menu_item($menu_item) {
    //building query for adding menu item to page
    if(is_user_logged_in()){
        echo '<div class="menu-item"> '.$menu_item['dish_name'].' | '.$menu_item['dish_description'].' | $'.$menu_item['price'].' | <a href="menu.php?' . http_build_query( array( 'id' => $menu_item['id'] ) ) . '"><img src="uploads/images/shopping-cart.png" alt="shopping cart"></a></div>' . PHP_EOL;
    }else{
        echo '<div class="menu-item"> '.$menu_item['dish_name'].' | '.$menu_item['dish_description'].' | $'.$menu_item['price'].' | <a href="login.php"><img src="uploads/images/shopping-cart.png" alt="shopping cart"></a></div>' . PHP_EOL;
    }

  }

?>
<!DOCTYPE html>
<html lang="en">

<body>
    <main>
        <div class="margin"></div>

        <div id="menu_background_img">
            <h2 class="background_text">Menu</h2>
        </div>

        <div class="content-container">
        <p>Log in to create and save an easy-to-use order. You can <em>log-in</em> or <em>create an account </em>in the link above.</p>
            <div class="row" id="menu">
                <?php
                    $sql = "SELECT * FROM categories;";
                    $params = array();
                    $records = exec_sql_query($db, $sql, $params);

                    foreach($records as $record) {?>
                        <figure class="fig_caption"">
                            <?php display_menu_images($record);?>
                            <figcaption>
                                <?php echo $record['category']?>
                                <a class= "citation" href = "<?php echo $record['citations']?>">(Citation)</a>
                            </figcaption>
                        </figure>
                    <?php } ?>
            </div>
        </div>


        <div class="content-container">
            <div class="menu-container">

            <!-- Display menu category title -->
            <?php
                if (isset($_GET['category'])) {
                    $category = filter_input(INPUT_GET, 'category', FILTER_SANITIZE_STRING);
                    $sql = "SELECT * FROM categories WHERE category = :category;";
                    $params = array(':category' => $category);
                    // print_r($params);
                    $records = exec_sql_query($db, $sql, $params);
                    // print_r($records);

                    foreach($records as $record) {?>
                        <h1 class="uppercase"><?php display_category($record); ?></h1>
                    <?php }
            }?>

            <!-- Displaying dishes for the category -->
            <div class="item-container">
            <?php

                $sql = "SELECT dishes.id, dish_name, dish_description, price FROM categories INNER JOIN dishes ON dishes.category_id = categories.id WHERE categories.category = :category;";
                $params = array(':category' => $category);

                $records = exec_sql_query($db, $sql, $params)->fetchAll();

                foreach($records as $record) {
                    print_menu_item($record);
                }
            ?>
            </div>
        </div>
    </div>
    <div class="view_menu_div"><a class="view_menu" href = "#menu">Back to Top</a></div>


        <div class="margin"></div>
    </main>
</body>

<?php include("includes/footer.php"); ?>

</html>
