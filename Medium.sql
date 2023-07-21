CREATE TABLE `users` (
  `user_id` integer PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) UNIQUE NOT NULL,
  `avatar` varchar(255),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
);

CREATE TABLE `reading_lists` (
  `reading_list_id` integer PRIMARY KEY AUTO_INCREMENT,
  `user_id` integer,
  `title` varchar(255)
);

CREATE TABLE `reading_list_items` (
  `reading_list_item` integer PRIMARY KEY AUTO_INCREMENT,
  `reading_list_id` integer,
  `post_id` integer
);

CREATE TABLE `posts` (
  `post_id` integer PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `visible` boolean DEFAULT false,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `og_image` varchar(255),
  `content` text,
  `user_id` integer,
  `slug` varchar(300) UNIQUE
);

CREATE TABLE `claps` (
  `clap_id` integer PRIMARY KEY AUTO_INCREMENT,
  `post_id` integer,
  `user_id` integer,
  `count` integer DEFAULT 1
);

CREATE TABLE `comments` (
  `comment_id` integer PRIMARY KEY AUTO_INCREMENT,
  `post_id` integer,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_ad` timestamp DEFAULT CURRENT_TIMESTAMP,
  `comment_parent_id` integer
);

ALTER TABLE `posts` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `claps` ADD FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`);

ALTER TABLE `claps` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `comments` ADD FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`);

ALTER TABLE `comments` ADD FOREIGN KEY (`comment_parent_id`) REFERENCES `comments` (`comment_id`);

ALTER TABLE `reading_lists` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `reading_list_items` ADD FOREIGN KEY (`reading_list_id`) REFERENCES `reading_lists` (`reading_list_id`);

ALTER TABLE `reading_list_items` ADD FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`);
