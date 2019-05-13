<?php
 // INCLUDE ON EVERY TOP-LEVEL PAGE!
$nav_gallery_class='current_page';

include("includes/init.php");
include("includes/header.php");


$upload_messages = array();
const MAX_FILE_SIZE = 1000000;
if (isset($_POST["upload"])&& is_user_logged_in()) {
    $upload_info = $_FILES["addimg"];
    $upload_alt = filter_input(INPUT_POST, 'alt', FILTER_SANITIZE_STRING);
    if ($upload_info['error'] == UPLOAD_ERR_OK) {
        $upload_name = basename($upload_info["name"]);
        $upload_ext = strtolower(pathinfo($upload_name, PATHINFO_EXTENSION));
        $sql = "INSERT INTO gallery_images(filename, ext, alt) VALUES(:filename, :ext, :alt );";
        $params = array(
            ':filename' => $upload_name,
            ':ext' => $upload_ext,
            ':alt' => $upload_alt,
          );
        $result = exec_sql_query($db, $sql, $params);
        if ($result) {
            $file_id = $db->lastInsertId('id');
            $id_filename = "uploads/images/gallery/" . $file_id . "." . $upload_ext;
            move_uploaded_file($upload_info['tmp_name'], $id_filename);
        }
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<link href="styles/all.css" rel="stylesheet" type="text/css" />
<link href="styles/font-awesome.min.css" rel="stylesheet" type="text/css" />
<body>
    <div id="gallery_background_img">
        <h2 class="background_text">Gallery</h2>
    </div>

    <div class="content-container">

    <div class='row'>
    <?php
    $records = exec_sql_query($db, "SELECT * FROM gallery_images")->fetchAll(PDO::FETCH_ASSOC);
    foreach ($records as $record) {
        echo "<div class='imgContainer'>";
        if (is_user_logged_in()) {
            if (is_user_logged_in('dumpVal')['admin'] == 1) {
                echo "<i class='fa fa-fw fa-times onClickRImage' aria-hidden='true' data-class='" . htmlspecialchars($record["id"]) . "' data-id='" . htmlspecialchars($record["ext"]) . "'></i>";
            }
        }
        echo "<img class='gallery_pic' src= 'uploads/images/gallery/".htmlspecialchars($record["id"]).".".htmlspecialchars($record["ext"])."' description = '".htmlspecialchars($record["description"])."'/></div>";
    }
    ?>
  </div>
        </div>

        <?php if (is_user_logged_in()){
            if (is_user_logged_in('dumpVal')['admin'] == 1) {
             ?>

        <form id="uploadimage" action="gallery.php" method="post" enctype="multipart/form-data">
        <fieldset>
            <legend>Add/Delete an Image</legend>
        <ul>
            <li>
                <input type="hidden" name="MAX_FILE_SIZE" value="<?php echo MAX_FILE_SIZE; ?>"/>
                <label for="addimg"> Choose an Image:</label>
                <input id="addimg" type="file" name="addimg">
    </li>
    <li>
        <button name="upload" type="submit">Upload File</button>
    </li>
    </ul>
    </fieldset>
    </form>
    <script src="jquery-3.1.1.min.js"></script>
    <script>
        var result;
        $(".onClickRImage").on("click", function () {
            result = window.confirm("Are you sure ?");
        });
        $(".onClickRImage").on("click", function () {
            if (result) {
                var that = $(this),
                    theID = that.attr("data-class"),
                    theEX = that.attr("data-id");
                $.ajax({
                    url: "ajax.php",
                    type: 'POST',
                    data: {theID: theID, theEX: theEX},
                    success: function (data) {
                        that.parent().remove();
                    }
                 });
            }
        });
    </script>
<?php       }
        } else{
        }
        ?>
</body>
<?php include("includes/footer.php"); ?>

</html>
