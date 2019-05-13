-- TODO: Put ALL SQL in between `BEGIN TRANSACTION` and `COMMIT`
BEGIN TRANSACTION;


-- categories table
CREATE TABLE categories (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	category TEXT NOT NULL UNIQUE,
    citations TEXT
);

-- dishes table
CREATE TABLE dishes (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    dish_name TEXT NOT NULL,
    dish_description TEXT NOT NULL,
    category_id INTEGER NOT NULL,
    price INTEGER NOT NULL
);

-- users table
CREATE TABLE users (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    admin INTEGER NOT NULL
);

-- sessions table
CREATE TABLE sessions (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	user_id INTEGER NOT NULL,
	session TEXT NOT NULL UNIQUE
);

-- reviews table
CREATE TABLE reviews (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    user_id INTEGER NOT NULL,
    service INTEGER NOT NULL,
    food INTEGER NOT NULL,
    wait_time INTEGER NOT NULL,
    overall INTEGER NOT NULL,
    comment TEXT NOT NULL,
    image_id INTEGER NOT NULL UNIQUE
);

-- images table (for reviews)
CREATE TABLE images (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    file_ext TEXT
);


-- orders table
CREATE TABLE userorders (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    user_id INTEGER NOT NULL UNIQUE,
    dishes_list TEXT
);

-- categories seed data
INSERT INTO categories (category, citations) VALUES ('appetizers', 'http://images.media-allrecipes.com/userphotos/960x960/4784469.jpg');
INSERT INTO categories (category, citations) VALUES ('soup', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/miso-soup-horizontal-jpg-1529350400.jpg');
INSERT INTO categories (category, citations) VALUES ('salad', 'https://d1alt1wkdk73qo.cloudfront.net/images/guide/105897bdb4ce44b5977aa261c77a7e9e/640x478_ac.jpg');
INSERT INTO categories (category, citations) VALUES ('noodle', 'https://sharedappetite.com/wp-content/uploads/2018/02/spicy-lamb-coconut-curry-ramen-5-copy.jpg');
INSERT INTO categories (category, citations) VALUES ('rice', 'https://japan.recipetineats.com/wp-content/uploads/2017/03/Katsu-Curry2.jpg');
INSERT INTO categories (category, citations) VALUES ('sushi entree', 'https://img.grouponcdn.com/iam/iF513Z3oSKacycWGpEjS/xu-2048x1229/v1/c700x420.jpg');
INSERT INTO categories (category, citations) VALUES ('fried dishes', 'https://static01.nyt.com/images/2013/10/23/dining/23JPFLEX1/23JPFLEX1-articleLarge.jpg');
INSERT INTO categories (category, citations) VALUES ('teppan plate', 'https://i0.wp.com/www.angsarap.net/wp-content/uploads/2016/05/Vegetable-Teppanyaki-Wide.jpg?ssl=1');
INSERT INTO categories (category, citations) VALUES ('yakitori', 'https://www.justonecookbook.com/wp-content/uploads/2014/04/Yakitori.jpg');
INSERT INTO categories (category, citations) VALUES ('bento boxes', 'http://www.goodchefbadchef.com.au/wp-content/uploads/2016/02/GCBC8_EP29_Bento-Box-700x404.jpg');
INSERT INTO categories (category, citations) VALUES ('a la carte sushi', 'https://lh3.googleusercontent.com/-8WFgIq-EON4/UBsAYjqlKoI/AAAAAAAALks/TBfAvFYI1gEzg8beTWmpt-fuF1ITSDoagCHMYBhgL/s1600/Kurumazushi%2B%2528Edited%2529%2B2568.jpg');
INSERT INTO categories (category, citations) VALUES ('sides', 'https://media-cdn.tripadvisor.com/media/photo-s/04/ce/e7/75/duru.jpg');
INSERT INTO categories (category, citations) VALUES ('beverages', 'https://www.japanesecooking101.com/wp-content/uploads/2015/06/IMG_8848.jpg');
INSERT INTO categories (category, citations) VALUES ('desserts', 'https://www.justonecookbook.com/wp-content/uploads/2014/06/Mochi-Ice-Cream.jpg
');

-- DISHES TABLE SEED DATA

-- Appetizers Seed Data
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('edamame', 'steamed young soybean', 1, 4.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('hijiki', 'black seaweed', 1, 4.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('shumai', 'steamed shrimp dumplings', 1, 5.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('gyoza', 'fried pork/vegetable dumplings', 1, 5.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('age tofu', 'fried tofu with tempura sauce', 1, 4.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('age imo', 'sweet potato french fries', 1, 4.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('ohitashi', 'steamed spinach with tempura sauce', 1, 4.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('satsuma-age', 'fried fish cake', 1, 4.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('korokke', 'japanese hash brown', 1, 4.50);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('harumaki', 'vegetable spring roll', 1, 4.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('kurobuta', 'black pork sausage', 1, 4.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('kalbi', 'beef short rib', 1, 9.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('calamari', 'fried squid', 1, 6.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('hamachi kama', 'fried squid', 1, 9.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('sake kama', 'grilled yellowtail jaw', 1, 7.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('sanma', 'grilled pike fish', 1, 5.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('dynamite', 'spicy tuna with salad', 1, 7.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('sashimi', '5 pieces of chef choice of sashimi', 1, 9.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('soft shell crab', 'fried soft shell crab', 1, 8.50);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('kushi-katsu', 'fried pork on skewer', 1, 6.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('kara-age', 'japanese fried chicken', 1, 6.25);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('shrimp & vegetable tempura', 'shrimp and vegetable fried dish', 1, 8.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('shishi-maki', 'beef with asparagus/scallion', 1, 9.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('ika-shoga', 'squid with ginger sauce', 1, 7.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('pajun', 'pancake with seafood/kimchi', 1, 7.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('tamago-yaki', 'egg custard', 1, 5.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('kara-ika', 'spicy squid', 1, 6.25);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('buta-kimchi', 'pork belly with kimchi', 1, 7.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('mapo-tofu', 'pork belly with tofu', 1, 7.25);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('yasai-itame', 'sauteed vegetable', 1, 6.50);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('vegetable only tempura', 'fried vegetable', 1, 7.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('crispy rice with spicy tuna','spicy tuna served with sesame sauce',  1, 11.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('pepper tuna tataki', 'tuna sidedish', 1, 11.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('tako yaki', 'fried octopus balls', 1, 5.95);

-- Soup Seed Data
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('miso soup', 'traditional Japanese soup', 2, 1.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('wakame soup', 'clear seaweed soup', 2, 2.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('hama-sui', 'clear clam soup', 2, 3.25);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('kimchi soup', 'kimchi, pork & vegetable', 2, 7.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('motsu-nabe', 'pork & vegetable', 2, 7.95);

-- Salad Seed Data
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('house salad', 'vegetables', 3, 2.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('tuna with spicy yuzu', 'tuna with japanese lime', 3, 12.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('avocado salad', 'avocado with wasabi mayo', 3, 8.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('mikado salad', 'crabmeat with spicy mayo', 3, 7.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('green seaweed salad', 'seaweed and vegetables', 3, 5.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('tofu salad', 'tofu and vegetables', 3, 6.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('grilled chicken salad', 'chicekn and vegetables', 3, 9.95);

-- Noodle Seed Data
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Udon (Hot)', 'white thick noodle soup', 4, 7.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Udon (Cold)', 'udon noodle with tempura flakes', 4, 7.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Soba (Hot)', 'thin buck-wheat noodle soup', 4, 7.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Soba (Cold)', 'soba noodle with tempura flakes', 4, 7.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Tonkatsu ramen', 'egg noodle in pork broth', 4, 11.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Miso Ramen', 'egg noodle with miso broth', 4, 11.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Nabeyaki Udon', 'udon with fish and tempura toppings ', 4, 11.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Yaki Udon', 'stir-fried noodle with vegetable', 4, 11.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Yaki Soba', 'stir fried egg noodle', 4, 11.95);

-- Rice Seed Data
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Curry Rice', 'Japanese style vegetable curry', 5, 8.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('curry rice with meat', 'chicken, beef, tonkatsu or chicken katsu', 5, 11.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('fried rice', 'with chicken/pork/salmon/shrimp/kimchi toppings', 5, 8.95);

-- Sushi Entree Seed Data
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('sushi regula', '7pcs of chef choice & 6pcs of tuna rolls', 6, 18.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('sushi deluxe', '10pcs of chef choice & 6pcs of tuna rolls', 6, 22.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('sashimi dinner', '15pcs of chef choice sashimi', 6, 22.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ("sushi sashimi lover's", '12pcs of chef choice sashimi, 5pcs of sushi, & 6pcs of tuna rolls', 6, 28.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('tekka don', '10pcs of tuna sashimi', 6, 22.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('special boat (for 2)', '15pcs of chef choice sashimi, 10pcs of sushi and rolls', 6, 56.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('sushi (for 2)', '20pcs of chef choice sushi and rolls', 6, 45.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('una don', 'broiled eel over white rice', 6, 19.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('chirashi', 'variety of sashimi, vegetables, & egg custard', 6, 22.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('vegetable maki', 'japanese vegetable roll', 6, 13.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('salmon don', '10 pcs of salmon sashimi with seasoned sushi rice', 6, 21.95);

-- Fried Dishes Seed Data
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('shrimp & vegetable tempura', 'deep fried shrimp & vegetable', 7, 17.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('chicken & vegetable tempura', 'deep fried chicken & vegetable', 7, 17.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('plum tree tempura', 'deep fried shrimp, chicken, salmon, & vegetable', 7, 19.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('vegetable tempura', 'deep fried vegetables', 7, 13.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('chicken katsu', 'deep fried chicken', 7, 14.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('tonkatsu', 'depe fried pork', 7, 14.95);

-- Teppan Plate Seed Data
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('chicken teriyaki', 'served with vegetable, rice & house salad', 8, 13.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('beef teriyaki', 'served with vegetable, rice & house salad', 8, 18.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('salmon teriyaki', 'served with vegetable, rice & house salad', 8, 18.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('shrimp teriyaki', 'served with vegetable, rice & house salad', 8, 18.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('tofu teriyaki', 'served with vegetable, rice & house salad', 8, 12.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('vegetable teriyaki', 'served with vegetable, rice & house salad', 8, 12.95);

-- Yakitori Seed Data
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('miso eggplant', 'eggplant with miso', 9, 5.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('chicken breast', 'three chicken breast skewwered', 9, 7.95);

-- Bento Boxes Seed Data
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('chicken box', 'chicken with shrimp & vegetable tempura', 10, 19.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('beef box', 'beef with shrimp & vegetable tempura', 10, 19.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('salmon box', 'salmon with shrimp & vegetable tempura', 10, 19.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('sushi box', 'sushi with shrimp & vegetable tempura', 10, 22.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('shishimaki box', 'asparagus/scallion with shrimp & vegetable tempura', 10, 22.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('vegetarian box', 'vegetable with shrimp & vegetable tempura', 10, 18.95);

-- A La Carte Sushi Seed Data
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Magura', 'tuna sushi', 11, 5.00);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Hamachi', 'yellowtail sushi', 11, 5.00);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Sake ', 'salmon sushi', 11, 5.00);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Tai', 'Red Snapper sushi', 11, 5.00);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Hirame', 'fluke sushi', 11, 5.00);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Ama-ebi', 'sweet shrimp sushi', 11, 5.00);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Tako', 'Octopus sushi', 11, 5.00);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Saba', 'Mackerel sushi', 11, 5.00);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Kani', 'crab stick sushi', 11, 4.50);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Ebi', 'shrimp sushi', 11, 5.00);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Suzuki', 'Striped Bass', 11, 5.00);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Ika', 'Squid sushi', 11, 5.00);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Hokki', 'surf clam sushi', 11, 5.00);

-- Sides Seed Data
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Kimchi', 'fermented cabbage', 12, 4.50);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Oshinko', 'pickled radish', 12, 4.50);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Spicy Mayo', 'sauce', 12, 1.00);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Teriyaki Sauce', 'sauce', 12, 1.00);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Jalapeno Mayo', 'sauce', 12, 1.00);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Rice', 'a bowl of rice', 12, 1.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Sushi Rice', 'sweetened rice', 12, 2.50);

-- Beverages Seed Data
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Green Tea', 'Cold/Warm', 13, 1.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Juice', 'orange/apple', 13, 2.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Sparkling Water', 'Bottled', 13, 2.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Japanese Marble Soda', 'soda with marble in bottle', 13, 2.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Soda', '12oz coke/sprite', 13, 1.95);

-- Desserts Seed Data
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Green Tea Ice Cream', 'Consistency cannot be guaranteed for delivery and pick-up orders', 14, 3.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Green Tea TempuraIce Cream', 'Consistency cannot be guaranteed for delivery and pick-up orders', 14, 5.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Mochi Ice Cream', 'Consistency cannot be guaranteed for delivery and pick-up orders', 14, 4.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Fried Cheese Cake', 'Consistency cannot be guaranteed for delivery and pick-up orders', 14, 5.95);
INSERT INTO dishes (dish_name, dish_description, category_id, price) VALUES ('Fried Banana', 'Consistency cannot be guaranteed for delivery and pick-up orders', 14, 6.95);

-- gallery seed data
CREATE TABLE "gallery_images" (
     'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    'filename' TEXT NOT NULL,
    'ext' TEXT NOT NULL,
    'alt' TEXT
);

INSERT into 'gallery_images' (filename, ext, alt) VALUES ('1','png', 'plum tree restaurant');
-- source: original content, Plum Tree Restaurant in Ithaca.
INSERT into 'gallery_images' (filename, ext, alt) VALUES ('2','png', 'plum tree restaurant');
-- source: original content, Plum Tree Restaurant in Ithaca.
INSERT into 'gallery_images' (filename, ext, alt) VALUES ('3','png', 'plum tree restaurant');
-- source: original content, Plum Tree Restaurant in Ithaca.
INSERT into 'gallery_images' (filename, ext, alt) VALUES ('4','png', 'plum tree restaurant');
-- source: original content, Plum Tree Restaurant in Ithaca.
INSERT into 'gallery_images' (filename, ext, alt) VALUES ('5','png', 'plum tree restaurant');
-- source: original content, Plum Tree Restaurant in Ithaca.
INSERT into 'gallery_images' (filename, ext, alt) VALUES ('6','png', 'plum tree restaurant');
-- source: original content, Plum Tree Restaurant in Ithaca.
INSERT into 'gallery_images' (filename, ext, alt) VALUES ('7','png', 'plum tree restaurant');
-- source: original content, Plum Tree Restaurant in Ithaca.
INSERT into 'gallery_images' (filename, ext, alt) VALUES ('8','png', 'plum tree restaurant');
-- source: original content, Plum Tree Restaurant in Ithaca.
INSERT into 'gallery_images' (filename, ext, alt) VALUES ('9','png', 'plum tree restaurant');
-- source: original content, Plum Tree Restaurant in Ithaca.
INSERT into 'gallery_images' (filename, ext, alt) VALUES ('10','png', 'plum tree restaurant');
-- source: original content, Plum Tree Restaurant in Ithaca.
INSERT into 'gallery_images' (filename, ext, alt) VALUES ('11','png', 'plum tree restaurant');
-- source: original content, Plum Tree Restaurant in Ithaca.
INSERT into 'gallery_images' (filename, ext, alt) VALUES ('12','png', 'plum tree restaurant');
-- source: original content, Plum Tree Restaurant in Ithaca.

-- TODO: FOR HASHED PASSWORDS, LEAVE A COMMENT WITH THE PLAIN TEXT PASSWORD!

-- users seed data
INSERT INTO users(id,username,password,admin) VALUES (1,'admin1','$2y$10$gRxH3ALbwjvb0K8MXzObl.32G9KSPtZ/WK3J7BK0efBLRG4olU8uu',1); --password: iloveplumtree
INSERT INTO users(id,username,password,admin) VALUES (2,'admin2','$2y$10$7JAqlf54InhsHTQqfYu6KeTaBJz0JlGWa3I5cTxYC9lcsMVNQ5Fkm',1); --password: sushi
INSERT INTO users(id,username,password,admin) VALUES (3,'jz482','$2y$10$Ot7ZE9kWXmQefOeazZUgnu4op7v.TE9ioqOzXynJgZjtckdOjrnnW',2); --password: ramen
INSERT INTO users(id,username,password,admin) VALUES (4,'gs484','$2y$10$gXDQY3L7iueLrLvtof7Lduhh2vMJ.saSJk.3Q/zPNZTnfL1INRDmu',2); --password: wasabi
INSERT INTO users(id,username,password,admin) VALUES (5,'ts142','$2y$10$.ASHBwvJYOYCRPKFjc.clumu2Puh3SbjdwdMDZZh2BS5aItCVpk0i',2); --password: hungry1212
INSERT INTO users(id,username,password,admin) VALUES (6,'tinajohnson','$2y$10$KkxyaZgkNEyXHuyK72UCZeU7WNtoqQxrmPGi3RXYM4e0v0pqe.VE.',2); --password: tjohnson73
INSERT INTO users(id,username,password,admin) VALUES (7,'chrissy12','$2y$10$TV/bRMDyX46v/wHSNFhv3.yBgjVOlZLWOzrUZhpnAzCR4N49dO9SG',2); --password: streetartist
INSERT INTO users(id,username,password,admin) VALUES (8,'lunag9','$2y$10$cQSm/fFa2.9wWf9EACDNpuO6vQxrtbaz.dl2QzUGU5TaXgcOQZyZq',2); --password: pisces
INSERT INTO users(id,username,password,admin) VALUES (9,'jeanpierre50','$2y$10$.sSN4tJA67bg9M4T16Fm9.6lypqjgy0MB1fioTBGW1PI9mSpHRmw2',2); --password: parisforever
INSERT INTO users(id,username,password,admin) VALUES (10,'claudiam','$2y$10$pr381x3Ia6mHGqGKgsMl0uehlzVKdHSNPjMSA8ixxpkDViTdRRKVS',2); --password: magic32

-- reviews table seed data
INSERT INTO reviews(id,user_id,service,food,wait_time,overall,comment,image_id) VALUES (1,3,4,5,4,4.5,"Mermaid roll is my all time favorite! Highly recommended! California sunrise and sukiyaki are also perfect for a chilly day. Plum tree is definitely the best Japanese restaurant at ctown.",1);
INSERT INTO reviews(id,user_id,service,food,wait_time,overall,comment,image_id) VALUES (2,4,5,4,5,4,"The sake kama (grilled salmon collar) is really good, grilled perfectly with nice char and cooked through, but small and overpriced.",2);
INSERT INTO reviews(id,user_id,service,food,wait_time,overall,comment,image_id) VALUES (3,6,5,5,5,5,"I love Plum Tree, such a fun ambiance and great food. Quick service and since they have so many selections I never get bored with the menu!",3);
INSERT INTO reviews(id,user_id,service,food,wait_time,overall,comment,image_id) VALUES (4,7,4,4,4,4,"I'd recommend coming here for lunch as their lunch special bento boxes are a great value at 9.95. Their cooked food (teriyaki, skewers) are actually pretty good.",4);
INSERT INTO reviews(id,user_id,service,food,wait_time,overall,comment,image_id) VALUES (5,8,4,4,4,4,"Plum Tree gets the job done and satisfies my late evening sushi cravings. As a tip for first timers, I would suggest going to their more reasonably priced lunch hour times.",5);
INSERT INTO reviews(id,user_id,service,food,wait_time,overall,comment,image_id) VALUES (6,10,4,5,4,4,"The ice cream tempura is amazing.",6);

-- images table seed data
INSERT INTO images(id,file_ext) VALUES (1,'jpg');
INSERT INTO images(id,file_ext) VALUES (2,'jpg');
INSERT INTO images(id,file_ext) VALUES (3,'jpg');
INSERT INTO images(id,file_ext) VALUES (4,'jpg');
INSERT INTO images(id,file_ext) VALUES (5,'jpg');
INSERT INTO images(id,file_ext) VALUES (6,'jpg');

CREATE TABLE "home_images" (
    'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    'filename' TEXT NOT NULL,
    'ext' TEXT NOT NULL,
    'alt' TEXT
);

-- images for home page

INSERT into 'home_images' (filename, ext, alt) VALUES ('1','png', 'plum tree restaurant');
-- source: original content, Plum Tree Restaurant in Ithaca.
INSERT into 'home_images' (filename, ext, alt) VALUES ('2','png', 'sushi');
-- source: original content, Plum Tree Restaurant in Ithaca.
INSERT into 'home_images' (filename, ext, alt) VALUES ('3','jpg', 'bento box');
-- source: original content, Plum Tree Restaurant in Ithaca.
INSERT into 'home_images' (filename, ext, alt) VALUES ('4','jpg', 'sushi');
-- source: original content, Plum Tree Restaurant in Ithaca.


-- order seed data
INSERT into 'userorders' (user_id, dishes_list) VALUES ('1', '6,7,53,4');
INSERT into 'userorders' (user_id, dishes_list) VALUES ('2', '12,34,5');


COMMIT;
