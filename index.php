<?php
 // INCLUDE ON EVERY TOP-LEVEL PAGE!
$nav_home_class='current_page';

include("includes/init.php");
include("includes/header.php");


?>
<!DOCTYPE html>
<html lang="en">

<body>
    <div>

        <div id="home_background_img">
        <a class="citation" href="https://www.wallpaperup.com/uploads/wallpapers/2013/03/21/55838/fb6e6b9f68f803cb84044f4d3846e330-700.jpg">Citations</a>
            <div id="home_title"><h2 id="home_background_text">Plum Tree</h2></div>
            <div class="button-container">
                <a href="#display_about">
                    <div class="down-arrow">V</div>
                </a>
            </div>
        </div>
        <div class="content-container">
            <div class="text_on_img" id="display_about">
                <h1 id="about_title">About Us</h1>
                <p>Located at the heart of Cornell University's Collegetown, Plum Tree Japanese Restaurant offers top-tier dining experience and a wide variety of flavors and tastes. From udon, ramen, and soba, teriyaki and tempura, to an unique assortment of sushi, the menu options are more than exhaustive!</p>
                <p>These top-notch Japanese cuisine are served in a lively environment where parties of all sizes can enjoy the accompany of friends and families. By offering excellent customer service, Plum Tree strives to bring an authentic and enjoyable Japanese experience to everyone. Stop at Plum Tree for a taste of Japanese cuisine at its finest!</p>
                <p>Interested in the food we serve? Check out the menu!</p>
               <div class="view_menu_div"><a class="view_menu" href = "menu.php">View Menu</a></div>
            </div>
        </div>

    </div>
</body>

<?php include("includes/footer.php"); ?>

</html>
