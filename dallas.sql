-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 01, 2019 at 04:21 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `checkins`
--

INSERT INTO `checkins` (`chId`, `eventId`, `user_id`, `chINDateTime`, `chOUTDateTime`, `chKind`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 3, '2019-08-24 22:14:08', NULL, 'Regular', '1', '2019-08-24 22:14:08', NULL, '2019-08-24 22:14:08', NULL, NULL),
(2, 1, 1, '2019-08-24 22:14:17', '2019-08-24 22:14:40', 'Regular', '1', '2019-08-24 22:14:17', '1', '2019-08-24 22:14:40', NULL, NULL),
(3, 1, 1, '2019-08-24 20:04:22', NULL, 'Regular', '1', '2019-08-25 08:04:22', NULL, '2019-08-25 08:04:22', NULL, NULL),
(4, 1, 1, '2019-08-24 20:07:38', NULL, 'Regular', '1', '2019-08-25 08:07:38', NULL, '2019-08-25 08:07:38', NULL, NULL),
(5, 1, 1, '2019-08-24 20:07:39', NULL, 'Regular', '1', '2019-08-25 08:07:39', NULL, '2019-08-25 08:07:39', NULL, NULL),
(6, 3, 1, '2019-08-29 06:45:52', NULL, 'Regular', '1', '2019-08-28 18:45:52', NULL, '2019-08-28 18:45:52', NULL, NULL),
(7, 3, 5, '2019-08-29 06:46:36', NULL, 'Regular', '1', '2019-08-28 18:46:36', NULL, '2019-08-28 18:46:36', NULL, NULL),
(8, 3, 5, '2019-08-29 06:47:11', NULL, 'Regular', '1', '2019-08-28 18:47:11', NULL, '2019-08-28 18:47:11', NULL, NULL),
(9, 2, 1, '2019-08-31 04:19:23', NULL, 'Regular', '1', '2019-08-31 04:19:23', NULL, '2019-08-31 04:19:23', NULL, NULL),
(10, 2, 1, '2019-08-31 04:19:29', NULL, 'Regular', '1', '2019-08-31 04:19:29', NULL, '2019-08-31 04:19:29', NULL, NULL),
(11, 2, 5, '2019-08-31 04:19:51', NULL, 'Regular', '1', '2019-08-31 04:19:51', NULL, '2019-08-31 04:19:51', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `comm_details`
--

INSERT INTO `comm_details` (`id`, `comm_master_id`, `to_user_id`, `read_status`, `delete_status`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 2, 'UNREAD', 'UNDELETED', NULL, '2019-08-24 22:07:35', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 2, 3, 'UNREAD', 'UNDELETED', NULL, '2019-08-24 22:09:03', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 3, 4, 'UNREAD', 'UNDELETED', NULL, '2019-08-24 22:09:22', NULL, '0000-00-00 00:00:00', NULL, NULL),
(4, 4, 2, 'UNREAD', 'UNDELETED', NULL, '2019-08-24 22:10:13', NULL, '0000-00-00 00:00:00', NULL, NULL),
(5, 4, 4, 'UNREAD', 'UNDELETED', NULL, '2019-08-24 22:10:13', NULL, '0000-00-00 00:00:00', NULL, NULL),
(6, 5, 3, 'UNREAD', 'UNDELETED', NULL, '2019-08-24 22:10:57', NULL, '0000-00-00 00:00:00', NULL, NULL),
(7, 6, 2, 'UNREAD', 'UNDELETED', NULL, '2019-08-24 22:11:17', NULL, '0000-00-00 00:00:00', NULL, NULL),
(8, 6, 3, 'UNREAD', 'UNDELETED', NULL, '2019-08-24 22:11:17', NULL, '0000-00-00 00:00:00', NULL, NULL),
(9, 7, 5, 'UNREAD', 'UNDELETED', NULL, '2019-08-28 18:46:25', NULL, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comm_masters`
--

CREATE TABLE IF NOT EXISTS `comm_masters` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comm_template_id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Email,2=Notification',
  `tag` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `name` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `from_user_id` bigint(20) DEFAULT NULL COMMENT 'From UserId',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `comm_masters`
--

INSERT INTO `comm_masters` (`id`, `comm_template_id`, `org_id`, `type`, `tag`, `name`, `subject`, `body`, `from_user_id`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 4, 1, 1, 'welcome', NULL, 'Welcome Email Sujbect', 'Welcome Email Body', 1, NULL, '2019-08-24 22:07:35', NULL, '2019-08-24 22:07:35', NULL, NULL),
(2, 4, 1, 1, 'welcome', NULL, 'Welcome Email Sujbect', 'Welcome Email Body', 1, NULL, '2019-08-24 22:09:03', NULL, '2019-08-24 22:09:03', NULL, NULL),
(3, 4, 1, 1, 'welcome', NULL, 'Welcome Email Sujbect', 'Welcome Email Body', 1, NULL, '2019-08-24 22:09:22', NULL, '2019-08-24 22:09:22', NULL, NULL),
(4, 5, 1, 2, 'household_added', NULL, 'household_added subj', 'household_added body', 1, NULL, '2019-08-24 22:10:13', NULL, '2019-08-24 22:10:13', NULL, NULL),
(5, 5, 1, 2, 'household_added', NULL, 'household_added subj', 'household_added body', 1, NULL, '2019-08-24 22:10:57', NULL, '2019-08-24 22:10:57', NULL, NULL),
(6, 5, 1, 2, 'household_added', NULL, 'household_added subj', 'household_added body', 1, NULL, '2019-08-24 22:11:17', NULL, '2019-08-24 22:11:17', NULL, NULL),
(7, 4, 1, 1, 'welcome', NULL, 'Welcome Email Sujbect', '<p>Welcome Email Body</p>', 1, NULL, '2019-08-28 18:46:25', NULL, '2019-08-28 18:46:25', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `comm_templates`
--

INSERT INTO `comm_templates` (`id`, `tag`, `name`, `subject`, `body`, `org_id`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 0, NULL, '2019-08-22 10:31:18', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 0, NULL, '2019-08-22 10:31:18', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 0, NULL, '2019-08-22 10:31:35', NULL, '0000-00-00 00:00:00', NULL, NULL),
(4, 'welcome', 'Welcome Emailasd saddad', 'Welcome Email Sujbect', '<p>Welcome Email Body</p>', 1, NULL, '2019-08-25 03:35:24', NULL, '2019-08-27 21:13:14', NULL, NULL),
(5, 'household_added', 'household_added name dsadasada', 'household_added subj', '<p>household_added body</p>', 1, NULL, '2019-08-25 03:35:24', NULL, '2019-08-27 21:13:21', NULL, NULL),
(6, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 1, NULL, '2019-08-25 03:35:24', NULL, NULL, NULL, NULL);

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
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eventId`, `orgId`, `eventName`, `eventFreq`, `eventDesc`, `eventCreatedDate`, `eventCheckin`, `eventShowTime`, `eventStartCheckin`, `eventEndCheckin`, `eventLocation`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, NULL, 'First Event', 'Daily', 'First Event Descr', '2019-08-25', NULL, NULL, '08:00:00', '10:00:00', 'Daily', '1', '2019-08-24 22:13:50', NULL, '2019-08-24 22:13:50', NULL, NULL),
(2, 1, 'myname', 'Daily', 'myname', '2019-08-29', NULL, '07:00:00', '09:00:00', '11:00:00', 'locaion1', '1', '2019-08-28 18:44:43', '1', '2019-08-28 18:45:30', NULL, NULL),
(3, 1, 'raja', 'Daily', 'raja', '2019-08-29', NULL, '01:00:00', '01:00:00', '01:00:00', 'locaion1', '1', '2019-08-28 18:45:05', '1', '2019-08-28 18:45:41', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `households`
--

INSERT INTO `households` (`id`, `orgId`, `hhPrimaryUserId`, `name`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 2, 'Karthik S K Household', NULL, '2019-08-24 22:10:13', NULL, '2019-08-24 22:10:13', NULL, NULL),
(2, 1, 2, 'Karthik S K Household', NULL, '2019-08-24 22:11:17', NULL, '2019-08-24 22:11:17', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `household_user`
--

INSERT INTO `household_user` (`id`, `household_id`, `user_id`, `isPrimary`, `createdBy`, `updatedBy`, `deletedBy`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 1, 2, 2, NULL, NULL, NULL, '2019-08-25 03:40:57', NULL, NULL),
(6, 1, 4, 1, NULL, NULL, NULL, '2019-08-25 03:40:57', NULL, NULL),
(7, 1, 3, 2, NULL, NULL, NULL, '2019-08-25 03:40:57', NULL, NULL),
(10, 2, 2, 1, NULL, NULL, NULL, '2019-08-25 03:41:27', NULL, NULL),
(11, 2, 3, 2, NULL, NULL, NULL, '2019-08-25 03:41:27', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `master_lookup_data`
--

INSERT INTO `master_lookup_data` (`mldId`, `orgId`, `mldKey`, `mldValue`, `mldType`, `mldOption`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 0, 'school_name', 'High School', 'A', 1, NULL, '2019-07-10 23:21:10', NULL, '2019-07-16 23:09:52', NULL, NULL),
(2, 0, 'school_name', 'Middle School', 'A', 1, NULL, '2019-07-10 23:30:06', NULL, '2019-07-16 23:09:52', NULL, NULL),
(3, 0, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-07-10 23:30:07', NULL, '2019-07-16 23:09:52', NULL, NULL),
(4, 0, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-07-10 23:30:07', NULL, '2019-07-16 23:09:52', NULL, NULL),
(5, 0, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-07-10 23:30:07', NULL, '2019-07-16 23:09:52', NULL, NULL),
(6, 0, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-07-10 23:30:07', NULL, '2019-07-16 23:09:52', NULL, NULL),
(7, 0, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-07-10 23:30:07', NULL, '2019-07-16 23:09:52', NULL, NULL),
(8, 0, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-07-10 23:30:07', NULL, '2019-07-16 23:09:52', NULL, NULL),
(9, 0, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-07-10 23:30:07', NULL, '2019-07-16 23:09:52', NULL, NULL),
(10, 0, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-07-10 23:30:07', NULL, '2019-07-16 23:09:52', NULL, NULL),
(11, 0, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-07-10 23:30:08', NULL, '2019-07-16 23:09:52', NULL, NULL),
(12, 0, 'name_suffix', 'II', 'A', 1, NULL, '2019-07-10 23:30:08', NULL, '2019-07-16 23:09:52', NULL, NULL),
(13, 0, 'name_suffix', 'III', 'A', 1, NULL, '2019-07-10 23:30:08', NULL, '2019-07-16 23:09:52', NULL, NULL),
(14, 0, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-07-10 23:30:08', NULL, '2019-07-16 23:09:52', NULL, NULL),
(15, 0, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-07-10 23:30:08', NULL, '2019-07-16 23:09:52', NULL, NULL),
(16, 0, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-07-10 23:30:08', NULL, '2019-07-16 23:09:52', NULL, NULL),
(17, 0, 'marital_status', 'Single', 'A', 1, NULL, '2019-07-10 23:30:09', NULL, '2019-07-16 23:09:52', NULL, NULL),
(18, 0, 'marital_status', 'Married', 'A', 4, NULL, '2019-07-10 23:30:09', NULL, '2019-07-16 23:09:52', NULL, NULL),
(19, 0, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-07-10 23:30:09', NULL, '2019-07-16 23:09:52', NULL, NULL),
(20, 0, 'membership_status', 'Member', 'A', 1, NULL, '2019-07-10 23:30:09', NULL, '2019-07-16 23:09:52', NULL, NULL),
(21, 0, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-07-10 23:30:09', NULL, '2019-07-16 23:09:52', NULL, NULL),
(22, 0, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-07-10 23:30:09', NULL, '2019-07-16 23:09:52', NULL, NULL),
(23, 0, 'membership_status', 'Participant', 'A', 1, NULL, '2019-07-10 23:30:09', NULL, '2019-07-16 23:09:52', NULL, NULL),
(24, 0, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-07-10 23:30:09', NULL, '2019-07-16 23:09:52', NULL, NULL),
(25, 0, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-07-11 00:13:30', NULL, '2019-07-16 23:09:52', NULL, NULL),
(26, 0, 'grade_name', 'K', 'A', 4, NULL, '2019-07-11 00:13:30', NULL, '2019-07-16 23:09:52', NULL, NULL),
(27, 0, 'grade_name', '1st', 'A', 4, NULL, '2019-07-11 00:13:30', NULL, '2019-07-16 23:09:52', NULL, NULL),
(28, 0, 'grade_name', '2nd', 'A', 1, NULL, '2019-07-11 00:13:30', NULL, '2019-07-16 23:09:52', NULL, NULL),
(29, 0, 'grade_name', '3rd', 'A', 4, NULL, '2019-07-11 00:13:30', NULL, '2019-07-16 23:09:52', NULL, NULL),
(30, 1, 'school_name', 'High School', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(31, 1, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(32, 1, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(33, 1, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(34, 1, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(35, 1, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(36, 1, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(37, 1, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(38, 1, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(39, 1, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(40, 1, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(41, 1, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(42, 1, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(43, 1, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(44, 1, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(45, 1, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(46, 1, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(47, 1, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(48, 1, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(49, 1, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(50, 1, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(51, 1, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(52, 1, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(53, 1, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(54, 1, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(55, 1, 'grade_name', 'K', 'A', 4, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(56, 1, 'grade_name', '1st', 'A', 4, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(57, 1, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL),
(58, 1, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-24 22:05:24', NULL, '2019-08-24 22:05:24', NULL, NULL);

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
(115, 'App\\User', 1),
(116, 'App\\User', 2),
(116, 'App\\User', 3),
(116, 'App\\User', 4),
(116, 'App\\User', 5);

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
('06b92c66f47f1b09e8cb6e1ee32778a80108bdb62e83718771fd3b2163b707491784dba739514418', 1, 1, 'dollar', '[]', 0, '2019-08-28 18:43:18', '2019-08-28 18:43:18', '2020-08-29 00:13:18'),
('19272c2e52d3f4bf9c452415fef1cc3e2a23e3ddf2bb36eb4955393b6b5399abe289bec13b157272', 1, 1, 'dollar', '[]', 0, '2019-08-24 20:14:52', '2019-08-24 20:14:52', '2020-08-25 01:44:52'),
('7c30cbce0a6743331c674d86f532f65cafe3ce5fa871de7483d2eaccf55c9a42c14bb0674909b1d3', 1, 1, 'dollar', '[]', 0, '2019-08-25 07:30:40', '2019-08-25 07:30:40', '2020-08-25 13:00:40'),
('8407ae545b6bf07952355ec3447c6a80208c6e8b09a7637f7bf5f4ddb6c9dcb99ce3d1fa4050098a', 1, 1, 'dollar', '[]', 0, '2019-08-24 22:05:54', '2019-08-24 22:05:54', '2020-08-25 03:35:54'),
('a1723d73c4fff1baa97084ae43e45452e7397e24b863cda5950b203ba50101d201f5d4c7dabc195c', 1, 1, 'dollar', '[]', 0, '2019-08-27 21:12:17', '2019-08-27 21:12:17', '2020-08-28 02:42:17'),
('a7289273947fb30912e96af73341d2a4df9f451979d18dbdaa40962783ed62ff7190eff5938b4c90', 1, 1, 'dollar', '[]', 0, '2019-08-31 04:16:35', '2019-08-31 04:16:35', '2020-08-31 09:46:35');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`orgId`, `orgName`, `orgAddress`, `orgAptUnitBox`, `orgCity`, `orgState`, `orgPincode`, `orgPhone`, `orgLogo`, `orgTimeZone`, `orgTimeCountry`, `orgTimeFormat`, `orgDateFormat`, `orgCurrency`, `orgEmail`, `orgWebsite`, `orgTaxIdNo`, `orgDomain`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 'stpaul', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'America/La_Paz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'stpaul', NULL, '2019-08-24 22:05:24', NULL, '2019-08-25 13:00:33', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `orgId`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 0, 'Nextgen Checkin', 'web', '2019-05-05 13:51:47', '2019-05-05 13:51:47'),
(2, 0, 'Member Directory', 'web', '2019-05-05 13:51:47', '2019-05-05 13:51:47'),
(3, 0, 'Scheduling', 'web', '2019-05-05 13:51:47', '2019-05-05 14:43:48'),
(4, 0, 'Event management', 'web', '2019-05-05 13:51:47', '2019-05-05 13:51:47'),
(5, 0, 'Small Group', 'web', '2019-05-05 14:30:09', '2019-05-05 14:38:33'),
(6, 0, 'Accounting', 'web', '2019-05-05 14:30:21', '2019-05-05 14:38:37'),
(7, 1, 'Nextgen Checkin', 'web', NULL, NULL),
(8, 1, 'Member Directory', 'web', NULL, NULL),
(9, 1, 'Scheduling', 'web', NULL, NULL),
(10, 1, 'Event management', 'web', NULL, NULL),
(11, 1, 'Small Group', 'web', NULL, NULL),
(12, 1, 'Accounting', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE IF NOT EXISTS `resources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `approval_group` text,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=126 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `orgId`, `name`, `guard_name`, `role_tag`, `created_at`, `updated_at`) VALUES
(1, 0, 'Super Adminin', 'web', 'superadmin', '2019-05-05 08:22:07', '2019-05-05 08:22:07'),
(2, 0, 'Adminstrator', 'web', 'admin', '2019-05-05 08:22:08', '2019-08-25 02:57:41'),
(3, 0, 'Member', 'web', 'member', '2019-05-05 09:20:10', '2019-05-05 09:20:10'),
(4, 0, 'Volunteer', 'web', 'volunteer', '2019-07-26 04:48:18', '2019-07-26 04:48:18'),
(107, 0, 'Pastor', 'pastor', 'pastor', '2019-08-25 02:59:13', NULL),
(108, 0, 'First Time Guest', 'First Time Guest\r\n', 'firsttimeguest', '2019-08-25 02:59:13', NULL),
(109, 0, 'Inactive Member', 'Inactive Member', 'InactiveMember', '2019-08-25 02:59:52', NULL),
(110, 0, 'Checkin Volunteer', 'Checkin Volunteer', 'CheckinVolunteer', '2019-08-25 02:59:52', NULL),
(111, 0, 'Event Organizer', 'Event Organizer', 'EventOrganizer', '2019-08-25 03:00:12', NULL),
(112, 0, 'Production Manager', 'Production Manager', 'ProductionManager', '2019-08-25 03:00:12', NULL),
(113, 0, 'Accounts Admin', 'Accounts Admin', 'AccountsAdmin', '2019-08-25 03:00:29', NULL),
(114, 0, 'Visitor', 'Visitor', 'Visitor', '2019-08-25 03:00:29', NULL),
(115, 1, 'Adminstrator', 'web', 'admin', '2019-08-25 03:35:24', NULL),
(116, 1, 'Member', 'web', 'member', '2019-08-25 03:35:24', NULL),
(117, 1, 'Volunteer', 'web', 'volunteer', '2019-08-25 03:35:24', NULL),
(118, 1, 'Pastor', 'pastor', 'pastor', '2019-08-25 03:35:24', NULL),
(119, 1, 'First Time Guest', 'First Time Guest\r\n', 'firsttimeguest', '2019-08-25 03:35:24', NULL),
(120, 1, 'Inactive Member', 'Inactive Member', 'InactiveMember', '2019-08-25 03:35:24', NULL),
(121, 1, 'Checkin Volunteer', 'Checkin Volunteer', 'CheckinVolunteer', '2019-08-25 03:35:24', NULL),
(122, 1, 'Event Organizer', 'Event Organizer', 'EventOrganizer', '2019-08-25 03:35:24', NULL),
(123, 1, 'Production Manager', 'Production Manager', 'ProductionManager', '2019-08-25 03:35:24', NULL),
(124, 1, 'Accounts Admin', 'Accounts Admin', 'AccountsAdmin', '2019-08-25 03:35:24', NULL),
(125, 1, 'Visitor', 'Visitor', 'Visitor', '2019-08-25 03:35:24', NULL);

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
(7, 115),
(8, 115),
(9, 115),
(10, 115),
(11, 115),
(12, 115),
(7, 116),
(7, 117),
(7, 118),
(7, 119),
(7, 120),
(7, 121),
(7, 122),
(7, 123),
(7, 124),
(7, 125);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(255) DEFAULT NULL,
  `room_owner` varchar(255) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `room_desc` text,
  `room_image` text,
  `group_id` bigint(20) DEFAULT NULL,
  `building_number` varchar(150) DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  `deletedBy` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `orgId`, `householdName`, `personal_id`, `name_prefix`, `given_name`, `first_name`, `last_name`, `middle_name`, `nick_name`, `full_name`, `user_full_name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `referal_code`, `name_suffix`, `profile_pic`, `dob`, `doa`, `school_name`, `grade_id`, `life_stage`, `mobile_no`, `home_phone_no`, `gender`, `social_profile`, `marital_status`, `address`, `medical_note`, `congregration_status`, `created_at`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'sathish kumar''s household', '0000000001', NULL, NULL, 'sathish kumar', NULL, NULL, NULL, 'sathish kumar', NULL, 'stpaul@gmail.com', NULL, NULL, '$2y$10$yIJFLrVJdpFyIvp.lM3ufO9YdaAuEmaKDzHRour.r9ldURmwm2ooO', NULL, 'sathckyy', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-24 22:05:24', '2019-08-24 22:05:24', NULL, NULL),
(2, 1, 'Karthik''s household', '0000000002', '32', 'given name', 'Karthik', 'K', 'S', 'nick name', 'Karthik S K', NULL, 'karth@g.com', NULL, NULL, '$2y$10$uNBHqnW.J7R2L5kR3bmgq.AbB9252WbKWS.RXcq/mYo75UOROEGee', NULL, 'Kartlhdt', '41', NULL, '1988-01-03', NULL, '30', 56, 'Adult', NULL, NULL, 'Male', NULL, '47', '1st main///apartment///mang///karn///651000', NULL, NULL, '2019-08-24 22:07:35', '2019-08-24 22:07:35', NULL, NULL),
(3, 1, 'suresh''s household', '0000000003', '36', NULL, 'suresh', 'k', 'j', NULL, 'suresh j k', NULL, 'suresh@gmail.com', NULL, NULL, '$2y$10$elFZ/Ac/xGLRPupulpU2VuuHSITKEvJUxCK4Jzwq9Btcl6xPPKjF6', NULL, 'suremohq', '41', NULL, NULL, NULL, '30', 56, 'Adult', NULL, NULL, 'Male', NULL, '47', '////////////', NULL, NULL, '2019-08-24 22:09:02', '2019-08-24 22:09:02', NULL, NULL),
(4, 1, 'paul raj''s household', '0000000004', '36', NULL, 'paul raj', 'k', 'j', NULL, 'paul raj j k', NULL, 'paul@g.com', NULL, NULL, '$2y$10$CvYJ27VaVklGP3Nv/AYMKOKtjXEh2GOKjbDKMLkd9jl77DohsPH5W', NULL, 'paul2emp', '41', NULL, NULL, NULL, '30', 56, 'Adult', NULL, NULL, 'Male', NULL, '47', '////////////', NULL, NULL, '2019-08-24 22:09:22', '2019-08-24 22:09:22', NULL, NULL),
(5, 1, 'Child''s household', '0000000005', '36', NULL, 'Child', NULL, 'd', NULL, 'Child d', NULL, 'dec@gmail.com', NULL, NULL, '$2y$10$DFljO1HxHsb43.c7p2.BsuiNF6xohug1tDPiEpkpPkF2FUDfJwFya', NULL, 'Chilquri', '41', 's:316:"{"uploaded_path":"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/profile\\/","download_path":"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/profile\\/","uploaded_file_name":"1567037895.png","original_filename":"1567037895.png","upload_file_extension":"png","file_size":0}";', NULL, NULL, '30', 56, 'Child', NULL, NULL, 'Male', NULL, '47', '////////////', NULL, NULL, '2019-08-28 18:46:25', '2019-08-28 18:48:15', NULL, NULL);

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
