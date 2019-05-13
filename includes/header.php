<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" type="text/css" href="styles/all.css" /><!--
  <script type="text/javascript" src="scripts/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="scripts/main.js"></script>-->

    <?php if (isset($_GET['logout'])) {
        log_out();
    }
    ?>


  <div class = "nav-bar-top">
      <div class = "title-container">
      <a id= "plum-tree-button" href = "index.php">PLUM TREE</a>
      </div>

      <div class="empty-container">
      </div>
      <div class = "nav-container">
          <?php if (is_user_logged_in()) { ?>
            <a href = "?logout=1" class="<?php echo $nav_login_class?>">Logout <?php echo $current_user['username']; ?></a>
          <?php } else { ?>
          <a href = "login.php" class="<?php echo $nav_login_class?>">Login</a>
          <?php } ?>
          <a href = "preorder.php" class="<?php echo $nav_preorder_class?>">Call in Order</a>
          <a href = "reviews.php" class="<?php echo $nav_reviews_class?>">Reviews</a>
          <a href = "gallery.php" class="<?php echo $nav_gallery_class?>">Gallery</a>
          <a href = "menu.php" class="<?php echo $nav_menu_class?>">Menu</a>
          <a href = "index.php" class="<?php echo $nav_home_class?>">Home</a>
      </div>
  </div>

</head>
