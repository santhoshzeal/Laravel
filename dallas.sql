-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 20, 2020 at 07:09 AM
-- Server version: 5.6.33-0ubuntu0.14.04.1
-- PHP Version: 7.1.20-1+ubuntu14.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dallas`
--

-- --------------------------------------------------------

--
-- Table structure for table `apps`
--

CREATE TABLE IF NOT EXISTS `apps` (
  `appId` int(20) NOT NULL AUTO_INCREMENT,
  `appName` varchar(250) DEFAULT NULL,
  `appPath` varchar(255) DEFAULT NULL,
  `appStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active,2=Inactive',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`appId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

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

CREATE TABLE IF NOT EXISTS `checkins` (
  `chId` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`chId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comm_details`
--

CREATE TABLE IF NOT EXISTS `comm_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comm_master_id` bigint(20) NOT NULL,
  `to_user_id` bigint(20) NOT NULL,
  `read_status` varchar(255) NOT NULL DEFAULT 'UNREAD' COMMENT 'Read status:READ,UNREAD',
  `delete_status` varchar(255) NOT NULL DEFAULT 'UNDELETED' COMMENT 'Message status:DELETED,UNDELETED',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `comm_details`
--

INSERT INTO `comm_details` (`id`, `comm_master_id`, `to_user_id`, `read_status`, `delete_status`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 5, 'UNREAD', 'UNDELETED', NULL, '2020-01-06 00:39:00', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 2, 6, 'UNREAD', 'UNDELETED', NULL, '2020-01-06 00:39:42', NULL, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comm_masters`
--

CREATE TABLE IF NOT EXISTS `comm_masters` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `comm_masters`
--

INSERT INTO `comm_masters` (`id`, `comm_template_id`, `org_id`, `type`, `tag`, `name`, `subject`, `body`, `from_user_id`, `related_id`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 11, 1, 1, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 1, NULL, NULL, '2020-01-06 00:39:00', NULL, '2020-01-06 00:39:00', NULL, NULL),
(2, 11, 1, 1, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 1, NULL, NULL, '2020-01-06 00:39:42', NULL, '2020-01-06 00:39:42', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comm_templates`
--

CREATE TABLE IF NOT EXISTS `comm_templates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `comm_templates`
--

INSERT INTO `comm_templates` (`id`, `tag`, `name`, `subject`, `body`, `org_id`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 0, NULL, '2019-08-21 18:01:18', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 0, NULL, '2019-08-21 18:01:18', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 0, NULL, '2019-08-21 18:01:35', NULL, '0000-00-00 00:00:00', NULL, NULL),
(4, 'schedule_auto_notify', 'Auto Scheduling Notification', 'Event scheduled', 'Your have been placed on the schedule. (Auto assigned)', 0, NULL, '2019-09-27 14:34:53', NULL, NULL, NULL, NULL),
(5, 'schedule_manual_notify', 'Scheduling event', 'Event Scheduled', 'Your Event has been scheduled, please follow the below mentioned details.', 0, NULL, '2019-09-27 14:34:53', NULL, NULL, NULL, NULL),
(6, 'schedule_confirmation', 'Schedule confirmation', 'Schedule Confirmation', 'You have been placed on the schedule for the following dates. To respond or simply view this schedule, click the appropriate button below.', 0, NULL, '2019-09-27 14:34:53', NULL, NULL, NULL, NULL),
(7, 'schedule_reminder', 'Schedule Remind', 'Schedule Remind', 'A Reminder that your event has been scheduled for below listed dates.', 0, NULL, '2019-09-27 14:34:53', NULL, NULL, NULL, NULL),
(8, 'schedule_check_out_notification_to_guest', 'Schedule check out notification to guest', 'Event Schedule Notification', 'This is notify that event has been scheduled.thank_you_for_service', 0, NULL, '2019-09-27 14:34:53', NULL, NULL, NULL, NULL),
(9, 'thank_you_for_service', 'Thanks for your service', 'Thanks for Service', 'Thanks for attending the below listed event.', 0, NULL, '2019-09-27 14:34:53', NULL, NULL, NULL, NULL),
(10, 'schedule_cancelled', 'Schedule cancelled', 'Schedule cancelled', 'sorry to inform you that. Your scheduled event has been canceled. For further information contact administrator.', 0, NULL, '2019-09-27 14:34:53', NULL, NULL, NULL, NULL),
(11, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(12, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(13, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(14, 'schedule_auto_notify', 'Auto Scheduling Notification', 'Event scheduled', 'Your have been placed on the schedule. (Auto assigned)', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(15, 'schedule_manual_notify', 'Scheduling event', 'Event Scheduled', 'Your Event has been scheduled, please follow the below mentioned details.', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(16, 'schedule_confirmation', 'Schedule confirmation', 'Schedule Confirmation', 'You have been placed on the schedule for the following dates. To respond or simply view this schedule, click the appropriate button below.', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(17, 'schedule_reminder', 'Schedule Remind', 'Schedule Remind', 'A Reminder that your event has been scheduled for below listed dates.', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(18, 'schedule_check_out_notification_to_guest', 'Schedule check out notification to guest', 'Event Schedule Notification', 'This is notify that event has been scheduled.thank_you_for_service', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(19, 'thank_you_for_service', 'Thanks for your service', 'Thanks for Service', 'Thanks for attending the below listed event.', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(20, 'schedule_cancelled', 'Schedule cancelled', 'Schedule cancelled', 'sorry to inform you that. Your scheduled event has been canceled. For further information contact administrator.', 1, NULL, '2019-12-18 01:54:50', NULL, NULL, NULL, NULL),
(21, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 2, NULL, '2020-01-05 01:13:01', NULL, NULL, NULL, NULL),
(22, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 2, NULL, '2020-01-05 01:13:01', NULL, NULL, NULL, NULL),
(23, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 2, NULL, '2020-01-05 01:13:01', NULL, NULL, NULL, NULL),
(24, 'schedule_auto_notify', 'Auto Scheduling Notification', 'Event scheduled', 'Your have been placed on the schedule. (Auto assigned)', 2, NULL, '2020-01-05 01:13:01', NULL, NULL, NULL, NULL),
(25, 'schedule_manual_notify', 'Scheduling event', 'Event Scheduled', 'Your Event has been scheduled, please follow the below mentioned details.', 2, NULL, '2020-01-05 01:13:01', NULL, NULL, NULL, NULL),
(26, 'schedule_confirmation', 'Schedule confirmation', 'Schedule Confirmation', 'You have been placed on the schedule for the following dates. To respond or simply view this schedule, click the appropriate button below.', 2, NULL, '2020-01-05 01:13:01', NULL, NULL, NULL, NULL),
(27, 'schedule_reminder', 'Schedule Remind', 'Schedule Remind', 'A Reminder that your event has been scheduled for below listed dates.', 2, NULL, '2020-01-05 01:13:01', NULL, NULL, NULL, NULL),
(28, 'schedule_check_out_notification_to_guest', 'Schedule check out notification to guest', 'Event Schedule Notification', 'This is notify that event has been scheduled.thank_you_for_service', 2, NULL, '2020-01-05 01:13:01', NULL, NULL, NULL, NULL),
(29, 'thank_you_for_service', 'Thanks for your service', 'Thanks for Service', 'Thanks for attending the below listed event.', 2, NULL, '2020-01-05 01:13:01', NULL, NULL, NULL, NULL),
(30, 'schedule_cancelled', 'Schedule cancelled', 'Schedule cancelled', 'sorry to inform you that. Your scheduled event has been canceled. For further information contact administrator.', 2, NULL, '2020-01-05 01:13:01', NULL, NULL, NULL, NULL),
(36, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 3, NULL, '2020-01-05 01:17:10', NULL, NULL, NULL, NULL),
(37, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 3, NULL, '2020-01-05 01:17:10', NULL, NULL, NULL, NULL),
(38, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 3, NULL, '2020-01-05 01:17:10', NULL, NULL, NULL, NULL),
(39, 'schedule_auto_notify', 'Auto Scheduling Notification', 'Event scheduled', 'Your have been placed on the schedule. (Auto assigned)', 3, NULL, '2020-01-05 01:17:10', NULL, NULL, NULL, NULL),
(40, 'schedule_manual_notify', 'Scheduling event', 'Event Scheduled', 'Your Event has been scheduled, please follow the below mentioned details.', 3, NULL, '2020-01-05 01:17:10', NULL, NULL, NULL, NULL),
(41, 'schedule_confirmation', 'Schedule confirmation', 'Schedule Confirmation', 'You have been placed on the schedule for the following dates. To respond or simply view this schedule, click the appropriate button below.', 3, NULL, '2020-01-05 01:17:10', NULL, NULL, NULL, NULL),
(42, 'schedule_reminder', 'Schedule Remind', 'Schedule Remind', 'A Reminder that your event has been scheduled for below listed dates.', 3, NULL, '2020-01-05 01:17:10', NULL, NULL, NULL, NULL),
(43, 'schedule_check_out_notification_to_guest', 'Schedule check out notification to guest', 'Event Schedule Notification', 'This is notify that event has been scheduled.thank_you_for_service', 3, NULL, '2020-01-05 01:17:10', NULL, NULL, NULL, NULL),
(44, 'thank_you_for_service', 'Thanks for your service', 'Thanks for Service', 'Thanks for attending the below listed event.', 3, NULL, '2020-01-05 01:17:10', NULL, NULL, NULL, NULL),
(45, 'schedule_cancelled', 'Schedule cancelled', 'Schedule cancelled', 'sorry to inform you that. Your scheduled event has been canceled. For further information contact administrator.', 3, NULL, '2020-01-05 01:17:10', NULL, NULL, NULL, NULL),
(46, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 4, NULL, '2020-01-13 02:58:02', NULL, NULL, NULL, NULL),
(47, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 4, NULL, '2020-01-13 02:58:02', NULL, NULL, NULL, NULL),
(48, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 4, NULL, '2020-01-13 02:58:02', NULL, NULL, NULL, NULL),
(49, 'schedule_auto_notify', 'Auto Scheduling Notification', 'Event scheduled', 'Your have been placed on the schedule. (Auto assigned)', 4, NULL, '2020-01-13 02:58:02', NULL, NULL, NULL, NULL),
(50, 'schedule_manual_notify', 'Scheduling event', 'Event Scheduled', 'Your Event has been scheduled, please follow the below mentioned details.', 4, NULL, '2020-01-13 02:58:02', NULL, NULL, NULL, NULL),
(51, 'schedule_confirmation', 'Schedule confirmation', 'Schedule Confirmation', 'You have been placed on the schedule for the following dates. To respond or simply view this schedule, click the appropriate button below.', 4, NULL, '2020-01-13 02:58:02', NULL, NULL, NULL, NULL),
(52, 'schedule_reminder', 'Schedule Remind', 'Schedule Remind', 'A Reminder that your event has been scheduled for below listed dates.', 4, NULL, '2020-01-13 02:58:02', NULL, NULL, NULL, NULL),
(53, 'schedule_check_out_notification_to_guest', 'Schedule check out notification to guest', 'Event Schedule Notification', 'This is notify that event has been scheduled.thank_you_for_service', 4, NULL, '2020-01-13 02:58:02', NULL, NULL, NULL, NULL),
(54, 'thank_you_for_service', 'Thanks for your service', 'Thanks for Service', 'Thanks for attending the below listed event.', 4, NULL, '2020-01-13 02:58:02', NULL, NULL, NULL, NULL),
(55, 'schedule_cancelled', 'Schedule cancelled', 'Schedule cancelled', 'sorry to inform you that. Your scheduled event has been canceled. For further information contact administrator.', 4, NULL, '2020-01-13 02:58:02', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `eventId` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eventId`, `orgId`, `eventName`, `eventFreq`, `eventDesc`, `eventCreatedDate`, `eventCheckin`, `eventShowTime`, `eventStartCheckin`, `eventEndCheckin`, `eventLocation`, `eventRoom`, `eventResource`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 3, 'Fiest', 'Daily', 'asdada', '2020-01-23', NULL, '06:00:00', '05:00:00', '13:00:00', '1', NULL, NULL, '3', '2020-01-05 01:37:45', NULL, '2020-01-05 01:37:45', NULL, NULL),
(2, 3, 'Jan 10 Event', 'Daily', 'asda', '2020-01-10', NULL, '06:00:00', '03:00:00', '07:00:00', '1', NULL, NULL, '3', '2020-01-05 01:38:07', NULL, '2020-01-05 01:38:07', NULL, NULL),
(3, 1, 'Jan 10 Event Paul', 'Daily', 'Jan 10 Event Paul', '2020-01-10', NULL, '11:00:00', '14:00:00', '17:00:00', '2', NULL, NULL, '1', '2020-01-05 06:57:01', NULL, '2020-01-05 06:57:01', NULL, NULL),
(4, 1, 'Jan 22 Event Paul', 'Daily', 'Jan 22 Event Paul', '2020-01-22', NULL, '09:00:00', '15:00:00', '23:00:00', '2', NULL, NULL, '1', '2020-01-05 06:57:28', NULL, '2020-01-05 06:57:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_attedance`
--

CREATE TABLE IF NOT EXISTS `event_attedance` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(22) DEFAULT NULL,
  `user_id` bigint(22) DEFAULT NULL,
  `event_id` bigint(22) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(150) DEFAULT NULL,
  `attendance_date` date DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `event_attedance`
--

INSERT INTO `event_attedance` (`id`, `orgId`, `user_id`, `event_id`, `event_date`, `first_name`, `gender`, `attendance_date`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 5, 4, '2020-01-22', 'Somesh', 'Male', '2020-01-12', '1', '2020-01-12 15:11:18', '1', '2020-01-12 15:22:22', NULL, NULL),
(2, 1, NULL, 4, '2020-01-22', 'Renita', 'Female', '2020-01-11', '1', '2020-01-12 15:22:51', NULL, '2020-01-12 15:22:51', NULL, NULL),
(3, 1, 6, 4, '2020-01-22', NULL, 'Male', '2020-01-13', '1', '2020-01-12 15:23:12', NULL, '2020-01-12 15:23:12', NULL, NULL),
(4, 1, 1, 4, '2020-01-22', NULL, 'Male', '2020-01-14', '1', '2020-01-13 03:20:48', NULL, '2020-01-13 03:20:48', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE IF NOT EXISTS `forms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(20) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `fields` varchar(1000) DEFAULT NULL,
  `profile_fields` varchar(250) DEFAULT NULL,
  `general_fields` varchar(500) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT '1 - active, 2 - deactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `form_submissions`
--

CREATE TABLE IF NOT EXISTS `form_submissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(20) DEFAULT NULL,
  `form_id` bigint(20) DEFAULT NULL,
  `profile_fields` varchar(1000) DEFAULT NULL,
  `general_fields` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `giving`
--

CREATE TABLE IF NOT EXISTS `giving` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `event_id` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `payment_gateway_id` bigint(20) DEFAULT NULL COMMENT 'payment_gateway.payment_gateway_id',
  `other_payment_method_id` bigint(20) DEFAULT NULL COMMENT 'other_payment_methods.other_payment_method_id',
  `amount` varchar(25) DEFAULT NULL,
  `pay_mode` varchar(100) DEFAULT NULL COMMENT 'Credit,Debit',
  `purpose_note` text,
  `transaction_date` datetime DEFAULT NULL COMMENT 'Date on which transaction was done',
  `transaction_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Status of transaction 1 => submitted, 2 = > confirmed 3=> declined/error',
  `customer_id` text COMMENT 'customer_id response sent from payment gateway',
  `token_id` text COMMENT 'token id from payment Gateway',
  `submited_datetime` datetime DEFAULT NULL,
  `confirmed_date` datetime DEFAULT NULL,
  `final_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Submitted,2=InProgress,3=Confirmed,4=Declined/Rejected',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `giving`
--

INSERT INTO `giving` (`id`, `type`, `user_id`, `orgId`, `event_id`, `email`, `first_name`, `middle_name`, `last_name`, `full_name`, `mobile_no`, `payment_gateway_id`, `other_payment_method_id`, `amount`, `pay_mode`, `purpose_note`, `transaction_date`, `transaction_status`, `customer_id`, `token_id`, `submited_datetime`, `confirmed_date`, `final_status`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '20000', 'Credit', NULL, '2020-01-19 15:54:17', 1, 'cus_GZkRVJQAiI6u17', NULL, NULL, NULL, 1, '1', '2020-01-19 10:24:19', NULL, '2020-01-19 10:24:19', NULL, NULL),
(2, 1, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5, '2500', 'Credit', NULL, '2020-01-20 06:13:20', 1, NULL, NULL, NULL, NULL, 1, '1', '2020-01-20 00:43:20', NULL, '2020-01-20 00:43:20', NULL, NULL),
(3, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '212121', 'Credit', NULL, '2020-01-20 06:17:47', 2, 'cus_GZyNchN2ORYEgm', NULL, NULL, NULL, 1, '1', '2020-01-20 00:47:50', NULL, '2020-01-20 00:47:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `orgId`, `groupType_id`, `name`, `description`, `notes`, `image_path`, `meeting_schedule`, `isPublic`, `location`, `is_enroll_autoClose`, `enroll_autoClose_on`, `is_enroll_autoClose_count`, `enroll_autoClose_count`, `is_enroll_notify_count`, `enroll_notify_count`, `contact_email`, `visible_leaders_fields`, `visible_members_fields`, `can_leaders_search_people`, `can_leaders_take_attendance`, `is_event_remind`, `event_remind_before`, `enroll_status`, `enroll_msg`, `leader_visibility_publicly`, `is_event_public`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 1, 'My Team', NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, 1, NULL, 1, 1, '1', '2019-12-28 00:35:32', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_enrolls`
--

CREATE TABLE IF NOT EXISTS `group_enrolls` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_events`
--

CREATE TABLE IF NOT EXISTS `group_events` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_events_attendance`
--

CREATE TABLE IF NOT EXISTS `group_events_attendance` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `event_id` bigint(22) DEFAULT NULL,
  `group_member_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE IF NOT EXISTS `group_members` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_resources`
--

CREATE TABLE IF NOT EXISTS `group_resources` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_tags`
--

CREATE TABLE IF NOT EXISTS `group_tags` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(22) DEFAULT NULL,
  `tag_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_types`
--

CREATE TABLE IF NOT EXISTS `group_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `group_types`
--

INSERT INTO `group_types` (`id`, `orgId`, `name`, `description`, `isPublic`, `d_isPublic`, `d_meeting_schedule`, `d_description`, `d_location`, `d_contact_email`, `d_visible_leaders_fields`, `d_visible_members_fields`, `d_is_enroll_autoClose`, `d_enroll_autoClose_on`, `d_is_enroll_autoClose_count`, `d_enroll_autoClose_count`, `d_is_enroll_notify_count`, `d_enroll_notify_count`, `d_can_leaders_search_people`, `d_is_event_public`, `d_is_event_remind`, `d_event_remind_before`, `d_can_leaders_take_attendance`, `d_enroll_status`, `d_enroll_msg`, `d_leader_visibility_publicly`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'Small groups', 'Small groups are a key aspect of our church community. Most meet weekly in the home of a group member (usually the leader''s home). We try to keep them limited to about 12 people. If you can''t find an open group, please let us know!', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 1, 1, NULL, 1, 1, NULL, 1, NULL, '2019-12-28 00:35:22', NULL, '2019-12-28 00:35:22', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `households`
--

CREATE TABLE IF NOT EXISTS `households` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(20) NOT NULL,
  `hhPrimaryUserId` bigint(20) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `household_user`
--

CREATE TABLE IF NOT EXISTS `household_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `isPrimary` tinyint(2) NOT NULL DEFAULT '2',
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedBy` text,
  `deletedBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `insights`
--

CREATE TABLE IF NOT EXISTS `insights` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `insights`
--

INSERT INTO `insights` (`id`, `group_id`, `name`, `type`, `source`, `description`, `visibility`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(4, NULL, 'Test21', 1, 's:293:"{"uploaded_path":"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/insights","download_path":"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/insights\\/","uploaded_file_name":"frid_1579428629.jpeg","original_filename":"frid_1579428629.jpeg","upload_file_extension":"jpeg","file_size":0}";', 'Test123', 1, '4', '2020-01-19 10:10:29', '4', '2020-01-19 10:11:05', NULL, NULL),
(5, NULL, 'asddasd', 2, NULL, 'wewerwer', 1, '4', '2020-01-19 10:11:23', NULL, '2020-01-19 10:11:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(22) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `orgId`, `name`, `latitude`, `longitude`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 3, 'asda', '2', '2', 3, '2020-01-05 01:37:20', NULL, '2020-01-05 01:37:20', NULL, NULL),
(2, 1, 'Chennai', '2', '1', 1, '2020-01-05 06:56:33', NULL, '2020-01-05 06:56:33', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_lookup_data`
--

CREATE TABLE IF NOT EXISTS `master_lookup_data` (
  `mldId` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mldId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=196 ;

--
-- Dumping data for table `master_lookup_data`
--

INSERT INTO `master_lookup_data` (`mldId`, `orgId`, `mldKey`, `mldValue`, `mldType`, `mldOption`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 0, 'school_name', 'High School', 'A', 1, NULL, '2019-07-10 12:21:10', NULL, '2019-07-16 12:09:52', NULL, NULL),
(2, 0, 'school_name', 'Middle School', 'A', 1, NULL, '2019-07-10 12:30:06', NULL, '2019-07-16 12:09:52', NULL, NULL),
(3, 0, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(4, 0, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(5, 0, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(6, 0, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(7, 0, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(8, 0, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(9, 0, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(10, 0, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-07-10 12:30:07', NULL, '2019-07-16 12:09:52', NULL, NULL),
(11, 0, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-07-10 12:30:08', NULL, '2019-07-16 12:09:52', NULL, NULL),
(12, 0, 'name_suffix', 'II', 'A', 1, NULL, '2019-07-10 12:30:08', NULL, '2019-07-16 12:09:52', NULL, NULL),
(13, 0, 'name_suffix', 'III', 'A', 1, NULL, '2019-07-10 12:30:08', NULL, '2019-07-16 12:09:52', NULL, NULL),
(14, 0, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-07-10 12:30:08', NULL, '2019-07-16 12:09:52', NULL, NULL),
(15, 0, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-07-10 12:30:08', NULL, '2019-07-16 12:09:52', NULL, NULL),
(16, 0, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-07-10 12:30:08', NULL, '2019-07-16 12:09:52', NULL, NULL),
(17, 0, 'marital_status', 'Single', 'A', 1, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(18, 0, 'marital_status', 'Married', 'A', 4, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(19, 0, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(20, 0, 'membership_status', 'Member', 'A', 1, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(21, 0, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(22, 0, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(23, 0, 'membership_status', 'Participant', 'A', 1, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(24, 0, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-07-10 12:30:09', NULL, '2019-07-16 12:09:52', NULL, NULL),
(25, 0, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-07-10 13:13:30', NULL, '2019-07-16 12:09:52', NULL, NULL),
(26, 0, 'grade_name', 'K', 'A', 4, NULL, '2019-07-10 13:13:30', NULL, '2019-07-16 12:09:52', NULL, NULL),
(27, 0, 'grade_name', '1st', 'A', 4, NULL, '2019-07-10 13:13:30', NULL, '2019-07-16 12:09:52', NULL, NULL),
(28, 0, 'grade_name', '2nd', 'A', 1, NULL, '2019-07-10 13:13:30', NULL, '2019-07-16 12:09:52', NULL, NULL),
(29, 0, 'grade_name', '3rd', 'A', 4, NULL, '2019-07-10 13:13:30', NULL, '2019-07-16 12:09:52', NULL, NULL),
(30, 0, 'room_group', 'Group1', 'A', 4, NULL, '2019-08-22 16:33:55', NULL, '2019-08-22 16:33:55', NULL, NULL),
(31, 0, 'resource_category', 'Electronic', 'A', 4, NULL, '2019-08-22 16:33:55', NULL, '2019-08-22 16:33:55', NULL, NULL),
(32, 0, 'pastor_board', 'Electronic', 'A', 1, NULL, '2019-09-11 09:35:01', NULL, '0000-00-00 00:00:00', NULL, NULL),
(33, 0, 'pastor_board', 'Home Care', 'A', 1, NULL, '2019-09-11 09:35:01', NULL, '0000-00-00 00:00:00', NULL, NULL),
(34, 1, 'school_name', 'High School', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(35, 1, 'school_name', 'Middle School', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(36, 1, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(37, 1, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(38, 1, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(39, 1, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(40, 1, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(41, 1, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(42, 1, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(43, 1, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(44, 1, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(45, 1, 'name_suffix', 'II', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(46, 1, 'name_suffix', 'III', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(47, 1, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(48, 1, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(49, 1, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(50, 1, 'marital_status', 'Single', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(51, 1, 'marital_status', 'Married', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(52, 1, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(53, 1, 'membership_status', 'Member', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(54, 1, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(55, 1, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(56, 1, 'membership_status', 'Participant', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(57, 1, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(58, 1, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(59, 1, 'grade_name', 'K', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(60, 1, 'grade_name', '1st', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(61, 1, 'grade_name', '2nd', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(62, 1, 'grade_name', '3rd', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(63, 1, 'room_group', 'Group1', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(64, 1, 'resource_category', 'Electronic', 'A', 4, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(65, 1, 'pastor_board', 'Electronic', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(66, 1, 'pastor_board', 'Home Care', 'A', 1, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(67, 2, 'school_name', 'High School', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(68, 2, 'school_name', 'Middle School', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(69, 2, 'name_prefix', 'Mr.', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(70, 2, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(71, 2, 'name_prefix', 'Ms.', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(72, 2, 'name_prefix', 'Miss', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(73, 2, 'name_prefix', 'Dr.', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(74, 2, 'name_prefix', 'Rev.', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(75, 2, 'name_suffix', 'Jr.', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(76, 2, 'name_suffix', 'Sr.', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(77, 2, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(78, 2, 'name_suffix', 'II', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(79, 2, 'name_suffix', 'III', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(80, 2, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(81, 2, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(82, 2, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(83, 2, 'marital_status', 'Single', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(84, 2, 'marital_status', 'Married', 'A', 4, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(85, 2, 'marital_status', 'Widowed', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(86, 2, 'membership_status', 'Member', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(87, 2, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(88, 2, 'membership_status', 'Visitor', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(89, 2, 'membership_status', 'Participant', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(90, 2, 'membership_status', 'In Progress', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(91, 2, 'grade_name', 'Pre-K', 'A', 4, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(92, 2, 'grade_name', 'K', 'A', 4, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(93, 2, 'grade_name', '1st', 'A', 4, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(94, 2, 'grade_name', '2nd', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(95, 2, 'grade_name', '3rd', 'A', 4, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(96, 2, 'room_group', 'Group1', 'A', 4, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(97, 2, 'resource_category', 'Electronic', 'A', 4, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(98, 2, 'pastor_board', 'Electronic', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(99, 2, 'pastor_board', 'Home Care', 'A', 1, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(130, 3, 'school_name', 'High School', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(131, 3, 'school_name', 'Middle School', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(132, 3, 'name_prefix', 'Mr.', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(133, 3, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(134, 3, 'name_prefix', 'Ms.', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(135, 3, 'name_prefix', 'Miss', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(136, 3, 'name_prefix', 'Dr.', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(137, 3, 'name_prefix', 'Rev.', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(138, 3, 'name_suffix', 'Jr.', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(139, 3, 'name_suffix', 'Sr.', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(140, 3, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(141, 3, 'name_suffix', 'II', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(142, 3, 'name_suffix', 'III', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(143, 3, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(144, 3, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(145, 3, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(146, 3, 'marital_status', 'Single', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(147, 3, 'marital_status', 'Married', 'A', 4, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(148, 3, 'marital_status', 'Widowed', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(149, 3, 'membership_status', 'Member', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(150, 3, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(151, 3, 'membership_status', 'Visitor', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(152, 3, 'membership_status', 'Participant', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(153, 3, 'membership_status', 'In Progress', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(154, 3, 'grade_name', 'Pre-K', 'A', 4, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(155, 3, 'grade_name', 'K', 'A', 4, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(156, 3, 'grade_name', '1st', 'A', 4, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(157, 3, 'grade_name', '2nd', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(158, 3, 'grade_name', '3rd', 'A', 4, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(159, 3, 'room_group', 'Group1', 'A', 4, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(160, 3, 'resource_category', 'Electronic', 'A', 4, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(161, 3, 'pastor_board', 'Electronic', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(162, 3, 'pastor_board', 'Home Care', 'A', 1, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(163, 4, 'school_name', 'High School', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(164, 4, 'school_name', 'Middle School', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(165, 4, 'name_prefix', 'Mr.', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(166, 4, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(167, 4, 'name_prefix', 'Ms.', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(168, 4, 'name_prefix', 'Miss', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(169, 4, 'name_prefix', 'Dr.', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(170, 4, 'name_prefix', 'Rev.', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(171, 4, 'name_suffix', 'Jr.', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(172, 4, 'name_suffix', 'Sr.', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(173, 4, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(174, 4, 'name_suffix', 'II', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(175, 4, 'name_suffix', 'III', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(176, 4, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(177, 4, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(178, 4, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(179, 4, 'marital_status', 'Single', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(180, 4, 'marital_status', 'Married', 'A', 4, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(181, 4, 'marital_status', 'Widowed', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(182, 4, 'membership_status', 'Member', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(183, 4, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(184, 4, 'membership_status', 'Visitor', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(185, 4, 'membership_status', 'Participant', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(186, 4, 'membership_status', 'In Progress', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(187, 4, 'grade_name', 'Pre-K', 'A', 4, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(188, 4, 'grade_name', 'K', 'A', 4, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(189, 4, 'grade_name', '1st', 'A', 4, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(190, 4, 'grade_name', '2nd', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(191, 4, 'grade_name', '3rd', 'A', 4, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(192, 4, 'room_group', 'Group1', 'A', 4, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(193, 4, 'resource_category', 'Electronic', 'A', 4, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(194, 4, 'pastor_board', 'Electronic', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL),
(195, 4, 'pastor_board', 'Home Care', 'A', 1, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=14 ;

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

CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\User', 1),
(13, 'App\\User', 1),
(2, 'App\\User', 2),
(24, 'App\\User', 2),
(2, 'App\\User', 3),
(39, 'App\\User', 3),
(1, 'App\\User', 4),
(14, 'App\\User', 5),
(16, 'App\\User', 6),
(2, 'App\\User', 7),
(50, 'App\\User', 7);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('04b2fbfd3b5f0e1b5a1d53656cc79be95ce03509f5727cda98cbdff0e4aa2ad03fc50b3e5a3ffeb0', 1, 1, 'dollar', '[]', 0, '2019-12-18 01:55:00', '2019-12-18 01:55:00', '2020-12-18 07:25:00'),
('08118bc7f54f19a16fe656e4fe3ec4ad4507576256a6e75069275423ca5843c75f260b5a957de6ee', 1, 1, 'dollar', '[]', 0, '2019-12-28 00:34:18', '2019-12-28 00:34:18', '2020-12-28 06:04:18'),
('0ae5b4f523fadce09ad5ececd8f6c36e78e9a1089d1e66099da5b94956443664539b92d53f3fa05e', 4, 1, 'dollar', '[]', 0, '2020-01-06 00:05:21', '2020-01-06 00:05:21', '2021-01-06 05:35:21'),
('0b0de77e4e3d53612ef030415f976a8f839cbc42800faf05558794709099096152f9e0c3cc70e919', 1, 1, 'dollar', '[]', 0, '2020-01-05 05:47:06', '2020-01-05 05:47:06', '2021-01-05 11:17:06'),
('13ed67066c1b0da0fbd74ef1cc08584bc4b55fc8c29fe92f30a9740bf6efb2adbecc4415d602616e', 4, 1, 'dollar', '[]', 0, '2020-01-13 02:55:38', '2020-01-13 02:55:38', '2021-01-13 08:25:38'),
('20e98543a23507e6509d46cfc091b2ef857d86184618711299db44638c37f0f1745a062d79e135af', 1, 1, 'dollar', '[]', 0, '2020-01-13 03:13:07', '2020-01-13 03:13:07', '2021-01-13 08:43:07'),
('27a7d90ac92b4476ad11d870ab07e19ba18bea8775e0146f8219f026b3249d452212394f333813ca', 4, 1, 'dollar', '[]', 0, '2020-01-06 00:04:51', '2020-01-06 00:04:51', '2021-01-06 05:34:51'),
('310093629747e822be60c06601f94de877b2f2041b45c495c929817f81093bc862866caa0a7bab40', 1, 1, 'dollar', '[]', 0, '2020-01-12 15:10:32', '2020-01-12 15:10:32', '2021-01-12 20:40:32'),
('35a6b4fa1bc13cffa1de5145d24ad7b8aab2f643985fb82937051e5e90294f2615297d464ff5bc52', 1, 1, 'dollar', '[]', 0, '2020-01-19 12:27:28', '2020-01-19 12:27:28', '2021-01-19 17:57:28'),
('36ebd74638d15c97baee4a12bd6c479999eb50653d02aacd75f1a3c96099b30c62971b24f7a71b93', 1, 1, 'dollar', '[]', 0, '2020-01-05 01:11:42', '2020-01-05 01:11:42', '2021-01-05 06:41:42'),
('3fc3121a933092d15fa2963a9a8eb405527200041901df4ab22f55a83865733dd2ecfde9c93923b0', 4, 1, 'dollar', '[]', 0, '2020-01-13 02:57:23', '2020-01-13 02:57:23', '2021-01-13 08:27:23'),
('407d15f6018626545c9e5026928e55f82620d35291620023911db5ebb804c8f1da6295c12c924d4d', 6, 1, 'dollar', '[]', 0, '2020-01-06 01:15:42', '2020-01-06 01:15:42', '2021-01-06 06:45:42'),
('40a77c817be88776eec4f66aef869738175f3c347286b54b13e0a7d647acffa8e5a2f9de7a04662f', 4, 1, 'dollar', '[]', 0, '2020-01-13 00:45:05', '2020-01-13 00:45:05', '2021-01-13 06:15:05'),
('42765866277b0d5c7609854b316043830c18e860d36cf67e32e77a9958d15065fb51c5924908bbb0', 3, 1, 'dollar', '[]', 0, '2020-01-05 01:17:45', '2020-01-05 01:17:45', '2021-01-05 06:47:45'),
('456316c9e06390bbe14b2b585d25c2049ac6b026d2602dd86db4597fd2785882f1d2ebefc93b6ab7', 1, 1, 'dollar', '[]', 0, '2020-01-19 10:18:41', '2020-01-19 10:18:41', '2021-01-19 15:48:41'),
('4933ce77ac2ee4613956324b8e9beacd1c4cd3a12c0f5329aea35d81c18ffc8790836f166fddcb0e', 6, 1, 'dollar', '[]', 0, '2020-01-06 00:40:18', '2020-01-06 00:40:18', '2021-01-06 06:10:18'),
('4f274098423f0f44befb3a88cc54e1ed0c675da6987499fea2b6e563b805e3f13673792a6b5717de', 1, 1, 'dollar', '[]', 0, '2020-01-06 02:35:27', '2020-01-06 02:35:27', '2021-01-06 08:05:27'),
('54fe60ac61c36ceaffba1fc3cb90d210000fba52a25b5b3dca2f180c7ba83c15ecd464d93e2909d7', 4, 1, 'dollar', '[]', 0, '2020-01-13 03:07:15', '2020-01-13 03:07:15', '2021-01-13 08:37:15'),
('6760dc09933309d1bea91b00a89d548dfbe45cf29a66ccf1c7453c9273a812e2e89fe9ce24a80492', 1, 1, 'dollar', '[]', 0, '2020-01-13 03:20:17', '2020-01-13 03:20:17', '2021-01-13 08:50:17'),
('6dde92c1ed614f797350dda92c6393ce6818c47603abf06dde8e32d819f8dd89916c393b70eab9e7', 1, 1, 'dollar', '[]', 0, '2020-01-19 10:12:10', '2020-01-19 10:12:10', '2021-01-19 15:42:10'),
('7f79f1d436942da14c412dd8287df751132d612b73e0b9615280693be0d117d180aae97e8faf264a', 5, 1, 'dollar', '[]', 0, '2020-01-06 00:47:33', '2020-01-06 00:47:33', '2021-01-06 06:17:33'),
('833bab0783d66bddfff79a42210e95a7b4df4d4cfc618490728a5bbcf893c9b7a168cc26ac0e5e66', 6, 1, 'dollar', '[]', 0, '2020-01-06 03:08:37', '2020-01-06 03:08:37', '2021-01-06 08:38:37'),
('8714fec4f8780bb9595e6e392cceb4b362f996cf4c4921e6a2334d674fd0e7b0afd512ece8b01500', 1, 1, 'dollar', '[]', 0, '2020-01-10 03:11:03', '2020-01-10 03:11:03', '2021-01-10 08:41:03'),
('95b19d42db8f600fe0b8100b11b3b420f0bb04e4236f64cc6be70bb79aaf2ae71e9b1c46898a3a66', 4, 1, 'dollar', '[]', 0, '2020-01-13 00:25:00', '2020-01-13 00:25:00', '2021-01-13 05:55:00'),
('9c2adb585449e62a9025924c6800727424b21ce2b9748375ac419166b2912d0393b7c245d3fb50a3', 4, 1, 'dollar', '[]', 0, '2020-01-19 10:08:28', '2020-01-19 10:08:28', '2021-01-19 15:38:28'),
('a8ec4b0cfe8ebef053645a77c2a297bf1de8f1e903b23f620b373455c771eee2999fbae8cca29911', 7, 1, 'dollar', '[]', 0, '2020-01-13 02:58:17', '2020-01-13 02:58:17', '2021-01-13 08:28:17'),
('aa44646e6c7fe41e8b133c6cee304f464a206d7a2d3829eefdee73f9316a03252929e62815a94e25', 1, 1, 'dollar', '[]', 0, '2020-01-19 10:08:02', '2020-01-19 10:08:02', '2021-01-19 15:38:02'),
('b3664943194a8084c436f72cc3f0ecd2b0975fb0b963e4734491d9e2c390f8ee2de2331da8bac5b7', 1, 1, 'dollar', '[]', 0, '2019-12-22 09:40:13', '2019-12-22 09:40:13', '2020-12-22 15:10:13'),
('bf4e0d883c83bd37e139012b14198a7d059bc6089a5f2f7261c2472c760f17c427b75aebfa6ae68c', 2, 1, 'dollar', '[]', 0, '2020-01-05 05:46:30', '2020-01-05 05:46:30', '2021-01-05 11:16:30'),
('c67dd3190970555c9fd1cb5855591a8380429c5e1a1f5bd14a33fe3ba3a7da309d91113d0ce62515', 1, 1, 'dollar', '[]', 0, '2020-01-05 05:46:54', '2020-01-05 05:46:54', '2021-01-05 11:16:54'),
('c69e423efac5ebc69766f4ee53493ae0b1cc31c0df5c382815d88d1c8db72b1fbddf6d3d1d5fe1c7', 1, 1, 'dollar', '[]', 0, '2020-01-13 15:54:54', '2020-01-13 15:54:54', '2021-01-13 21:24:54'),
('cc81350ae6eb3755662c5885b4055ceceee01a5393416e6d97bc50092dca32e334814398aef4043e', 1, 1, 'dollar', '[]', 0, '2020-01-20 00:04:47', '2020-01-20 00:04:47', '2021-01-20 05:34:47'),
('d91cf34a32fabe2a856c776f8647f4ef3ddd1a400cee5c0f1a7f005f58ce0603f616e94c9290eef4', 1, 1, 'dollar', '[]', 0, '2020-01-07 01:27:27', '2020-01-07 01:27:27', '2021-01-07 06:57:27'),
('d9a95bcce49d7c05d8776e89e68be2f88a782625819d3937a757b58c0bc4d714b346aa9c2a973c55', 1, 1, 'dollar', '[]', 0, '2019-12-27 01:02:11', '2019-12-27 01:02:11', '2020-12-27 06:32:11'),
('df186275b245d956918fadd1bc20fd6e5a11d09a3c6b06b26f5deeb65baf98cb598ff6459e53741a', 6, 1, 'dollar', '[]', 0, '2020-01-06 00:44:18', '2020-01-06 00:44:18', '2021-01-06 06:14:18'),
('e241b0f00534e47533de9216546deaba933a76fb56f54e312e7435c2ce3ad208c80b5e4433b54745', 1, 1, 'dollar', '[]', 0, '2020-01-19 13:05:33', '2020-01-19 13:05:33', '2021-01-19 18:35:33'),
('ebcec3b7d62afc3e317abfe9736d3e4386c2cc9821806402c192d651f8775189c21e2a1311f30f21', 1, 1, 'dollar', '[]', 0, '2020-01-06 00:37:43', '2020-01-06 00:37:43', '2021-01-06 06:07:43'),
('ec6570d2740b133391cbc2710c9211e9825d8aed8568c2415689ce1bb595689babca949a62e658cf', 1, 1, 'dollar', '[]', 0, '2020-01-05 13:48:49', '2020-01-05 13:48:49', '2021-01-05 19:18:49'),
('edc97192d25965798f4f4908d81cff15a6687c874eb669c8d422d30d229d974144d14ad6e96d40a8', 1, 1, 'dollar', '[]', 0, '2019-12-18 01:55:08', '2019-12-18 01:55:08', '2020-12-18 07:25:08'),
('ee3ef2f2c600456a39176816faeab72855ec226a59cb249caca5c6939ebe1cca0e4972212911412b', 1, 1, 'dollar', '[]', 0, '2020-01-06 15:39:54', '2020-01-06 15:39:54', '2021-01-06 21:09:54'),
('f0dbb2a89ef4dead1186c258cd6c2c911b31ef4be53495b2c5d365ba932df509cb1cf5933f872728', 5, 1, 'dollar', '[]', 0, '2020-01-06 04:22:49', '2020-01-06 04:22:49', '2021-01-06 09:52:49'),
('f16a1a9c81f83ee68bc6a964f2dcd307574cc3a5fa99e3c603dcb6496ff96dd98736776b3015070b', 1, 1, 'dollar', '[]', 0, '2020-01-06 00:48:06', '2020-01-06 00:48:06', '2021-01-06 06:18:06'),
('f38c3be03218bb0ef9c115ee34bddbc781b49257fa2d049922a930dacf40687e390c64b1411c28dd', 1, 1, 'dollar', '[]', 0, '2020-01-13 00:43:03', '2020-01-13 00:43:03', '2021-01-13 06:13:03'),
('f82f77452473c63d4825b9a8ffccafb1e0f9d2814315e3dce3a8a6da06dcd608fbbf3a9f24ee7b5e', 4, 1, 'dollar', '[]', 0, '2020-01-13 00:25:25', '2020-01-13 00:25:25', '2021-01-13 05:55:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

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

CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-05-05 20:28:45', '2019-05-05 20:28:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE IF NOT EXISTS `organization` (
  `orgId` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`orgId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`orgId`, `orgName`, `orgAddress`, `orgAptUnitBox`, `orgCity`, `orgState`, `orgPincode`, `orgPhone`, `orgLogo`, `orgTimeZone`, `orgTimeCountry`, `orgTimeFormat`, `orgDateFormat`, `orgCurrency`, `orgEmail`, `orgWebsite`, `orgTaxIdNo`, `orgDomain`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 'St Paul', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Canada/Saskatchewan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'stpaul', NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(2, 'stpeter church', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'America/Los_Angeles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'stpeter', NULL, '2020-01-05 01:13:00', NULL, '2020-01-05 01:13:00', NULL, NULL),
(3, 'stantony church', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pacific/Samoa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'stantony', NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(4, 'Karkal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'America/Mexico_City', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'karkal', NULL, '2020-01-13 02:58:01', NULL, '2020-01-13 02:58:01', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `other_payment_methods`
--

CREATE TABLE IF NOT EXISTS `other_payment_methods` (
  `other_payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`other_payment_method_id`),
  KEY `orgId` (`orgId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `other_payment_methods`
--

INSERT INTO `other_payment_methods` (`other_payment_method_id`, `orgId`, `payment_method`, `payment_method_notes`, `confirm_payment_method`, `status`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, NULL, 'Cash', 'other_payment_methods', 0, 1, NULL, '2019-12-13 03:57:02', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, NULL, 'Cheque', 'Cheque', 0, 1, NULL, '2019-12-13 03:57:02', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 3, 'C-Pay', 'C-Pay Npte hellpo', 0, 1, '3', '2020-01-05 01:19:50', NULL, '2020-01-05 01:19:50', NULL, NULL),
(4, 1, 'C-Pay', 'C-Pay Npte hellpo', 0, 1, '1', '2020-01-05 06:25:33', NULL, '2020-01-05 06:25:33', NULL, NULL),
(5, 1, 'Cash Coupon', 'Cash Coupon', 0, 1, '1', '2020-01-13 03:18:13', NULL, '2020-01-13 03:18:13', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pastor_board`
--

CREATE TABLE IF NOT EXISTS `pastor_board` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE IF NOT EXISTS `payment_gateways` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID Primary Key',
  `payment_gateway_id` tinyint(1) DEFAULT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `gateway_name` varchar(50) NOT NULL COMMENT 'name of the gateway',
  `active` varchar(1) NOT NULL DEFAULT '1' COMMENT 'Status of the gateway, 1=Active,2=InActive',
  `createdBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `payment_gateway_id`, `orgId`, `gateway_name`, `active`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, NULL, 'Stripe', '1', NULL, '2019-12-27 01:01:48', NULL, '2019-12-28 00:47:17', NULL, NULL),
(2, 2, NULL, 'Paypal', '1', NULL, '2019-12-27 01:01:48', NULL, '2019-12-28 00:48:05', NULL, NULL),
(3, 3, NULL, 'Others', '1', NULL, '2019-12-27 01:01:48', NULL, '2019-12-28 00:48:05', NULL, NULL),
(4, 1, 3, 'Stripe', '1', NULL, '2020-01-05 01:18:35', NULL, '2020-01-05 01:18:35', NULL, NULL),
(5, 3, 3, 'Others', '1', NULL, '2020-01-05 01:20:12', NULL, '2020-01-05 01:20:12', NULL, NULL),
(6, 1, 1, 'Stripe', '1', NULL, '2020-01-05 05:47:34', NULL, '2020-01-05 05:47:34', NULL, NULL),
(7, 3, 1, 'Others', '1', NULL, '2020-01-05 06:25:02', NULL, '2020-01-05 06:25:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway_parameters`
--

CREATE TABLE IF NOT EXISTS `payment_gateway_parameters` (
  `parameter_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_gateway_id` int(11) NOT NULL,
  `parameter_name` varchar(50) NOT NULL,
  `validation_type` varchar(100) DEFAULT NULL COMMENT 'enter if specific validation is required except "required" validation',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`parameter_id`),
  KEY `payment_gateways_payment_gateway_parameters_FK1` (`payment_gateway_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `payment_gateway_parameters`
--

INSERT INTO `payment_gateway_parameters` (`parameter_id`, `payment_gateway_id`, `parameter_name`, `validation_type`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'Public Key', 'text', NULL, '2019-12-27 01:01:50', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 1, 'Secret Key', 'text', NULL, '2019-12-27 01:01:50', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 2, 'Client Email Id', 'email', NULL, '2019-12-27 01:01:50', NULL, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orgId` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=32 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `orgId`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 0, 'Nextgen Checkin', 'web', '2019-05-05 02:51:47', '2019-05-05 02:51:47'),
(2, 0, 'Member Directory', 'web', '2019-05-05 02:51:47', '2019-05-05 02:51:47'),
(3, 0, 'Scheduling', 'web', '2019-05-05 02:51:47', '2019-05-05 03:43:48'),
(4, 0, 'Event management', 'web', '2019-05-05 02:51:47', '2019-05-05 02:51:47'),
(5, 0, 'Small Group', 'web', '2019-05-05 03:30:09', '2019-05-05 03:38:33'),
(6, 0, 'Accounting', 'web', '2019-05-05 03:30:21', '2019-05-05 03:38:37'),
(7, 1, 'Nextgen Checkin', 'web', NULL, NULL),
(8, 1, 'Member Directory', 'web', NULL, NULL),
(9, 1, 'Scheduling', 'web', NULL, NULL),
(10, 1, 'Event management', 'web', NULL, NULL),
(11, 1, 'Small Group', 'web', NULL, NULL),
(12, 1, 'Accounting', 'web', NULL, NULL),
(13, 2, 'Nextgen Checkin', 'web', NULL, NULL),
(14, 2, 'Member Directory', 'web', NULL, NULL),
(15, 2, 'Scheduling', 'web', NULL, NULL),
(16, 2, 'Event management', 'web', NULL, NULL),
(17, 2, 'Small Group', 'web', NULL, NULL),
(18, 2, 'Accounting', 'web', NULL, NULL),
(20, 3, 'Nextgen Checkin', 'web', NULL, NULL),
(21, 3, 'Member Directory', 'web', NULL, NULL),
(22, 3, 'Scheduling', 'web', NULL, NULL),
(23, 3, 'Event management', 'web', NULL, NULL),
(24, 3, 'Small Group', 'web', NULL, NULL),
(25, 3, 'Accounting', 'web', NULL, NULL),
(26, 4, 'Nextgen Checkin', 'web', NULL, NULL),
(27, 4, 'Member Directory', 'web', NULL, NULL),
(28, 4, 'Scheduling', 'web', NULL, NULL),
(29, 4, 'Event management', 'web', NULL, NULL),
(30, 4, 'Small Group', 'web', NULL, NULL),
(31, 4, 'Accounting', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE IF NOT EXISTS `position` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(22) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE IF NOT EXISTS `resources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orgId` bigint(20) DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_tag` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=61 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `orgId`, `name`, `guard_name`, `role_tag`, `created_at`, `updated_at`) VALUES
(1, 0, 'Super Adminin', 'web', 'superadmin', '2019-05-04 21:22:07', '2019-05-04 21:22:07'),
(2, 0, 'Adminstrator', 'web', 'admin', '2019-05-04 21:22:08', '2019-08-24 15:57:41'),
(3, 0, 'Member', 'web', 'member', '2019-05-04 22:20:10', '2019-05-04 22:20:10'),
(4, 0, 'Volunteer', 'web', 'volunteer', '2019-07-25 17:48:18', '2019-07-25 17:48:18'),
(5, 0, 'Pastor', 'web', 'pastor', '2019-08-24 15:59:13', '2019-09-12 19:52:59'),
(6, 0, 'First Time Guest', 'web', 'firsttimeguest', '2019-08-24 15:59:13', '2019-09-12 19:52:59'),
(7, 0, 'Inactive Member', 'web', 'InactiveMember', '2019-08-24 15:59:52', '2019-09-12 19:52:59'),
(8, 0, 'Checkin Volunteer', 'web', 'CheckinVolunteer', '2019-08-24 15:59:52', '2019-09-12 19:52:59'),
(9, 0, 'Event Organizer', 'web', 'EventOrganizer', '2019-08-24 16:00:12', '2019-09-12 19:52:59'),
(10, 0, 'Production Manager', 'web', 'ProductionManager', '2019-08-24 16:00:12', '2019-09-12 19:52:59'),
(11, 0, 'Accounts Admin', 'web', 'AccountsAdmin', '2019-08-24 16:00:29', '2019-09-12 19:52:59'),
(12, 0, 'Visitor', 'web', 'Visitor', '2019-08-24 16:00:29', '2019-09-12 19:52:59'),
(13, 1, 'Adminstrator', 'web', 'admin', '2019-12-18 01:54:50', NULL),
(14, 1, 'Member', 'web', 'member', '2019-12-18 01:54:50', '2020-01-06 01:14:49'),
(15, 1, 'Volunteer', 'web', 'volunteer', '2019-12-18 01:54:50', NULL),
(16, 1, 'Pastor', 'web', 'pastor', '2019-12-18 01:54:50', NULL),
(17, 1, 'First Time Guest', 'web', 'firsttimeguest', '2019-12-18 01:54:50', NULL),
(18, 1, 'Inactive Member', 'web', 'InactiveMember', '2019-12-18 01:54:50', NULL),
(19, 1, 'Checkin Volunteer', 'web', 'CheckinVolunteer', '2019-12-18 01:54:50', NULL),
(20, 1, 'Event Organizer', 'web', 'EventOrganizer', '2019-12-18 01:54:50', NULL),
(21, 1, 'Production Manager', 'web', 'ProductionManager', '2019-12-18 01:54:50', NULL),
(22, 1, 'Accounts Admin', 'web', 'AccountsAdmin', '2019-12-18 01:54:50', NULL),
(23, 1, 'Visitor', 'web', 'Visitor', '2019-12-18 01:54:50', NULL),
(24, 2, 'Adminstrator', 'web', 'admin', '2020-01-05 01:13:00', NULL),
(25, 2, 'Member', 'web', 'member', '2020-01-05 01:13:00', NULL),
(26, 2, 'Volunteer', 'web', 'volunteer', '2020-01-05 01:13:00', NULL),
(27, 2, 'Pastor', 'web', 'pastor', '2020-01-05 01:13:00', NULL),
(28, 2, 'First Time Guest', 'web', 'firsttimeguest', '2020-01-05 01:13:00', NULL),
(29, 2, 'Inactive Member', 'web', 'InactiveMember', '2020-01-05 01:13:00', NULL),
(30, 2, 'Checkin Volunteer', 'web', 'CheckinVolunteer', '2020-01-05 01:13:00', NULL),
(31, 2, 'Event Organizer', 'web', 'EventOrganizer', '2020-01-05 01:13:00', NULL),
(32, 2, 'Production Manager', 'web', 'ProductionManager', '2020-01-05 01:13:00', NULL),
(33, 2, 'Accounts Admin', 'web', 'AccountsAdmin', '2020-01-05 01:13:00', NULL),
(34, 2, 'Visitor', 'web', 'Visitor', '2020-01-05 01:13:00', NULL),
(39, 3, 'Adminstrator', 'web', 'admin', '2020-01-05 01:17:10', NULL),
(40, 3, 'Member', 'web', 'member', '2020-01-05 01:17:10', NULL),
(41, 3, 'Volunteer', 'web', 'volunteer', '2020-01-05 01:17:10', NULL),
(42, 3, 'Pastor', 'web', 'pastor', '2020-01-05 01:17:10', NULL),
(43, 3, 'First Time Guest', 'web', 'firsttimeguest', '2020-01-05 01:17:10', NULL),
(44, 3, 'Inactive Member', 'web', 'InactiveMember', '2020-01-05 01:17:10', NULL),
(45, 3, 'Checkin Volunteer', 'web', 'CheckinVolunteer', '2020-01-05 01:17:10', NULL),
(46, 3, 'Event Organizer', 'web', 'EventOrganizer', '2020-01-05 01:17:10', NULL),
(47, 3, 'Production Manager', 'web', 'ProductionManager', '2020-01-05 01:17:10', NULL),
(48, 3, 'Accounts Admin', 'web', 'AccountsAdmin', '2020-01-05 01:17:10', NULL),
(49, 3, 'Visitor', 'web', 'Visitor', '2020-01-05 01:17:10', NULL),
(50, 4, 'Adminstrator', 'web', 'admin', '2020-01-13 02:58:01', NULL),
(51, 4, 'Member', 'web', 'member', '2020-01-13 02:58:01', NULL),
(52, 4, 'Volunteer', 'web', 'volunteer', '2020-01-13 02:58:01', NULL),
(53, 4, 'Pastor', 'web', 'pastor', '2020-01-13 02:58:01', NULL),
(54, 4, 'First Time Guest', 'web', 'firsttimeguest', '2020-01-13 02:58:01', NULL),
(55, 4, 'Inactive Member', 'web', 'InactiveMember', '2020-01-13 02:58:01', NULL),
(56, 4, 'Checkin Volunteer', 'web', 'CheckinVolunteer', '2020-01-13 02:58:01', NULL),
(57, 4, 'Event Organizer', 'web', 'EventOrganizer', '2020-01-13 02:58:01', NULL),
(58, 4, 'Production Manager', 'web', 'ProductionManager', '2020-01-13 02:58:01', NULL),
(59, 4, 'Accounts Admin', 'web', 'AccountsAdmin', '2020-01-13 02:58:01', NULL),
(60, 4, 'Visitor', 'web', 'Visitor', '2020-01-13 02:58:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(7, 13),
(8, 13),
(9, 13),
(10, 13),
(11, 13),
(12, 13),
(7, 14),
(11, 14),
(7, 15),
(7, 16),
(8, 16),
(10, 16),
(11, 16),
(12, 16),
(7, 17),
(7, 18),
(7, 19),
(7, 20),
(7, 21),
(7, 22),
(7, 23),
(13, 24),
(14, 24),
(15, 24),
(16, 24),
(17, 24),
(18, 24),
(13, 25),
(13, 26),
(13, 27),
(13, 28),
(13, 29),
(13, 30),
(13, 31),
(13, 32),
(13, 33),
(13, 34),
(20, 39),
(21, 39),
(22, 39),
(23, 39),
(24, 39),
(25, 39),
(20, 40),
(20, 41),
(20, 42),
(20, 43),
(20, 44),
(20, 45),
(20, 46),
(20, 47),
(20, 48),
(20, 49),
(26, 50),
(27, 50),
(28, 50),
(29, 50),
(30, 50),
(31, 50),
(26, 51),
(26, 52),
(26, 53),
(26, 54),
(26, 55),
(26, 56),
(26, 57),
(26, 58),
(26, 59),
(26, 60);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE IF NOT EXISTS `schedules` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `s_title` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_service_users_count`
--

CREATE TABLE IF NOT EXISTS `schedule_service_users_count` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scheduling`
--

CREATE TABLE IF NOT EXISTS `scheduling` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scheduling_user`
--

CREATE TABLE IF NOT EXISTS `scheduling_user` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `store_payment_gateway_values`
--

CREATE TABLE IF NOT EXISTS `store_payment_gateway_values` (
  `payment_values_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID Primary Key',
  `orgId` bigint(20) DEFAULT NULL COMMENT 'Foreign key reference to organization',
  `payment_gateway_id` int(11) NOT NULL,
  `payment_gateway_parameter_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Foreign key reference to payment_gateway_parameters',
  `payment_gateway_parameter_value` varchar(200) NOT NULL COMMENT 'Values of the parameter to be passed to payment gateway',
  `active` varchar(1) NOT NULL DEFAULT '1' COMMENT 'Record status',
  `preferred_payment_gateway` int(1) NOT NULL DEFAULT '1' COMMENT '0 -> inactive, 1 - active',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`payment_values_id`),
  KEY `orgId` (`orgId`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `store_payment_gateway_values`
--

INSERT INTO `store_payment_gateway_values` (`payment_values_id`, `orgId`, `payment_gateway_id`, `payment_gateway_parameter_id`, `payment_gateway_parameter_value`, `active`, `preferred_payment_gateway`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 3, 1, 1, 'test', '1', 1, NULL, '2020-01-05 01:18:35', NULL, '2020-01-07 01:35:07', NULL, NULL),
(2, 3, 1, 2, 'test', '1', 1, NULL, '2020-01-05 01:18:35', NULL, '2020-01-07 01:35:08', NULL, NULL),
(3, 1, 1, 1, 'pk_test_ABtwzuVrHYZusP90hjjEHDur', '1', 1, NULL, '2020-01-05 05:47:34', NULL, '2020-01-13 03:15:26', NULL, NULL),
(4, 1, 1, 2, 'sk_test_JpFi9kNRPYH0bUJeQmxbIqFr', '1', 1, NULL, '2020-01-05 05:47:34', NULL, '2020-01-13 03:15:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `tagGroup_id` bigint(22) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `order` tinyint(10) NOT NULL DEFAULT '0' COMMENT 'Listing order number for sorting',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tag_groups`
--

CREATE TABLE IF NOT EXISTS `tag_groups` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(22) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `team_has_position`
--

CREATE TABLE IF NOT EXISTS `team_has_position` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `team_id` bigint(22) DEFAULT NULL,
  `position_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updatedBy` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deletedBy` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `orgId`, `householdName`, `personal_id`, `name_prefix`, `given_name`, `first_name`, `last_name`, `middle_name`, `nick_name`, `full_name`, `user_full_name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `referal_code`, `name_suffix`, `profile_pic`, `dob`, `doa`, `school_name`, `grade_id`, `life_stage`, `mobile_no`, `home_phone_no`, `gender`, `social_profile`, `marital_status`, `address`, `medical_note`, `congregration_status`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'St Paul Admin''s household', '0000000001', NULL, NULL, 'St Paul Admin', NULL, NULL, NULL, 'St Paul Admin', NULL, 'stpaul@gmail.com', NULL, NULL, '$2y$10$j81Uj33DWeh6SoXbuqFdFeA2wr72bVXjV1qsGDjc11e8ZnQbyQtP6', NULL, 'St Paht4', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(2, 2, 'stpeter name''s household', '0000000002', NULL, NULL, 'stpeter name', NULL, NULL, NULL, 'stpeter name', NULL, 'stpeter@stpeter.com', NULL, NULL, '$2y$10$ylQn5OiWe6DDgmp0bAD.Z.bgnyuQJ0OC6RbzuzocANiyBdb7Lhc32', NULL, 'stpehine', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-05 01:13:01', NULL, '2020-01-05 01:13:01', NULL, NULL),
(3, 3, 'stantony name''s household', '0000000003', NULL, NULL, 'stantony name', NULL, NULL, NULL, 'stantony name', NULL, 'stantony@stantony.com', NULL, NULL, '$2y$10$7SUh6ZRp9g/JLVWiepNxaOA99ciQSFkXDYmslR34q9wksNLfLpnAe', NULL, 'stanpzdi', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-05 01:17:10', NULL, '2020-01-05 01:17:10', NULL, NULL),
(4, NULL, 'Superadmin', '0000000000', NULL, NULL, 'Superadmin', NULL, NULL, NULL, 'Superadmin', NULL, 'superadmin@superadmin.com', 'superadmin', NULL, '$2y$10$j81Uj33DWeh6SoXbuqFdFeA2wr72bVXjV1qsGDjc11e8ZnQbyQtP6', NULL, 'superadmin', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-18 01:54:50', NULL, '2019-12-18 01:54:50', NULL, NULL),
(5, 1, 'Somesh''s household', '0000000005', '40', 'somesh', 'Somesh', 'L', 'S', 'somesh', 'Somesh S L', NULL, 'somesh@somesh.com', NULL, NULL, '$2y$10$8U4KBJQM00q0K2cuP0InheVn1cD6jC5h.xa7mx55qh5dCV.pQvt8.', NULL, 'Somefn4v', '45', NULL, '1980-01-23', '1970-01-01', '34', 60, 'Adult', '123', NULL, 'Male', NULL, '51', '////////////', NULL, NULL, '2020-01-06 00:39:00', NULL, '2020-01-06 00:39:00', NULL, NULL),
(6, 1, 'Manish''s household', '0000000006', '40', 'Manish', 'Manish', 't', 'r', 'Manish', 'Manish r t', NULL, 'manish@manish.com', NULL, NULL, '$2y$10$CQGnOSibgcmVAUh6uw/WHuawtpS7y8NaZ96P0qdSFrJtPIKLqE7ZW', NULL, 'Manixhzh', '45', NULL, '1970-01-01', '1970-01-01', '34', 60, 'Adult', NULL, NULL, 'Male', NULL, '51', '////////////', NULL, NULL, '2020-01-06 00:39:42', NULL, '2020-01-06 00:39:42', NULL, NULL),
(7, 4, 'Karkal name''s household', '0000000007', NULL, NULL, 'Karkal name', NULL, NULL, NULL, 'Karkal name', NULL, 'karkal@karkal.com', NULL, NULL, '$2y$10$xJJ8QhLyuk1XWGlGN.Z/gOMTSyL40OGQRo/CkcWSy3ehbGhRyBAUy', NULL, 'Karkryr6', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-13 02:58:02', NULL, '2020-01-13 02:58:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_position`
--

CREATE TABLE IF NOT EXISTS `user_has_position` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(22) DEFAULT NULL,
  `user_id` bigint(22) DEFAULT NULL,
  `position_id` bigint(22) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
