-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2019 at 05:06 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dallas`
--

-- --------------------------------------------------------

--
-- Table structure for table `apps`
--

CREATE TABLE `apps` (
  `appId` int(20) NOT NULL,
  `appName` varchar(250) DEFAULT NULL,
  `appPath` varchar(255) DEFAULT NULL,
  `appStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apps`
--

INSERT INTO `apps` (`appId`, `appName`, `appPath`, `appStatus`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 'accounts', 'accounts', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 'check-ins', 'checkins', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 'giving', 'giving', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL),
(4, 'groups', 'groups', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL),
(5, 'people', 'people', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL),
(6, 'registrations', 'registrations', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL),
(7, 'resources', 'resources', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL),
(8, 'services', 'services', 1, NULL, '2019-07-15 21:02:37', NULL, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `checkins`
--

CREATE TABLE `checkins` (
  `chId` bigint(20) NOT NULL,
  `eventId` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `chINDateTime` timestamp NULL DEFAULT NULL,
  `chOUTDateTime` timestamp NULL DEFAULT NULL,
  `chKind` enum('Regular','Guest','Volunteer') DEFAULT 'Regular' COMMENT 'user type with ''Regular'',''Guest'',''Volunteer''',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `checkins`
--

INSERT INTO `checkins` (`chId`, `eventId`, `user_id`, `chINDateTime`, `chOUTDateTime`, `chKind`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 1, '2019-09-05 20:17:34', NULL, 'Regular', '1', '2019-09-05 20:17:34', NULL, '2019-09-05 20:17:34', NULL, NULL),
(2, 1, 2, '2019-09-05 20:18:16', NULL, 'Regular', '1', '2019-09-05 20:18:16', NULL, '2019-09-05 20:18:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comm_details`
--

CREATE TABLE `comm_details` (
  `id` bigint(20) NOT NULL,
  `comm_master_id` bigint(20) NOT NULL,
  `to_user_id` bigint(20) NOT NULL,
  `read_status` varchar(255) NOT NULL DEFAULT 'UNREAD' COMMENT 'Read status:READ,UNREAD',
  `delete_status` varchar(255) NOT NULL DEFAULT 'UNDELETED' COMMENT 'Message status:DELETED,UNDELETED',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comm_details`
--

INSERT INTO `comm_details` (`id`, `comm_master_id`, `to_user_id`, `read_status`, `delete_status`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 2, 'UNREAD', 'UNDELETED', NULL, '2019-09-05 20:18:05', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 2, 1, 'UNREAD', 'UNDELETED', NULL, '2019-09-27 20:07:02', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 3, 2, 'UNREAD', 'UNDELETED', NULL, '2019-12-04 00:42:22', NULL, '0000-00-00 00:00:00', NULL, NULL),
(4, 3, 1, 'UNREAD', 'UNDELETED', NULL, '2019-12-04 00:42:22', NULL, '0000-00-00 00:00:00', NULL, NULL),
(5, 4, 3, 'UNREAD', 'UNDELETED', NULL, '2019-12-05 01:44:57', NULL, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comm_masters`
--

CREATE TABLE `comm_masters` (
  `id` bigint(20) NOT NULL,
  `comm_template_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Email,2=Notification',
  `tag` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `name` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `from_user_id` bigint(20) DEFAULT NULL COMMENT 'From UserId',
  `related_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comm_masters`
--

INSERT INTO `comm_masters` (`id`, `comm_template_id`, `org_id`, `type`, `tag`, `name`, `subject`, `body`, `from_user_id`, `related_id`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 4, 1, 1, 'welcome', NULL, 'Welcome Email Sujbect', 'Welcome Email Body', 1, NULL, NULL, '2019-09-05 20:18:05', NULL, '2019-09-05 20:18:05', NULL, NULL),
(2, 14, 1, 1, 'schedule_manual_notify', 'Scheduling event', 'Event Scheduled', 'Your Event has been scheduled, please follow the below mentioned details.', 1, 1, NULL, '2019-09-27 20:07:02', NULL, '2019-09-27 20:07:02', NULL, NULL),
(3, 5, 1, 2, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 1, NULL, NULL, '2019-12-04 00:42:22', NULL, '2019-12-04 00:42:22', NULL, NULL),
(4, 4, 1, 1, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 1, NULL, NULL, '2019-12-05 01:44:57', NULL, '2019-12-05 01:44:57', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comm_templates`
--

CREATE TABLE `comm_templates` (
  `id` bigint(20) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subject` text,
  `body` text,
  `org_id` bigint(20) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comm_templates`
--

INSERT INTO `comm_templates` (`id`, `tag`, `name`, `subject`, `body`, `org_id`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 0, NULL, '2019-08-22 05:01:18', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 0, NULL, '2019-08-22 05:01:18', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 0, NULL, '2019-08-22 05:01:35', NULL, '0000-00-00 00:00:00', NULL, NULL),
(4, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 1, NULL, '2019-09-02 14:15:03', NULL, NULL, NULL, NULL),
(5, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 1, NULL, '2019-09-02 14:15:03', NULL, NULL, NULL, NULL),
(6, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 1, NULL, '2019-09-02 14:15:03', NULL, NULL, NULL, NULL),
(7, 'schedule_auto_notify', 'Auto Scheduling Notification', 'Event scheduled', 'Your have been placed on the schedule. (Auto assigned)', 0, NULL, '2019-09-28 01:34:53', NULL, NULL, NULL, NULL),
(8, 'schedule_manual_notify', 'Scheduling event', 'Event Scheduled', 'Your Event has been scheduled, please follow the below mentioned details.', 0, NULL, '2019-09-28 01:34:53', NULL, NULL, NULL, NULL),
(9, 'schedule_confirmation', 'Schedule confirmation', 'Schedule Confirmation', 'You have been placed on the schedule for the following dates. To respond or simply view this schedule, click the appropriate button below.', 0, NULL, '2019-09-28 01:34:53', NULL, NULL, NULL, NULL),
(10, 'schedule_reminder', 'Schedule Remind', 'Schedule Remind', 'A Reminder that your event has been scheduled for below listed dates.', 0, NULL, '2019-09-28 01:34:53', NULL, NULL, NULL, NULL),
(11, 'schedule_check_out_notification_to_guest', 'Schedule check out notification to guest', 'Event Schedule Notification', 'This is notify that event has been scheduled.thank_you_for_service', 0, NULL, '2019-09-28 01:34:53', NULL, NULL, NULL, NULL),
(12, 'thank_you_for_service', 'Thanks for your service', 'Thanks for Service', 'Thanks for attending the below listed event.', 0, NULL, '2019-09-28 01:34:53', NULL, NULL, NULL, NULL),
(13, 'schedule_cancelled', 'Schedule cancelled', 'Schedule cancelled', 'sorry to inform you that. Your scheduled event has been canceled. For further information contact administrator.', 0, NULL, '2019-09-28 01:34:53', NULL, NULL, NULL, NULL),
(14, 'schedule_manual_notify', 'Scheduling event', 'Event Scheduled', 'Your Event has been scheduled, please follow the below mentioned details.', 1, NULL, '2019-09-27 20:07:02', NULL, '2019-09-27 20:07:02', NULL, NULL),
(15, 'schedule_auto_notify', 'Auto Scheduling Notification', 'Event scheduled', 'Your have been placed on the schedule. (Auto assigned)', 1, NULL, '2019-09-27 20:07:41', NULL, '2019-09-27 20:07:41', NULL, NULL),
(16, 'schedule_confirmation', 'Schedule confirmation', 'Schedule Confirmation', 'You have been placed on the schedule for the following dates. To respond or simply view this schedule, click the appropriate button below.', 1, NULL, '2019-09-27 20:07:41', NULL, '2019-09-27 20:07:41', NULL, NULL),
(17, 'schedule_reminder', 'Schedule Remind', 'Schedule Remind', 'A Reminder that your event has been scheduled for below listed dates.', 1, NULL, '2019-09-27 20:07:42', NULL, '2019-09-27 20:07:42', NULL, NULL),
(18, 'schedule_check_out_notification_to_guest', 'Schedule check out notification to guest', 'Event Schedule Notification', 'This is notify that event has been scheduled.thank_you_for_service', 1, NULL, '2019-09-27 20:07:42', NULL, '2019-09-27 20:07:42', NULL, NULL),
(19, 'thank_you_for_service', 'Thanks for your service', 'Thanks for Service', 'Thanks for attending the below listed event.', 1, NULL, '2019-09-27 20:07:42', NULL, '2019-09-27 20:07:42', NULL, NULL),
(20, 'schedule_cancelled', 'Schedule cancelled', 'Schedule cancelled', 'sorry to inform you that. Your scheduled event has been canceled. For further information contact administrator.', 1, NULL, '2019-09-27 20:07:42', NULL, '2019-09-27 20:07:42', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `eventId` bigint(20) NOT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `eventName` varchar(250) DEFAULT NULL,
  `eventFreq` varchar(250) DEFAULT NULL COMMENT 'Daily,Weekly,None',
  `eventDesc` text,
  `eventCreatedDate` date DEFAULT NULL,
  `eventCheckin` time DEFAULT NULL,
  `eventShowTime` time DEFAULT NULL,
  `eventStartCheckin` time DEFAULT NULL,
  `eventEndCheckin` time DEFAULT NULL,
  `eventLocation` text,
  `eventRoom` int(11) DEFAULT NULL,
  `eventResource` int(11) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eventId`, `orgId`, `eventName`, `eventFreq`, `eventDesc`, `eventCreatedDate`, `eventCheckin`, `eventShowTime`, `eventStartCheckin`, `eventEndCheckin`, `eventLocation`, `eventRoom`, `eventResource`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'Fiest', 'Daily', 'asdad asdsasdas adad', '2019-09-07', NULL, '08:00:00', '14:00:00', '15:00:00', 'locaion1', NULL, NULL, '1', '2019-09-05 20:17:23', NULL, '2019-09-05 20:17:23', NULL, NULL),
(2, 1, 'Masson', 'Daily', 'Masson', '2019-11-20', NULL, '11:00:00', '11:00:00', '12:00:00', '1', 1, NULL, '1', '2019-11-17 14:51:41', NULL, '2019-11-17 14:51:41', NULL, NULL),
(3, 1, 'Regel', 'Daily', 'Regel', '2019-11-26', NULL, '07:00:00', '13:00:00', '18:00:00', '1', NULL, NULL, '1', '2019-11-17 15:43:06', NULL, '2019-11-17 15:43:06', NULL, NULL),
(4, 1, 'Maran', 'Daily', 'Maran', '2019-11-20', NULL, '06:00:00', '11:00:00', '14:00:00', '1', NULL, NULL, '1', '2019-11-17 16:17:41', NULL, '2019-11-17 16:17:41', NULL, NULL),
(5, 1, 'Dec 10 Event', 'Daily', 'Dec 10 Event desc', '2019-12-10', NULL, '06:00:00', '10:00:00', '12:00:00', '1', 1, NULL, '1', '2019-12-01 01:15:15', NULL, '2019-12-01 01:15:15', NULL, NULL),
(6, 1, 'Dec 15 Event', 'Daily', 'Dec 15 Event desc', '2019-12-15', NULL, '09:00:00', '16:00:00', '20:00:00', '1', 1, NULL, '1', '2019-12-01 01:16:10', NULL, '2019-12-01 01:16:10', NULL, NULL),
(7, 1, 'Dec 10 Event Sec 2', 'Daily', 'Dec 10 Event Sec 2 descc', '2019-12-10', NULL, '04:00:00', '07:00:00', '10:00:00', '1', 1, NULL, '1', '2019-12-01 13:58:01', NULL, '2019-12-01 13:58:01', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) NOT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `fields` varchar(1000) DEFAULT NULL,
  `profile_fields` varchar(250) DEFAULT NULL,
  `general_fields` varchar(500) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT '1 - active, 2 - deactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `orgId`, `title`, `description`, `fields`, `profile_fields`, `general_fields`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '', '', 'a:0:{}', 'a:0:{}', NULL, 1, '2019-09-06 22:57:46', '2019-09-06 22:59:51'),
(2, 1, '', '', 'a:0:{}', 'a:0:{}', NULL, 1, '2019-09-06 22:58:38', '2019-09-06 22:58:38'),
(3, 1, 'Tour Request Form', 'St Aloysius Mangalore', 'a:4:{i:0;a:4:{s:5:\"title\";s:5:\"Phone\";s:4:\"type\";s:1:\"1\";s:3:\"tag\";s:9:\"mobile_no\";s:10:\"isRequired\";b:0;}i:1;a:4:{s:5:\"title\";s:7:\"Address\";s:4:\"type\";s:1:\"1\";s:3:\"tag\";s:7:\"address\";s:10:\"isRequired\";b:0;}i:2;a:7:{s:10:\"fieldTitle\";s:9:\"Paragraph\";s:9:\"inputType\";s:8:\"textarea\";s:4:\"type\";s:1:\"2\";s:5:\"label\";s:15:\"Your Experience\";s:11:\"placeholder\";s:21:\"Your Experience Place\";s:10:\"isRequired\";b:0;s:7:\"options\";a:0:{}}i:3;a:7:{s:10:\"fieldTitle\";s:4:\"Text\";s:9:\"inputType\";s:4:\"text\";s:4:\"type\";s:1:\"2\";s:5:\"label\";s:17:\"Your Fathers Name\";s:11:\"placeholder\";s:23:\"Your Fathers Name Place\";s:10:\"isRequired\";b:1;s:7:\"options\";a:0:{}}}', 'a:2:{i:0;s:5:\"Phone\";i:1;s:7:\"Address\";}', NULL, 1, '2019-09-06 23:01:58', '2019-09-06 23:01:58'),
(4, 1, 'Contact', 'Contact desc', 'a:3:{i:0;a:4:{s:5:\"title\";s:8:\"Birthday\";s:4:\"type\";s:1:\"1\";s:3:\"tag\";s:3:\"dob\";s:10:\"isRequired\";b:0;}i:1;a:7:{s:10:\"fieldTitle\";s:4:\"Text\";s:9:\"inputType\";s:4:\"text\";s:4:\"type\";s:1:\"2\";s:5:\"label\";s:8:\"Your age\";s:11:\"placeholder\";s:8:\"Your age\";s:10:\"isRequired\";b:1;s:7:\"options\";a:0:{}}i:2;a:4:{s:5:\"title\";s:5:\"Phone\";s:4:\"type\";s:1:\"1\";s:3:\"tag\";s:9:\"mobile_no\";s:10:\"isRequired\";b:0;}}', 'a:2:{i:0;s:8:\"Birthday\";i:1;s:5:\"Phone\";}', NULL, 1, '2019-09-08 19:28:05', '2019-09-08 19:28:05'),
(5, 1, 'New DB FOrm', 'New DB FOrm desc', 'a:2:{i:0;a:4:{s:5:\"title\";s:5:\"Phone\";s:4:\"type\";s:1:\"1\";s:3:\"tag\";s:9:\"mobile_no\";s:10:\"isRequired\";b:1;}i:1;a:7:{s:10:\"fieldTitle\";s:4:\"Text\";s:9:\"inputType\";s:4:\"text\";s:4:\"type\";s:1:\"2\";s:5:\"label\";s:3:\"Age\";s:11:\"placeholder\";s:9:\"Age Place\";s:10:\"isRequired\";b:0;s:7:\"options\";a:0:{}}}', 'a:1:{i:0;s:5:\"Phone\";}', 'a:1:{i:0;s:3:\"Age\";}', 1, '2019-09-09 08:57:03', '2019-09-09 08:57:03'),
(6, 1, 'New Form', 'New Form', 'a:2:{i:0;a:4:{s:5:\"title\";s:5:\"Phone\";s:4:\"type\";s:1:\"1\";s:3:\"tag\";s:9:\"mobile_no\";s:10:\"isRequired\";b:0;}i:1;a:7:{s:10:\"fieldTitle\";s:4:\"Text\";s:9:\"inputType\";s:4:\"text\";s:4:\"type\";s:1:\"2\";s:5:\"label\";s:3:\"Age\";s:11:\"placeholder\";s:10:\"Age Place \";s:10:\"isRequired\";b:0;s:7:\"options\";a:0:{}}}', 'a:1:{i:0;s:5:\"Phone\";}', 'a:1:{i:0;s:3:\"Age\";}', 1, '2019-09-10 21:44:52', '2019-09-10 21:44:52');

-- --------------------------------------------------------

--
-- Table structure for table `form_submissions`
--

CREATE TABLE `form_submissions` (
  `id` bigint(20) NOT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `form_id` bigint(20) DEFAULT NULL,
  `profile_fields` varchar(1000) DEFAULT NULL,
  `general_fields` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `form_submissions`
--

INSERT INTO `form_submissions` (`id`, `orgId`, `form_id`, `profile_fields`, `general_fields`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'a:5:{s:7:\"Mail Id\";s:25:\"sathish@cobrasoftwares.in\";s:8:\"Birthday\";s:10:\"2019-09-11\";s:5:\"Phone\";s:0:\"\";s:4:\"Name\";s:11:\"Sathish K S\";s:7:\"Address\";s:0:\"\";}', 'a:1:{s:8:\"Your age\";s:2:\"21\";}', '2019-09-08 19:45:06', '2019-09-08 19:45:06'),
(2, 1, 4, 'a:5:{s:7:\"Mail Id\";s:25:\"sathish@cobrasoftwares.in\";s:8:\"Birthday\";s:10:\"2019-09-11\";s:5:\"Phone\";s:0:\"\";s:4:\"Name\";s:11:\"Sathish K S\";s:7:\"Address\";s:0:\"\";}', 'a:1:{s:8:\"Your age\";s:2:\"21\";}', '2019-09-08 19:45:06', '2019-09-08 19:45:06'),
(3, 1, 3, 'a:4:{s:7:\"Mail Id\";s:14:\"asasd@asda.com\";s:5:\"Phone\";s:0:\"\";s:4:\"Name\";s:13:\"1234 1223 asd\";s:7:\"Address\";s:0:\"\";}', 'a:2:{s:15:\"Your Experience\";s:0:\"\";s:17:\"Your Fathers Name\";s:7:\"asdadas\";}', '2019-09-09 20:39:04', '2019-09-09 20:39:04'),
(4, 1, 3, 'a:4:{s:7:\"Mail Id\";s:14:\"asasd@asda.com\";s:5:\"Phone\";s:0:\"\";s:4:\"Name\";s:13:\"1234 1223 asd\";s:7:\"Address\";s:0:\"\";}', 'a:2:{s:15:\"Your Experience\";s:0:\"\";s:17:\"Your Fathers Name\";s:7:\"asdadas\";}', '2019-09-09 20:39:04', '2019-09-09 20:39:04'),
(5, 1, 3, 'a:4:{s:7:\"Mail Id\";s:14:\"asasd@asda.com\";s:5:\"Phone\";s:0:\"\";s:4:\"Name\";s:13:\"1234 1223 asd\";s:7:\"Address\";s:0:\"\";}', 'a:2:{s:15:\"Your Experience\";s:0:\"\";s:17:\"Your Fathers Name\";s:7:\"asdadas\";}', '2019-09-09 20:39:04', '2019-09-09 20:39:04'),
(6, 1, 3, 'a:4:{s:7:\"Mail Id\";s:14:\"asasd@asda.com\";s:5:\"Phone\";s:0:\"\";s:4:\"Name\";s:13:\"1234 1223 asd\";s:7:\"Address\";s:0:\"\";}', 'a:2:{s:15:\"Your Experience\";s:0:\"\";s:17:\"Your Fathers Name\";s:7:\"asdadas\";}', '2019-09-09 20:39:04', '2019-09-09 20:39:04'),
(7, 1, 6, 'a:4:{s:7:\"Mail Id\";s:25:\"sathish@cobrasoftwares.in\";s:5:\"Phone\";s:8:\"12345678\";s:4:\"Name\";s:15:\"Sathish K Kumar\";s:7:\"Address\";s:0:\"\";}', 'a:1:{s:3:\"Age\";s:2:\"22\";}', '2019-09-10 21:45:59', '2019-09-10 21:45:59');

-- --------------------------------------------------------

--
-- Table structure for table `giving`
--

CREATE TABLE `giving` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) NOT NULL,
  `orgId` bigint(20) NOT NULL,
  `groupType_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `notes` text,
  `image_path` text,
  `meeting_schedule` text,
  `isPublic` tinyint(1) DEFAULT '1' COMMENT '0=Disable, 1=Enable',
  `location` varchar(255) DEFAULT NULL,
  `is_enroll_autoClose` tinyint(1) NOT NULL DEFAULT '0',
  `enroll_autoClose_on` date DEFAULT NULL,
  `is_enroll_autoClose_count` tinyint(1) NOT NULL DEFAULT '0',
  `enroll_autoClose_count` int(15) DEFAULT NULL COMMENT 'Max attendendies per group',
  `is_enroll_notify_count` tinyint(1) NOT NULL DEFAULT '0',
  `enroll_notify_count` int(15) DEFAULT NULL,
  `contact_email` varchar(75) DEFAULT NULL,
  `visible_leaders_fields` text COMMENT 'Stored in serialized formate',
  `visible_members_fields` text COMMENT 'Stored in serialized Formate',
  `can_leaders_search_people` tinyint(1) NOT NULL DEFAULT '1',
  `can_leaders_take_attendance` tinyint(1) NOT NULL DEFAULT '1',
  `is_event_remind` tinyint(1) NOT NULL DEFAULT '1',
  `event_remind_before` int(5) DEFAULT '0',
  `enroll_status` tinyint(1) NOT NULL DEFAULT '1',
  `enroll_msg` varchar(255) DEFAULT NULL,
  `leader_visibility_publicly` tinyint(1) NOT NULL DEFAULT '1',
  `is_event_public` tinyint(1) NOT NULL DEFAULT '1',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `orgId`, `groupType_id`, `name`, `description`, `notes`, `image_path`, `meeting_schedule`, `isPublic`, `location`, `is_enroll_autoClose`, `enroll_autoClose_on`, `is_enroll_autoClose_count`, `enroll_autoClose_count`, `is_enroll_notify_count`, `enroll_notify_count`, `contact_email`, `visible_leaders_fields`, `visible_members_fields`, `can_leaders_search_people`, `can_leaders_take_attendance`, `is_event_remind`, `event_remind_before`, `enroll_status`, `enroll_msg`, `leader_visibility_publicly`, `is_event_public`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 1, 'asdsa', 'dada', NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, '', 1, 1, NULL, '2019-09-28 01:39:00', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 1, 1, 'one', 'dada', NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, '', 1, 1, NULL, '2019-09-28 01:39:00', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 1, 1, 'two', 'dada', NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, '', 1, 1, NULL, '2019-09-28 01:39:00', NULL, '0000-00-00 00:00:00', NULL, NULL),
(4, 1, 1, 'three', 'dada', NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, '', 1, 1, NULL, '2019-09-28 01:39:00', NULL, '0000-00-00 00:00:00', NULL, NULL),
(5, 1, 1, 'four', 'dada', NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, '', 1, 1, NULL, '2019-09-28 01:39:00', NULL, '0000-00-00 00:00:00', NULL, NULL),
(6, 1, 1, 'five', 'dada', NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, '', 1, 1, NULL, '2019-09-28 01:39:00', NULL, '0000-00-00 00:00:00', NULL, NULL),
(7, 1, 1, 'six\r\n', 'dada', NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, '', 1, 1, NULL, '2019-09-28 01:39:00', NULL, '0000-00-00 00:00:00', NULL, NULL),
(8, 1, 1, 'seven', 'dada', NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, '', 1, 1, NULL, '2019-09-27 20:09:00', NULL, '0000-00-00 00:00:00', NULL, NULL),
(9, 1, 1, 'eight', 'dada', NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, '', 1, 1, NULL, '2019-09-27 20:09:00', NULL, '0000-00-00 00:00:00', NULL, NULL),
(10, 1, 1, 'none', 'dada', NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, '', 1, 1, NULL, '2019-09-27 20:09:00', NULL, '0000-00-00 00:00:00', NULL, NULL),
(11, 1, 1, 'ten', 'dada', NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, '', 1, 1, NULL, '2019-09-27 20:09:00', NULL, '0000-00-00 00:00:00', NULL, NULL),
(12, 1, 1, 'eleven', 'dada', NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, '', 1, 1, NULL, '2019-09-27 20:09:00', NULL, '0000-00-00 00:00:00', NULL, NULL),
(13, 1, 1, 'tweleve', 'dada', NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, '', 1, 1, NULL, '2019-09-27 20:09:00', NULL, '0000-00-00 00:00:00', NULL, NULL),
(14, 1, 1, 'thirteen', 'dada', NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, '', 1, 1, NULL, '2019-09-27 20:09:00', NULL, '0000-00-00 00:00:00', NULL, NULL),
(15, 1, 3, 'Chennai Heavy Rain Dec1', 'Dec 5 desc', NULL, 's:386:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/group\\/15\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/group\\/15\\/\",\"uploaded_file_name\":\"list-of-all-prime-minister-india_1575336075.jpg\",\"original_filename\":\"list-of-all-prime-minister-india_1575336075.jpg\",\"upload_file_extension\":\"jpg\",\"file_size\":0}\";', 'Dec 5 rrrr', 1, '1', 1, '2019-12-05', 1, 6, 0, NULL, NULL, '[\"name\",\"photo\",\"email\"]', '[\"name\",\"photo\"]', 1, 1, 1, NULL, 1, NULL, 1, 1, '1', '2019-12-02 00:40:41', '1', '2019-12-03 01:36:08', NULL, NULL),
(16, 1, 3, 'Pallavaram', NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, 1, NULL, 1, 1, '1', '2019-12-13 00:30:10', NULL, NULL, NULL, NULL),
(17, 1, 3, 'Pallavaram', NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, 1, NULL, 1, 1, '1', '2019-12-13 00:30:22', NULL, NULL, NULL, NULL),
(18, 1, 3, 'Pallavaram', NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, 1, NULL, 1, 1, '1', '2019-12-13 00:30:55', NULL, NULL, NULL, NULL),
(19, 1, 3, 'Manali', 'Coimbatore desc', NULL, 's:334:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/group\\/19\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/group\\/19\\/\",\"uploaded_file_name\":\"instwo_1576197187.png\",\"original_filename\":\"instwo_1576197187.png\",\"upload_file_extension\":\"png\",\"file_size\":0}\";', 'Coimbatore', 1, '2', 0, NULL, 0, NULL, 0, NULL, NULL, '', '', 1, 1, 1, NULL, 1, NULL, 1, 1, '1', '2019-12-13 00:31:20', '1', '2019-12-13 00:33:09', NULL, NULL),
(20, 1, 3, 'Tiruppur', NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, 1, NULL, 1, 1, '1', '2019-12-13 00:31:33', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_enrolls`
--

CREATE TABLE `group_enrolls` (
  `id` bigint(22) NOT NULL,
  `group_id` bigint(22) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `mobile_no` int(15) DEFAULT NULL,
  `message` text,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_events`
--

CREATE TABLE `group_events` (
  `id` bigint(22) NOT NULL,
  `group_id` bigint(22) DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  `isMutiDay_event` tinyint(1) NOT NULL DEFAULT '1',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `repeat` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text,
  `is_event_remind` tinyint(1) NOT NULL DEFAULT '1',
  `event_remind_before` varchar(255) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_events`
--

INSERT INTO `group_events` (`id`, `group_id`, `title`, `isMutiDay_event`, `start_date`, `end_date`, `start_time`, `end_time`, `repeat`, `location`, `description`, `is_event_remind`, `event_remind_before`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'Event', 0, '2019-10-23', '2019-10-30', '09:00:00', '21:00:00', 'never', 'locaion1', 'asdada', 1, NULL, NULL, '2019-10-14 21:07:25', NULL, '2019-10-14 21:07:25', NULL, NULL),
(2, 15, 'Dec 5', 0, '2019-12-05', '2019-12-05', '11:00:00', '12:00:00', 'never', 'locaion1', 'asdad', 1, NULL, NULL, '2019-12-03 01:20:22', NULL, '2019-12-03 01:20:22', NULL, NULL),
(3, 15, 'Todayas events', 0, '2019-12-11', '2019-12-11', '11:00:00', '12:00:00', 'never', '1', 'Todayas events desc', 1, NULL, NULL, '2019-12-10 05:43:04', NULL, '2019-12-10 05:43:04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_events_attendance`
--

CREATE TABLE `group_events_attendance` (
  `id` bigint(22) NOT NULL,
  `event_id` bigint(22) DEFAULT NULL,
  `group_member_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(20) NOT NULL,
  `group_id` bigint(22) DEFAULT NULL,
  `isUser` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=User, 2=Enrolled User',
  `user_id` bigint(20) DEFAULT NULL,
  `role` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=Leader, 2=Member',
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  `message` text,
  `member_since` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_members`
--

INSERT INTO `group_members` (`id`, `orgId`, `group_id`, `isUser`, `user_id`, `role`, `email`, `first_name`, `middle_name`, `last_name`, `full_name`, `mobile_no`, `message`, `member_since`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(6, 1, 15, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-02 01:58:49', '1', '2019-12-02 01:58:49', NULL, '2019-12-02 01:58:49', NULL, NULL),
(7, 1, 15, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-02 02:41:15', '1', '2019-12-02 02:41:15', '1', '2019-12-12 00:57:54', NULL, NULL),
(8, 1, 14, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-02 02:44:32', '1', '2019-12-02 02:44:32', '1', '2019-12-09 02:01:43', NULL, NULL),
(9, 1, 1, 2, NULL, 2, 'sathishs1@yahoo.co.in', 'Murali', NULL, NULL, 'Sathish Kumar', '08088231481', NULL, '2019-12-09 00:13:53', NULL, '2019-12-09 00:13:53', NULL, '2019-12-12 01:52:13', NULL, NULL),
(10, 1, 1, 2, NULL, 2, 'de@asda.com', 'Raju', NULL, NULL, 'asda asdsada', '1222111', NULL, '2019-12-09 00:14:26', NULL, '2019-12-09 00:14:26', NULL, '2019-12-12 01:52:17', NULL, NULL),
(11, 1, 1, 2, NULL, 2, 'sathishs1@yahoo.co.in', 'Sathish Kumar', NULL, NULL, 'Sathish Kumar', '08088231481', NULL, '2019-12-09 00:16:31', NULL, '2019-12-09 00:16:31', NULL, '2019-12-09 00:22:23', NULL, NULL),
(12, 1, 15, 2, NULL, 2, 'sathishs1@yahoo.co.in', 'Sathish Kumar', NULL, NULL, 'Sathish Kumar', '08088231481', NULL, '2019-12-09 00:28:42', NULL, '2019-12-09 00:28:42', NULL, '2019-12-09 00:28:42', NULL, NULL),
(13, 1, 7, 2, NULL, 2, 'sathishs1@yahoo.co.in', 'Sathish Kumar', NULL, NULL, 'Sathish Kumar', '08088231481', NULL, '2019-12-09 00:29:08', NULL, '2019-12-09 00:29:08', NULL, '2019-12-09 00:29:08', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_resources`
--

CREATE TABLE `group_resources` (
  `id` bigint(22) NOT NULL,
  `group_id` bigint(22) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=File, 2=URL Path',
  `source` text,
  `description` text,
  `visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Only for Leaders / Admins, 2=ALL',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_resources`
--

INSERT INTO `group_resources` (`id`, `group_id`, `name`, `type`, `source`, `description`, `visibility`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'asdd', 1, 's:352:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/group\\/resource\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/group\\/resource\\/\",\"uploaded_file_name\":\"iglowlogo_1571107063.png\",\"original_filename\":\"iglowlogo_1571107063.png\",\"upload_file_extension\":\"png\",\"file_size\":0}\";', 'adada', 1, '1', '2019-10-14 21:07:43', NULL, '2019-10-14 21:07:43', NULL, NULL),
(2, 15, 'Dec 5', 1, 's:368:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/group\\/15\\/resource\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/group\\/15\\/resource\\/\",\"uploaded_file_name\":\"cobratechlogo_1575336050.png\",\"original_filename\":\"cobratechlogo_1575336050.png\",\"upload_file_extension\":\"png\",\"file_size\":0}\";', 'Dec 5', 2, '1', '2019-12-03 01:20:50', NULL, '2019-12-03 01:20:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_tags`
--

CREATE TABLE `group_tags` (
  `id` bigint(22) NOT NULL,
  `group_id` bigint(22) DEFAULT NULL,
  `tag_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_types`
--

CREATE TABLE `group_types` (
  `id` bigint(20) NOT NULL,
  `orgId` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '1',
  `d_isPublic` tinyint(1) DEFAULT '1' COMMENT '0=Disable, 1=Enable',
  `d_meeting_schedule` text,
  `d_description` text,
  `d_location` varchar(255) DEFAULT NULL,
  `d_contact_email` varchar(75) DEFAULT NULL,
  `d_visible_leaders_fields` text COMMENT 'Stored in serialized formate',
  `d_visible_members_fields` text COMMENT 'Stored in serialized Formate',
  `d_is_enroll_autoClose` tinyint(1) NOT NULL DEFAULT '0',
  `d_enroll_autoClose_on` date DEFAULT NULL,
  `d_is_enroll_autoClose_count` tinyint(1) NOT NULL DEFAULT '0',
  `d_enroll_autoClose_count` int(15) DEFAULT NULL COMMENT 'Max attendendies per group',
  `d_is_enroll_notify_count` tinyint(1) NOT NULL DEFAULT '0',
  `d_enroll_notify_count` int(15) DEFAULT NULL,
  `d_can_leaders_search_people` tinyint(1) NOT NULL DEFAULT '1',
  `d_is_event_public` tinyint(1) NOT NULL DEFAULT '1',
  `d_is_event_remind` tinyint(1) NOT NULL DEFAULT '1',
  `d_event_remind_before` int(5) DEFAULT NULL,
  `d_can_leaders_take_attendance` tinyint(1) NOT NULL DEFAULT '1',
  `d_enroll_status` tinyint(1) NOT NULL DEFAULT '1',
  `d_enroll_msg` varchar(255) DEFAULT NULL,
  `d_leader_visibility_publicly` tinyint(1) NOT NULL DEFAULT '1',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_types`
--

INSERT INTO `group_types` (`id`, `orgId`, `name`, `description`, `isPublic`, `d_isPublic`, `d_meeting_schedule`, `d_description`, `d_location`, `d_contact_email`, `d_visible_leaders_fields`, `d_visible_members_fields`, `d_is_enroll_autoClose`, `d_enroll_autoClose_on`, `d_is_enroll_autoClose_count`, `d_enroll_autoClose_count`, `d_is_enroll_notify_count`, `d_enroll_notify_count`, `d_can_leaders_search_people`, `d_is_event_public`, `d_is_event_remind`, `d_event_remind_before`, `d_can_leaders_take_attendance`, `d_enroll_status`, `d_enroll_msg`, `d_leader_visibility_publicly`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'Small groups', NULL, 1, 1, 'my meeting desc is here schedule', 'i all', '1', 'asd@asda.com', '[\"name\",\"phone\"]', '[\"photo\",\"email\"]', 1, '1970-01-01', 0, NULL, 0, NULL, 1, 1, 1, NULL, 1, 1, NULL, 1, NULL, '2019-09-15 08:19:10', '1', '2019-12-02 00:38:17', NULL, NULL),
(2, 1, 'Unique', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 1, 1, NULL, 1, 1, NULL, 1, NULL, '2019-09-15 08:19:10', NULL, '2019-09-15 08:19:10', NULL, NULL),
(3, 1, 'Chennai Grp', 'Chennai Grp desc', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 1, 1, NULL, 1, 1, NULL, 1, NULL, '2019-12-02 00:38:57', NULL, '2019-12-02 00:38:57', NULL, NULL),
(4, 1, 'Grp Type details', 'Grp Type details', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 1, 1, NULL, 1, 1, NULL, 1, NULL, '2019-12-10 05:31:59', NULL, '2019-12-10 05:31:59', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `households`
--

CREATE TABLE `households` (
  `id` bigint(20) NOT NULL,
  `orgId` bigint(20) NOT NULL,
  `hhPrimaryUserId` bigint(20) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `households`
--

INSERT INTO `households` (`id`, `orgId`, `hhPrimaryUserId`, `name`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 2, 'ramesg de f Household', NULL, '2019-12-04 00:42:22', NULL, '2019-12-04 00:42:22', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `household_user`
--

CREATE TABLE `household_user` (
  `id` int(11) NOT NULL,
  `household_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `isPrimary` tinyint(2) NOT NULL DEFAULT '2',
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedBy` text,
  `deletedBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `household_user`
--

INSERT INTO `household_user` (`id`, `household_id`, `user_id`, `isPrimary`, `createdBy`, `updatedBy`, `deletedBy`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 1, 2, 1, NULL, NULL, NULL, '2019-12-04 00:42:28', NULL, NULL),
(4, 1, 1, 2, NULL, NULL, NULL, '2019-12-04 00:42:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `orgId` bigint(22) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `orgId`, `name`, `latitude`, `longitude`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'Coimbatore', '11', '77', 1, '2019-11-10 12:32:05', NULL, '2019-11-10 12:32:05', NULL, NULL),
(2, 1, 'Chennai', '11', '22', 1, '2019-12-02 00:36:27', NULL, '2019-12-02 00:36:27', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_lookup_data`
--

CREATE TABLE `master_lookup_data` (
  `mldId` bigint(20) NOT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `mldKey` varchar(150) DEFAULT NULL,
  `mldValue` varchar(200) DEFAULT NULL,
  `mldType` enum('A','B') NOT NULL DEFAULT 'A' COMMENT ' A=Master Code,B=Organization Added Code',
  `mldOption` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Edit - Delete, 2=Edit - No Delete,3=No Edit - Delete,4=No Edit - No Delete',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_lookup_data`
--

INSERT INTO `master_lookup_data` (`mldId`, `orgId`, `mldKey`, `mldValue`, `mldType`, `mldOption`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 0, 'school_name', 'High School', 'A', 1, NULL, '2019-07-10 17:51:10', NULL, '2019-07-16 17:39:52', NULL, NULL),
(2, 0, 'school_name', 'Middle School', 'A', 1, NULL, '2019-07-10 18:00:06', NULL, '2019-07-16 17:39:52', NULL, NULL),
(3, 0, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-07-10 18:00:07', NULL, '2019-07-16 17:39:52', NULL, NULL),
(4, 0, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-07-10 18:00:07', NULL, '2019-07-16 17:39:52', NULL, NULL),
(5, 0, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-07-10 18:00:07', NULL, '2019-07-16 17:39:52', NULL, NULL),
(6, 0, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-07-10 18:00:07', NULL, '2019-07-16 17:39:52', NULL, NULL),
(7, 0, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-07-10 18:00:07', NULL, '2019-07-16 17:39:52', NULL, NULL),
(8, 0, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-07-10 18:00:07', NULL, '2019-07-16 17:39:52', NULL, NULL),
(9, 0, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-07-10 18:00:07', NULL, '2019-07-16 17:39:52', NULL, NULL),
(10, 0, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-07-10 18:00:07', NULL, '2019-07-16 17:39:52', NULL, NULL),
(11, 0, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-07-10 18:00:08', NULL, '2019-07-16 17:39:52', NULL, NULL),
(12, 0, 'name_suffix', 'II', 'A', 1, NULL, '2019-07-10 18:00:08', NULL, '2019-07-16 17:39:52', NULL, NULL),
(13, 0, 'name_suffix', 'III', 'A', 1, NULL, '2019-07-10 18:00:08', NULL, '2019-07-16 17:39:52', NULL, NULL),
(14, 0, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-07-10 18:00:08', NULL, '2019-07-16 17:39:52', NULL, NULL),
(15, 0, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-07-10 18:00:08', NULL, '2019-07-16 17:39:52', NULL, NULL),
(16, 0, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-07-10 18:00:08', NULL, '2019-07-16 17:39:52', NULL, NULL),
(17, 0, 'marital_status', 'Single', 'A', 1, NULL, '2019-07-10 18:00:09', NULL, '2019-07-16 17:39:52', NULL, NULL),
(18, 0, 'marital_status', 'Married', 'A', 4, NULL, '2019-07-10 18:00:09', NULL, '2019-07-16 17:39:52', NULL, NULL),
(19, 0, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-07-10 18:00:09', NULL, '2019-07-16 17:39:52', NULL, NULL),
(20, 0, 'membership_status', 'Member', 'A', 1, NULL, '2019-07-10 18:00:09', NULL, '2019-07-16 17:39:52', NULL, NULL),
(21, 0, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-07-10 18:00:09', NULL, '2019-07-16 17:39:52', NULL, NULL),
(22, 0, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-07-10 18:00:09', NULL, '2019-07-16 17:39:52', NULL, NULL),
(23, 0, 'membership_status', 'Participant', 'A', 1, NULL, '2019-07-10 18:00:09', NULL, '2019-07-16 17:39:52', NULL, NULL),
(24, 0, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-07-10 18:00:09', NULL, '2019-07-16 17:39:52', NULL, NULL),
(25, 0, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-07-10 18:43:30', NULL, '2019-07-16 17:39:52', NULL, NULL),
(26, 0, 'grade_name', 'K', 'A', 4, NULL, '2019-07-10 18:43:30', NULL, '2019-07-16 17:39:52', NULL, NULL),
(27, 0, 'grade_name', '1st', 'A', 4, NULL, '2019-07-10 18:43:30', NULL, '2019-07-16 17:39:52', NULL, NULL),
(28, 0, 'grade_name', '2nd', 'A', 1, NULL, '2019-07-10 18:43:30', NULL, '2019-07-16 17:39:52', NULL, NULL),
(29, 0, 'grade_name', '3rd', 'A', 4, NULL, '2019-07-10 18:43:30', NULL, '2019-07-16 17:39:52', NULL, NULL),
(30, 1, 'school_name', 'High School', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(31, 1, 'school_name', 'Middle School', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(32, 1, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(33, 1, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(34, 1, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(35, 1, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(36, 1, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(37, 1, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(38, 1, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(39, 1, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(40, 1, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(41, 1, 'name_suffix', 'II', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(42, 1, 'name_suffix', 'III', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(43, 1, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(44, 1, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(45, 1, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(46, 1, 'marital_status', 'Single', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(47, 1, 'marital_status', 'Married', 'A', 4, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(48, 1, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(49, 1, 'membership_status', 'Member', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(50, 1, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(51, 1, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(52, 1, 'membership_status', 'Participant', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(53, 1, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(54, 1, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(55, 1, 'grade_name', 'K', 'A', 4, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(56, 1, 'grade_name', '1st', 'A', 4, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(57, 1, 'grade_name', '2nd', 'A', 1, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(58, 1, 'grade_name', '3rd', 'A', 4, NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL),
(59, 0, 'room_group', 'Group1', 'A', 4, NULL, '2019-08-22 22:03:55', NULL, '2019-08-22 22:03:55', NULL, NULL),
(60, 0, 'resource_category', 'Electronic', 'A', 4, NULL, '2019-08-22 22:03:55', NULL, '2019-08-22 22:03:55', NULL, NULL),
(61, 0, 'pastor_board', 'Electronic', 'A', 1, NULL, '2019-09-11 15:05:01', NULL, '0000-00-00 00:00:00', NULL, NULL),
(62, 0, 'pastor_board', 'Home Care', 'A', 1, NULL, '2019-09-11 15:05:01', NULL, '0000-00-00 00:00:00', NULL, NULL),
(63, 1, 'type_of_volunteer', 'checker', 'A', 1, NULL, '2019-09-21 01:32:23', NULL, '0000-00-00 00:00:00', NULL, NULL),
(64, 1, 'type_of_volunteer', 'service', 'A', 1, NULL, '2019-09-21 01:32:23', NULL, '0000-00-00 00:00:00', NULL, NULL),
(65, 1, 'type_of_volunteer', 'helper', 'A', 1, NULL, '2019-09-21 01:32:23', NULL, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2019_05_06_061007_create_permission_tables', 1),
(8, '2019_05_06_061659_create_posts_table', 1),
(9, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(10, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(12, '2016_06_01_000004_create_oauth_clients_table', 2),
(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(7, '', 13),
(7, '', 14);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(13, 'App\\User', 1),
(14, 'App\\User', 2),
(14, 'App\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('01b54bae27d01107095834b45b6d5b9d7fae4b8d8c0b9c015e68260d7c5e8d9a90ec0a99eebf5b67', 1, 1, 'dollar', '[]', 0, '2019-12-04 00:32:41', '2019-12-04 00:32:41', '2020-12-04 06:02:41'),
('02011951bb61cffaf3cb8034cde8d2a6aba669c62838cfa3ec7296de8d2b176d7dabd391b40045b9', 1, 1, 'dollar', '[]', 0, '2019-09-29 19:46:32', '2019-09-29 19:46:32', '2020-09-30 01:16:32'),
('054e8ce59e69dbca4363652dd1b59377156ca1cfe6150acf10707c49ffb2e24845a2283b34b2ef81', 1, 1, 'dollar', '[]', 0, '2019-09-27 22:35:46', '2019-09-27 22:35:46', '2020-09-28 04:05:46'),
('06b92c66f47f1b09e8cb6e1ee32778a80108bdb62e83718771fd3b2163b707491784dba739514418', 1, 1, 'dollar', '[]', 0, '2019-08-28 18:43:18', '2019-08-28 18:43:18', '2020-08-29 00:13:18'),
('0d61ed80db33fe1aa5e153100ae879bb44c12644aad237106c470b656356dd5c6779d6c8b9f894a8', 1, 1, 'dollar', '[]', 0, '2019-09-05 20:15:25', '2019-09-05 20:15:25', '2020-09-06 01:45:25'),
('0dc57dd5dc69fce8fe92edea8f07e276c364c0370c896f266075ff3231abd7b35071398a27668e33', 1, 1, 'dollar', '[]', 0, '2019-09-24 20:04:55', '2019-09-24 20:04:55', '2020-09-25 01:34:55'),
('0fd5c8dc43845d73972b409c3730b1c32133490ebf3be9485b4ba89aa6f9b5fcaa37438f2274efa0', 1, 1, 'dollar', '[]', 0, '2019-09-02 08:45:09', '2019-09-02 08:45:09', '2020-09-02 14:15:09'),
('10426bb9c6e14a3afddf1f093a1b0ec92d32caf33d320ca88cc262150673013627ff1b87818c588f', 1, 1, 'dollar', '[]', 0, '2019-11-17 05:48:01', '2019-11-17 05:48:01', '2020-11-17 11:18:01'),
('112dab96784a3551ed765130f6d37bb5c838c2ee2be5cc795c4c9d66ed295a260a1a4138a22402a1', 1, 1, 'dollar', '[]', 0, '2019-09-18 09:48:09', '2019-09-18 09:48:09', '2020-09-18 15:18:09'),
('158263b6d99cbb33665d910d839f1d57ce572a49a49efba04c6442c289828af8b7396c0910c88a79', 1, 1, 'dollar', '[]', 0, '2019-09-10 21:40:53', '2019-09-10 21:40:53', '2020-09-11 03:10:53'),
('16339df9f48f5305d4efca4a4a013ea82dfaf0e1e669c48744b0918fe9049da5e09835e4ae5ba60e', 1, 1, 'dollar', '[]', 0, '2019-09-12 18:39:41', '2019-09-12 18:39:41', '2020-09-13 00:09:41'),
('17dd8bbcecc3613454cc8b67f84c85d92cb1794fb88355a7c6a5af98b7f68c407208862ba2fd24e8', 1, 1, 'dollar', '[]', 0, '2019-10-19 18:48:41', '2019-10-19 18:48:41', '2020-10-20 00:18:41'),
('1873c7183e374f5e07e95f84c40d1dcd8551392fb14812e3cfed30157730e5951472070b8fa0999e', 1, 1, 'dollar', '[]', 0, '2019-12-03 00:56:54', '2019-12-03 00:56:54', '2020-12-03 06:26:54'),
('18a2f9ac3a1ea3a028add989b416007711cba5ef915f106c995e7a643db921892543946eeb65aac7', 1, 1, 'dollar', '[]', 0, '2019-12-04 00:15:46', '2019-12-04 00:15:46', '2020-12-04 05:45:46'),
('19272c2e52d3f4bf9c452415fef1cc3e2a23e3ddf2bb36eb4955393b6b5399abe289bec13b157272', 1, 1, 'dollar', '[]', 0, '2019-08-24 20:14:52', '2019-08-24 20:14:52', '2020-08-25 01:44:52'),
('1f8f931bb955fb6edba1dd8085892816a7d94a3cb260bb6771b77744915373e1005c47c536aca82a', 1, 1, 'dollar', '[]', 0, '2019-12-01 13:02:14', '2019-12-01 13:02:14', '2020-12-01 18:32:14'),
('241bfe2b193c90a379e011ed6c1389ffa45e69debf4ebae8c6451cdde610c1408b9b5ce6d675e21e', 1, 1, 'dollar', '[]', 0, '2019-11-02 11:16:29', '2019-11-02 11:16:29', '2020-11-02 16:46:29'),
('283d82cd1c526e52825dbf5ce6900872d84645596ba30c7abb3fbe010deb4472f17b53086b3f477a', 1, 1, 'dollar', '[]', 0, '2019-10-28 20:24:01', '2019-10-28 20:24:01', '2020-10-29 01:54:01'),
('293c125b8d400630d295dc297f13d9471133e30976e381d9ccc984e1670c0e9bac30979e7edc3ffb', 1, 1, 'dollar', '[]', 0, '2019-12-10 00:40:59', '2019-12-10 00:40:59', '2020-12-10 06:10:59'),
('2b5b2a114f5619b35b7f0081d83352923291545401dd5edec4fd599456d4fd5b28adc8b56ffab822', 1, 1, 'dollar', '[]', 0, '2019-11-03 15:44:27', '2019-11-03 15:44:27', '2020-11-03 21:14:27'),
('2d29e100b686baa8d92c5c7f10e3aa5b6cc5673dc59c8f052bcfb512c9d1b7b9c3e4751f2f9924da', 9, 1, 'dollar', '[]', 0, '2019-09-02 04:08:44', '2019-09-02 04:08:44', '2020-09-02 09:38:44'),
('302072937ee1300a17c3afe68ebeae90195aed4e5b0b1cb22073297aadda5becb67025e9fa511776', 1, 1, 'dollar', '[]', 0, '2019-09-18 09:16:55', '2019-09-18 09:16:55', '2020-09-18 14:46:55'),
('30866b419a2c95e036075a0232e068200f69884f631da84cb4a8c6540e25ed45d8ac85f043f2df58', 3, 1, 'dollar', '[]', 0, '2019-12-05 01:45:11', '2019-12-05 01:45:11', '2020-12-05 07:15:11'),
('31864836a7b98d165ff965efce9a2eea7776607fc3f71d2797f98424c29b0532a3da4a1590dadf45', 1, 1, 'dollar', '[]', 0, '2019-12-13 00:29:08', '2019-12-13 00:29:08', '2020-12-13 05:59:08'),
('3456c9c15b71faa05813f8246f2f64979b4f875d22cd34abcfb66c509cca7fd477050272d351ab0f', 1, 1, 'dollar', '[]', 0, '2019-09-11 09:51:23', '2019-09-11 09:51:23', '2020-09-11 15:21:23'),
('3795009633228fe374bc7d665db47f565d0978d2e602bc200bd9fa465e41333dfaca410668439550', 1, 1, 'dollar', '[]', 0, '2019-11-11 01:03:32', '2019-11-11 01:03:32', '2020-11-11 06:33:32'),
('3d0e5fc3fae705c3fd7d0a28b3058ab40c55f54aaa73b82c2b527f1dbaf7c4517e495958e6762ffd', 1, 1, 'dollar', '[]', 0, '2019-12-10 05:26:52', '2019-12-10 05:26:52', '2020-12-10 10:56:52'),
('3e676fe179c1c385fb08d43874b54c11f9ddbdb7b8292e3c180decfae8ccb3a577b096a1a3e31115', 1, 1, 'dollar', '[]', 0, '2019-11-03 11:10:08', '2019-11-03 11:10:08', '2020-11-03 16:40:08'),
('402ab601017494b14bc09382e0965ecd1e5e5e351aae8cd067ffb41f057e7f5232c7a9bb37348bc0', 8, 1, 'dollar', '[]', 0, '2019-09-02 04:07:33', '2019-09-02 04:07:33', '2020-09-02 09:37:33'),
('455877b653904f9c6048523a34715a018cef4d976c791e5f5cab7dfa5ce0409820ac15e772a3256d', 1, 1, 'dollar', '[]', 0, '2019-09-01 23:53:49', '2019-09-01 23:53:49', '2020-09-02 05:23:49'),
('484c2f0d05df45e1762ccde22b02537e3c8f71098ab74f00c6ae2dda9e1a4da5057f56304d748509', 1, 1, 'dollar', '[]', 0, '2019-09-12 08:30:56', '2019-09-12 08:30:56', '2020-09-12 14:00:56'),
('4f1bead9b2ba98937f0730b5751264027740dcb02639564b5f9aa20653a6e15759da7a8c0f92d338', 1, 1, 'dollar', '[]', 0, '2019-11-11 03:52:48', '2019-11-11 03:52:48', '2020-11-11 09:22:48'),
('52d72709bdb3cb942af56f0c73ec41da9cbfa9a3b58a106c6beb3bdc492f398847ead9ceac5d1832', 1, 1, 'dollar', '[]', 0, '2019-10-14 21:02:24', '2019-10-14 21:02:24', '2020-10-15 02:32:24'),
('5413b97e87e9f8d5fc3fbfe4b68cc6ff4224ee2c74e68b5d52354a925f95a1be7696926e03ede7be', 1, 1, 'dollar', '[]', 0, '2019-11-10 09:08:31', '2019-11-10 09:08:31', '2020-11-10 14:38:31'),
('5a40acb0ccb193c183e42b26b675befebe9ff4c137fd03e23f143139a183f258ef52d164d23151ac', 1, 1, 'dollar', '[]', 0, '2019-11-17 05:30:50', '2019-11-17 05:30:50', '2020-11-17 11:00:50'),
('5e8b7cd26450e0c5759442ce7253f18a120db2328180d9d5b8f6a6fe80da37d05bed9648faabc11b', 1, 1, 'dollar', '[]', 0, '2019-12-11 02:00:52', '2019-12-11 02:00:52', '2020-12-11 07:30:52'),
('61acc42444269ef9391f7db16465b2d64bf943855c819290b0508258d970991c2149dfe737bc603e', 1, 1, 'dollar', '[]', 0, '2019-11-01 10:47:14', '2019-11-01 10:47:14', '2020-11-01 16:17:14'),
('63d403a69efeb2fccbbdef789856674b321f24aef840036ea3030030f39a602ddc2267adfac9edba', 1, 1, 'dollar', '[]', 0, '2019-09-29 21:44:32', '2019-09-29 21:44:32', '2020-09-30 03:14:32'),
('685dbfec990ed843e61c63b17448880dcb4c30d003612ed9122435006d78105d69a0b6ffd1d19ca6', 1, 1, 'dollar', '[]', 0, '2019-09-01 22:52:04', '2019-09-01 22:52:04', '2020-09-02 04:22:04'),
('6d42799e3469a8cc32828b0d003ee48f6caeadd74c10c873e0bfac6dbec2838909a6c15fef9c8859', 1, 1, 'dollar', '[]', 0, '2019-11-21 01:42:37', '2019-11-21 01:42:37', '2020-11-21 07:12:37'),
('6fc5027dfa9bef923732ccd2f9db797d4b9334515d90cf474f1a744914dde71820e1109b8a4c87a7', 1, 1, 'dollar', '[]', 0, '2019-09-25 18:47:37', '2019-09-25 18:47:37', '2020-09-26 00:17:37'),
('714c6e61bb08aa30d5d649b146e525661a1f0cce949c8e17a4f3e98d6c4438869e8b042ab7062a8b', 1, 1, 'dollar', '[]', 0, '2019-09-09 20:13:57', '2019-09-09 20:13:57', '2020-09-10 01:43:57'),
('72f41dcbdcc3ba38783be84fcd73049a8284810be91c316461b34646961ea4f1852ff8a94a63b208', 1, 1, 'dollar', '[]', 0, '2019-11-11 03:52:08', '2019-11-11 03:52:08', '2020-11-11 09:22:08'),
('75fb965d62465de738b5697e8ec06c1f528a252799656ae00ccf01e4de863c93d5452cb03ad18ce4', 1, 1, 'dollar', '[]', 0, '2019-09-11 19:28:39', '2019-09-11 19:28:39', '2020-09-12 00:58:39'),
('76b825058ef909da602b57ce9889be0a80a6fddc41e7076307f9326082476240a002e5c2485180e9', 1, 1, 'dollar', '[]', 0, '2019-09-09 08:51:06', '2019-09-09 08:51:06', '2020-09-09 14:21:06'),
('7a64927dc3d31e440440f694937044c0ae4c529e8cfb58925066fe36c142d7b36c26fc2e372e8145', 1, 1, 'dollar', '[]', 0, '2019-09-03 10:56:57', '2019-09-03 10:56:57', '2020-09-03 16:26:57'),
('7ba3d1d0f79eb4e3f1869bc3bfa90a08d5e34d9220bdbe3adda6691c7796acc6b011f866bd145467', 1, 1, 'dollar', '[]', 0, '2019-11-17 12:30:22', '2019-11-17 12:30:22', '2020-11-17 18:00:22'),
('7c30cbce0a6743331c674d86f532f65cafe3ce5fa871de7483d2eaccf55c9a42c14bb0674909b1d3', 1, 1, 'dollar', '[]', 0, '2019-08-25 07:30:40', '2019-08-25 07:30:40', '2020-08-25 13:00:40'),
('7cabcf95782f5912e7459778b4e5db4a266c72203e5e7e0f5c106088d5362b2d0755fb2073105846', 1, 1, 'dollar', '[]', 0, '2019-12-12 04:33:18', '2019-12-12 04:33:18', '2020-12-12 10:03:18'),
('7e1d70bf3f288eb4c2f815d57e93290abd3f41fdda886045c1a0c4446e53008ffb1d1b0a263ddafb', 1, 1, 'dollar', '[]', 0, '2019-09-01 23:54:46', '2019-09-01 23:54:46', '2020-09-02 05:24:46'),
('7f54116e712f21763e76a4e50ef9b71f18e9c8bcac89fca76e38e2864ae38faee204dda6971d4bf6', 1, 1, 'dollar', '[]', 0, '2019-11-16 13:46:31', '2019-11-16 13:46:31', '2020-11-16 19:16:31'),
('8407ae545b6bf07952355ec3447c6a80208c6e8b09a7637f7bf5f4ddb6c9dcb99ce3d1fa4050098a', 1, 1, 'dollar', '[]', 0, '2019-08-24 22:05:54', '2019-08-24 22:05:54', '2020-08-25 03:35:54'),
('8bc7096ba857d74e088ef92065c7a14db24e45c1c4f18255e1d39607e45265f1705c7a3e7002b20c', 1, 1, 'dollar', '[]', 0, '2019-12-09 00:16:57', '2019-12-09 00:16:57', '2020-12-09 05:46:57'),
('8ec2222cbf759e82025013ff99f3357db0ee7c087e8cfadcfa4cffb684c0f3eb4b47491b8331722f', 1, 1, 'dollar', '[]', 0, '2019-09-15 08:03:24', '2019-09-15 08:03:24', '2020-09-15 13:33:24'),
('90b0cf280b5b6a0da5ea420615dcb6146aa868cb2914e4771a960173f6c609902ace470ad12a3936', 1, 1, 'dollar', '[]', 0, '2019-11-24 04:35:34', '2019-11-24 04:35:34', '2020-11-24 10:05:34'),
('93d3eeee7090ae2cc90f7e07eb740e86eac3708e8589db06728ea8f111be54e786b2efbe7107ebba', 1, 1, 'dollar', '[]', 0, '2019-12-11 02:00:13', '2019-12-11 02:00:13', '2020-12-11 07:30:13'),
('94bf3108327fb1a09f2193a0854c5294392373407c6290d0c9077d36fa367452c87795cee0b2d64f', 1, 1, 'dollar', '[]', 0, '2019-09-02 01:59:19', '2019-09-02 01:59:19', '2020-09-02 07:29:19'),
('97f521aec71958cbccecb51177a68f785b3186d69da5f9e8c58d67b83f0d87835a8859113d70e0c9', 1, 1, 'dollar', '[]', 0, '2019-09-18 10:33:46', '2019-09-18 10:33:46', '2020-09-18 16:03:46'),
('9a99ba39e761dbc17ca18e0fe37ffcf0f1335a8ddbb6d64be4e7118b5e94de911eb05d85d1168967', 1, 1, 'dollar', '[]', 0, '2019-12-12 04:32:20', '2019-12-12 04:32:20', '2020-12-12 10:02:20'),
('9bcbc32af194f2eab4b21f14a59acf0231bbdb03f1457a83b5d97aaf939fa1a1260cf08515848b91', 1, 1, 'dollar', '[]', 0, '2019-12-06 00:09:39', '2019-12-06 00:09:39', '2020-12-06 05:39:39'),
('9dba0135ebb9641494e1d97e59f4354e3c1d5b07f1d7590f8f583c43b822dbb715d93af07e50dd60', 1, 1, 'dollar', '[]', 0, '2019-09-28 09:57:11', '2019-09-28 09:57:11', '2020-09-28 15:27:11'),
('9f9de72198538823644224f43d402c81af22990b675e241a0c733ccd9d0c8b69ffe60aa3aee8f914', 1, 1, 'dollar', '[]', 0, '2019-12-10 05:26:53', '2019-12-10 05:26:53', '2020-12-10 10:56:53'),
('a0412fd16b217606bb25b74ecb9423069d0c6da3c0ab60a3809cbe7e38a667d4e149ddb4bda08da2', 1, 1, 'dollar', '[]', 0, '2019-11-18 03:08:09', '2019-11-18 03:08:09', '2020-11-18 08:38:09'),
('a1723d73c4fff1baa97084ae43e45452e7397e24b863cda5950b203ba50101d201f5d4c7dabc195c', 1, 1, 'dollar', '[]', 0, '2019-08-27 21:12:17', '2019-08-27 21:12:17', '2020-08-28 02:42:17'),
('a452aa737592a936ca377b140911ad676087e71b4078d783390f397042adc3c04b8445164e721213', 1, 1, 'dollar', '[]', 0, '2019-11-03 00:30:33', '2019-11-03 00:30:33', '2020-11-03 06:00:33'),
('a7289273947fb30912e96af73341d2a4df9f451979d18dbdaa40962783ed62ff7190eff5938b4c90', 1, 1, 'dollar', '[]', 0, '2019-08-31 04:16:35', '2019-08-31 04:16:35', '2020-08-31 09:46:35'),
('a8a5bbdbf236edebe4b3ac0a1c4bae9fe336830cf822843729123a0d05b9ac6b29cfa4f9198dce21', 1, 1, 'dollar', '[]', 0, '2019-09-17 19:33:41', '2019-09-17 19:33:41', '2020-09-18 01:03:41'),
('a9de36c574966338c0fce32a54d31c04a2aeb0898acad2bf85dcec9b56bebeab651f9876586ff50a', 1, 1, 'dollar', '[]', 0, '2019-10-28 04:20:21', '2019-10-28 04:20:21', '2020-10-28 09:50:21'),
('ad3fdff2f7e83b37d3ca7928e30e87cbf87b8bef8289a99694df154f6f28fe63570da630bc22ab22', 1, 1, 'dollar', '[]', 0, '2019-12-11 00:30:37', '2019-12-11 00:30:37', '2020-12-11 06:00:37'),
('adcde0b137b07760d67aee5d0f00ba3088ad27c743c870df9088b4a769af7928c6f9676372300a1a', 1, 1, 'dollar', '[]', 0, '2019-10-23 19:12:50', '2019-10-23 19:12:50', '2020-10-24 00:42:50'),
('afb7ecf322cce1c0b02f09bad72eae1ffd15949ff145139e04bb79fd29ee6639744a1cacb15e45dd', 1, 1, 'dollar', '[]', 0, '2019-10-19 05:57:26', '2019-10-19 05:57:26', '2020-10-19 11:27:26'),
('b3211c42f7084ead2ecc214ce30761795364de62b3ae55ad2fa352a182591fd465eced8461d20505', 1, 1, 'dollar', '[]', 0, '2019-10-28 00:20:41', '2019-10-28 00:20:41', '2020-10-28 05:50:41'),
('b34efcdfcb37b3353e61a09b96361057120a73507f6316a67b5a3fe538d26ddb0defa980234f05b0', 1, 1, 'dollar', '[]', 0, '2019-10-19 21:40:11', '2019-10-19 21:40:11', '2020-10-20 03:10:11'),
('b593a2961f8deeeb1b42f9cc1059cfcc282975180c7d36577a4c7267def7548edb4a689ba9310c23', 1, 1, 'dollar', '[]', 0, '2019-09-29 06:31:56', '2019-09-29 06:31:56', '2020-09-29 12:01:56'),
('b5dbec6e13b7712c33b3443d43f2d12bfeea4b550b25f00fc7a5523c92a0790c01cd1ca4bbc25c28', 1, 1, 'dollar', '[]', 0, '2019-09-07 05:42:28', '2019-09-07 05:42:28', '2020-09-07 11:12:28'),
('b6751dd3e68bd97f2d07773eb62efc593ac555096757953db6fd58dc8b6ca3624fd83db79839078b', 1, 1, 'dollar', '[]', 0, '2019-11-10 12:27:34', '2019-11-10 12:27:34', '2020-11-10 17:57:34'),
('b7d844c9ea542f12e5f17fd03d8f2327a9b42fe31c1d289c15dadf26b9220421c465c443d26d1301', 1, 1, 'dollar', '[]', 0, '2019-11-09 12:13:09', '2019-11-09 12:13:09', '2020-11-09 17:43:09'),
('baefa5b4c70698404089905b8a498da903ef868d0708a4f5c62ab27878725eb6e1798fb5d8f0ae1f', 6, 1, 'dollar', '[]', 0, '2019-09-01 19:57:35', '2019-09-01 19:57:35', '2020-09-02 01:27:35'),
('bb86c418163c8e10f073be8612f60e48c490f37205ef83ff05ca6b84c36d2347c09088cd5d231691', 1, 1, 'dollar', '[]', 0, '2019-09-06 22:57:11', '2019-09-06 22:57:11', '2020-09-07 04:27:11'),
('bdbee6fbf6413649f5b101a7b75772b71cd19573c4c1d52d6e5f21260d257e134093f5489dba2a25', 1, 1, 'dollar', '[]', 0, '2019-09-27 20:05:43', '2019-09-27 20:05:43', '2020-09-28 01:35:43'),
('c0e5a304ed780d2527fc84dd133eccd41f96bb737e7c1ca1fea8b9eb03d801833d58aef76e7ce4db', 1, 1, 'dollar', '[]', 0, '2019-10-19 21:41:27', '2019-10-19 21:41:27', '2020-10-20 03:11:27'),
('c1b57bec5a52f74476d01a661bc4aef00e8aefa9b9241b646b756c3435662aa330fa71e46c077446', 1, 1, 'dollar', '[]', 0, '2019-12-05 03:02:18', '2019-12-05 03:02:18', '2020-12-05 08:32:18'),
('c37891b4cc879992449c031bf0278da0d794354361adfd56a987800d04fe784a2b960f343cce41e7', 1, 1, 'dollar', '[]', 0, '2019-12-01 23:58:22', '2019-12-01 23:58:22', '2020-12-02 05:28:22'),
('c3adc6ea3293948bf9b280d18a251bdd42cf5d1101fa17f128ae067c3417b40384aa3265aa6639b5', 1, 1, 'dollar', '[]', 0, '2019-12-08 14:00:44', '2019-12-08 14:00:44', '2020-12-08 19:30:44'),
('ca3a7a7deaa167791cb684c7d061e688761c917b4ab6d0ad3103dc06834a467027072befef2b27a6', 1, 1, 'dollar', '[]', 0, '2019-12-05 00:25:29', '2019-12-05 00:25:29', '2020-12-05 05:55:29'),
('cc2bce10f5c988042e1f18862a7bb4d145d5561d705cc025ab519d14ea4dc3e46f72a1755cff87a0', 1, 1, 'dollar', '[]', 0, '2019-12-01 01:11:16', '2019-12-01 01:11:16', '2020-12-01 06:41:16'),
('ce7a5f1c6386cdacc36e14b724ff76a1a101c7bc30cc1440904fdb6d1c9fb28eefb2b783fb7f001a', 1, 1, 'dollar', '[]', 0, '2019-12-04 15:11:09', '2019-12-04 15:11:09', '2020-12-04 20:41:09'),
('d3f44601e7033f3c90e3c675e506c167edbea2893cdf5540bb8da8aa0d62a9d947f32e25ad679fb2', 1, 1, 'dollar', '[]', 0, '2019-11-02 01:08:13', '2019-11-02 01:08:13', '2020-11-02 06:38:13'),
('d5d68955d2f9f5b8660dd9cbd99713823622eed4cbafe6d3cc9499b4a72d77963315c57e7932bcce', 1, 1, 'dollar', '[]', 0, '2019-10-01 22:43:32', '2019-10-01 22:43:32', '2020-10-02 04:13:32'),
('dad23036dc7a06ab71c114084d92e86ccef2bdac5d12bb5e0383c8b9e89069dba6e38f2e32a429b9', 1, 1, 'dollar', '[]', 0, '2019-11-07 02:27:24', '2019-11-07 02:27:24', '2020-11-07 07:57:24'),
('dc789000eadf2292f372c6932bbe9f21827a0df9f37cbf5c7a182e3a3d2728678deb686b150932f8', 1, 1, 'dollar', '[]', 0, '2019-09-25 08:36:39', '2019-09-25 08:36:39', '2020-09-25 14:06:39'),
('e5e5f02df407562e694b845def7471aaa7b947b0d8ab0fec0c21623f86136e0be0e0c37f9b196573', 1, 1, 'dollar', '[]', 0, '2019-10-19 21:40:36', '2019-10-19 21:40:36', '2020-10-20 03:10:36'),
('e614d6eed7b1aa2b66a03b38be1f4cc89ccd9db5677adadd04794245fe23a14a8fb2e538d82d189b', 1, 1, 'dollar', '[]', 0, '2019-11-06 00:56:07', '2019-11-06 00:56:07', '2020-11-06 06:26:07'),
('e8b4919c5f2c1444ec6cef5678f08b156b18fcbdfb01aba304facbeadb7cdb496c48ec5e0b62f00f', 1, 1, 'dollar', '[]', 0, '2019-09-29 21:46:17', '2019-09-29 21:46:17', '2020-09-30 03:16:17'),
('e8d01693d0bd9efa55371ab1716c693709e579d3e99eedd27d62809cf4bf90603600b3d486fff491', 1, 1, 'dollar', '[]', 0, '2019-09-20 20:00:21', '2019-09-20 20:00:21', '2020-09-21 01:30:21'),
('f2aa3d14801a0cdd6db26192e6b6b2575083e068727c5b70e529eca0129c1d87ef04f7d8590ee383', 1, 1, 'dollar', '[]', 0, '2019-12-12 00:33:23', '2019-12-12 00:33:23', '2020-12-12 06:03:23'),
('f565875e7d6449c2a9dd4feb381b254b8217ea04fc94c1ce362ead76e378124ecf97ff0efb3e0234', 1, 1, 'dollar', '[]', 0, '2019-09-08 19:26:11', '2019-09-08 19:26:11', '2020-09-09 00:56:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'KTpGS8SGl59m7hYg24lfah08jwIvdGi4xmdwCRJl', 'http://localhost', 1, 0, 0, '2019-04-22 11:22:39', '2019-04-22 11:22:39'),
(2, NULL, 'Laravel Password Grant Client', '9beWRls9Vc1uMuBkuN0PT1ypowdrXmxnf27GVqha', 'http://localhost', 0, 1, 0, '2019-04-22 11:22:39', '2019-04-22 11:22:39');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-05-05 20:28:45', '2019-05-05 20:28:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `orgId` bigint(20) NOT NULL,
  `orgName` varchar(255) NOT NULL,
  `orgAddress` text,
  `orgAptUnitBox` text,
  `orgCity` varchar(255) DEFAULT NULL,
  `orgState` varchar(255) DEFAULT NULL,
  `orgPincode` varchar(100) DEFAULT NULL,
  `orgPhone` varchar(50) DEFAULT NULL,
  `orgLogo` text,
  `orgTimeZone` text,
  `orgTimeCountry` int(20) DEFAULT NULL,
  `orgTimeFormat` varchar(10) DEFAULT NULL,
  `orgDateFormat` varchar(255) DEFAULT NULL,
  `orgCurrency` varchar(150) DEFAULT NULL,
  `orgEmail` text,
  `orgWebsite` text,
  `orgTaxIdNo` varchar(150) DEFAULT NULL,
  `orgDomain` varchar(250) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`orgId`, `orgName`, `orgAddress`, `orgAptUnitBox`, `orgCity`, `orgState`, `orgPincode`, `orgPhone`, `orgLogo`, `orgTimeZone`, `orgTimeCountry`, `orgTimeFormat`, `orgDateFormat`, `orgCurrency`, `orgEmail`, `orgWebsite`, `orgTaxIdNo`, `orgDomain`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 'stpaul church', '1st Main road', NULL, 'Coimbatore', 'Karnataka', '600028', '1290', 's:384:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/org_logo\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/org_logo\\/\",\"uploaded_file_name\":\"list-of-all-prime-minister-india_1576125158.jpg\",\"original_filename\":\"list-of-all-prime-minister-india_1576125158.jpg\",\"upload_file_extension\":\"jpg\",\"file_size\":0}\";', 'Pacific/Samoa', 1, NULL, NULL, NULL, 'stpaulchurchemail@gmail.com', 'http://www.st.com', NULL, 'stpaul', NULL, '2019-09-02 08:45:03', NULL, '2019-12-12 04:32:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `other_payment_methods`
--

CREATE TABLE `other_payment_methods` (
  `other_payment_method_id` int(11) NOT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `payment_method` varchar(100) NOT NULL,
  `payment_method_notes` text,
  `confirm_payment_method` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Deactive,1=Active  (When a student submits the registration fee method with flag 1 , the payment status will be marked as confirmed )',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '0=Inactive,1=Active',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `other_payment_methods`
--

INSERT INTO `other_payment_methods` (`other_payment_method_id`, `orgId`, `payment_method`, `payment_method_notes`, `confirm_payment_method`, `status`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, NULL, 'Cash', 'other_payment_methods', 0, 1, NULL, '2019-12-13 03:57:02', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, NULL, 'Cheque', 'Cheque', 0, 1, NULL, '2019-12-13 03:57:02', NULL, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pastor_board`
--

CREATE TABLE `pastor_board` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(22) DEFAULT NULL,
  `parent_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Post,2=News,3=Ads',
  `p_title` text,
  `p_description` text,
  `classified_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Buy,2=Sell',
  `p_category` bigint(22) DEFAULT NULL COMMENT 'Category from master_lookup table with pastor_board cat',
  `posted_date` datetime DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_email` text,
  `contact_phone` varchar(20) DEFAULT NULL,
  `cost` varchar(20) DEFAULT NULL,
  `image_path` text,
  `location_id` bigint(22) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active,2-Inactive',
  `createdBy` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pastor_board`
--

INSERT INTO `pastor_board` (`id`, `orgId`, `parent_type`, `p_title`, `p_description`, `classified_type`, `p_category`, `posted_date`, `contact_name`, `contact_email`, `contact_phone`, `cost`, `image_path`, `location_id`, `status`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 1, 'First', 'First', 1, NULL, NULL, 'Sathish', 'sat@asda.com', '918181', NULL, 's:328:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/\",\"uploaded_file_name\":\"ambed_1568554445.png\",\"original_filename\":\"ambed_1568554445.png\",\"upload_file_extension\":\"png\",\"file_size\":0}\";', NULL, 1, 1, '2019-09-15 08:04:05', NULL, '2019-09-15 13:34:05', NULL, NULL),
(2, 1, 2, 'Sec', 'Sec desc', 1, NULL, NULL, 'Sathish1', 'sat@as2da.com', '9181811', NULL, 's:334:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/2\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/2\\/\",\"uploaded_file_name\":\"amerfort_1568554490.jpg\",\"original_filename\":\"amerfort_1568554490.jpg\",\"upload_file_extension\":\"jpg\",\"file_size\":0}\";', NULL, 1, 1, '2019-09-15 08:04:50', NULL, '2019-09-15 13:34:50', NULL, NULL),
(3, 1, 3, 'Third', 'Third desc', 1, 59, NULL, 'Sathish12', 'sat@as2aadda.com', '918181222', '222', 's:344:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/3\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/3\\/\",\"uploaded_file_name\":\"cobratechlogo_1568554536.png\",\"original_filename\":\"cobratechlogo_1568554536.png\",\"upload_file_extension\":\"png\",\"file_size\":0}\";', NULL, 1, 1, '2019-09-15 08:05:36', NULL, '2019-09-15 13:35:36', NULL, NULL),
(4, 1, 1, 'Fourth', 'Fourth desc', 1, NULL, NULL, 'Sathish', 'sat@asda.com', '918181', NULL, 's:328:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/\",\"uploaded_file_name\":\"ambed_1568554445.png\",\"original_filename\":\"ambed_1568554445.png\",\"upload_file_extension\":\"png\",\"file_size\":0}\";', NULL, 1, 1, '2019-09-15 08:04:05', NULL, '2019-09-15 13:34:05', NULL, NULL),
(5, 1, 1, 'Fifth', 'Fifth', 1, NULL, NULL, 'Sathish', 'sat@asda.com', '918181', NULL, 's:328:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/\",\"uploaded_file_name\":\"ambed_1568554445.png\",\"original_filename\":\"ambed_1568554445.png\",\"upload_file_extension\":\"png\",\"file_size\":0}\";', NULL, 1, 1, '2019-09-15 08:04:05', NULL, '2019-09-15 13:34:05', NULL, NULL),
(6, 1, 1, 'Six', 'Six', 1, NULL, NULL, 'Sathish', 'sat@asda.com', '918181', NULL, 's:328:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/\",\"uploaded_file_name\":\"ambed_1568554445.png\",\"original_filename\":\"ambed_1568554445.png\",\"upload_file_extension\":\"png\",\"file_size\":0}\";', NULL, 1, 1, '2019-09-15 02:34:05', NULL, '2019-09-15 13:34:05', NULL, NULL),
(7, 1, 2, 'seven', 'seven desc', 1, NULL, NULL, 'Sathish1', 'sat@as2da.com', '9181811', NULL, 's:334:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/2\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/2\\/\",\"uploaded_file_name\":\"amerfort_1568554490.jpg\",\"original_filename\":\"amerfort_1568554490.jpg\",\"upload_file_extension\":\"jpg\",\"file_size\":0}\";', NULL, 1, 1, '2019-09-15 02:34:50', NULL, '2019-09-15 13:34:50', NULL, NULL),
(8, 1, 3, 'eight', 'eight desc', 1, 59, NULL, 'Sathish12', 'sat@as2aadda.com', '918181222', '222', 's:344:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/3\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/3\\/\",\"uploaded_file_name\":\"cobratechlogo_1568554536.png\",\"original_filename\":\"cobratechlogo_1568554536.png\",\"upload_file_extension\":\"png\",\"file_size\":0}\";', NULL, 1, 1, '2019-09-15 02:35:36', NULL, '2019-09-15 13:35:36', NULL, NULL),
(9, 1, 1, 'nine', 'nine desc', 1, NULL, NULL, 'Sathish', 'sat@asda.com', '918181', NULL, 's:328:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/\",\"uploaded_file_name\":\"ambed_1568554445.png\",\"original_filename\":\"ambed_1568554445.png\",\"upload_file_extension\":\"png\",\"file_size\":0}\";', NULL, 1, 1, '2019-09-15 02:34:05', NULL, '2019-09-15 13:34:05', NULL, NULL),
(10, 1, 1, 'tne', 'tne', 1, NULL, NULL, 'Sathish', 'sat@asda.com', '918181', NULL, 's:328:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/\",\"uploaded_file_name\":\"ambed_1568554445.png\",\"original_filename\":\"ambed_1568554445.png\",\"upload_file_extension\":\"png\",\"file_size\":0}\";', NULL, 1, 1, '2019-09-15 02:34:05', NULL, '2019-09-15 13:34:05', NULL, NULL),
(11, 1, 3, 'Pastor board Example', 'Pastor board Example desc', 2, 59, NULL, 'My name', 'myemail@gmail.com', '98765432', '2000', 's:362:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/3\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/3\\/\",\"uploaded_file_name\":\"indian-national-emblem_1569813561.jpg\",\"original_filename\":\"indian-national-emblem_1569813561.jpg\",\"upload_file_extension\":\"jpg\",\"file_size\":0}\";', NULL, 1, 1, '2019-09-29 21:49:21', NULL, '2019-09-30 08:50:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(11) NOT NULL COMMENT 'Unique ID Primary Key',
  `gateway_name` varchar(50) NOT NULL COMMENT 'name of the gateway',
  `active` varchar(1) NOT NULL COMMENT 'Status of the gateway'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `gateway_name`, `active`) VALUES
(1, 'Stripe', '1'),
(2, 'Paypal', '1'),
(3, 'Others', '1');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway_parameters`
--

CREATE TABLE `payment_gateway_parameters` (
  `parameter_id` int(11) NOT NULL,
  `payment_gateway_id` int(11) NOT NULL,
  `parameter_name` varchar(50) NOT NULL,
  `validation_type` varchar(100) DEFAULT NULL COMMENT 'enter if specific validation is required except "required" validation'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_gateway_parameters`
--

INSERT INTO `payment_gateway_parameters` (`parameter_id`, `payment_gateway_id`, `parameter_name`, `validation_type`) VALUES
(1, 1, 'Public Key', 'text'),
(2, 1, 'Secret Key', 'text'),
(3, 2, 'Client Email Id', 'email');

-- --------------------------------------------------------

--
-- Table structure for table `payment_mode`
--

CREATE TABLE `payment_mode` (
  `id` int(20) NOT NULL,
  `pm_name` varchar(255) DEFAULT NULL,
  `pm_desc` text,
  `pm_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `orgId` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `orgId`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 0, 'Nextgen Checkin', 'web', '2019-05-05 08:21:47', '2019-05-05 08:21:47'),
(2, 0, 'Member Directory', 'web', '2019-05-05 08:21:47', '2019-05-05 08:21:47'),
(3, 0, 'Scheduling', 'web', '2019-05-05 08:21:47', '2019-05-05 09:13:48'),
(4, 0, 'Event management', 'web', '2019-05-05 08:21:47', '2019-05-05 08:21:47'),
(5, 0, 'Small Group', 'web', '2019-05-05 09:00:09', '2019-05-05 09:08:33'),
(6, 0, 'Accounting', 'web', '2019-05-05 09:00:21', '2019-05-05 09:08:37'),
(7, 1, 'Nextgen Checkin', 'web', NULL, NULL),
(8, 1, 'Member Directory', 'web', NULL, NULL),
(9, 1, 'Scheduling', 'web', NULL, NULL),
(10, 1, 'Event management', 'web', NULL, NULL),
(11, 1, 'Small Group', 'web', NULL, NULL),
(12, 1, 'Accounting', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(22) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `orgId`, `name`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'Band', '1', '2019-10-14 21:02:56', '1', '2019-10-14 21:03:55', '1', '2019-10-14 21:03:55'),
(2, 1, 'Drums', '1', '2019-10-19 21:47:39', '1', '2019-10-19 21:50:31', NULL, NULL),
(3, 1, 'Guitar', '1', '2019-10-19 21:47:45', NULL, '2019-10-19 21:47:45', NULL, NULL),
(4, 1, 'Piano', '1', '2019-10-28 07:49:20', NULL, '2019-10-28 07:49:20', NULL, NULL),
(5, 1, 'Singing', '1', '2019-10-28 07:49:37', NULL, '2019-10-28 07:49:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` bigint(20) NOT NULL,
  `orgId` int(11) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `item_desc` text,
  `location_id` bigint(20) DEFAULT NULL,
  `item_year` int(11) DEFAULT NULL,
  `item_model` varchar(100) DEFAULT NULL,
  `last_service_date` date DEFAULT NULL,
  `next_service_date` date DEFAULT NULL,
  `notification_period` varchar(200) NOT NULL,
  `item_photo` text,
  `coa` varchar(150) DEFAULT NULL,
  `rod` varchar(150) DEFAULT NULL,
  `approval_group` int(20) DEFAULT NULL COMMENT 'From ''roles'' table role id resepective of orgId',
  `quantity` int(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `orgId` bigint(20) DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_tag` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `orgId`, `name`, `guard_name`, `role_tag`, `created_at`, `updated_at`) VALUES
(1, 0, 'Super Adminin', 'web', 'superadmin', '2019-05-05 02:52:07', '2019-05-05 02:52:07'),
(2, 0, 'Adminstrator', 'web', 'admin', '2019-05-05 02:52:08', '2019-08-24 21:27:41'),
(3, 0, 'Member', 'web', 'member', '2019-05-05 03:50:10', '2019-05-05 03:50:10'),
(4, 0, 'Volunteer', 'web', 'volunteer', '2019-07-25 23:18:18', '2019-07-25 23:18:18'),
(5, 0, 'Pastor', 'web', 'pastor', '2019-08-24 21:29:13', '2019-09-13 01:22:59'),
(6, 0, 'First Time Guest', 'web', 'firsttimeguest', '2019-08-24 21:29:13', '2019-09-13 01:22:59'),
(7, 0, 'Inactive Member', 'web', 'InactiveMember', '2019-08-24 21:29:52', '2019-09-13 01:22:59'),
(8, 0, 'Checkin Volunteer', 'web', 'CheckinVolunteer', '2019-08-24 21:29:52', '2019-09-13 01:22:59'),
(9, 0, 'Event Organizer', 'web', 'EventOrganizer', '2019-08-24 21:30:12', '2019-09-13 01:22:59'),
(10, 0, 'Production Manager', 'web', 'ProductionManager', '2019-08-24 21:30:12', '2019-09-13 01:22:59'),
(11, 0, 'Accounts Admin', 'web', 'AccountsAdmin', '2019-08-24 21:30:29', '2019-09-13 01:22:59'),
(12, 0, 'Visitor', 'web', 'Visitor', '2019-08-24 21:30:29', '2019-09-13 01:22:59'),
(13, 1, 'Adminstrator', 'web', 'admin', '2019-09-02 14:15:03', NULL),
(14, 1, 'Member', 'web', 'member', '2019-09-02 14:15:03', NULL),
(15, 1, 'Volunteer', 'web', 'volunteer', '2019-09-02 14:15:03', NULL),
(16, 1, 'Pastor', 'web', 'pastor', '2019-09-02 14:15:03', '2019-09-13 01:22:59'),
(17, 1, 'First Time Guest', 'web', 'firsttimeguest', '2019-09-02 14:15:03', '2019-09-13 01:22:59'),
(18, 1, 'Inactive Member', 'web', 'InactiveMember', '2019-09-02 14:15:03', '2019-09-13 01:22:59'),
(19, 1, 'Checkin Volunteer', 'web', 'CheckinVolunteer', '2019-09-02 14:15:03', '2019-09-13 01:22:59'),
(20, 1, 'Event Organizer', 'web', 'EventOrganizer', '2019-09-02 14:15:03', '2019-09-13 01:22:59'),
(21, 1, 'Production Manager', 'web', 'ProductionManager', '2019-09-02 14:15:03', '2019-09-13 01:22:59'),
(22, 1, 'Accounts Admin', 'web', 'AccountsAdmin', '2019-09-02 14:15:03', '2019-09-13 01:22:59'),
(23, 1, 'Visitor', 'web', 'Visitor', '2019-09-02 14:15:03', '2019-09-13 01:22:59');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(7, 13),
(7, 14),
(7, 15),
(7, 16),
(7, 17),
(7, 18),
(7, 19),
(7, 20),
(7, 21),
(7, 22),
(7, 23),
(8, 13),
(9, 13),
(10, 13),
(11, 13),
(12, 13);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) NOT NULL,
  `orgId` int(11) NOT NULL,
  `room_name` varchar(255) DEFAULT NULL,
  `room_owner` varchar(255) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `room_desc` text,
  `room_image` text,
  `group_id` bigint(20) DEFAULT NULL,
  `building_number` varchar(150) DEFAULT NULL,
  `approval_group` int(20) DEFAULT NULL COMMENT 'From ''''roles'''' table role id resepective of orgId',
  `room_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `orgId`, `room_name`, `room_owner`, `contact_no`, `contact_email`, `room_desc`, `room_image`, `group_id`, `building_number`, `approval_group`, `room_status`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'test', 'test', 'test', 'test@test.com', 'test', 's:340:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/rooms\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/rooms\\/\",\"uploaded_file_name\":\"cobratechlogo_1569813787.png\",\"original_filename\":\"cobratechlogo_1569813787.png\",\"upload_file_extension\":\"png\",\"file_size\":0}\";', 59, '2', NULL, 1, '1', '2019-09-29 21:53:07', NULL, '2019-09-29 21:53:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(22) NOT NULL,
  `s_title` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_service_users_count`
--

CREATE TABLE `schedule_service_users_count` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(22) DEFAULT NULL,
  `scheduling_id` bigint(22) DEFAULT NULL,
  `team_id` bigint(22) DEFAULT NULL,
  `service_id` bigint(22) DEFAULT NULL,
  `user_count` int(10) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scheduling`
--

CREATE TABLE `scheduling` (
  `id` bigint(22) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `orgId` bigint(22) NOT NULL,
  `event_date` date DEFAULT NULL,
  `event_id` bigint(22) DEFAULT NULL,
  `is_manual_schedule` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=Auto scheduling, 2=Manual Scheduling',
  `assign_ids` text,
  `notification_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=None,2=SMS,3=Email,4=Both',
  `team_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scheduling`
--

INSERT INTO `scheduling` (`id`, `title`, `orgId`, `event_date`, `event_id`, `is_manual_schedule`, `assign_ids`, `notification_flag`, `team_id`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 'Sathish gtgt', 1, '2019-12-10', 5, 2, NULL, 2, 7, NULL, '2019-12-01 02:45:22', NULL, '2019-12-02 00:10:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `scheduling_user`
--

CREATE TABLE `scheduling_user` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(22) NOT NULL,
  `scheduling_id` bigint(22) NOT NULL,
  `team_id` bigint(22) DEFAULT NULL,
  `position_id` bigint(22) DEFAULT NULL,
  `user_id` bigint(22) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Pending, 2=Accepted, 3=Decline',
  `token` varchar(255) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scheduling_user`
--

INSERT INTO `scheduling_user` (`id`, `orgId`, `scheduling_id`, `team_id`, `position_id`, `user_id`, `status`, `token`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 1, 7, 3, NULL, 1, NULL, NULL, '2019-12-02 00:12:12', NULL, '2019-12-02 00:19:15', NULL, NULL),
(2, 1, 1, 7, 4, 2, 1, NULL, NULL, '2019-12-02 00:12:12', NULL, '2019-12-02 00:18:59', NULL, NULL),
(3, 1, 1, 7, 5, 1, 1, NULL, NULL, '2019-12-02 00:12:12', NULL, '2019-12-02 00:18:59', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `store_payment_gateway_values`
--

CREATE TABLE `store_payment_gateway_values` (
  `payment_values_id` int(11) NOT NULL COMMENT 'Unique ID Primary Key',
  `orgId` bigint(20) DEFAULT NULL COMMENT 'Foreign key reference to organization',
  `payment_gateway_id` int(11) NOT NULL,
  `payment_gateway_parameter_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Foreign key reference to payment_gateway_parameters',
  `payment_gateway_parameter_value` varchar(200) NOT NULL COMMENT 'Values of the parameter to be passed to payment gateway',
  `active` varchar(1) NOT NULL DEFAULT '1' COMMENT 'Record status',
  `preferred_payment_gateway` int(1) NOT NULL DEFAULT '0' COMMENT '0 -> inactive, 1 - active',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `store_payment_transactions`
--

CREATE TABLE `store_payment_transactions` (
  `id` int(11) NOT NULL COMMENT 'Unique ID Primary Key',
  `orgId` bigint(20) DEFAULT NULL COMMENT 'Foreign key reference to organization',
  `student_id` int(11) NOT NULL COMMENT 'Foreign key reference to student_id for which students the dues are paid',
  `student_personal_info_id` int(11) NOT NULL COMMENT 'student personal info id to track payments for each student',
  `user_type` int(11) NOT NULL DEFAULT '1' COMMENT '1=>STUDENT,2=>JUDGE',
  `payment_fees_id` int(11) DEFAULT NULL COMMENT 'payment done for',
  `payment_gateway_id` int(11) NOT NULL DEFAULT '0' COMMENT '0 -> none',
  `transaction_date` datetime DEFAULT NULL COMMENT 'Date on which transaction was done',
  `transaction_status` tinyint(1) DEFAULT NULL COMMENT 'Status of transaction 1 => submitted, 2 = > confirmed 3=> declined/error',
  `customer_id` varchar(50) DEFAULT NULL COMMENT 'customer_id response sent from payment gateway',
  `token_id` varchar(50) DEFAULT NULL COMMENT 'token id from payment Gateway',
  `payment_type` int(1) DEFAULT NULL COMMENT '1 => payment gateway, 2 => Check , 3 => Cash, 4=> purchase order, 5 => other',
  `other` varchar(250) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `manual_payment_details` varchar(250) DEFAULT NULL COMMENT 'if the payment is done via cash/cheque then related details will be saved here',
  `payment_gateway_return_data` mediumtext COMMENT 'Payment gateway return/postback data',
  `amount_paid` decimal(10,2) DEFAULT NULL COMMENT 'Amount already paid',
  `admin_status` tinyint(1) DEFAULT NULL COMMENT 'Status of transaction 0 => none 1 => submitted, 2 = > confirmed 3=> declined/error',
  `final_payment_flag` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=>Old payment,1=>Final payment',
  `submit_date` datetime DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `modified_user_type` varchar(25) DEFAULT NULL,
  `last_updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `student_individual_payment_status` int(11) NOT NULL DEFAULT '0' COMMENT 'student individual payment status',
  `st_type` int(11) NOT NULL DEFAULT '1' COMMENT 'Student ordering for team student, default it will be 1',
  `rule_show_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Not Shown,2=Rule Shown'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(22) NOT NULL,
  `tagGroup_id` bigint(22) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `order` tinyint(10) NOT NULL DEFAULT '0' COMMENT 'Listing order number for sorting',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tagGroup_id`, `name`, `order`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'One', 3, NULL, '2019-09-17 19:43:30', NULL, '2019-09-17 19:44:39', NULL, NULL),
(2, 1, 'Two', 2, NULL, '2019-09-17 19:43:34', NULL, '2019-09-17 19:44:39', NULL, NULL),
(3, 1, 'Three', 1, NULL, '2019-09-17 19:43:38', NULL, '2019-09-17 19:44:39', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tag_groups`
--

CREATE TABLE `tag_groups` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(22) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Public, 0=Restricted',
  `isMultiple_select` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Multiple select, 0=single',
  `order` tinyint(10) NOT NULL DEFAULT '0' COMMENT 'Listing order number for sorting',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag_groups`
--

INSERT INTO `tag_groups` (`id`, `orgId`, `name`, `isPublic`, `isMultiple_select`, `order`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'First Tag', 1, 1, 1, NULL, '2019-09-17 19:43:24', NULL, '2019-09-17 19:43:24', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(22) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `orgId`, `name`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(6, 1, 'Block2', '1', '2019-11-02 11:41:16', '1', '2019-11-02 11:41:22', NULL, NULL),
(7, 1, 'Venus', '1', '2019-11-03 00:31:00', NULL, '2019-11-03 00:31:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `team_has_position`
--

CREATE TABLE `team_has_position` (
  `id` bigint(22) NOT NULL,
  `team_id` bigint(22) DEFAULT NULL,
  `position_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `team_has_position`
--

INSERT INTO `team_has_position` (`id`, `team_id`, `position_id`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(19, 6, 2, '1', '2019-11-02 11:41:16', NULL, '2019-11-02 11:41:22', '1', '2019-11-02 11:41:22'),
(20, 6, 4, '1', '2019-11-02 11:41:16', NULL, '2019-11-02 11:41:22', '1', '2019-11-02 11:41:22'),
(21, 6, 2, '1', '2019-11-02 11:41:22', NULL, '2019-11-02 11:41:22', NULL, NULL),
(22, 6, 4, '1', '2019-11-02 11:41:22', NULL, '2019-11-02 11:41:22', NULL, NULL),
(23, 7, 3, '1', '2019-11-03 00:31:00', NULL, '2019-11-03 00:31:00', NULL, NULL),
(24, 7, 4, '1', '2019-11-03 00:31:00', NULL, '2019-11-03 00:31:00', NULL, NULL),
(25, 7, 5, '1', '2019-11-03 00:31:00', NULL, '2019-11-03 00:31:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `householdName` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_prefix` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `given_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nick_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` text COLLATE utf8mb4_unicode_ci,
  `user_full_name` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referal_code` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_suffix` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_pic` text COLLATE utf8mb4_unicode_ci,
  `dob` date DEFAULT NULL,
  `doa` date DEFAULT NULL,
  `school_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade_id` bigint(20) DEFAULT NULL,
  `life_stage` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT 'Adult' COMMENT 'Adult,Child',
  `mobile_no` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_phone_no` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_profile` text COLLATE utf8mb4_unicode_ci,
  `marital_status` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `medical_note` text COLLATE utf8mb4_unicode_ci,
  `congregration_status` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deletedBy` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `orgId`, `householdName`, `personal_id`, `name_prefix`, `given_name`, `first_name`, `last_name`, `middle_name`, `nick_name`, `full_name`, `user_full_name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `referal_code`, `name_suffix`, `profile_pic`, `dob`, `doa`, `school_name`, `grade_id`, `life_stage`, `mobile_no`, `home_phone_no`, `gender`, `social_profile`, `marital_status`, `address`, `medical_note`, `congregration_status`, `created_at`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'stpaul name\'s household', '0000000001', NULL, NULL, 'stpaul name', NULL, NULL, NULL, 'stpaul name coim', NULL, 'stpaul@gmail.com', NULL, NULL, '$2y$10$o9KLhUJSz5S7tn20C6BhlOGaQq6sV0dfodXFAEhkLBVJPEn1fYSge', NULL, 'stpa6pnp', NULL, 's:316:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/profile\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/profile\\/\",\"uploaded_file_name\":\"1576112227.png\",\"original_filename\":\"1576112227.png\",\"upload_file_extension\":\"png\",\"file_size\":0}\";', NULL, NULL, NULL, NULL, 'Adult', '98111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-02 08:45:03', '2019-12-12 00:57:07', NULL, NULL),
(2, 1, 'ramesg\'s household', '0000000002', '36', NULL, 'ramesg', 'f', 'de', NULL, 'ramesg de f', NULL, 'asd@asda.ocm', NULL, NULL, '$2y$10$K6n4YZZ4veda5Xq0UiONmutMGwzPcE5cWWHqYjwY2sA7gRcUACA5y', NULL, 'rameufk1', '41', 's:316:\"{\"uploaded_path\":\"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/profile\\/\",\"download_path\":\"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/profile\\/\",\"uploaded_file_name\":\"1575420319.png\",\"original_filename\":\"1575420319.png\",\"upload_file_extension\":\"png\",\"file_size\":0}\";', '1970-01-01', '1970-01-01', '30', 56, 'Adult', NULL, NULL, 'Male', NULL, '47', '////////////', NULL, NULL, '2019-09-05 20:18:05', '2019-12-04 00:45:19', NULL, NULL),
(3, 1, 'rahulr\'s household', '0000000003', '36', 'rahulr', 'rahulr', 'd', 's', 'rahulr neick', 'rahulr s d', NULL, 'rahulr@g.com', NULL, NULL, '$2y$10$Ugdh0xsm6bTQU8cEjU5OHubya1R0I0OIgt.NGlvE/wtOXUDHL/hFW', NULL, 'rahugc4k', '41', NULL, '1988-12-26', '1970-01-01', '30', 55, 'Adult', NULL, NULL, 'Female', NULL, '46', '////////////', 'asd asdada', NULL, '2019-12-05 01:44:56', '2019-12-05 01:44:56', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_position`
--

CREATE TABLE `user_has_position` (
  `id` bigint(22) NOT NULL,
  `orgId` bigint(22) DEFAULT NULL,
  `user_id` bigint(22) DEFAULT NULL,
  `position_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_has_position`
--

INSERT INTO `user_has_position` (`id`, `orgId`, `user_id`, `position_id`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 2, 2, NULL, '2019-10-28 13:10:41', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 1, 2, 3, NULL, '2019-10-28 13:10:41', NULL, '2019-10-28 13:18:52', NULL, NULL),
(3, 1, 3, 2, '1', '2019-12-10 05:28:25', NULL, '2019-12-10 05:28:25', NULL, NULL),
(4, 1, 3, 4, '1', '2019-12-10 05:28:25', NULL, '2019-12-10 05:28:25', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apps`
--
ALTER TABLE `apps`
  ADD PRIMARY KEY (`appId`);

--
-- Indexes for table `checkins`
--
ALTER TABLE `checkins`
  ADD PRIMARY KEY (`chId`);

--
-- Indexes for table `comm_details`
--
ALTER TABLE `comm_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comm_masters`
--
ALTER TABLE `comm_masters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comm_templates`
--
ALTER TABLE `comm_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`eventId`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_submissions`
--
ALTER TABLE `form_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `giving`
--
ALTER TABLE `giving`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_enrolls`
--
ALTER TABLE `group_enrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_events`
--
ALTER TABLE `group_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_events_attendance`
--
ALTER TABLE `group_events_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_resources`
--
ALTER TABLE `group_resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_tags`
--
ALTER TABLE `group_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_types`
--
ALTER TABLE `group_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `households`
--
ALTER TABLE `households`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `household_user`
--
ALTER TABLE `household_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_lookup_data`
--
ALTER TABLE `master_lookup_data`
  ADD PRIMARY KEY (`mldId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`orgId`);

--
-- Indexes for table `other_payment_methods`
--
ALTER TABLE `other_payment_methods`
  ADD PRIMARY KEY (`other_payment_method_id`),
  ADD KEY `orgId` (`orgId`) USING BTREE;

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pastor_board`
--
ALTER TABLE `pastor_board`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateway_parameters`
--
ALTER TABLE `payment_gateway_parameters`
  ADD PRIMARY KEY (`parameter_id`),
  ADD KEY `payment_gateways_payment_gateway_parameters_FK1` (`payment_gateway_id`);

--
-- Indexes for table `payment_mode`
--
ALTER TABLE `payment_mode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_service_users_count`
--
ALTER TABLE `schedule_service_users_count`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scheduling`
--
ALTER TABLE `scheduling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scheduling_user`
--
ALTER TABLE `scheduling_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_payment_gateway_values`
--
ALTER TABLE `store_payment_gateway_values`
  ADD PRIMARY KEY (`payment_values_id`),
  ADD KEY `orgId` (`orgId`) USING BTREE;

--
-- Indexes for table `store_payment_transactions`
--
ALTER TABLE `store_payment_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`orgId`),
  ADD KEY `payment_fees_id` (`payment_fees_id`),
  ADD KEY `payment_gateway_id` (`payment_gateway_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_groups`
--
ALTER TABLE `tag_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_has_position`
--
ALTER TABLE `team_has_position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_has_position`
--
ALTER TABLE `user_has_position`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apps`
--
ALTER TABLE `apps`
  MODIFY `appId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `checkins`
--
ALTER TABLE `checkins`
  MODIFY `chId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comm_details`
--
ALTER TABLE `comm_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comm_masters`
--
ALTER TABLE `comm_masters`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comm_templates`
--
ALTER TABLE `comm_templates`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `eventId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `form_submissions`
--
ALTER TABLE `form_submissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `giving`
--
ALTER TABLE `giving`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `group_enrolls`
--
ALTER TABLE `group_enrolls`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_events`
--
ALTER TABLE `group_events`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `group_events_attendance`
--
ALTER TABLE `group_events_attendance`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `group_resources`
--
ALTER TABLE `group_resources`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_tags`
--
ALTER TABLE `group_tags`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_types`
--
ALTER TABLE `group_types`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `households`
--
ALTER TABLE `households`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `household_user`
--
ALTER TABLE `household_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `master_lookup_data`
--
ALTER TABLE `master_lookup_data`
  MODIFY `mldId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `orgId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `other_payment_methods`
--
ALTER TABLE `other_payment_methods`
  MODIFY `other_payment_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pastor_board`
--
ALTER TABLE `pastor_board`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID Primary Key', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_gateway_parameters`
--
ALTER TABLE `payment_gateway_parameters`
  MODIFY `parameter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_mode`
--
ALTER TABLE `payment_mode`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule_service_users_count`
--
ALTER TABLE `schedule_service_users_count`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scheduling`
--
ALTER TABLE `scheduling`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `scheduling_user`
--
ALTER TABLE `scheduling_user`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `store_payment_gateway_values`
--
ALTER TABLE `store_payment_gateway_values`
  MODIFY `payment_values_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID Primary Key';

--
-- AUTO_INCREMENT for table `store_payment_transactions`
--
ALTER TABLE `store_payment_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID Primary Key';

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tag_groups`
--
ALTER TABLE `tag_groups`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `team_has_position`
--
ALTER TABLE `team_has_position`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_has_position`
--
ALTER TABLE `user_has_position`
  MODIFY `id` bigint(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
