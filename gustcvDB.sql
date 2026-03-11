CREATE TABLE `image_type` (
  `image_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_type_name` varchar(30) NOT NULL DEFAULT '',
  `image_size` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`image_type_id`)
);

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_link` varchar(50) NOT NULL DEFAULT '',
  `image_text` varchar(30) DEFAULT NULL,
  `image_type` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`image_id`),
  KEY `image_type` (`image_type`),
  CONSTRAINT `1` FOREIGN KEY (`image_type`) REFERENCES `image_type` (`image_type_id`)
);

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(100) NOT NULL DEFAULT '',
  `last_text` text NOT NULL DEFAULT '',
  `post_image` int(11) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `post_image` (`post_image`),
  CONSTRAINT `1` FOREIGN KEY (`post_image`) REFERENCES `images` (`image_id`)
);

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(10) NOT NULL DEFAULT 'No name',
  `last_name` varchar(15) NOT NULL DEFAULT 'No name',
  `pass` varchar(50) NOT NULL DEFAULT '',
  `date_of_birth` date NOT NULL DEFAULT '0000-00-00',
  `email` varchar(50) NOT NULL DEFAULT '',
  `pfp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  KEY `pfp` (`pfp`),
  CONSTRAINT `1` FOREIGN KEY (`pfp`) REFERENCES `images` (`image_id`)
);

CREATE TABLE `post_connector` (
  `post_con_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`post_con_id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`)
);
INSERT INTO gust_cv.image_type (image_type_name,image_size) VALUES
	('pfp','280x280');
INSERT INTO gust_cv.images (image_link,image_text,image_type) VALUES
	 ('/images/nopfp.jpg',NULL,1),
	 ('/images/cv.jpeg',NULL,1);
INSERT INTO gust_cv.users (first_name,last_name,pass,date_of_birth,email,pfp) VALUES
	 ('Gust','Gilis',/*nopassforyou*/,'2005-08-28','gust-gilis-work@outlook.com',3);