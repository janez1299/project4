<?php
 // INCLUDE ON EVERY TOP-LEVEL PAGE!
$nav_reviews_class='current_page';

include("includes/init.php");
include("includes/header.php");

const MAX_FILE_SIZE = 1000000;

// *Source: Kyle Harms INFO 2300 Spring 2019 Lab 8 (shoes.php)
function star_rating($rating) {
    $result = "";
    for ($iterator=1; $iterator<=5; $iterator++) {
        if($iterator <= $rating) {
            $result = $result . "★";
        } else {
            $result = $result . "☆";
        }
    }
    return $result;
}
?>
<!DOCTYPE html>
<html lang="en">
<link href="styles/all.css" rel="stylesheet" type="text/css" />
<body>
    <div id="reviews_background_img">
        <h2 class="background_text">Reviews</h2>
    </div>

    <div class="content-container">
        <?php
        //Users must be logged in before adding a review
        if(isset($_POST['add_review']) && is_user_logged_in()) {
            $upload_info = $_FILES["photo"];
            if ($upload_info["error"] == "UPLOAD_ERR_OK") {
                $username = $current_user['username'];
                $service_rating = filter_input(INPUT_POST,'service_rating',FILTER_SANITIZE_SPECIAL_CHARS);
                $food_rating = filter_input(INPUT_POST,'food_rating',FILTER_SANITIZE_SPECIAL_CHARS);
                $waittime_rating = filter_input(INPUT_POST,'waittime_rating',FILTER_SANITIZE_SPECIAL_CHARS);
                $overall_rating = filter_input(INPUT_POST,'overall_rating',FILTER_SANITIZE_SPECIAL_CHARS);
                $comments = filter_input(INPUT_POST,'comment',FILTER_SANITIZE_SPECIAL_CHARS);
                $basename = basename($upload_info["name"]);
                $upload_ext = strtolower(pathinfo($basename,PATHINFO_EXTENSION));

                if ($servie_rating == "" || $food_rating == "" || $waittime_rating=="" || $overall_rating==""){
                    echo("<p class=\"warning\">You must input a rating for all the criteria.</p>");
                }
                if ($comments == "") {
                    echo("<p class=\"warning\">You must fill out the comments section.</p>");
                }
                else {
                $sql = "INSERT INTO images(file_ext) VALUES (:file_ext)";
                $params = array (
                    ':file_ext' => $upload_ext
                );

                $result = exec_sql_query($db,$sql,$params);
                $id =$db->lastInsertId("id");

                $sql2 = "INSERT INTO reviews (user_id, service,food,wait_time,overall,comment,image_id) VALUES (:user_id, :service, :food, :wait_time,
                :overall, :comment,:image_id)";

                $params2 = array(
                    ':user_id' => $current_user['id'],
                    ':service' => $service_rating,
                    ':food' => $food_rating,
                    ':wait_time' => $waittime_rating,
                    ':overall' => $overall_rating,
                    ':comment' => $comments,
                    ':image_id' => $id
                );

                $add_result = exec_sql_query($db,$sql2,$params2);
                $new_path = "uploads/images/reviews/" . $id . "." . $upload_ext;
                move_uploaded_file($upload_info["tmp_name"],$new_path);

            echo("<p class=\"warning\">Thank you for your feedback. Your review has been added!</p>");
            }
        } else {

             // displays warning message if user does not provide a file name or if the file exceeds the maximum size
             echo("<p class=\"warning\">You must upload an image for the review. File name cannot be empty and cannot exceed the maximum size. Please resubmit the form.</p>");
        }
        }
        ?>


        <div class="row">
        <p class="feedback">Want to share your dining experience at Plum Tree? Leave us some feedback! </p>
        <form id="add_review_form" class="review" action="reviews.php" method="post" enctype="multipart/form-data">
        <fieldset class="review">
            <legend class="review"> Add a Review </legend>
            <p class="review_form">Please input the following information: <p>
                <input type="hidden" name="MAX_FILE_SIZE" value="<?php echo MAX_FILE_SIZE; ?>" />
                <ul>
                    <li>Service Rating:
                        <select name="service_rating">
                            <option value="0">None Selected</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </li>
                    <li>Food Rating:
                    <select name="food_rating">
                            <option value="0">None Selected</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </li>
                    <li>Wait Time Rating:
                    <select name="waittime_rating">
                            <option value="0">None Selected</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </li>
                    <li>Overall Rating:
                    <select name="overall_rating">
                            <option value="0">None Selected</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </li>
                    <li> Photo:
                        <input type="file" id="photo" name="photo" accept="image/.png,image/.jpeg" />
                    </li>
                    <li>Additional Comments:
                        <textarea name="comment" rows="5" cols="100"></textarea>
                    </li>
                </ul>
                <input id="button" class="review_button" name="add_review" type="submit" value="Submit">
        </fieldset>
        </form>

        <p class="feedback2"> Read our previous reviews here... </p>

            <ul class="sort">
                <li class="sort"> Sort Reviews By
                    <select name="field">
                        <option value="0">None Selected</option>
                        <option value="service">By Service</option>
                        <option value="food">By Food</option>
                        <option value="wait_time">By Wait Time</option>
                        <option value="overall">By Overall</option>
                    </select>
                </li>
            </ul>

            <?php
            $sql = "SELECT service, food, wait_time, overall, comment, image_id, file_ext, username FROM reviews LEFT JOIN images ON reviews.image_id = images.id INNER JOIN users ON users.id = user_id;";
            $params = array();
            $records = exec_sql_query($db,$sql,$params);

            echo("<table>");

            foreach($records as $record) {
                ?>
                <tr class="review">
                    <td class="review">
                        <img src="<?php echo ("uploads/images/reviews/" . $record["image_id"] . "." . $record["file_ext"]) ?>" class="reviews_img" alt="Review Image">
                    </td>
                    <td>
                        <?php
                        $sections = array(
                            "service" => "Service",
                            "food" => "Food",
                            "wait_time" => "Wait Time",
                            "overall" => "Overall"
                        );
                        echo("<p class=\"username\">Username: ");
                        echo($record["username"]);
                        echo("</p>");
                        foreach (array_keys($sections) as $section) {
                            $rating = intval($record[$section]);
                            ?>
                            <p class="review"><?php echo ($sections[$section] . " Rating: " . star_rating($rating)) ?></p>
                            <?php
                        }
                        echo("<p class=\"review\">Comment: " . $record["comment"] . "</p>");
                        ?>
                    </td>
                </tr>
                <?php
        }
        echo ("</table>");
    ?>
        <a href="#" class="previous">&laquo; Previous</a>
        <a href="#" class="next">Next &raquo;</a>

        </div>
    </div>
</body>


<?php include("includes/footer.php"); ?>

</html>
