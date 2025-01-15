-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 15, 2025 at 11:18 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `issue_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
                            `comment_id` int UNSIGNED NOT NULL COMMENT 'Unikaalne ID iga kommentaari jaoks.',
                            `story_id` int UNSIGNED NOT NULL COMMENT 'Viide kasutajaloole, millele kommentaar kuulub.',
                            `user_id` int UNSIGNED NOT NULL COMMENT 'Viide kasutajale, kes kommentаari lisas.',
                            `content` text NOT NULL COMMENT 'Kommentаari sisu, kuna see võib olla pikem tekst.',
                            `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Kommentaari loomise aeg.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `story_id`, `user_id`, `content`, `created_at`) VALUES
                                                                                          (1, 1, 1, 'I am working on this issue.', '2025-01-15 10:21:20'),
                                                                                          (2, 2, 2, 'Can we add a toggle for dark mode?', '2025-01-15 10:21:20'),
                                                                                          (3, 1, 3, 'This issue is critical and needs attention.', '2025-01-15 10:21:20');

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE `labels` (
                          `label_id` int UNSIGNED NOT NULL COMMENT 'Unikaalne ID iga sildi jaoks.',
                          `name` varchar(50) NOT NULL COMMENT 'Sildi nimi, kuni 50 tähemärki.',
                          `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Sildi loomise aeg.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`label_id`, `name`, `created_at`) VALUES
                                                            (1, 'Bug', '2025-01-15 10:22:46'),
                                                            (2, 'Feature Request', '2025-01-15 10:22:46'),
                                                            (3, 'Critical', '2025-01-15 10:22:46'),
                                                            (4, 'UI/UX', '2025-01-15 10:22:46'),
                                                            (5, 'Performance', '2025-01-15 10:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
                            `project_id` int UNSIGNED NOT NULL COMMENT 'Unikaalne ID iga projekti jaoks.',
                            `name` varchar(100) NOT NULL COMMENT 'Projekti nimi, kuni 100 tähemärki.',
                            `description` text COMMENT 'Projekti kirjeldus, kuna see võib olla pikem.',
                            `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Projekti loomise aeg.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `name`, `description`, `created_at`) VALUES
                                                                               (1, 'Project 1', 'Description for project 1', '2025-01-15 10:19:39'),
                                                                               (2, 'Project 2', 'Description for project 2', '2025-01-15 10:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `story_labels`
--

CREATE TABLE `story_labels` (
                                `story_id` int UNSIGNED NOT NULL COMMENT 'Viide kasutajaloole, millele silt on lisatud.',
                                `label_id` int UNSIGNED NOT NULL COMMENT 'Viide sildiväljale.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `story_labels`
--

INSERT INTO `story_labels` (`story_id`, `label_id`) VALUES
                                                        (1, 1),
                                                        (2, 2),
                                                        (1, 3),
                                                        (6, 4),
                                                        (7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `story_owners`
--

CREATE TABLE `story_owners` (
                                `owner_id` int UNSIGNED NOT NULL COMMENT 'Unikaalne ID iga omaniku jaoks.',
                                `story_id` int UNSIGNED NOT NULL COMMENT 'Viide kasutajaloole, millega omanik on seotud.',
                                `user_id` int UNSIGNED NOT NULL COMMENT 'Viide kasutajale, kes on selle loo omanik.',
                                `assigned_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Aeg, millal kasutaja määrati omanikuks.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `story_owners`
--

INSERT INTO `story_owners` (`owner_id`, `story_id`, `user_id`, `assigned_at`) VALUES
                                                                                  (1, 1, 1, '2025-01-15 10:20:06'),
                                                                                  (2, 2, 2, '2025-01-15 10:20:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
                         `user_id` int UNSIGNED NOT NULL COMMENT 'Unikaalne ID iga kasutaja jaoks.',
                         `username` varchar(50) NOT NULL COMMENT 'Kasutajanimi, kuni 50 tähemärki.',
                         `email` varchar(255) NOT NULL COMMENT 'E-posti aadress, kuni 255 tähemärki vastavalt standardile.',
                         `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Konto loomise aeg.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `created_at`) VALUES
                                                                       (1, 'john_doe', 'john@example.com', '2025-01-15 10:19:23'),
                                                                       (2, 'jane_doe', 'jane@example.com', '2025-01-15 10:19:23'),
                                                                       (3, 'alice', 'alice@example.com', '2025-01-15 10:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `user_stories`
--

CREATE TABLE `user_stories` (
                                `story_id` int UNSIGNED NOT NULL COMMENT 'Unikaalne ID iga kasutajaloo jaoks.',
                                `project_id` int UNSIGNED NOT NULL COMMENT 'Viide projektile, millega kasutajalugu on seotud.',
                                `title` varchar(150) NOT NULL COMMENT 'Kasutajaloo pealkiri, kuni 150 tähemärki.',
                                `description` text COMMENT 'Kasutajaloo üksikasjalik kirjeldus.',
                                `status` enum('pending','in_progress','completed') NOT NULL DEFAULT 'pending' COMMENT 'Kasutajaloo staatus.',
                                `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Kasutajaloo loomise aeg.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_stories`
--

INSERT INTO `user_stories` (`story_id`, `project_id`, `title`, `description`, `status`, `created_at`) VALUES
                                                                                                          (1, 1, 'Fix Login Issue', 'Details about login issue', 'pending', '2025-01-15 10:19:52'),
                                                                                                          (2, 1, 'Add Dark Mode', 'Details about dark mode', 'in_progress', '2025-01-15 10:19:52'),
                                                                                                          (6, 1, 'Crash on Launch', 'Fix app crash issue on iOS', 'in_progress', '2025-01-15 10:26:59'),
                                                                                                          (7, 2, 'Optimize Database', 'Improve database performance', 'pending', '2025-01-15 10:26:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
    ADD PRIMARY KEY (`comment_id`),
  ADD KEY `fk_comment_story` (`story_id`),
  ADD KEY `fk_comment_user` (`user_id`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
    ADD PRIMARY KEY (`label_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
    ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `story_labels`
--
ALTER TABLE `story_labels`
    ADD PRIMARY KEY (`story_id`,`label_id`) COMMENT 'Kombineeritud primaarvõti kasutajalugudele ja siltidele.',
  ADD KEY `fk_story_label_label` (`label_id`);

--
-- Indexes for table `story_owners`
--
ALTER TABLE `story_owners`
    ADD PRIMARY KEY (`owner_id`),
  ADD KEY `fk_owner_story` (`story_id`),
  ADD KEY `fk_owner_user` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_stories`
--
ALTER TABLE `user_stories`
    ADD PRIMARY KEY (`story_id`),
  ADD KEY `fk_story_project` (`project_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
    MODIFY `comment_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unikaalne ID iga kommentaari jaoks.', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
    MODIFY `label_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unikaalne ID iga sildi jaoks.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
    MODIFY `project_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unikaalne ID iga projekti jaoks.', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `story_owners`
--
ALTER TABLE `story_owners`
    MODIFY `owner_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unikaalne ID iga omaniku jaoks.', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
    MODIFY `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unikaalne ID iga kasutaja jaoks.', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_stories`
--
ALTER TABLE `user_stories`
    MODIFY `story_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unikaalne ID iga kasutajaloo jaoks.', AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
    ADD CONSTRAINT `fk_comment_story` FOREIGN KEY (`story_id`) REFERENCES `user_stories` (`story_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `story_labels`
--
ALTER TABLE `story_labels`
    ADD CONSTRAINT `fk_story_label_label` FOREIGN KEY (`label_id`) REFERENCES `labels` (`label_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_story_label_story` FOREIGN KEY (`story_id`) REFERENCES `user_stories` (`story_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `story_owners`
--
ALTER TABLE `story_owners`
    ADD CONSTRAINT `fk_owner_story` FOREIGN KEY (`story_id`) REFERENCES `user_stories` (`story_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_owner_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `user_stories`
--
ALTER TABLE `user_stories`
    ADD CONSTRAINT `fk_story_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
