-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 18, 2019 at 08:06 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `comm_details`
--

INSERT INTO `comm_details` (`id`, `comm_master_id`, `to_user_id`, `read_status`, `delete_status`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 2, 'UNREAD', 'UNDELETED', NULL, '2019-09-05 20:18:05', NULL, '0000-00-00 00:00:00', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `comm_masters`
--

INSERT INTO `comm_masters` (`id`, `comm_template_id`, `org_id`, `type`, `tag`, `name`, `subject`, `body`, `from_user_id`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 4, 1, 1, 'welcome', NULL, 'Welcome Email Sujbect', 'Welcome Email Body', 1, NULL, '2019-09-05 20:18:05', NULL, '2019-09-05 20:18:05', NULL, NULL);

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
(1, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 0, NULL, '2019-08-22 05:01:18', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 0, NULL, '2019-08-22 05:01:18', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 0, NULL, '2019-08-22 05:01:35', NULL, '0000-00-00 00:00:00', NULL, NULL),
(4, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 1, NULL, '2019-09-02 14:15:03', NULL, NULL, NULL, NULL),
(5, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 1, NULL, '2019-09-02 14:15:03', NULL, NULL, NULL, NULL),
(6, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 1, NULL, '2019-09-02 14:15:03', NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eventId`, `orgId`, `eventName`, `eventFreq`, `eventDesc`, `eventCreatedDate`, `eventCheckin`, `eventShowTime`, `eventStartCheckin`, `eventEndCheckin`, `eventLocation`, `eventRoom`, `eventResource`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'Fiest', 'Daily', 'asdad asdsasdas adad', '2019-09-07', NULL, '08:00:00', '14:00:00', '15:00:00', 'locaion1', NULL, NULL, '1', '2019-09-05 20:17:23', NULL, '2019-09-05 20:17:23', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `orgId`, `title`, `description`, `fields`, `profile_fields`, `general_fields`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '', '', 'a:0:{}', 'a:0:{}', NULL, 1, '2019-09-06 22:57:46', '2019-09-06 22:59:51'),
(2, 1, '', '', 'a:0:{}', 'a:0:{}', NULL, 1, '2019-09-06 22:58:38', '2019-09-06 22:58:38'),
(3, 1, 'Tour Request Form', 'St Aloysius Mangalore', 'a:4:{i:0;a:4:{s:5:"title";s:5:"Phone";s:4:"type";s:1:"1";s:3:"tag";s:9:"mobile_no";s:10:"isRequired";b:0;}i:1;a:4:{s:5:"title";s:7:"Address";s:4:"type";s:1:"1";s:3:"tag";s:7:"address";s:10:"isRequired";b:0;}i:2;a:7:{s:10:"fieldTitle";s:9:"Paragraph";s:9:"inputType";s:8:"textarea";s:4:"type";s:1:"2";s:5:"label";s:15:"Your Experience";s:11:"placeholder";s:21:"Your Experience Place";s:10:"isRequired";b:0;s:7:"options";a:0:{}}i:3;a:7:{s:10:"fieldTitle";s:4:"Text";s:9:"inputType";s:4:"text";s:4:"type";s:1:"2";s:5:"label";s:17:"Your Fathers Name";s:11:"placeholder";s:23:"Your Fathers Name Place";s:10:"isRequired";b:1;s:7:"options";a:0:{}}}', 'a:2:{i:0;s:5:"Phone";i:1;s:7:"Address";}', NULL, 1, '2019-09-06 23:01:58', '2019-09-06 23:01:58'),
(4, 1, 'Contact', 'Contact desc', 'a:3:{i:0;a:4:{s:5:"title";s:8:"Birthday";s:4:"type";s:1:"1";s:3:"tag";s:3:"dob";s:10:"isRequired";b:0;}i:1;a:7:{s:10:"fieldTitle";s:4:"Text";s:9:"inputType";s:4:"text";s:4:"type";s:1:"2";s:5:"label";s:8:"Your age";s:11:"placeholder";s:8:"Your age";s:10:"isRequired";b:1;s:7:"options";a:0:{}}i:2;a:4:{s:5:"title";s:5:"Phone";s:4:"type";s:1:"1";s:3:"tag";s:9:"mobile_no";s:10:"isRequired";b:0;}}', 'a:2:{i:0;s:8:"Birthday";i:1;s:5:"Phone";}', NULL, 1, '2019-09-08 19:28:05', '2019-09-08 19:28:05'),
(5, 1, 'New DB FOrm', 'New DB FOrm desc', 'a:2:{i:0;a:4:{s:5:"title";s:5:"Phone";s:4:"type";s:1:"1";s:3:"tag";s:9:"mobile_no";s:10:"isRequired";b:1;}i:1;a:7:{s:10:"fieldTitle";s:4:"Text";s:9:"inputType";s:4:"text";s:4:"type";s:1:"2";s:5:"label";s:3:"Age";s:11:"placeholder";s:9:"Age Place";s:10:"isRequired";b:0;s:7:"options";a:0:{}}}', 'a:1:{i:0;s:5:"Phone";}', 'a:1:{i:0;s:3:"Age";}', 1, '2019-09-09 08:57:03', '2019-09-09 08:57:03'),
(6, 1, 'New Form', 'New Form', 'a:2:{i:0;a:4:{s:5:"title";s:5:"Phone";s:4:"type";s:1:"1";s:3:"tag";s:9:"mobile_no";s:10:"isRequired";b:0;}i:1;a:7:{s:10:"fieldTitle";s:4:"Text";s:9:"inputType";s:4:"text";s:4:"type";s:1:"2";s:5:"label";s:3:"Age";s:11:"placeholder";s:10:"Age Place ";s:10:"isRequired";b:0;s:7:"options";a:0:{}}}', 'a:1:{i:0;s:5:"Phone";}', 'a:1:{i:0;s:3:"Age";}', 1, '2019-09-10 21:44:52', '2019-09-10 21:44:52');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `form_submissions`
--

INSERT INTO `form_submissions` (`id`, `orgId`, `form_id`, `profile_fields`, `general_fields`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'a:5:{s:7:"Mail Id";s:25:"sathish@cobrasoftwares.in";s:8:"Birthday";s:10:"2019-09-11";s:5:"Phone";s:0:"";s:4:"Name";s:11:"Sathish K S";s:7:"Address";s:0:"";}', 'a:1:{s:8:"Your age";s:2:"21";}', '2019-09-08 19:45:06', '2019-09-08 19:45:06'),
(2, 1, 4, 'a:5:{s:7:"Mail Id";s:25:"sathish@cobrasoftwares.in";s:8:"Birthday";s:10:"2019-09-11";s:5:"Phone";s:0:"";s:4:"Name";s:11:"Sathish K S";s:7:"Address";s:0:"";}', 'a:1:{s:8:"Your age";s:2:"21";}', '2019-09-08 19:45:06', '2019-09-08 19:45:06'),
(3, 1, 3, 'a:4:{s:7:"Mail Id";s:14:"asasd@asda.com";s:5:"Phone";s:0:"";s:4:"Name";s:13:"1234 1223 asd";s:7:"Address";s:0:"";}', 'a:2:{s:15:"Your Experience";s:0:"";s:17:"Your Fathers Name";s:7:"asdadas";}', '2019-09-09 20:39:04', '2019-09-09 20:39:04'),
(4, 1, 3, 'a:4:{s:7:"Mail Id";s:14:"asasd@asda.com";s:5:"Phone";s:0:"";s:4:"Name";s:13:"1234 1223 asd";s:7:"Address";s:0:"";}', 'a:2:{s:15:"Your Experience";s:0:"";s:17:"Your Fathers Name";s:7:"asdadas";}', '2019-09-09 20:39:04', '2019-09-09 20:39:04'),
(5, 1, 3, 'a:4:{s:7:"Mail Id";s:14:"asasd@asda.com";s:5:"Phone";s:0:"";s:4:"Name";s:13:"1234 1223 asd";s:7:"Address";s:0:"";}', 'a:2:{s:15:"Your Experience";s:0:"";s:17:"Your Fathers Name";s:7:"asdadas";}', '2019-09-09 20:39:04', '2019-09-09 20:39:04'),
(6, 1, 3, 'a:4:{s:7:"Mail Id";s:14:"asasd@asda.com";s:5:"Phone";s:0:"";s:4:"Name";s:13:"1234 1223 asd";s:7:"Address";s:0:"";}', 'a:2:{s:15:"Your Experience";s:0:"";s:17:"Your Fathers Name";s:7:"asdadas";}', '2019-09-09 20:39:04', '2019-09-09 20:39:04'),
(7, 1, 6, 'a:4:{s:7:"Mail Id";s:25:"sathish@cobrasoftwares.in";s:5:"Phone";s:8:"12345678";s:4:"Name";s:15:"Sathish K Kumar";s:7:"Address";s:0:"";}', 'a:1:{s:3:"Age";s:2:"22";}', '2019-09-10 21:45:59', '2019-09-10 21:45:59');

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
  `event_remind_before` int(5) NOT NULL,
  `enroll_status` tinyint(1) NOT NULL DEFAULT '1',
  `enroll_msg` varchar(255) NOT NULL,
  `leader_visibility_publicly` tinyint(1) NOT NULL DEFAULT '1',
  `is_event_public` tinyint(1) NOT NULL DEFAULT '1',
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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
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
  `mobile_no` int(15) DEFAULT NULL,
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
(1, 1, 'Small groups', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 1, 1, NULL, 1, 1, NULL, 1, NULL, '2019-09-15 08:19:10', NULL, '2019-09-15 08:19:10', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

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
(62, 0, 'pastor_board', 'Home Care', 'A', 1, NULL, '2019-09-11 15:05:01', NULL, '0000-00-00 00:00:00', NULL, NULL);

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
(13, 'App\\User', 1),
(14, 'App\\User', 2);

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
('0d61ed80db33fe1aa5e153100ae879bb44c12644aad237106c470b656356dd5c6779d6c8b9f894a8', 1, 1, 'dollar', '[]', 0, '2019-09-05 20:15:25', '2019-09-05 20:15:25', '2020-09-06 01:45:25'),
('0fd5c8dc43845d73972b409c3730b1c32133490ebf3be9485b4ba89aa6f9b5fcaa37438f2274efa0', 1, 1, 'dollar', '[]', 0, '2019-09-02 08:45:09', '2019-09-02 08:45:09', '2020-09-02 14:15:09'),
('158263b6d99cbb33665d910d839f1d57ce572a49a49efba04c6442c289828af8b7396c0910c88a79', 1, 1, 'dollar', '[]', 0, '2019-09-10 21:40:53', '2019-09-10 21:40:53', '2020-09-11 03:10:53'),
('16339df9f48f5305d4efca4a4a013ea82dfaf0e1e669c48744b0918fe9049da5e09835e4ae5ba60e', 1, 1, 'dollar', '[]', 0, '2019-09-12 18:39:41', '2019-09-12 18:39:41', '2020-09-13 00:09:41'),
('19272c2e52d3f4bf9c452415fef1cc3e2a23e3ddf2bb36eb4955393b6b5399abe289bec13b157272', 1, 1, 'dollar', '[]', 0, '2019-08-24 20:14:52', '2019-08-24 20:14:52', '2020-08-25 01:44:52'),
('2d29e100b686baa8d92c5c7f10e3aa5b6cc5673dc59c8f052bcfb512c9d1b7b9c3e4751f2f9924da', 9, 1, 'dollar', '[]', 0, '2019-09-02 04:08:44', '2019-09-02 04:08:44', '2020-09-02 09:38:44'),
('3456c9c15b71faa05813f8246f2f64979b4f875d22cd34abcfb66c509cca7fd477050272d351ab0f', 1, 1, 'dollar', '[]', 0, '2019-09-11 09:51:23', '2019-09-11 09:51:23', '2020-09-11 15:21:23'),
('402ab601017494b14bc09382e0965ecd1e5e5e351aae8cd067ffb41f057e7f5232c7a9bb37348bc0', 8, 1, 'dollar', '[]', 0, '2019-09-02 04:07:33', '2019-09-02 04:07:33', '2020-09-02 09:37:33'),
('455877b653904f9c6048523a34715a018cef4d976c791e5f5cab7dfa5ce0409820ac15e772a3256d', 1, 1, 'dollar', '[]', 0, '2019-09-01 23:53:49', '2019-09-01 23:53:49', '2020-09-02 05:23:49'),
('484c2f0d05df45e1762ccde22b02537e3c8f71098ab74f00c6ae2dda9e1a4da5057f56304d748509', 1, 1, 'dollar', '[]', 0, '2019-09-12 08:30:56', '2019-09-12 08:30:56', '2020-09-12 14:00:56'),
('685dbfec990ed843e61c63b17448880dcb4c30d003612ed9122435006d78105d69a0b6ffd1d19ca6', 1, 1, 'dollar', '[]', 0, '2019-09-01 22:52:04', '2019-09-01 22:52:04', '2020-09-02 04:22:04'),
('714c6e61bb08aa30d5d649b146e525661a1f0cce949c8e17a4f3e98d6c4438869e8b042ab7062a8b', 1, 1, 'dollar', '[]', 0, '2019-09-09 20:13:57', '2019-09-09 20:13:57', '2020-09-10 01:43:57'),
('75fb965d62465de738b5697e8ec06c1f528a252799656ae00ccf01e4de863c93d5452cb03ad18ce4', 1, 1, 'dollar', '[]', 0, '2019-09-11 19:28:39', '2019-09-11 19:28:39', '2020-09-12 00:58:39'),
('76b825058ef909da602b57ce9889be0a80a6fddc41e7076307f9326082476240a002e5c2485180e9', 1, 1, 'dollar', '[]', 0, '2019-09-09 08:51:06', '2019-09-09 08:51:06', '2020-09-09 14:21:06'),
('7a64927dc3d31e440440f694937044c0ae4c529e8cfb58925066fe36c142d7b36c26fc2e372e8145', 1, 1, 'dollar', '[]', 0, '2019-09-03 10:56:57', '2019-09-03 10:56:57', '2020-09-03 16:26:57'),
('7c30cbce0a6743331c674d86f532f65cafe3ce5fa871de7483d2eaccf55c9a42c14bb0674909b1d3', 1, 1, 'dollar', '[]', 0, '2019-08-25 07:30:40', '2019-08-25 07:30:40', '2020-08-25 13:00:40'),
('7e1d70bf3f288eb4c2f815d57e93290abd3f41fdda886045c1a0c4446e53008ffb1d1b0a263ddafb', 1, 1, 'dollar', '[]', 0, '2019-09-01 23:54:46', '2019-09-01 23:54:46', '2020-09-02 05:24:46'),
('8407ae545b6bf07952355ec3447c6a80208c6e8b09a7637f7bf5f4ddb6c9dcb99ce3d1fa4050098a', 1, 1, 'dollar', '[]', 0, '2019-08-24 22:05:54', '2019-08-24 22:05:54', '2020-08-25 03:35:54'),
('8ec2222cbf759e82025013ff99f3357db0ee7c087e8cfadcfa4cffb684c0f3eb4b47491b8331722f', 1, 1, 'dollar', '[]', 0, '2019-09-15 08:03:24', '2019-09-15 08:03:24', '2020-09-15 13:33:24'),
('94bf3108327fb1a09f2193a0854c5294392373407c6290d0c9077d36fa367452c87795cee0b2d64f', 1, 1, 'dollar', '[]', 0, '2019-09-02 01:59:19', '2019-09-02 01:59:19', '2020-09-02 07:29:19'),
('a1723d73c4fff1baa97084ae43e45452e7397e24b863cda5950b203ba50101d201f5d4c7dabc195c', 1, 1, 'dollar', '[]', 0, '2019-08-27 21:12:17', '2019-08-27 21:12:17', '2020-08-28 02:42:17'),
('a7289273947fb30912e96af73341d2a4df9f451979d18dbdaa40962783ed62ff7190eff5938b4c90', 1, 1, 'dollar', '[]', 0, '2019-08-31 04:16:35', '2019-08-31 04:16:35', '2020-08-31 09:46:35'),
('a8a5bbdbf236edebe4b3ac0a1c4bae9fe336830cf822843729123a0d05b9ac6b29cfa4f9198dce21', 1, 1, 'dollar', '[]', 0, '2019-09-17 19:33:41', '2019-09-17 19:33:41', '2020-09-18 01:03:41'),
('b5dbec6e13b7712c33b3443d43f2d12bfeea4b550b25f00fc7a5523c92a0790c01cd1ca4bbc25c28', 1, 1, 'dollar', '[]', 0, '2019-09-07 05:42:28', '2019-09-07 05:42:28', '2020-09-07 11:12:28'),
('baefa5b4c70698404089905b8a498da903ef868d0708a4f5c62ab27878725eb6e1798fb5d8f0ae1f', 6, 1, 'dollar', '[]', 0, '2019-09-01 19:57:35', '2019-09-01 19:57:35', '2020-09-02 01:27:35'),
('bb86c418163c8e10f073be8612f60e48c490f37205ef83ff05ca6b84c36d2347c09088cd5d231691', 1, 1, 'dollar', '[]', 0, '2019-09-06 22:57:11', '2019-09-06 22:57:11', '2020-09-07 04:27:11'),
('f565875e7d6449c2a9dd4feb381b254b8217ea04fc94c1ce362ead76e378124ecf97ff0efb3e0234', 1, 1, 'dollar', '[]', 0, '2019-09-08 19:26:11', '2019-09-08 19:26:11', '2020-09-09 00:56:11');

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
(1, 'stpaul church', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pacific/Samoa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'stpaul', NULL, '2019-09-02 08:45:03', NULL, '2019-09-02 08:45:03', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `pastor_board`
--

INSERT INTO `pastor_board` (`id`, `orgId`, `parent_type`, `p_title`, `p_description`, `classified_type`, `p_category`, `posted_date`, `contact_name`, `contact_email`, `contact_phone`, `cost`, `image_path`, `location_id`, `status`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 1, 'First', 'First', 1, NULL, NULL, 'Sathish', 'sat@asda.com', '918181', NULL, 's:328:"{"uploaded_path":"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/","download_path":"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/","uploaded_file_name":"ambed_1568554445.png","original_filename":"ambed_1568554445.png","upload_file_extension":"png","file_size":0}";', NULL, 1, 1, '2019-09-15 08:04:05', NULL, '2019-09-15 13:34:05', NULL, NULL),
(2, 1, 2, 'Sec', 'Sec desc', 1, NULL, NULL, 'Sathish1', 'sat@as2da.com', '9181811', NULL, 's:334:"{"uploaded_path":"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/2\\/","download_path":"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/2\\/","uploaded_file_name":"amerfort_1568554490.jpg","original_filename":"amerfort_1568554490.jpg","upload_file_extension":"jpg","file_size":0}";', NULL, 1, 1, '2019-09-15 08:04:50', NULL, '2019-09-15 13:34:50', NULL, NULL),
(3, 1, 3, 'Third', 'Third desc', 1, 59, NULL, 'Sathish12', 'sat@as2aadda.com', '918181222', '222', 's:344:"{"uploaded_path":"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/3\\/","download_path":"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/3\\/","uploaded_file_name":"cobratechlogo_1568554536.png","original_filename":"cobratechlogo_1568554536.png","upload_file_extension":"png","file_size":0}";', NULL, 1, 1, '2019-09-15 08:05:36', NULL, '2019-09-15 13:35:36', NULL, NULL),
(4, 1, 1, 'Fourth', 'Fourth desc', 1, NULL, NULL, 'Sathish', 'sat@asda.com', '918181', NULL, 's:328:"{"uploaded_path":"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/","download_path":"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/","uploaded_file_name":"ambed_1568554445.png","original_filename":"ambed_1568554445.png","upload_file_extension":"png","file_size":0}";', NULL, 1, 1, '2019-09-15 08:04:05', NULL, '2019-09-15 13:34:05', NULL, NULL),
(5, 1, 1, 'Fifth', 'Fifth', 1, NULL, NULL, 'Sathish', 'sat@asda.com', '918181', NULL, 's:328:"{"uploaded_path":"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/","download_path":"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/","uploaded_file_name":"ambed_1568554445.png","original_filename":"ambed_1568554445.png","upload_file_extension":"png","file_size":0}";', NULL, 1, 1, '2019-09-15 08:04:05', NULL, '2019-09-15 13:34:05', NULL, NULL),
(6, 1, 1, 'Six', 'Six', 1, NULL, NULL, 'Sathish', 'sat@asda.com', '918181', NULL, 's:328:"{"uploaded_path":"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/","download_path":"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/","uploaded_file_name":"ambed_1568554445.png","original_filename":"ambed_1568554445.png","upload_file_extension":"png","file_size":0}";', NULL, 1, 1, '2019-09-15 02:34:05', NULL, '2019-09-15 13:34:05', NULL, NULL),
(7, 1, 2, 'seven', 'seven desc', 1, NULL, NULL, 'Sathish1', 'sat@as2da.com', '9181811', NULL, 's:334:"{"uploaded_path":"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/2\\/","download_path":"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/2\\/","uploaded_file_name":"amerfort_1568554490.jpg","original_filename":"amerfort_1568554490.jpg","upload_file_extension":"jpg","file_size":0}";', NULL, 1, 1, '2019-09-15 02:34:50', NULL, '2019-09-15 13:34:50', NULL, NULL),
(8, 1, 3, 'eight', 'eight desc', 1, 59, NULL, 'Sathish12', 'sat@as2aadda.com', '918181222', '222', 's:344:"{"uploaded_path":"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/3\\/","download_path":"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/3\\/","uploaded_file_name":"cobratechlogo_1568554536.png","original_filename":"cobratechlogo_1568554536.png","upload_file_extension":"png","file_size":0}";', NULL, 1, 1, '2019-09-15 02:35:36', NULL, '2019-09-15 13:35:36', NULL, NULL),
(9, 1, 1, 'nine', 'nine desc', 1, NULL, NULL, 'Sathish', 'sat@asda.com', '918181', NULL, 's:328:"{"uploaded_path":"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/","download_path":"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/","uploaded_file_name":"ambed_1568554445.png","original_filename":"ambed_1568554445.png","upload_file_extension":"png","file_size":0}";', NULL, 1, 1, '2019-09-15 02:34:05', NULL, '2019-09-15 13:34:05', NULL, NULL),
(10, 1, 1, 'tne', 'tne', 1, NULL, NULL, 'Sathish', 'sat@asda.com', '918181', NULL, 's:328:"{"uploaded_path":"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/","download_path":"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/post\\/1\\/","uploaded_file_name":"ambed_1568554445.png","original_filename":"ambed_1568554445.png","upload_file_extension":"png","file_size":0}";', NULL, 1, 1, '2019-09-15 02:34:05', NULL, '2019-09-15 13:34:05', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=24 ;

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
(7, 15),
(7, 16),
(7, 17),
(7, 18),
(7, 19),
(7, 20),
(7, 21),
(7, 22),
(7, 23);

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
-- Table structure for table `scheduling`
--

CREATE TABLE IF NOT EXISTS `scheduling` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `s_title` varchar(255) DEFAULT NULL,
  `s_date` date DEFAULT NULL,
  `s_time` time DEFAULT NULL,
  `eventId` bigint(22) DEFAULT NULL,
  `location_id` bigint(22) DEFAULT NULL,
  `building_block` bigint(22) DEFAULT NULL,
  `type_of_volunteer` bigint(22) DEFAULT NULL,
  `notification_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=None,2=SMS,3=Email,4=Both',
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tag_groups`
--

INSERT INTO `tag_groups` (`id`, `orgId`, `name`, `isPublic`, `isMultiple_select`, `order`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'First Tag', 1, 1, 1, NULL, '2019-09-17 19:43:24', NULL, '2019-09-17 19:43:24', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `orgId`, `householdName`, `personal_id`, `name_prefix`, `given_name`, `first_name`, `last_name`, `middle_name`, `nick_name`, `full_name`, `user_full_name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `referal_code`, `name_suffix`, `profile_pic`, `dob`, `doa`, `school_name`, `grade_id`, `life_stage`, `mobile_no`, `home_phone_no`, `gender`, `social_profile`, `marital_status`, `address`, `medical_note`, `congregration_status`, `created_at`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 'stpaul name''s household', '0000000001', NULL, NULL, 'stpaul name', NULL, NULL, NULL, 'stpaul name', NULL, 'stpaul@gmail.com', NULL, NULL, '$2y$10$o9KLhUJSz5S7tn20C6BhlOGaQq6sV0dfodXFAEhkLBVJPEn1fYSge', NULL, 'stpa6pnp', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-02 08:45:03', '2019-09-02 08:45:03', NULL, NULL),
(2, 1, 'ramesg''s household', '0000000002', '36', NULL, 'ramesg', 'f', 'de', NULL, 'ramesg de f', NULL, 'asd@asda.ocm', NULL, NULL, '$2y$10$K6n4YZZ4veda5Xq0UiONmutMGwzPcE5cWWHqYjwY2sA7gRcUACA5y', NULL, 'rameufk1', '41', NULL, '1970-01-01', '1970-01-01', '30', 56, 'Adult', NULL, NULL, 'Male', NULL, '47', '////////////', NULL, NULL, '2019-09-05 20:18:05', '2019-09-05 20:18:05', NULL, NULL);

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
