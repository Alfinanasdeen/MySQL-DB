CREATE TABLE `users` (
  `user_id` INT PRIMARY KEY,
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(50) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `role` VARCHAR(255),
  `createdAt` DATETIME DEFAULT (now()),
  `updated_at` DATETIME
);

CREATE TABLE `students` (
  `student_id` INT PRIMARY KEY,
  `user_id` INT NOT NULL,
  `full_name` VARCHAR(255) NOT NULL,
  `address` TEXT NOT NULL,
  `phone_number` VARCHAR(255) NOT NULL,
  `qualification` TEXT NOT NULL,
  `work_experience` TEXT NOT NULL
);

CREATE TABLE `topics` (
  `topic_id` INT PRIMARY KEY,
  `topic_name` VARCHAR(255),
  `description` TEXT,
  `num_sessions` INT,
  `mentor_id` INT
);

CREATE TABLE `task` (
  `task_id` INT PRIMARY KEY,
  `topic_id` INT,
  `task_name` VARCHAR(255),
  `description` TEXT NOT NULL,
  `deadline` DATE
);

CREATE TABLE `attendance` (
  `attendance_id` INT PRIMARY KEY,
  `user_id` INT NOT NULL,
  `topic_id` INT NOT NULL,
  `session_date` DATE,
  `status` VARCHAR(255)
);

CREATE TABLE `capstone` (
  `capstone_id` INT PRIMARY KEY,
  `user_id` INT NOT NULL,
  `project_name` VARCHAR(255),
  `description` TEXT
);

CREATE TABLE `queries` (
  `query_id` INT PRIMARY KEY,
  `student_id` INT UNIQUE,
  `topic_id` INT UNIQUE NOT NULL,
  `question` VARCHAR(255) UNIQUE NOT NULL,
  `answer` TEXT
);

CREATE TABLE `portfolio_submission` (
  `submission_id` INT PRIMARY KEY,
  `student_id` INT,
  `capstone_id` INT,
  `submission_date` DATE,
  `github_url` VARCHAR(255),
  `portfolio_url` VARCHAR(255),
  `resume_url` VARCHAR(255)
);

CREATE TABLE `additional_session` (
  `session_id` INT PRIMARY KEY,
  `topic_id` INT NOT NULL,
  `session_date` DATE,
  `session_details` TEXT
);

CREATE TABLE `leaderboard` (
  `leaderboard_id` INT PRIMARY KEY,
  `user_id` INT NOT NULL,
  `score` INT
);

ALTER TABLE `students` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `topics` ADD FOREIGN KEY (`mentor_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `task` ADD FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`);

ALTER TABLE `attendance` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `attendance` ADD FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`);

ALTER TABLE `capstone` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `queries` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

ALTER TABLE `queries` ADD FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`);

ALTER TABLE `portfolio_submission` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

ALTER TABLE `portfolio_submission` ADD FOREIGN KEY (`capstone_id`) REFERENCES `capstone` (`capstone_id`);

ALTER TABLE `additional_session` ADD FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`);

ALTER TABLE `leaderboard` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
