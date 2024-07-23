-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2023 at 11:51 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trs_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `reminder_list`
--

CREATE TABLE `reminder_list` (
  `id` bigint(30) NOT NULL,
  `user_id` bigint(30) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `remind_from` date NOT NULL,
  `remind_to` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reminder_list`
--

INSERT INTO `reminder_list` (`id`, `user_id`, `title`, `description`, `remind_from`, `remind_to`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Meeting Reminder', 'Schedule and attend the weekly team meeting', '2023-11-21', '2023-11-21', 1, '2023-04-17 16:44:27', '2023-11-09 14:32:58'),
(2, 14, 'Project Deadline Reminder', 'Submit the quarterly project report to the client.', '2023-11-11', '2023-11-13', 1, '2023-04-17 16:44:57', '2023-11-09 14:40:19'),
(3, 13, 'Training Session Reminder', 'Attend the cybersecurity training session.\r\nLocation: Training Room B. Bring your laptop. ', '2023-11-05', '2023-11-06', 1, '2023-04-17 16:45:25', '2023-11-09 14:43:35'),
(4, 13, 'Sample Task 103', 'Submit monthly expense reports for reimbursement.\r\nInclude scanned receipts and expense details.', '2023-11-30', '2023-12-01', 1, '2023-04-17 16:45:56', '2023-11-09 14:55:04'),
(5, 14, 'Task Prioritization Reminder', ' Review and prioritize tasks for the upcoming week. Use the task prioritization feature to categorize tasks as high, medium, or low priority. This will help in better time management and focus on critical assignments.', '2023-11-15', '2023-11-16', 1, '2023-11-09 15:07:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Task Reminder System'),
(6, 'short_name', 'TRS'),
(11, 'logo', 'uploads/logo.png?v=1699655724'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover.png?v=1699706267'),
(17, 'phone', '456-987-1231'),
(18, 'mobile', '09123456987 / 094563212222 '),
(19, 'email', 'info@musicschool.com'),
(20, 'address', 'Here St, Down There City, Anywhere Here, 2306 -updated');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='2';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', '', 'Admin', 'admin', '$2y$10$.gzqbDnuw9K4lfDciM4j2.45sDo.jUN2Og1qNIff8meU7h3I.QH06', 'uploads/avatars/1.png?v=1649834664', NULL, 1, '2021-01-20 14:02:37', '2023-11-11 14:19:04'),
(13, 'Mike', '', 'Madison', 'mike1', '$2y$10$QatDA3cuwNRqraD4lwtrOOOZrIxKMgt8InmYPdnq8XEqDrBq26hYS', NULL, NULL, 2, '2023-04-17 16:43:19', '2023-11-09 12:52:38'),
(14, 'Hema', '', '  ', 'hema1', '$2y$10$1B6Z6fmKt4urjkRq/Zae8edGoLQGQJMNAm/67bmi6G4PQWdn4Mdnu', NULL, NULL, 2, '2023-04-17 16:43:46', '2023-11-11 15:39:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reminder_list`
--
ALTER TABLE `reminder_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_fk` (`user_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reminder_list`
--
ALTER TABLE `reminder_list`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `reminder_list`
--
ALTER TABLE `reminder_list`
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
