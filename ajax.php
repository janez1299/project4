<?php
	include("includes/init.php");
	if ($_SERVER['REQUEST_METHOD'] == "POST") {
		if (isset($_POST['theID']) && isset($_POST['theEX'])) {
			$ID = intval($_POST['theID']);
			$TE = filter_var($_POST['theEX'], FILTER_SANITIZE_SPECIAL_CHARS);
			$SQL = "DELETE FROM `gallery_images` WHERE `id` = ?";
			$DEL = exec_sql_query($db, $SQL, array($ID));
			unlink("uploads/images/gallery/" . $ID . "." . $TE);
		}
	}
?>