-- Load sample data into database

USE group78;

-- Create users
INSERT INTO User (username, firstname, lastname, password, email, active) 
VALUES ('sportslover', 'Paul', 'Walker', 'paulpass93', 'sportslover@hotmail.com', 'yes');

INSERT INTO User (username, firstname, lastname, password, email, active) 
VALUES ('traveler', 'Rebecca', 'Travolta', 'rebeccapass15', 'rebt@explorer.org', 'yes');

INSERT INTO User (username, firstname, lastname, password, email, active) 
VALUES ('spacejunkie', 'Bob', 'Spacey', 'bob1pass', 'bspace@spacejunkies.net', 'yes');

-- Create albums
INSERT INTO Album (title, created, lastupdated, username, access)
VALUES ('I love sports', '2000-01-01', '2000-01-01', 'sportslover', 'public');

INSERT INTO Album (title, created, lastupdated, username, access)
VALUES ('I love football', '2000-01-01', '2000-01-01', 'sportslover', 'public');

INSERT INTO Album (title, created, lastupdated, username, access)
VALUES ('Around The World', '2000-01-01', '2000-01-01', 'traveler', 'public');

INSERT INTO Album (title, created, lastupdated, username, access)
VALUES ('Cool Space Shots', '2000-01-01', '2000-01-01', 'spacejunkie', 'private');

INSERT INTO Album (title, created, lastupdated, username, access)
VALUES ('search', '2012-02-08', '2012-02-10', 'sportslover', 'public');

-- Create photos
INSERT INTO Photo (picid, url, format, date)
VALUES ('football_s1', '/static/img/db/football_s1.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('football_s2', '/static/img/db/football_s2.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('football_s3', '/static/img/db/football_s3.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('football_s4', '/static/img/db/football_s4.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('space_EagleNebula', '/static/img/db/space_EagleNebula.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('space_GalaxyCollision', '/static/img/db/space_GalaxyCollision.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('space_HelixNebula', '/static/img/db/space_HelixNebula.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('space_MilkyWay', '/static/img/db/space_MilkyWay.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('space_OrionNebula', '/static/img/db/space_OrionNebula.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('sports_s1', '/static/img/db/sports_s1.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('sports_s2', '/static/img/db/sports_s2.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('sports_s3', '/static/img/db/sports_s3.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('sports_s4', '/static/img/db/sports_s4.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('sports_s5', '/static/img/db/sports_s5.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('sports_s6', '/static/img/db/sports_s6.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('sports_s7', '/static/img/db/sports_s7.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('sports_s8', '/static/img/db/sports_s8.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('world_EiffelTower', '/static/img/db/world_EiffelTower.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('world_GreatWall', '/static/img/db/world_GreatWall.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('world_Isfahan', '/static/img/db/world_Isfahan.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('world_Istanbul', '/static/img/db/world_Istanbul.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('world_Persepolis', '/static/img/db/world_Persepolis.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('world_Reykjavik', '/static/img/db/world_Reykjavik.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('world_Seoul', '/static/img/db/world_Seoul.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('world_Stonehenge', '/static/img/db/world_Stonehenge.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('world_TajMahal', '/static/img/db/world_TajMahal.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('world_TelAviv', '/static/img/db/world_TelAviv.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('world_WashingtonDC', '/static/img/db/world_WashingtonDC.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('world_firenze', '/static/img/db/world_firenze.jpg', 'jpg', '2000-01-01');

INSERT INTO Photo (picid, url, format, date)
VALUES ('world_tokyo', '/static/img/db/world_tokyo.jpg', 'jpg', '2000-01-01');

-- Create contain relationships
INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (2, 'football_s1', 'This picture rocks!', 1);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (2, 'football_s2', 'This picture rocks!', 2);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (2, 'football_s3', 'This picture rocks!', 3);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (2, 'football_s4', 'This picture rocks!', 4);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (4, 'space_EagleNebula', 'This picture rocks!', 1);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (4, 'space_GalaxyCollision', 'This picture rocks!', 2);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (4, 'space_HelixNebula', 'This picture rocks!', 3);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (4, 'space_MilkyWay', 'This picture rocks!', 4);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (4, 'space_OrionNebula', 'This picture rocks!', 5);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (1, 'sports_s1', 'This picture rocks!', 1);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (1, 'sports_s2', 'This picture rocks!', 2);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (1, 'sports_s3', 'This picture rocks!', 3);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (1, 'sports_s4', 'This picture rocks!', 4);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (1, 'sports_s5', 'This picture rocks!', 5);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (1, 'sports_s6', 'This picture rocks!', 6);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (1, 'sports_s7', 'This picture rocks!', 7);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (1, 'sports_s8', 'This picture rocks!', 8);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (3, 'world_EiffelTower', 'This picture rocks!', 1);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (3, 'world_GreatWall', 'This picture rocks!', 2);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (3, 'world_Isfahan', 'This picture rocks!', 3);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (3, 'world_Istanbul', 'This picture rocks!', 4);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (3, 'world_Persepolis', 'This picture rocks!', 5);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (3, 'world_Reykjavik', 'This picture rocks!', 6);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (3, 'world_Seoul', 'This picture rocks!', 7);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (3, 'world_Stonehenge', 'This picture rocks!', 8);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (3, 'world_TajMahal', 'This picture rocks!', 9);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (3, 'world_TelAviv', 'This picture rocks!', 10);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (3, 'world_WashingtonDC', 'This picture rocks!', 11);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (3, 'world_firenze', 'This picture rocks!', 12);

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (3, 'world_tokyo', 'This picture rocks!', 13);

-- Create album access relationships

INSERT INTO AlbumAccess (albumid, username)
VALUES (4, 'traveler');


-- Generated by parse_xml.py (from search.xml)

INSERT INTO Photo (picid, url, format, date)
VALUES ('1', '/static/img/db/1.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '1', 'spaghetti con tarako(uova di merluzzo)', 1);

INSERT INTO Photo (picid, url, format, date)
VALUES ('2', '/static/img/db/2.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '2', 'Feds spaghetti eating contest', 2);

INSERT INTO Photo (picid, url, format, date)
VALUES ('3', '/static/img/db/3.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '3', 'Feds spaghetti eating contest', 3);

INSERT INTO Photo (picid, url, format, date)
VALUES ('4', '/static/img/db/4.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '4', 'Spaghetti with Swiss Chard, Onions, Kalamata Olives and Pecorino', 4);

INSERT INTO Photo (picid, url, format, date)
VALUES ('5', '/static/img/db/5.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '5', 'Mushroom ragù with spaghetti', 5);

INSERT INTO Photo (picid, url, format, date)
VALUES ('6', '/static/img/db/6.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '6', 'Why, yes, that is ketchup on my spaghetti!', 6);

INSERT INTO Photo (picid, url, format, date)
VALUES ('7', '/static/img/db/7.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '7', 'Spaghetti di farro con gamberi, zucchine e peperoncini ciliegino by occhipiuverdi', 7);

INSERT INTO Photo (picid, url, format, date)
VALUES ('8', '/static/img/db/8.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '8', 'Chicken Sandwich (on a burger bun)', 8);

INSERT INTO Photo (picid, url, format, date)
VALUES ('9', '/static/img/db/9.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '9', 'Meatball sub with cheese', 9);

INSERT INTO Photo (picid, url, format, date)
VALUES ('10', '/static/img/db/10.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '10', 'Tuna salad sandwich and baked potato', 10);

INSERT INTO Photo (picid, url, format, date)
VALUES ('11', '/static/img/db/11.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '11', 'Ice Cream Sandwich', 11);

INSERT INTO Photo (picid, url, format, date)
VALUES ('12', '/static/img/db/12.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '12', 'rainbow sandwich', 12);

INSERT INTO Photo (picid, url, format, date)
VALUES ('13', '/static/img/db/13.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '13', 'Making homemade sushi on tv night', 13);

INSERT INTO Photo (picid, url, format, date)
VALUES ('14', '/static/img/db/14.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '14', 'Veggie Tempura Rolls', 14);

INSERT INTO Photo (picid, url, format, date)
VALUES ('15', '/static/img/db/15.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '15', 'refreshing sushi roll', 15);

INSERT INTO Photo (picid, url, format, date)
VALUES ('16', '/static/img/db/16.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '16', 'tofu sushi roll', 16);

INSERT INTO Photo (picid, url, format, date)
VALUES ('17', '/static/img/db/17.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '17', 'tofu maki sushi', 17);

INSERT INTO Photo (picid, url, format, date)
VALUES ('18', '/static/img/db/18.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '18', 'Bison Steaks', 18);

INSERT INTO Photo (picid, url, format, date)
VALUES ('19', '/static/img/db/19.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '19', 'chicken fried steak', 19);

INSERT INTO Photo (picid, url, format, date)
VALUES ('20', '/static/img/db/20.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '20', 'Steak and eggs', 20);

INSERT INTO Photo (picid, url, format, date)
VALUES ('21', '/static/img/db/21.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '21', 'Steak tartare', 21);

INSERT INTO Photo (picid, url, format, date)
VALUES ('22', '/static/img/db/22.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '22', 'cornmeal breaded salmon steak', 22);

INSERT INTO Photo (picid, url, format, date)
VALUES ('23', '/static/img/db/23.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '23', 'I made my love a heart pizza today', 23);

INSERT INTO Photo (picid, url, format, date)
VALUES ('24', '/static/img/db/24.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '24', 'Chicken Perreroni Pizza', 24);

INSERT INTO Photo (picid, url, format, date)
VALUES ('25', '/static/img/db/25.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '25', 'Domino\'s pizza delivery', 25);

INSERT INTO Photo (picid, url, format, date)
VALUES ('26', '/static/img/db/26.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '26', 'Pesto Pizza', 26);

INSERT INTO Photo (picid, url, format, date)
VALUES ('27', '/static/img/db/27.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '27', 'Pizza Chef Elmo', 27);

INSERT INTO Photo (picid, url, format, date)
VALUES ('28', '/static/img/db/28.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '28', 'Broadway Pizza', 28);

INSERT INTO Photo (picid, url, format, date)
VALUES ('29', '/static/img/db/29.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '29', 'Fig and Prosciutto Pizza', 29);

INSERT INTO Photo (picid, url, format, date)
VALUES ('30', '/static/img/db/30.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '30', 'Pizza Van', 30);

INSERT INTO Photo (picid, url, format, date)
VALUES ('31', '/static/img/db/31.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '31', 'lego space shuttle', 31);

INSERT INTO Photo (picid, url, format, date)
VALUES ('32', '/static/img/db/32.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '32', 'space truck', 32);

INSERT INTO Photo (picid, url, format, date)
VALUES ('33', '/static/img/db/33.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '33', 'Space Shuttle Atlantis, STS-132', 33);

INSERT INTO Photo (picid, url, format, date)
VALUES ('34', '/static/img/db/34.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '34', 'Space Shuttle Atlantis, STS-132', 34);

INSERT INTO Photo (picid, url, format, date)
VALUES ('35', '/static/img/db/35.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '35', 'Landing gear of Shuttle Atlantis STS-135', 35);

INSERT INTO Photo (picid, url, format, date)
VALUES ('36', '/static/img/db/36.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '36', 'Space Shuttle', 36);

INSERT INTO Photo (picid, url, format, date)
VALUES ('37', '/static/img/db/37.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '37', 'Space Shuttle Model in Japan store', 37);

INSERT INTO Photo (picid, url, format, date)
VALUES ('38', '/static/img/db/38.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '38', 'Space shuttle', 38);

INSERT INTO Photo (picid, url, format, date)
VALUES ('39', '/static/img/db/39.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '39', 'Space Shuttle Enterprise', 39);

INSERT INTO Photo (picid, url, format, date)
VALUES ('40', '/static/img/db/40.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '40', 'shuttle indoors', 40);

INSERT INTO Photo (picid, url, format, date)
VALUES ('41', '/static/img/db/41.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '41', 'Space Shuttle Enterprise', 41);

INSERT INTO Photo (picid, url, format, date)
VALUES ('42', '/static/img/db/42.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '42', 'Inter-Island Helicopters', 42);

INSERT INTO Photo (picid, url, format, date)
VALUES ('43', '/static/img/db/43.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '43', 'Helicopter ride (Tauranga)', 43);

INSERT INTO Photo (picid, url, format, date)
VALUES ('44', '/static/img/db/44.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '44', 'Helicopter pilot serving in Afghanistan', 44);

INSERT INTO Photo (picid, url, format, date)
VALUES ('45', '/static/img/db/45.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '45', 'Bell Jet Ranger Helicopter', 45);

INSERT INTO Photo (picid, url, format, date)
VALUES ('46', '/static/img/db/46.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '46', 'Huey Helicopter', 46);

INSERT INTO Photo (picid, url, format, date)
VALUES ('47', '/static/img/db/47.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '47', 'world war helicopter', 47);

INSERT INTO Photo (picid, url, format, date)
VALUES ('48', '/static/img/db/48.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '48', 'USS Essex Helicopter with the Royal Thai Navy', 48);

INSERT INTO Photo (picid, url, format, date)
VALUES ('49', '/static/img/db/49.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '49', 'KPIX TV helicopter 5 Aerospatiale AS350BA N110TV', 49);

INSERT INTO Photo (picid, url, format, date)
VALUES ('50', '/static/img/db/50.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '50', 'Vintage Bicycle', 50);

INSERT INTO Photo (picid, url, format, date)
VALUES ('51', '/static/img/db/51.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '51', 'Samsung ST600 imageloger - Bicycle', 51);

INSERT INTO Photo (picid, url, format, date)
VALUES ('52', '/static/img/db/52.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '52', 'Bicycle! Bicylcle!', 52);

INSERT INTO Photo (picid, url, format, date)
VALUES ('53', '/static/img/db/53.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '53', 'Papa on bicycle', 53);

INSERT INTO Photo (picid, url, format, date)
VALUES ('54', '/static/img/db/54.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '54', 'Bicycle for rent', 54);

INSERT INTO Photo (picid, url, format, date)
VALUES ('55', '/static/img/db/55.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '55', 'Bicycle rim', 55);

INSERT INTO Photo (picid, url, format, date)
VALUES ('56', '/static/img/db/56.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '56', 'PUGSLEY COMPLETE BICYCLE ABOVE BIKE CUSTOM / SNOW BLIND', 56);

INSERT INTO Photo (picid, url, format, date)
VALUES ('57', '/static/img/db/57.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '57', 'Bicycle Osaka', 57);

INSERT INTO Photo (picid, url, format, date)
VALUES ('58', '/static/img/db/58.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '58', 'urban bicycles', 58);

INSERT INTO Photo (picid, url, format, date)
VALUES ('59', '/static/img/db/59.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '59', 'Nancy Rubins, Chas\' Stainless Steel, Mark Thompson\'s Airplane Parts', 59);

INSERT INTO Photo (picid, url, format, date)
VALUES ('60', '/static/img/db/60.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '60', 'Playing with paper airplanes', 60);

INSERT INTO Photo (picid, url, format, date)
VALUES ('61', '/static/img/db/61.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '61', 'CAP airplane', 61);

INSERT INTO Photo (picid, url, format, date)
VALUES ('62', '/static/img/db/62.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '62', 'interior display of plane', 62);

INSERT INTO Photo (picid, url, format, date)
VALUES ('63', '/static/img/db/63.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '63', 'San Francisco Airplane', 63);

INSERT INTO Photo (picid, url, format, date)
VALUES ('64', '/static/img/db/64.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '64', 'Military plane heading towards base', 64);

INSERT INTO Photo (picid, url, format, date)
VALUES ('65', '/static/img/db/65.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '65', 'french military planes', 65);

INSERT INTO Photo (picid, url, format, date)
VALUES ('66', '/static/img/db/66.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '66', 'F-16 plane Aggressors', 66);

INSERT INTO Photo (picid, url, format, date)
VALUES ('67', '/static/img/db/67.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '67', 'Air Canada Airbus A330-343 C-GHKW cn 0408', 67);

INSERT INTO Photo (picid, url, format, date)
VALUES ('68', '/static/img/db/68.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '68', 'boats', 68);

INSERT INTO Photo (picid, url, format, date)
VALUES ('69', '/static/img/db/69.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '69', 'Jet Boating across Waimakariri River Gorge', 69);

INSERT INTO Photo (picid, url, format, date)
VALUES ('70', '/static/img/db/70.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '70', 'Amy takin photos on the boat', 70);

INSERT INTO Photo (picid, url, format, date)
VALUES ('71', '/static/img/db/71.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '71', 'Boat Reflections', 71);

INSERT INTO Photo (picid, url, format, date)
VALUES ('72', '/static/img/db/72.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '72', 'Sunken Boat', 72);

INSERT INTO Photo (picid, url, format, date)
VALUES ('73', '/static/img/db/73.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '73', 'New Zealand - Wellington Ferry - View from the Boat', 73);

INSERT INTO Photo (picid, url, format, date)
VALUES ('74', '/static/img/db/74.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '74', 'harbor boats', 74);

INSERT INTO Photo (picid, url, format, date)
VALUES ('75', '/static/img/db/75.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '75', 'Monterey Harbor personal boats', 75);

INSERT INTO Photo (picid, url, format, date)
VALUES ('76', '/static/img/db/76.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '76', 'help sinking boat', 76);

INSERT INTO Photo (picid, url, format, date)
VALUES ('77', '/static/img/db/77.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '77', 'World of Wheels Auto Show Indianapolis Indiana - Custom cars', 77);

INSERT INTO Photo (picid, url, format, date)
VALUES ('78', '/static/img/db/78.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '78', '40th Anniversary BMW Car Cake', 78);

INSERT INTO Photo (picid, url, format, date)
VALUES ('79', '/static/img/db/79.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '79', 'bmw cars n pole error 010', 79);

INSERT INTO Photo (picid, url, format, date)
VALUES ('80', '/static/img/db/80.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '80', 'BMW M3 GPower GT2 car', 80);

INSERT INTO Photo (picid, url, format, date)
VALUES ('81', '/static/img/db/81.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '81', 'Volkswagen Rabbit cars', 81);

INSERT INTO Photo (picid, url, format, date)
VALUES ('82', '/static/img/db/82.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '82', 'Griffin Motorwerke VW GTI MkV auto car', 82);

INSERT INTO Photo (picid, url, format, date)
VALUES ('83', '/static/img/db/83.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '83', 'Roger Rabbit\'s Car Toon Spin', 83);

INSERT INTO Photo (picid, url, format, date)
VALUES ('84', '/static/img/db/84.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '84', 'car 1980 Volkswagen Rabbit Diesel', 84);

INSERT INTO Photo (picid, url, format, date)
VALUES ('85', '/static/img/db/85.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '85', 'Volkswagen cars Rabbit Cabrio VW landscape Tauplitz Austria', 85);

INSERT INTO Photo (picid, url, format, date)
VALUES ('86', '/static/img/db/86.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '86', 'chess king and his army', 86);

INSERT INTO Photo (picid, url, format, date)
VALUES ('87', '/static/img/db/87.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '87', 'Lewis Chessmen', 87);

INSERT INTO Photo (picid, url, format, date)
VALUES ('88', '/static/img/db/88.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '88', 'Chess x Smoke', 88);

INSERT INTO Photo (picid, url, format, date)
VALUES ('89', '/static/img/db/89.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '89', 'Shawn Doyle Plays Endgame\'s Chess-Master-Turned-Detective Arkady Balagan', 89);

INSERT INTO Photo (picid, url, format, date)
VALUES ('90', '/static/img/db/90.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '90', 'Checkmate chess', 90);

INSERT INTO Photo (picid, url, format, date)
VALUES ('91', '/static/img/db/91.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '91', 'city Chess in the square', 91);

INSERT INTO Photo (picid, url, format, date)
VALUES ('92', '/static/img/db/92.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '92', 'Chess at Schaeffer\'s lodge', 92);

INSERT INTO Photo (picid, url, format, date)
VALUES ('93', '/static/img/db/93.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '93', 'Outdoor chess - checkmate and a poor loss for white', 93);

INSERT INTO Photo (picid, url, format, date)
VALUES ('94', '/static/img/db/94.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '94', 'Chess Men Statues', 94);

INSERT INTO Photo (picid, url, format, date)
VALUES ('95', '/static/img/db/95.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '95', 'Monitor Lizard swimming away from us', 95);

INSERT INTO Photo (picid, url, format, date)
VALUES ('96', '/static/img/db/96.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '96', 'Swimming with my Go Pro', 96);

INSERT INTO Photo (picid, url, format, date)
VALUES ('97', '/static/img/db/97.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '97', 'Swimming pool at Sofitel Plaza Hanoi', 97);

INSERT INTO Photo (picid, url, format, date)
VALUES ('98', '/static/img/db/98.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '98', 'Swim suit Bikini Model Goddess', 98);

INSERT INTO Photo (picid, url, format, date)
VALUES ('99', '/static/img/db/99.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '99', 'A swimming dog', 99);

INSERT INTO Photo (picid, url, format, date)
VALUES ('100', '/static/img/db/100.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '100', 'Men\'s olympic Swimming', 100);

INSERT INTO Photo (picid, url, format, date)
VALUES ('101', '/static/img/db/101.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '101', 'swimming in and out of choclate', 101);

INSERT INTO Photo (picid, url, format, date)
VALUES ('102', '/static/img/db/102.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '102', 'Felix Resort swimming pool, Kanchanaburi', 102);

INSERT INTO Photo (picid, url, format, date)
VALUES ('103', '/static/img/db/103.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '103', 'Greensborough local swimming pool', 103);

INSERT INTO Photo (picid, url, format, date)
VALUES ('104', '/static/img/db/104.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '104', 'Bristol Pitbulls Ice Hockey', 104);

INSERT INTO Photo (picid, url, format, date)
VALUES ('105', '/static/img/db/105.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '105', '39/365 : Hockey at City Hal', 105);

INSERT INTO Photo (picid, url, format, date)
VALUES ('106', '/static/img/db/106.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '106', 'The Hockey Goal', 106);

INSERT INTO Photo (picid, url, format, date)
VALUES ('107', '/static/img/db/107.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '107', 'Ice hockey in a cold day', 107);

INSERT INTO Photo (picid, url, format, date)
VALUES ('108', '/static/img/db/108.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '108', 'hockey girl', 108);

INSERT INTO Photo (picid, url, format, date)
VALUES ('109', '/static/img/db/109.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '109', 'OLYMPIC ICE HOCKEY Scrabble Tile Pendant', 109);

INSERT INTO Photo (picid, url, format, date)
VALUES ('110', '/static/img/db/110.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '110', 'College Hockey: OU vs Oakland', 110);

INSERT INTO Photo (picid, url, format, date)
VALUES ('111', '/static/img/db/111.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '111', 'men\'s hockey boston university', 111);

INSERT INTO Photo (picid, url, format, date)
VALUES ('112', '/static/img/db/112.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '112', 'Indian Olympic Hockey Team 1936 Berlin', 112);

INSERT INTO Photo (picid, url, format, date)
VALUES ('113', '/static/img/db/113.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '113', 'LATVIA FRIENDLY SOCCER', 113);

INSERT INTO Photo (picid, url, format, date)
VALUES ('114', '/static/img/db/114.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '114', 'Soccer Sillhouette (Day 30)', 114);

INSERT INTO Photo (picid, url, format, date)
VALUES ('115', '/static/img/db/115.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '115', 'GMC soccer', 115);

INSERT INTO Photo (picid, url, format, date)
VALUES ('116', '/static/img/db/116.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '116', 'YouthLink YouthLink Street Soccer', 116);

INSERT INTO Photo (picid, url, format, date)
VALUES ('117', '/static/img/db/117.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '117', 'soccer Coupe du Monde Babyfoot - 2010', 117);

INSERT INTO Photo (picid, url, format, date)
VALUES ('118', '/static/img/db/118.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '118', 'South Africa WCup Soccer', 118);

INSERT INTO Photo (picid, url, format, date)
VALUES ('119', '/static/img/db/119.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '119', 'spain soccer world cup fans', 119);

INSERT INTO Photo (picid, url, format, date)
VALUES ('120', '/static/img/db/120.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '120', 'South Africa Soccer world Cup Kobe Bryant', 120);

INSERT INTO Photo (picid, url, format, date)
VALUES ('121', '/static/img/db/121.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '121', 'Britain Soccer Champions League', 121);

INSERT INTO Photo (picid, url, format, date)
VALUES ('122', '/static/img/db/122.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '122', 'barbie football', 122);

INSERT INTO Photo (picid, url, format, date)
VALUES ('123', '/static/img/db/123.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '123', 'Old Trafford #England #Manchester football #stadium #mufc #oldtrafford', 123);

INSERT INTO Photo (picid, url, format, date)
VALUES ('124', '/static/img/db/124.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '124', 'football finals stadium', 124);

INSERT INTO Photo (picid, url, format, date)
VALUES ('125', '/static/img/db/125.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '125', 'Chiefs vs Ravens football', 125);

INSERT INTO Photo (picid, url, format, date)
VALUES ('126', '/static/img/db/126.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '126', 'Alex, the Mean Footballer', 126);

INSERT INTO Photo (picid, url, format, date)
VALUES ('127', '/static/img/db/127.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '127', 'getting ready for football', 127);

INSERT INTO Photo (picid, url, format, date)
VALUES ('128', '/static/img/db/128.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '128', 'Walter Camp:the Father of American Football', 128);

INSERT INTO Photo (picid, url, format, date)
VALUES ('129', '/static/img/db/129.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '129', 'Braylon Edwards showing off the six pack football', 129);

INSERT INTO Photo (picid, url, format, date)
VALUES ('130', '/static/img/db/130.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '130', 'The Patriots football tight ends', 130);

INSERT INTO Photo (picid, url, format, date)
VALUES ('131', '/static/img/db/131.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '131', 'Hats - Baseball USA', 131);

INSERT INTO Photo (picid, url, format, date)
VALUES ('132', '/static/img/db/132.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '132', 'Snead State Baseball vs Gadsden State', 132);

INSERT INTO Photo (picid, url, format, date)
VALUES ('133', '/static/img/db/133.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '133', 'Lego Zombie Baseball player', 133);

INSERT INTO Photo (picid, url, format, date)
VALUES ('134', '/static/img/db/134.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '134', 'Colony HS Freshman Baseball', 134);

INSERT INTO Photo (picid, url, format, date)
VALUES ('135', '/static/img/db/135.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '135', '1950s Studio Portrait of a Little League Baseball Player by Strands Studio of Rugby, North Dakota', 135);

INSERT INTO Photo (picid, url, format, date)
VALUES ('136', '/static/img/db/136.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '136', 'Baseball is in the Air', 136);

INSERT INTO Photo (picid, url, format, date)
VALUES ('137', '/static/img/db/137.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '137', 'yankees baseball match', 137);

INSERT INTO Photo (picid, url, format, date)
VALUES ('138', '/static/img/db/138.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '138', 'Johnny Damon redsox baseball', 138);

INSERT INTO Photo (picid, url, format, date)
VALUES ('139', '/static/img/db/139.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '139', 'redsox baseball boston', 139);

INSERT INTO Photo (picid, url, format, date)
VALUES ('140', '/static/img/db/140.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '140', 'island pig eating', 140);

INSERT INTO Photo (picid, url, format, date)
VALUES ('141', '/static/img/db/141.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '141', 'pig crossing', 141);

INSERT INTO Photo (picid, url, format, date)
VALUES ('142', '/static/img/db/142.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '142', 'Liga Privada T52 Flying Pig by Drew Estate', 142);

INSERT INTO Photo (picid, url, format, date)
VALUES ('143', '/static/img/db/143.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '143', 'Pig Family', 143);

INSERT INTO Photo (picid, url, format, date)
VALUES ('144', '/static/img/db/144.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '144', 'UIUC three little pigs in their house of bricks', 144);

INSERT INTO Photo (picid, url, format, date)
VALUES ('145', '/static/img/db/145.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '145', 'Pig coming back from the show ring', 145);

INSERT INTO Photo (picid, url, format, date)
VALUES ('146', '/static/img/db/146.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '146', 'Pig Show in the Small Arena', 146);

INSERT INTO Photo (picid, url, format, date)
VALUES ('147', '/static/img/db/147.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '147', 'New pig in the family', 147);

INSERT INTO Photo (picid, url, format, date)
VALUES ('148', '/static/img/db/148.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '148', 'When pigs learn to fly', 148);

INSERT INTO Photo (picid, url, format, date)
VALUES ('149', '/static/img/db/149.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '149', 'Orcs Around poor Pig', 149);

INSERT INTO Photo (picid, url, format, date)
VALUES ('150', '/static/img/db/150.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '150', 'bored Sea Lion', 150);

INSERT INTO Photo (picid, url, format, date)
VALUES ('151', '/static/img/db/151.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '151', 'Lion Dancer', 151);

INSERT INTO Photo (picid, url, format, date)
VALUES ('152', '/static/img/db/152.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '152', 'red lion day', 152);

INSERT INTO Photo (picid, url, format, date)
VALUES ('153', '/static/img/db/153.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '153', 'Lion outside the British Museum', 153);

INSERT INTO Photo (picid, url, format, date)
VALUES ('154', '/static/img/db/154.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '154', 'lion and tiger in china', 154);

INSERT INTO Photo (picid, url, format, date)
VALUES ('155', '/static/img/db/155.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '155', 'Lions hunting a Buffalo', 155);

INSERT INTO Photo (picid, url, format, date)
VALUES ('156', '/static/img/db/156.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '156', 'lions all attacking', 156);

INSERT INTO Photo (picid, url, format, date)
VALUES ('157', '/static/img/db/157.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '157', 'lions resting from the feast', 157);

INSERT INTO Photo (picid, url, format, date)
VALUES ('158', '/static/img/db/158.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '158', 'Berlin - Zoo - Lion', 158);

INSERT INTO Photo (picid, url, format, date)
VALUES ('159', '/static/img/db/159.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '159', 'Stumpy the Elephant. The World Cup mascot', 159);

INSERT INTO Photo (picid, url, format, date)
VALUES ('160', '/static/img/db/160.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '160', 'indian elephant', 160);

INSERT INTO Photo (picid, url, format, date)
VALUES ('161', '/static/img/db/161.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '161', 'Foot Print Of Elephant', 161);

INSERT INTO Photo (picid, url, format, date)
VALUES ('162', '/static/img/db/162.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '162', 'Elephant seals', 162);

INSERT INTO Photo (picid, url, format, date)
VALUES ('163', '/static/img/db/163.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '163', 'Thailand Sawasdee Elephant', 163);

INSERT INTO Photo (picid, url, format, date)
VALUES ('164', '/static/img/db/164.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '164', 'Wild Elephants in Borango Springs', 164);

INSERT INTO Photo (picid, url, format, date)
VALUES ('165', '/static/img/db/165.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '165', 'Tiger Safari, on elephants, India', 165);

INSERT INTO Photo (picid, url, format, date)
VALUES ('166', '/static/img/db/166.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '166', 'Mahouts and elephants', 166);

INSERT INTO Photo (picid, url, format, date)
VALUES ('167', '/static/img/db/167.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '167', 'Tara Kiplings camp elephant', 167);

INSERT INTO Photo (picid, url, format, date)
VALUES ('168', '/static/img/db/168.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '168', 'eastern whip bird', 168);

INSERT INTO Photo (picid, url, format, date)
VALUES ('169', '/static/img/db/169.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '169', 'Bird attacking our car', 169);

INSERT INTO Photo (picid, url, format, date)
VALUES ('170', '/static/img/db/170.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '170', 'Weaver Bird staring', 170);

INSERT INTO Photo (picid, url, format, date)
VALUES ('171', '/static/img/db/171.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '171', 'bird over sierra nevadas', 171);

INSERT INTO Photo (picid, url, format, date)
VALUES ('172', '/static/img/db/172.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '172', 'OBP habitat 1 - rarest birds in the world?', 172);

INSERT INTO Photo (picid, url, format, date)
VALUES ('173', '/static/img/db/173.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '173', 'Allen\'s Humming bird', 173);

INSERT INTO Photo (picid, url, format, date)
VALUES ('174', '/static/img/db/174.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '174', 'Cassin\'s King bird, Tyrannus vociferans', 174);

INSERT INTO Photo (picid, url, format, date)
VALUES ('175', '/static/img/db/175.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '175', 'Lotherton Hall Bird Garden', 175);

INSERT INTO Photo (picid, url, format, date)
VALUES ('176', '/static/img/db/176.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '176', 'Black-winged Ground Dove Palomita Cordillerana Metriopelia melanoptera', 176);

INSERT INTO Photo (picid, url, format, date)
VALUES ('177', '/static/img/db/177.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '177', 'US-WESTMINSTER DOG SHOW', 177);

INSERT INTO Photo (picid, url, format, date)
VALUES ('178', '/static/img/db/178.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '178', 'Black the Rabbit and White The Dog by Katie Nelson', 178);

INSERT INTO Photo (picid, url, format, date)
VALUES ('179', '/static/img/db/179.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '179', 'at dog hotel while our family takes a vacation!', 179);

INSERT INTO Photo (picid, url, format, date)
VALUES ('180', '/static/img/db/180.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '180', 'two old dogs', 180);

INSERT INTO Photo (picid, url, format, date)
VALUES ('181', '/static/img/db/181.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '181', 'Seychelles - Beach Dog on La Digue', 181);

INSERT INTO Photo (picid, url, format, date)
VALUES ('182', '/static/img/db/182.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '182', 'dog on the shore', 182);

INSERT INTO Photo (picid, url, format, date)
VALUES ('183', '/static/img/db/183.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '183', 'On the Wednesday morning walk. In the dog run', 183);

INSERT INTO Photo (picid, url, format, date)
VALUES ('184', '/static/img/db/184.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '184', 'Jeffrey Brown - The Cutest Sneeze in the World: 30 Cat Postcards', 184);

INSERT INTO Photo (picid, url, format, date)
VALUES ('185', '/static/img/db/185.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '185', 'My cat Nana', 185);

INSERT INTO Photo (picid, url, format, date)
VALUES ('186', '/static/img/db/186.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '186', 'cute cats goes to heaven', 186);

INSERT INTO Photo (picid, url, format, date)
VALUES ('187', '/static/img/db/187.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '187', '17th, International Cat Day', 187);

INSERT INTO Photo (picid, url, format, date)
VALUES ('188', '/static/img/db/188.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '188', 'nosy cat staring at me', 188);

INSERT INTO Photo (picid, url, format, date)
VALUES ('189', '/static/img/db/189.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '189', 'Persian cat', 189);

INSERT INTO Photo (picid, url, format, date)
VALUES ('190', '/static/img/db/190.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '190', 'Sonoma County Cat Show 2011', 190);

INSERT INTO Photo (picid, url, format, date)
VALUES ('191', '/static/img/db/191.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '191', 'Retiring cat show judge', 191);

INSERT INTO Photo (picid, url, format, date)
VALUES ('192', '/static/img/db/192.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '192', 'Black cat shows the versatility of their home', 192);

INSERT INTO Photo (picid, url, format, date)
VALUES ('193', '/static/img/db/193.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '193', 'Black Tip Reef Shark in the TAR Park', 193);

INSERT INTO Photo (picid, url, format, date)
VALUES ('194', '/static/img/db/194.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '194', 'Em closes in on resting shark', 194);

INSERT INTO Photo (picid, url, format, date)
VALUES ('195', '/static/img/db/195.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '195', 'Swimming with Sharks', 195);

INSERT INTO Photo (picid, url, format, date)
VALUES ('196', '/static/img/db/196.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '196', 'Jumping shark', 196);

INSERT INTO Photo (picid, url, format, date)
VALUES ('197', '/static/img/db/197.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '197', 'Great white jumping shark', 197);

INSERT INTO Photo (picid, url, format, date)
VALUES ('198', '/static/img/db/198.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '198', 'Hammerhead Shark', 198);

INSERT INTO Photo (picid, url, format, date)
VALUES ('199', '/static/img/db/199.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '199', 'Great White shark breaking out of water', 199);

INSERT INTO Photo (picid, url, format, date)
VALUES ('200', '/static/img/db/200.jpg', 'jpg', '2012-02-10');

INSERT INTO Contain (albumid, picid, caption, sequencenum)
VALUES (5, '200', 'female great white shark up close', 200);

