-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 22, 2019 at 10:27 PM
-- Server version: 5.7.24
-- PHP Version: 7.0.33-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dallas1`
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
  `chINDateTime` timestamp NULL DEFAULT NULL,
  `chOUTDateTime` timestamp NULL DEFAULT NULL,
  `chKind` int(11) DEFAULT NULL COMMENT 'user type with ''Regular'',''Guest'',''Volunteer''',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 1, 10, 'UNREAD', 'UNDELETED', NULL, '2019-08-21 15:55:20', NULL, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comm_masters`
--

CREATE TABLE `comm_masters` (
  `id` bigint(20) NOT NULL,
  `comm_template_id` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Email,2=Notification',
  `tag` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `from_user_id` bigint(20) DEFAULT NULL COMMENT 'From UserId',
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

INSERT INTO `comm_masters` (`id`, `comm_template_id`, `org_id`, `type`, `tag`, `subject`, `body`, `from_user_id`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 0, 0, 1, NULL, 'Welcome email sub', 'Welcome email body', 1, NULL, '2019-08-21 15:53:31', NULL, '2019-08-21 16:01:59', NULL, NULL);

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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comm_templates`
--

INSERT INTO `comm_templates` (`id`, `tag`, `name`, `subject`, `body`, `org_id`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 'Welcome ', 'Welcome email', 'Welcome email sub', 'Welcome email sub body', 0, NULL, '2019-08-21 15:50:11', NULL, '2019-08-21 16:01:47', NULL, NULL),
(2, 'Welcome ', 'Welcome email', 'Welcome email sub', 'Welcome email sub body', 1, NULL, '2019-08-21 15:50:11', NULL, '2019-08-21 16:01:52', NULL, NULL),
(3, 'Event1', 'Event1 name', 'Event1 sub ~name~\r\n\r\n\r\nThanksn\r\n\r\n~Admin EMail~\r\n~Admin Name~', 'Event1 body', 1, NULL, '2019-08-21 15:50:11', NULL, '2019-08-21 16:04:52', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `eventId` bigint(20) NOT NULL,
  `eventName` varchar(250) DEFAULT NULL,
  `eventFreq` varchar(250) DEFAULT NULL COMMENT 'Daily,Weekly,None',
  `eventCreatedDate` date DEFAULT NULL,
  `eventCheckin` datetime DEFAULT NULL,
  `eventStartCheckin` datetime DEFAULT NULL,
  `eventEndCheckin` datetime DEFAULT NULL,
  `eventLocation` text,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(2, 2, 10, 'My Family', 'lokesh', '2019-08-17 23:00:00', NULL, '2019-08-17 23:00:00', NULL, NULL),
(4, 2, 4, 'Lokesh\'s Family', NULL, '2019-08-18 02:00:12', NULL, '2019-08-18 02:00:41', NULL, NULL),
(5, 1, 3, 'gtgtgt name Household', NULL, '2019-08-21 10:15:24', NULL, '2019-08-21 10:15:24', NULL, NULL),
(6, 1, 3, 'gtgtgt name Household', NULL, '2019-08-21 18:41:42', NULL, '2019-08-21 18:41:42', NULL, NULL);

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
(1, 2, 4, 1, 4, 'Lokesh', NULL, '2019-08-18 01:42:45', '2019-08-18 01:49:32', NULL),
(3, 2, 11, 2, NULL, NULL, NULL, '2019-08-18 01:51:14', NULL, NULL),
(4, 4, 4, 1, NULL, NULL, NULL, '2019-08-18 02:02:10', NULL, NULL),
(9, 5, 3, 2, NULL, NULL, NULL, '2019-08-22 00:11:09', NULL, NULL),
(12, 6, 3, 1, NULL, NULL, NULL, '2019-08-22 00:11:49', NULL, NULL),
(13, 6, 2, 2, NULL, NULL, NULL, '2019-08-22 00:11:49', NULL, NULL);

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
(30, 1, 'school_name', 'High School', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(31, 1, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(32, 1, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(33, 1, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(34, 1, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(35, 1, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(36, 1, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(37, 1, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(38, 1, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(39, 1, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(40, 1, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(41, 1, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(42, 1, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(43, 1, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(44, 1, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(45, 1, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(46, 1, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(47, 1, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(48, 1, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(49, 1, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(50, 1, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(51, 1, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(52, 1, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(53, 1, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(54, 1, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(55, 1, 'grade_name', 'K', 'A', 4, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(56, 1, 'grade_name', '1st', 'A', 4, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(57, 1, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(58, 1, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-01 21:47:29', NULL, '2019-08-01 21:47:29', NULL, NULL),
(61, 2, 'school_name', 'High School', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(62, 2, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(63, 2, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(64, 2, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(65, 2, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(66, 2, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(67, 2, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(68, 2, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(69, 2, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(70, 2, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(71, 2, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(72, 2, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(73, 2, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(74, 2, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(75, 2, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(76, 2, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(77, 2, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(78, 2, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(79, 2, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(80, 2, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(81, 2, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(82, 2, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(83, 2, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(84, 2, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(85, 2, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(86, 2, 'grade_name', 'K', 'A', 4, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(87, 2, 'grade_name', '1st', 'A', 4, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(88, 2, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(89, 2, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(90, 3, 'school_name', 'High School', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(91, 3, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(92, 3, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(93, 3, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(94, 3, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(95, 3, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(96, 3, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(97, 3, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(98, 3, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(99, 3, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(100, 3, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(101, 3, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(102, 3, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(103, 3, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(104, 3, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(105, 3, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(106, 3, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(107, 3, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(108, 3, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(109, 3, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(110, 3, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(111, 3, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(112, 3, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(113, 3, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(114, 3, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(115, 3, 'grade_name', 'K', 'A', 4, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(116, 3, 'grade_name', '1st', 'A', 4, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(117, 3, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(118, 3, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-14 20:23:24', NULL, '2019-08-14 20:23:24', NULL, NULL),
(119, 4, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(120, 4, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(121, 4, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(122, 4, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(123, 4, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(124, 4, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(125, 4, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(126, 4, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(127, 4, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(128, 4, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(129, 4, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(130, 4, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(131, 4, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(132, 4, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(133, 4, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(134, 4, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(135, 4, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(136, 4, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(137, 4, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(138, 4, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(139, 4, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(140, 4, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(141, 4, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(142, 4, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(143, 4, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(144, 4, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(145, 4, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(146, 4, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(147, 4, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(150, 5, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(151, 5, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(152, 5, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(153, 5, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(154, 5, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(155, 5, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(156, 5, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(157, 5, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(158, 5, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(159, 5, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(160, 5, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(161, 5, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(162, 5, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(163, 5, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(164, 5, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(165, 5, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(166, 5, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(167, 5, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(168, 5, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(169, 5, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(170, 5, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(171, 5, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(172, 5, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(173, 5, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(174, 5, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(175, 5, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(176, 5, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(177, 5, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(178, 5, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(181, 8, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(182, 8, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(183, 8, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(184, 8, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(185, 8, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(186, 8, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(187, 8, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(188, 8, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(189, 8, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(190, 8, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(191, 8, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(192, 8, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(193, 8, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(194, 8, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(195, 8, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(196, 8, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(197, 8, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(198, 8, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(199, 8, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(200, 8, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(201, 8, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(202, 8, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(203, 8, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(204, 8, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(205, 8, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(206, 8, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(207, 8, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(208, 8, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(209, 8, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(212, 9, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(213, 9, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(214, 9, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(215, 9, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(216, 9, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(217, 9, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(218, 9, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(219, 9, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(220, 9, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(221, 9, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(222, 9, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(223, 9, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(224, 9, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(225, 9, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(226, 9, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(227, 9, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(228, 9, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(229, 9, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(230, 9, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(231, 9, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(232, 9, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(233, 9, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(234, 9, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(235, 9, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(236, 9, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(237, 9, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(238, 9, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(239, 9, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(240, 9, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(243, 10, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(244, 10, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(245, 10, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(246, 10, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(247, 10, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(248, 10, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(249, 10, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(250, 10, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(251, 10, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(252, 10, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(253, 10, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(254, 10, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(255, 10, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(256, 10, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(257, 10, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(258, 10, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(259, 10, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(260, 10, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(261, 10, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(262, 10, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(263, 10, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(264, 10, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(265, 10, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(266, 10, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(267, 10, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(268, 10, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(269, 10, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(270, 10, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(271, 10, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(274, 11, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(275, 11, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(276, 11, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(277, 11, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(278, 11, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(279, 11, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(280, 11, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(281, 11, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(282, 11, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(283, 11, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(284, 11, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(285, 11, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(286, 11, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(287, 11, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(288, 11, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(289, 11, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(290, 11, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(291, 11, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(292, 11, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(293, 11, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(294, 11, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(295, 11, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(296, 11, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(297, 11, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(298, 11, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(299, 11, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(300, 11, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(301, 11, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(302, 11, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(305, 12, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(306, 12, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(307, 12, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(308, 12, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(309, 12, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(310, 12, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(311, 12, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(312, 12, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(313, 12, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(314, 12, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(315, 12, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(316, 12, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(317, 12, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(318, 12, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(319, 12, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(320, 12, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(321, 12, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(322, 12, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(323, 12, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(324, 12, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(325, 12, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(326, 12, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(327, 12, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(328, 12, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(329, 12, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(330, 12, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(331, 12, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(332, 12, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(333, 12, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(336, 13, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(337, 13, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(338, 13, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(339, 13, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(340, 13, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(341, 13, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(342, 13, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(343, 13, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(344, 13, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(345, 13, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(346, 13, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(347, 13, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(348, 13, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(349, 13, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(350, 13, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(351, 13, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(352, 13, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(353, 13, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(354, 13, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(355, 13, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(356, 13, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(357, 13, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(358, 13, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(359, 13, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(360, 13, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(361, 13, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(362, 13, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(363, 13, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(364, 13, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(367, 14, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(368, 14, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(369, 14, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(370, 14, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(371, 14, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(372, 14, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(373, 14, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(374, 14, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(375, 14, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(376, 14, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(377, 14, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(378, 14, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(379, 14, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(380, 14, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(381, 14, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(382, 14, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(383, 14, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(384, 14, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(385, 14, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(386, 14, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(387, 14, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(388, 14, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(389, 14, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(390, 14, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(391, 14, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(392, 14, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(393, 14, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(394, 14, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(395, 14, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(398, 15, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(399, 15, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(400, 15, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(401, 15, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(402, 15, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(403, 15, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(404, 15, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(405, 15, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(406, 15, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(407, 15, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(408, 15, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(409, 15, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(410, 15, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(411, 15, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(412, 15, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(413, 15, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(414, 15, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(415, 15, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(416, 15, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(417, 15, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(418, 15, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(419, 15, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(420, 15, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(421, 15, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(422, 15, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(423, 15, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(424, 15, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(425, 15, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(426, 15, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(429, 16, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(430, 16, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(431, 16, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(432, 16, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(433, 16, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(434, 16, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(435, 16, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(436, 16, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(437, 16, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(438, 16, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(439, 16, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(440, 16, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(441, 16, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(442, 16, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(443, 16, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(444, 16, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(445, 16, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(446, 16, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(447, 16, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(448, 16, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(449, 16, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(450, 16, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(451, 16, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(452, 16, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(453, 16, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(454, 16, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(455, 16, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(456, 16, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(457, 16, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(460, 17, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(461, 17, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL);
INSERT INTO `master_lookup_data` (`mldId`, `orgId`, `mldKey`, `mldValue`, `mldType`, `mldOption`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(462, 17, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(463, 17, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(464, 17, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(465, 17, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(466, 17, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(467, 17, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(468, 17, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(469, 17, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(470, 17, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(471, 17, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(472, 17, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(473, 17, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(474, 17, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(475, 17, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(476, 17, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(477, 17, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(478, 17, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(479, 17, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(480, 17, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(481, 17, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(482, 17, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(483, 17, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(484, 17, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(485, 17, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(486, 17, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(487, 17, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(488, 17, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(491, 18, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(492, 18, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(493, 18, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(494, 18, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(495, 18, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(496, 18, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(497, 18, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(498, 18, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(499, 18, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(500, 18, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(501, 18, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(502, 18, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(503, 18, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(504, 18, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(505, 18, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(506, 18, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(507, 18, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(508, 18, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(509, 18, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(510, 18, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(511, 18, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(512, 18, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(513, 18, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(514, 18, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(515, 18, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(516, 18, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(517, 18, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(518, 18, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(519, 18, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(522, 19, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(523, 19, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(524, 19, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(525, 19, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(526, 19, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(527, 19, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(528, 19, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(529, 19, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(530, 19, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(531, 19, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(532, 19, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(533, 19, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(534, 19, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(535, 19, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(536, 19, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(537, 19, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(538, 19, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(539, 19, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(540, 19, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(541, 19, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(542, 19, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(543, 19, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(544, 19, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(545, 19, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(546, 19, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(547, 19, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(548, 19, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(549, 19, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(550, 19, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(553, 20, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(554, 20, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(555, 20, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(556, 20, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(557, 20, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(558, 20, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(559, 20, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(560, 20, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(561, 20, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(562, 20, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(563, 20, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(564, 20, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(565, 20, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(566, 20, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(567, 20, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(568, 20, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(569, 20, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(570, 20, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(571, 20, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(572, 20, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(573, 20, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(574, 20, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(575, 20, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(576, 20, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(577, 20, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(578, 20, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(579, 20, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(580, 20, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(581, 20, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:42:15', NULL, '2019-08-21 20:42:15', NULL, NULL),
(584, 21, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(585, 21, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(586, 21, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(587, 21, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(588, 21, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(589, 21, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(590, 21, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(591, 21, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(592, 21, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(593, 21, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(594, 21, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(595, 21, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(596, 21, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(597, 21, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(598, 21, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(599, 21, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(600, 21, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(601, 21, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(602, 21, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(603, 21, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(604, 21, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(605, 21, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(606, 21, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(607, 21, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(608, 21, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(609, 21, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(610, 21, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(611, 21, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(612, 21, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(615, 22, 'school_name', 'High School', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(616, 22, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(617, 22, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(618, 22, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(619, 22, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(620, 22, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(621, 22, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(622, 22, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(623, 22, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(624, 22, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(625, 22, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(626, 22, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(627, 22, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(628, 22, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(629, 22, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(630, 22, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(631, 22, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(632, 22, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(633, 22, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(634, 22, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(635, 22, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(636, 22, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(637, 22, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(638, 22, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(639, 22, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(640, 22, 'grade_name', 'K', 'A', 4, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(641, 22, 'grade_name', '1st', 'A', 4, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(642, 22, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL),
(643, 22, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL);

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
(2, 'App\\User', 2),
(5, 'App\\User', 2),
(2, 'App\\User', 3),
(2, 'App\\User', 4),
(8, 'App\\User', 4),
(2, 'App\\User', 5),
(2, 'App\\User', 6),
(11, 'App\\User', 6),
(2, 'App\\User', 7),
(2, 'App\\User', 12),
(14, 'App\\User', 12),
(2, 'App\\User', 13),
(17, 'App\\User', 13),
(2, 'App\\User', 16),
(26, 'App\\User', 16),
(2, 'App\\User', 17),
(29, 'App\\User', 17),
(2, 'App\\User', 18),
(32, 'App\\User', 18),
(2, 'App\\User', 19),
(35, 'App\\User', 19),
(2, 'App\\User', 20),
(38, 'App\\User', 20),
(2, 'App\\User', 21),
(41, 'App\\User', 21),
(2, 'App\\User', 22),
(44, 'App\\User', 22),
(2, 'App\\User', 23),
(47, 'App\\User', 23),
(2, 'App\\User', 24),
(50, 'App\\User', 24),
(2, 'App\\User', 25),
(53, 'App\\User', 25),
(2, 'App\\User', 26),
(56, 'App\\User', 26),
(2, 'App\\User', 27),
(59, 'App\\User', 27),
(2, 'App\\User', 28),
(62, 'App\\User', 28),
(2, 'App\\User', 29),
(65, 'App\\User', 29),
(2, 'App\\User', 30),
(68, 'App\\User', 30);

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
('07a0d977f849e382f28e564ca3e849f094522fdb38f70fa0edc387c74172964d837fbcc2f9fa4eb7', 102, 1, 'dollar', '[]', 0, '2019-08-01 00:18:44', '2019-08-01 00:18:44', '2020-08-01 05:48:44'),
('0f08054c832fb91084330daaaeb9055d6a55f5a62f51049265f8de278a94e9e4cc832fd393b0cfd0', 4, 1, 'dollar', '[]', 0, '2019-08-14 14:36:12', '2019-08-14 14:36:12', '2020-08-14 15:36:12'),
('1195a789e62944b30a5a0723866c7cf146550fd8826a832ecfea48b6dcec401a3b11d9b4cd444538', 2, 1, 'dollar', '[]', 0, '2019-08-21 10:06:39', '2019-08-21 10:06:39', '2020-08-21 15:36:39'),
('1a90bf58b10200f51daa2ba4bf23595592496cdc0b6893ff5c160409ba3609ec43196ec7cb164c1d', 102, 1, 'dollar', '[]', 0, '2019-07-28 01:54:42', '2019-07-28 01:54:42', '2020-07-28 07:24:42'),
('1c4a21b092a2dff6e6bf9f5af6b078e2d7f4ef64331f42f3452730dab42a61a24ebe999eb5dc96e9', 4, 1, 'dollar', '[]', 0, '2019-08-14 09:21:53', '2019-08-14 09:21:53', '2020-08-14 10:21:53'),
('1ce0b7eb3eef6daef603e83eecd898b65d29d23e40b4a1e23627093565a780934260d64c21ec096c', 108, 1, 'dollar', '[]', 0, '2019-08-01 20:30:56', '2019-08-01 20:30:56', '2020-08-02 02:00:56'),
('21a4f8e567513b729d9d1ea891cf9a3ade6f2dae425aecc3c6ce078a6924219192e818744d6ffad2', 87, 1, 'dollar', '[]', 0, '2019-07-08 17:29:30', '2019-07-08 17:29:30', '2020-07-09 04:29:30'),
('28fa779f44500257026b3967c06a29f3d9b77b1396540e7515d685136f0dd718599ad367780b9182', 2, 1, 'dollar', '[]', 0, '2019-08-01 21:22:44', '2019-08-01 21:22:44', '2020-08-02 02:52:44'),
('2b44aafbc783793e88cd81950d72ee920c1a315e6f4328211cb64a9d3bb59aa626e278bde20254b0', 2, 1, 'dollar', '[]', 0, '2019-08-18 07:26:10', '2019-08-18 07:26:10', '2020-08-18 12:56:10'),
('3373c749ea3f080d8b0e991764d478f639c9ed983294fd22f419cfa94cdf6628bcf9b8406d947825', 4, 1, 'dollar', '[]', 0, '2019-08-17 22:39:36', '2019-08-17 22:39:36', '2020-08-17 23:39:36'),
('36bdd74e89292be6eef5b0cb8e38a0b58bc494fffe1c51ecad0ba24827d66f243bd0892b5db52a53', 87, 1, 'dollar', '[]', 0, '2019-07-21 08:17:55', '2019-07-21 08:17:55', '2020-07-21 13:47:55'),
('391a907e599a8b11088852ad6c0be3deabf032751a058b5da2cb04f29f2c01dc3bf3f49918d758e0', 88, 1, 'dollar', '[]', 0, '2019-07-07 21:00:48', '2019-07-07 21:00:48', '2020-07-08 08:00:48'),
('3f23ab8d6c51854fdb06e7981ba08f6eb3241d321a959f1857a170288212c1215817d7a40e030c80', 87, 1, 'dollar', '[]', 0, '2019-07-01 23:41:27', '2019-07-01 23:41:27', '2020-07-02 10:41:27'),
('40e3575c22b590681120f70958255bcf95063a1611aa85990f0c87f4b977420226c57a7c18726775', 2, 1, 'dollar', '[]', 0, '2019-08-21 09:38:47', '2019-08-21 09:38:47', '2020-08-21 15:08:47'),
('42a786050bd91e192ca1721a193b6294abc464bb1f0bf42a3b60c5099b5227690e0025409052b898', 87, 1, 'dollar', '[]', 0, '2019-07-22 04:01:33', '2019-07-22 04:01:33', '2020-07-22 09:31:33'),
('49401a0a8d493fa62bdb0881c1fe0d82e445354821ed119480ca4c4a4bd311e0011658154204e13b', 87, 1, 'dollar', '[]', 0, '2019-06-13 00:50:54', '2019-06-13 00:50:54', '2020-06-13 11:50:54'),
('4a4f73cf742d950d40f02cb345a7e52bc8848060bd1194996bb0441761892ecc0a1224693aefeed3', 102, 1, 'dollar', '[]', 0, '2019-07-28 18:31:22', '2019-07-28 18:31:22', '2020-07-29 00:01:22'),
('4e5c7e01b4551619228ed240b4fd87f28f44dac1bb447bf595e6ca9486c8f2b8eb66601e0c5b145d', 87, 1, 'dollar', '[]', 0, '2019-07-04 22:43:42', '2019-07-04 22:43:42', '2020-07-05 09:43:42'),
('55c52871c22948c1f09bce5e194d355330984c979f2fc31390459ed5726b9e3cf84a792a6be018c3', 87, 1, 'dollar', '[]', 0, '2019-07-21 00:56:20', '2019-07-21 00:56:20', '2020-07-21 06:26:20'),
('564d0b4411615966f43c52baaf42c8ffc5754bbc6ad53fd6098f426b3c87f78647dddd26b4cc9d09', 87, 1, 'dollar', '[]', 0, '2019-07-02 18:32:00', '2019-07-02 18:32:00', '2020-07-03 05:32:00'),
('56edb0ca0ef06551fb70c1f87856ceb6dff42972661c75d98e5de3a6ecdbc6cc53bdebb754ade88b', 87, 1, 'dollar', '[]', 0, '2019-06-13 00:50:41', '2019-06-13 00:50:41', '2020-06-13 11:50:41'),
('5a5341d40ca0cf669bae387c9871dcc3fcabe42c83eb3f01c9d41514d0c2e570005fe8b38bba3f42', 87, 1, 'dollar', '[]', 0, '2019-07-20 00:31:41', '2019-07-20 00:31:41', '2020-07-20 06:01:41'),
('5b8ab60bff6488ebaab4917be0a87189c2a451f466701567f670faaf1c648289bad5baa8494203c8', 102, 1, 'dollar', '[]', 0, '2019-07-31 00:20:46', '2019-07-31 00:20:46', '2020-07-31 05:50:46'),
('5bd6580802d106c50cb87d25d41e329c5768d669fc2bae1ab262043fcd93ce714a6f1c3c90147641', 102, 1, 'dollar', '[]', 0, '2019-07-26 09:49:17', '2019-07-26 09:49:17', '2020-07-26 15:19:17'),
('5fe26d13456319d038cc74a52038d556ba848b5faa6fd7d0c5aaae14cc1ff3336ab10d3f1d79b4e3', 4, 1, 'dollar', '[]', 0, '2019-08-15 11:43:11', '2019-08-15 11:43:11', '2020-08-15 12:43:11'),
('76c1f6e3c9944286fc173374eab66726ab02befd97c46858e087fe6fc7b35a390d9cde864657e4bf', 4, 1, 'dollar', '[]', 0, '2019-08-18 10:08:40', '2019-08-18 10:08:40', '2020-08-18 11:08:40'),
('7a8ed7f6784155e6f79aafd98622bd4701dc405dfc7aaea06e4ae2f390ffc556e5a216404ead66c2', 102, 1, 'dollar', '[]', 0, '2019-07-30 06:19:21', '2019-07-30 06:19:21', '2020-07-30 11:49:21'),
('7cd0affdc7cf0d59cfbe6f349e92c8373f43cf6029b92ffcf14bd2346025320bffb2c1d0cc67b42b', 87, 1, 'dollar', '[]', 0, '2019-07-19 05:16:31', '2019-07-19 05:16:31', '2020-07-19 10:46:31'),
('8305b21340e9fdf629c34ea4f409eeb114b43b8e9b904a7e7e151c5b040cd2e2e4139b85f7b2b368', 4, 1, 'dollar', '[]', 0, '2019-08-14 19:56:26', '2019-08-14 19:56:26', '2020-08-14 20:56:26'),
('885f184c34725a62294361cbfc47eb125b666c17131c521757b9759e9a7af4bbe4692af96ca78eb1', 2, 1, 'dollar', '[]', 0, '2019-08-18 21:26:35', '2019-08-18 21:26:35', '2020-08-19 02:56:35'),
('8dfb82e9ee2286648a760362c9dc41a360bdf7a3afa845467991c178da35bb77c6843e8a1cddacfc', 87, 1, 'dollar', '[]', 0, '2019-07-20 06:49:51', '2019-07-20 06:49:51', '2020-07-20 12:19:51'),
('9016a28bbc57b6ae325fa81519343be9d5aee86bad4c2872b7fbaa67ec8a87ed4ac76453c95c2765', 4, 1, 'dollar', '[]', 0, '2019-08-15 07:35:43', '2019-08-15 07:35:43', '2020-08-15 08:35:43'),
('9262250e837dad1b323e9d5a88be720bf5226bfb7e5e09786c430abe01e1611bb4b4569de15063ca', 102, 1, 'dollar', '[]', 0, '2019-07-28 21:42:12', '2019-07-28 21:42:12', '2020-07-29 03:12:12'),
('9350e3dceb288328d7cc193b76abc3d7a6079abd17e0aa4d72a276ddc59f4258b0a33bbb76fc7fa1', 87, 1, 'dollar', '[]', 0, '2019-07-02 22:51:19', '2019-07-02 22:51:19', '2020-07-03 09:51:19'),
('966ff81d182c248a96dbe1eba2f4bf014a5165d887948a5fdb6dcfe131adf023376e0cee93726984', 87, 1, 'dollar', '[]', 0, '2019-07-20 06:02:44', '2019-07-20 06:02:44', '2020-07-20 11:32:44'),
('97455615e8404b7eb4f4c3c405a36c3bdd0d1be70c567d34abb65652ee1e2c0f9d2e42b87dd1b249', 109, 1, 'dollar', '[]', 0, '2019-08-01 20:41:57', '2019-08-01 20:41:57', '2020-08-02 02:11:57'),
('98e1fd302a1802860adb5aacf630c18b587ef8b3b8d1fbddc6b50338470ba33c553b8e24bb71183d', 2, 1, 'dollar', '[]', 0, '2019-08-01 21:21:28', '2019-08-01 21:21:28', '2020-08-02 02:51:28'),
('998f75837a26d1ecf33769de49cf9c4d1d8e4e7d3a378795676fc63f9e96b696ff6d5c8d3b23c75c', 102, 1, 'dollar', '[]', 0, '2019-08-01 19:42:12', '2019-08-01 19:42:12', '2020-08-02 01:12:12'),
('9a89208149fd4708e7c5270e86e8a4c9c48331cc27a56e10232dec5246a0d4f485cacc8548901fde', 2, 1, 'dollar', '[]', 0, '2019-08-01 21:47:44', '2019-08-01 21:47:44', '2020-08-02 03:17:44'),
('9acc811b09067b2ef20f6bbac4ce8c7e1bdabf41506952b327a3d2f3b1ed1dd8591e44827941e409', 87, 1, 'dollar', '[]', 0, '2019-07-24 05:55:30', '2019-07-24 05:55:30', '2020-07-24 11:25:30'),
('9d85673d26d2eef7509d6aa793e15e12e1adec162fa05d9cca47f53c71c040d79717d4ab0f7490fe', 6, 1, 'dollar', '[]', 0, '2019-08-14 20:24:25', '2019-08-14 20:24:25', '2020-08-14 21:24:25'),
('a1525dec8a326cc17169ac39feb7c53ab48f7ec45677cfc1f4b07d5a4a9ae9d1d86761185fe40e4b', 102, 1, 'dollar', '[]', 0, '2019-07-29 22:22:03', '2019-07-29 22:22:03', '2020-07-30 03:52:03'),
('a339d330d9d0dcff6798b42a134e376862c81cd2f2ca60f5b308f7dd7190892a7e8276a211d7a256', 2, 1, 'dollar', '[]', 0, '2019-08-19 20:19:47', '2019-08-19 20:19:47', '2020-08-20 01:49:47'),
('a89fbd0a3af31335251962bbf5451fecf1849c8ccae7c22faf84f43914806cb175024f19003c2952', 102, 1, 'dollar', '[]', 0, '2019-07-26 19:34:32', '2019-07-26 19:34:32', '2020-07-27 01:04:32'),
('aa2bdab72420d3ff29b1d3fcf3b9686c3a84c49878bf7923b32f8f8dece66ba27a40d32e58841eea', 4, 1, 'dollar', '[]', 0, '2019-08-15 16:09:40', '2019-08-15 16:09:40', '2020-08-15 17:09:40'),
('aaebcf0c802dd1e25fb95000b199418ac631b5139dfe3a592c317b16644f8788afaaca1551496c9c', 87, 1, 'dollar', '[]', 0, '2019-07-19 21:37:53', '2019-07-19 21:37:53', '2020-07-20 03:07:53'),
('b6e2732b2d8e641029c0bc214a57a3c2397651e46926f9c2a4b8cd950f0e0d8fb85ebe29e7c5398a', 97, 1, 'dollar', '[]', 0, '2019-07-26 05:12:32', '2019-07-26 05:12:32', '2020-07-26 10:42:32'),
('c384427a07f1c5a5692c68440822bb7812e3d73bac242deee2bb74a423481144a3590e31fd67d512', 2, 1, 'dollar', '[]', 0, '2019-08-18 07:49:57', '2019-08-18 07:49:57', '2020-08-18 13:19:57'),
('c5a1f10286c5cf1f2f491168f52dc87be1fda2f3209b3c870ccc995af5488efa0a9a64ad5223be4b', 87, 1, 'dollar', '[]', 0, '2019-07-20 06:02:52', '2019-07-20 06:02:52', '2020-07-20 11:32:52'),
('c74dee57928433395de16ae5b3c31fafd226b40ed47504a80e6420bc18977a259fe4ad16cb06a37b', 87, 1, 'dollar', '[]', 0, '2019-07-21 10:18:06', '2019-07-21 10:18:06', '2020-07-21 15:48:06'),
('c8b7cffc21183dade88db801fa144c0bf9b537ce9cdd24b3039199be1bf2acaa92adbfd1646e3dbe', 87, 1, 'dollar', '[]', 0, '2019-07-21 10:17:40', '2019-07-21 10:17:40', '2020-07-21 15:47:40'),
('cbc85c023bed7682d964f90aac54f6a323e113d3c671366632cc3a4067149f76a0469a75e70c571d', 87, 1, 'dollar', '[]', 0, '2019-07-17 23:26:19', '2019-07-17 23:26:19', '2020-07-18 04:56:19'),
('cce2dd49c4c06218a7f6b74c60526b2468ce4b24d2def7ef12db4ce3fcc42d8a20e104161e8cd297', 102, 1, 'dollar', '[]', 0, '2019-07-30 06:33:24', '2019-07-30 06:33:24', '2020-07-30 12:03:24'),
('ccf054bc061a897d428de73a1d7cb16e6424263369cb49a4d52f6d33c267cf0859e33dde2ddb2077', 87, 1, 'dollar', '[]', 0, '2019-07-21 20:15:11', '2019-07-21 20:15:11', '2020-07-22 01:45:11'),
('cf143b92d0c3ba8ef30545797731b6272d432441b277f57ebc2207cd3c90573c45f5e6dc4383159c', 102, 1, 'dollar', '[]', 0, '2019-07-29 03:56:51', '2019-07-29 03:56:51', '2020-07-29 09:26:51'),
('d142ea6fe09ea23ae945ba21315b1390f52e23688606dc81b80058e7451507ee15f31cf4e7d57007', 4, 1, 'dollar', '[]', 0, '2019-08-09 18:14:19', '2019-08-09 18:14:19', '2020-08-09 19:14:19'),
('d50cba8c08d891cc0f43d2fb3d03285303df36a2197e6271100f618e31ee8af7d529b77b207def2b', 2, 1, 'dollar', '[]', 0, '2019-08-21 10:08:47', '2019-08-21 10:08:47', '2020-08-21 15:38:47'),
('d8de316ee12b5c67e3b75f8cb2fb6557d808a589ab5ba38e2f77887635f1cbd104d33cd845268738', 4, 1, 'dollar', '[]', 0, '2019-08-13 21:26:53', '2019-08-13 21:26:53', '2020-08-13 22:26:53'),
('d9a1e66bc3175e5bc39164cfde20bc1e3e3c033cd29f1a56582a19e5298c72e6405fd390f3c888ea', 109, 1, 'dollar', '[]', 0, '2019-08-01 20:40:14', '2019-08-01 20:40:14', '2020-08-02 02:10:14'),
('da42a4b6ea2d457cee636c5d9f4c90fd249a65f8a98540a6f6718c3f7c00c4adbded23fd41473ae2', 2, 1, 'dollar', '[]', 0, '2019-08-01 21:12:19', '2019-08-01 21:12:19', '2020-08-02 02:42:19'),
('dc3aa91d30153caaaa19ee77aa2f081f76c50b1d232cefe4fb99e0fc0ad7467bd143d773c9579cae', 87, 1, 'dollar', '[]', 0, '2019-07-22 05:01:45', '2019-07-22 05:01:45', '2020-07-22 10:31:45'),
('df9e400ec2ff66aad5cdeb79459ed5fb2bbce5fca4ebabd4200e942d3dbaf58ef2b09110bf51f72e', 87, 1, 'dollar', '[]', 0, '2019-07-03 23:19:12', '2019-07-03 23:19:12', '2020-07-04 10:19:12'),
('e445857b4c00fb415c105d0cb97210c5f779bbd1218dcae6bf04364b56f855aaad385a26362399ff', 2, 1, 'dollar', '[]', 0, '2019-08-21 18:37:14', '2019-08-21 18:37:14', '2020-08-22 00:07:14'),
('e4c9348b64a9a9830946ca63e1f28194adfa46e95eba6ea67476f254f6552b108ee437a4fae6d247', 87, 1, 'dollar', '[]', 0, '2019-07-22 23:25:50', '2019-07-22 23:25:50', '2020-07-23 04:55:50'),
('e75da22da958377c6f65d3cc7cf4114fe52e1fc9d1bf9a2ce83839653248e9ef721f63cf66944d84', 102, 1, 'dollar', '[]', 0, '2019-08-01 05:36:49', '2019-08-01 05:36:49', '2020-08-01 11:06:49'),
('e928db91b7e977eb82798a814620e88f26a12e6fabb250dd20635be624c860e12b09996a4e623d81', 102, 1, 'dollar', '[]', 0, '2019-07-30 21:07:17', '2019-07-30 21:07:17', '2020-07-31 02:37:17'),
('ef9763080456367398a41f2c96b021695bcf0431474633faabbd80c994ffccbc720d1d89b4142b53', 6, 1, 'dollar', '[]', 0, '2019-08-01 21:39:23', '2019-08-01 21:39:23', '2020-08-02 03:09:23'),
('f9acd31cd5e915ce5b198de1177029c663b37be6e96530cabc30ccab9fa24bb9f44dc5f8ba75fa9a', 102, 1, 'dollar', '[]', 0, '2019-07-28 07:37:33', '2019-07-28 07:37:33', '2020-07-28 13:07:33');

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
(1, 'stpaul', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pacific/Samoa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-01 21:47:28', NULL, '2019-08-01 21:47:28', NULL, NULL),
(2, 'Testing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Asia/Calcutta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-09 18:12:04', NULL, '2019-08-09 18:12:04', NULL, NULL),
(3, 'Anjali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Asia/Calcutta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-14 20:23:23', NULL, '2019-08-14 20:23:23', NULL, NULL),
(4, 'St Jhons', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'America/Monterrey', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'jhonschurch', NULL, '2019-08-21 18:51:51', NULL, '2019-08-21 18:51:51', NULL, NULL),
(5, 'Aloysius', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US/Mountain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aloy', NULL, '2019-08-21 20:13:58', NULL, '2019-08-21 20:13:58', NULL, NULL),
(8, 'Aloysius', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US/Mountain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mila', NULL, '2019-08-21 20:15:46', NULL, '2019-08-21 20:15:46', NULL, NULL),
(9, 'Aloysius', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US/Mountain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mila1', NULL, '2019-08-21 20:18:07', NULL, '2019-08-21 20:18:07', NULL, NULL),
(10, 'Aloysius', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US/Mountain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mila11', NULL, '2019-08-21 20:18:48', NULL, '2019-08-21 20:18:48', NULL, NULL),
(11, 'patrick church', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'America/Chihuahua', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dere', NULL, '2019-08-21 20:19:26', NULL, '2019-08-21 20:19:26', NULL, NULL),
(12, 'patrick church', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'America/Chihuahua', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dere1', NULL, '2019-08-21 20:19:35', NULL, '2019-08-21 20:19:35', NULL, NULL),
(13, 'patrick church', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'America/Chihuahua', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dere1as', NULL, '2019-08-21 20:20:13', NULL, '2019-08-21 20:20:13', NULL, NULL),
(14, 'asdad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asdadada', NULL, '2019-08-21 20:20:57', NULL, '2019-08-21 20:20:57', NULL, NULL),
(15, 'asdad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asdadadaasd', NULL, '2019-08-21 20:21:18', NULL, '2019-08-21 20:21:18', NULL, NULL),
(16, 'asdada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dasdasd', NULL, '2019-08-21 20:21:37', NULL, '2019-08-21 20:21:37', NULL, NULL),
(17, 'asdad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asdsada', NULL, '2019-08-21 20:23:00', NULL, '2019-08-21 20:23:00', NULL, NULL),
(18, 'asdad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asdad', NULL, '2019-08-21 20:36:05', NULL, '2019-08-21 20:36:05', NULL, NULL),
(19, 'aasa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'faf', NULL, '2019-08-21 20:40:59', NULL, '2019-08-21 20:40:59', NULL, NULL),
(20, 'frsfd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fsdfsd', NULL, '2019-08-21 20:42:14', NULL, '2019-08-21 20:42:14', NULL, NULL),
(21, 'asdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asda', NULL, '2019-08-21 20:43:12', NULL, '2019-08-21 20:43:12', NULL, NULL),
(22, 'asdadsa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dadada', NULL, '2019-08-21 20:44:15', NULL, '2019-08-21 20:44:15', NULL, NULL);

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
(12, 1, 'Accounting', 'web', NULL, NULL),
(14, 2, 'Nextgen Checkin', 'web', NULL, NULL),
(15, 2, 'Member Directory', 'web', NULL, NULL),
(16, 2, 'Scheduling', 'web', NULL, NULL),
(17, 2, 'Event management', 'web', NULL, NULL),
(18, 2, 'Small Group', 'web', NULL, NULL),
(19, 2, 'Accounting', 'web', NULL, NULL),
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
(31, 4, 'Accounting', 'web', NULL, NULL),
(33, 5, 'Nextgen Checkin', 'web', NULL, NULL),
(34, 5, 'Member Directory', 'web', NULL, NULL),
(35, 5, 'Scheduling', 'web', NULL, NULL),
(36, 5, 'Event management', 'web', NULL, NULL),
(37, 5, 'Small Group', 'web', NULL, NULL),
(38, 5, 'Accounting', 'web', NULL, NULL),
(54, 8, 'Nextgen Checkin', 'web', NULL, NULL),
(55, 8, 'Member Directory', 'web', NULL, NULL),
(56, 8, 'Scheduling', 'web', NULL, NULL),
(57, 8, 'Event management', 'web', NULL, NULL),
(58, 8, 'Small Group', 'web', NULL, NULL),
(59, 8, 'Accounting', 'web', NULL, NULL),
(61, 9, 'Nextgen Checkin', 'web', NULL, NULL),
(62, 9, 'Member Directory', 'web', NULL, NULL),
(63, 9, 'Scheduling', 'web', NULL, NULL),
(64, 9, 'Event management', 'web', NULL, NULL),
(65, 9, 'Small Group', 'web', NULL, NULL),
(66, 9, 'Accounting', 'web', NULL, NULL),
(68, 10, 'Nextgen Checkin', 'web', NULL, NULL),
(69, 10, 'Member Directory', 'web', NULL, NULL),
(70, 10, 'Scheduling', 'web', NULL, NULL),
(71, 10, 'Event management', 'web', NULL, NULL),
(72, 10, 'Small Group', 'web', NULL, NULL),
(73, 10, 'Accounting', 'web', NULL, NULL),
(75, 11, 'Nextgen Checkin', 'web', NULL, NULL),
(76, 11, 'Member Directory', 'web', NULL, NULL),
(77, 11, 'Scheduling', 'web', NULL, NULL),
(78, 11, 'Event management', 'web', NULL, NULL),
(79, 11, 'Small Group', 'web', NULL, NULL),
(80, 11, 'Accounting', 'web', NULL, NULL),
(82, 12, 'Nextgen Checkin', 'web', NULL, NULL),
(83, 12, 'Member Directory', 'web', NULL, NULL),
(84, 12, 'Scheduling', 'web', NULL, NULL),
(85, 12, 'Event management', 'web', NULL, NULL),
(86, 12, 'Small Group', 'web', NULL, NULL),
(87, 12, 'Accounting', 'web', NULL, NULL),
(89, 13, 'Nextgen Checkin', 'web', NULL, NULL),
(90, 13, 'Member Directory', 'web', NULL, NULL),
(91, 13, 'Scheduling', 'web', NULL, NULL),
(92, 13, 'Event management', 'web', NULL, NULL),
(93, 13, 'Small Group', 'web', NULL, NULL),
(94, 13, 'Accounting', 'web', NULL, NULL),
(96, 14, 'Nextgen Checkin', 'web', NULL, NULL),
(97, 14, 'Member Directory', 'web', NULL, NULL),
(98, 14, 'Scheduling', 'web', NULL, NULL),
(99, 14, 'Event management', 'web', NULL, NULL),
(100, 14, 'Small Group', 'web', NULL, NULL),
(101, 14, 'Accounting', 'web', NULL, NULL),
(103, 15, 'Nextgen Checkin', 'web', NULL, NULL),
(104, 15, 'Member Directory', 'web', NULL, NULL),
(105, 15, 'Scheduling', 'web', NULL, NULL),
(106, 15, 'Event management', 'web', NULL, NULL),
(107, 15, 'Small Group', 'web', NULL, NULL),
(108, 15, 'Accounting', 'web', NULL, NULL),
(110, 16, 'Nextgen Checkin', 'web', NULL, NULL),
(111, 16, 'Member Directory', 'web', NULL, NULL),
(112, 16, 'Scheduling', 'web', NULL, NULL),
(113, 16, 'Event management', 'web', NULL, NULL),
(114, 16, 'Small Group', 'web', NULL, NULL),
(115, 16, 'Accounting', 'web', NULL, NULL),
(117, 17, 'Nextgen Checkin', 'web', NULL, NULL),
(118, 17, 'Member Directory', 'web', NULL, NULL),
(119, 17, 'Scheduling', 'web', NULL, NULL),
(120, 17, 'Event management', 'web', NULL, NULL),
(121, 17, 'Small Group', 'web', NULL, NULL),
(122, 17, 'Accounting', 'web', NULL, NULL),
(124, 18, 'Nextgen Checkin', 'web', NULL, NULL),
(125, 18, 'Member Directory', 'web', NULL, NULL),
(126, 18, 'Scheduling', 'web', NULL, NULL),
(127, 18, 'Event management', 'web', NULL, NULL),
(128, 18, 'Small Group', 'web', NULL, NULL),
(129, 18, 'Accounting', 'web', NULL, NULL),
(131, 19, 'Nextgen Checkin', 'web', NULL, NULL),
(132, 19, 'Member Directory', 'web', NULL, NULL),
(133, 19, 'Scheduling', 'web', NULL, NULL),
(134, 19, 'Event management', 'web', NULL, NULL),
(135, 19, 'Small Group', 'web', NULL, NULL),
(136, 19, 'Accounting', 'web', NULL, NULL),
(138, 20, 'Nextgen Checkin', 'web', NULL, NULL),
(139, 20, 'Member Directory', 'web', NULL, NULL),
(140, 20, 'Scheduling', 'web', NULL, NULL),
(141, 20, 'Event management', 'web', NULL, NULL),
(142, 20, 'Small Group', 'web', NULL, NULL),
(143, 20, 'Accounting', 'web', NULL, NULL),
(145, 21, 'Nextgen Checkin', 'web', NULL, NULL),
(146, 21, 'Member Directory', 'web', NULL, NULL),
(147, 21, 'Scheduling', 'web', NULL, NULL),
(148, 21, 'Event management', 'web', NULL, NULL),
(149, 21, 'Small Group', 'web', NULL, NULL),
(150, 21, 'Accounting', 'web', NULL, NULL),
(152, 22, 'Nextgen Checkin', 'web', NULL, NULL),
(153, 22, 'Member Directory', 'web', NULL, NULL),
(154, 22, 'Scheduling', 'web', NULL, NULL),
(155, 22, 'Event management', 'web', NULL, NULL),
(156, 22, 'Small Group', 'web', NULL, NULL),
(157, 22, 'Accounting', 'web', NULL, NULL);

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
(1, 0, 'Super Adminin', 'web', 'superadmin', '2019-05-05 08:22:07', '2019-05-05 08:22:07'),
(2, 0, 'Admin', 'web', 'admin', '2019-05-05 08:22:08', '2019-05-05 08:22:08'),
(3, 0, 'Member', 'web', 'member', '2019-05-05 09:20:10', '2019-05-05 09:20:10'),
(4, 0, 'Volunteer', 'web', 'volunteer', '2019-07-26 04:48:18', '2019-07-26 04:48:18'),
(5, 1, 'Admin', 'web', 'admin', '2019-08-02 03:17:29', NULL),
(6, 1, 'Member', 'web', 'member', '2019-08-02 03:17:29', NULL),
(7, 1, 'Volunteer', 'web', 'volunteer', '2019-08-02 03:17:29', NULL),
(8, 2, 'Admin', 'web', 'admin', '2019-08-09 19:12:04', NULL),
(9, 2, 'Member', 'web', 'member', '2019-08-09 19:12:04', NULL),
(10, 2, 'Volunteer', 'web', 'volunteer', '2019-08-09 19:12:04', NULL),
(11, 3, 'Admin', 'web', 'admin', '2019-08-14 21:23:23', NULL),
(12, 3, 'Member', 'web', 'member', '2019-08-14 21:23:23', NULL),
(13, 3, 'Volunteer', 'web', 'volunteer', '2019-08-14 21:23:23', NULL),
(14, 4, 'Admin', 'web', 'admin', '2019-08-22 00:21:51', NULL),
(15, 4, 'Member', 'web', 'member', '2019-08-22 00:21:51', NULL),
(16, 4, 'Volunteer', 'web', 'volunteer', '2019-08-22 00:21:51', NULL),
(17, 5, 'Admin', 'web', 'admin', '2019-08-22 01:43:58', NULL),
(18, 5, 'Member', 'web', 'member', '2019-08-22 01:43:58', NULL),
(19, 5, 'Volunteer', 'web', 'volunteer', '2019-08-22 01:43:58', NULL),
(26, 8, 'Admin', 'web', 'admin', '2019-08-22 01:45:46', NULL),
(27, 8, 'Member', 'web', 'member', '2019-08-22 01:45:46', NULL),
(28, 8, 'Volunteer', 'web', 'volunteer', '2019-08-22 01:45:46', NULL),
(29, 9, 'Admin', 'web', 'admin', '2019-08-22 01:48:07', NULL),
(30, 9, 'Member', 'web', 'member', '2019-08-22 01:48:07', NULL),
(31, 9, 'Volunteer', 'web', 'volunteer', '2019-08-22 01:48:07', NULL),
(32, 10, 'Admin', 'web', 'admin', '2019-08-22 01:48:48', NULL),
(33, 10, 'Member', 'web', 'member', '2019-08-22 01:48:48', NULL),
(34, 10, 'Volunteer', 'web', 'volunteer', '2019-08-22 01:48:48', NULL),
(35, 11, 'Admin', 'web', 'admin', '2019-08-22 01:49:26', NULL),
(36, 11, 'Member', 'web', 'member', '2019-08-22 01:49:26', NULL),
(37, 11, 'Volunteer', 'web', 'volunteer', '2019-08-22 01:49:26', NULL),
(38, 12, 'Admin', 'web', 'admin', '2019-08-22 01:49:35', NULL),
(39, 12, 'Member', 'web', 'member', '2019-08-22 01:49:35', NULL),
(40, 12, 'Volunteer', 'web', 'volunteer', '2019-08-22 01:49:35', NULL),
(41, 13, 'Admin', 'web', 'admin', '2019-08-22 01:50:13', NULL),
(42, 13, 'Member', 'web', 'member', '2019-08-22 01:50:13', NULL),
(43, 13, 'Volunteer', 'web', 'volunteer', '2019-08-22 01:50:13', NULL),
(44, 14, 'Admin', 'web', 'admin', '2019-08-22 01:50:57', NULL),
(45, 14, 'Member', 'web', 'member', '2019-08-22 01:50:57', NULL),
(46, 14, 'Volunteer', 'web', 'volunteer', '2019-08-22 01:50:57', NULL),
(47, 15, 'Admin', 'web', 'admin', '2019-08-22 01:51:18', NULL),
(48, 15, 'Member', 'web', 'member', '2019-08-22 01:51:18', NULL),
(49, 15, 'Volunteer', 'web', 'volunteer', '2019-08-22 01:51:18', NULL),
(50, 16, 'Admin', 'web', 'admin', '2019-08-22 01:51:37', NULL),
(51, 16, 'Member', 'web', 'member', '2019-08-22 01:51:37', NULL),
(52, 16, 'Volunteer', 'web', 'volunteer', '2019-08-22 01:51:37', NULL),
(53, 17, 'Admin', 'web', 'admin', '2019-08-22 01:53:00', NULL),
(54, 17, 'Member', 'web', 'member', '2019-08-22 01:53:00', NULL),
(55, 17, 'Volunteer', 'web', 'volunteer', '2019-08-22 01:53:00', NULL),
(56, 18, 'Admin', 'web', 'admin', '2019-08-22 02:06:05', NULL),
(57, 18, 'Member', 'web', 'member', '2019-08-22 02:06:05', NULL),
(58, 18, 'Volunteer', 'web', 'volunteer', '2019-08-22 02:06:05', NULL),
(59, 19, 'Admin', 'web', 'admin', '2019-08-22 02:10:59', NULL),
(60, 19, 'Member', 'web', 'member', '2019-08-22 02:10:59', NULL),
(61, 19, 'Volunteer', 'web', 'volunteer', '2019-08-22 02:10:59', NULL),
(62, 20, 'Admin', 'web', 'admin', '2019-08-22 02:12:14', NULL),
(63, 20, 'Member', 'web', 'member', '2019-08-22 02:12:14', NULL),
(64, 20, 'Volunteer', 'web', 'volunteer', '2019-08-22 02:12:14', NULL),
(65, 21, 'Admin', 'web', 'admin', '2019-08-22 02:13:12', NULL),
(66, 21, 'Member', 'web', 'member', '2019-08-22 02:13:12', NULL),
(67, 21, 'Volunteer', 'web', 'volunteer', '2019-08-22 02:13:12', NULL),
(68, 22, 'Admin', 'web', 'admin', '2019-08-22 02:14:15', NULL),
(69, 22, 'Member', 'web', 'member', '2019-08-22 02:14:15', NULL),
(70, 22, 'Volunteer', 'web', 'volunteer', '2019-08-22 02:14:15', NULL);

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
(7, 5),
(8, 5),
(9, 5),
(10, 5),
(11, 5),
(12, 5),
(7, 6),
(7, 7),
(14, 8),
(15, 8),
(16, 8),
(17, 8),
(18, 8),
(19, 8),
(14, 9),
(14, 10),
(20, 11),
(21, 11),
(22, 11),
(23, 11),
(24, 11),
(25, 11),
(20, 12),
(20, 13),
(26, 14),
(27, 14),
(28, 14),
(29, 14),
(30, 14),
(31, 14),
(26, 15),
(26, 16),
(33, 17),
(34, 17),
(35, 17),
(36, 17),
(37, 17),
(38, 17),
(33, 18),
(33, 19),
(54, 26),
(55, 26),
(56, 26),
(57, 26),
(58, 26),
(59, 26),
(54, 27),
(54, 28),
(61, 29),
(62, 29),
(63, 29),
(64, 29),
(65, 29),
(66, 29),
(61, 30),
(61, 31),
(68, 32),
(69, 32),
(70, 32),
(71, 32),
(72, 32),
(73, 32),
(68, 33),
(68, 34),
(75, 35),
(76, 35),
(77, 35),
(78, 35),
(79, 35),
(80, 35),
(75, 36),
(75, 37),
(82, 38),
(83, 38),
(84, 38),
(85, 38),
(86, 38),
(87, 38),
(82, 39),
(82, 40),
(89, 41),
(90, 41),
(91, 41),
(92, 41),
(93, 41),
(94, 41),
(89, 42),
(89, 43),
(96, 44),
(97, 44),
(98, 44),
(99, 44),
(100, 44),
(101, 44),
(96, 45),
(96, 46),
(103, 47),
(104, 47),
(105, 47),
(106, 47),
(107, 47),
(108, 47),
(103, 48),
(103, 49),
(110, 50),
(111, 50),
(112, 50),
(113, 50),
(114, 50),
(115, 50),
(110, 51),
(110, 52),
(117, 53),
(118, 53),
(119, 53),
(120, 53),
(121, 53),
(122, 53),
(117, 54),
(117, 55),
(124, 56),
(125, 56),
(126, 56),
(127, 56),
(128, 56),
(129, 56),
(124, 57),
(124, 58),
(131, 59),
(132, 59),
(133, 59),
(134, 59),
(135, 59),
(136, 59),
(131, 60),
(131, 61),
(138, 62),
(139, 62),
(140, 62),
(141, 62),
(142, 62),
(143, 62),
(138, 63),
(138, 64),
(145, 65),
(146, 65),
(147, 65),
(148, 65),
(149, 65),
(150, 65),
(145, 66),
(145, 67),
(152, 68),
(153, 68),
(154, 68),
(155, 68),
(156, 68),
(157, 68),
(152, 69),
(152, 70);

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

INSERT INTO `users` (`id`, `orgId`, `householdName`, `personal_id`, `name_prefix`, `given_name`, `first_name`, `last_name`, `middle_name`, `nick_name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `referal_code`, `name_suffix`, `profile_pic`, `dob`, `doa`, `school_name`, `grade_id`, `life_stage`, `mobile_no`, `home_phone_no`, `gender`, `social_profile`, `marital_status`, `address`, `medical_note`, `congregration_status`, `created_at`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, NULL, 'Admin', '0000000001', 'Admin', 'Admin', 'Admin', NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'stpaul my name\'s household', '0000000002', NULL, NULL, 'stpaul my name', NULL, NULL, NULL, 'stpaul@gmail.com', 'stpaul', NULL, '$2y$10$TT/yxAXlArEmU6dszc75/u5YcuLc.itz4kwBUNO6crWld0jh9oiBC', NULL, 'stpab7bx', NULL, 's:316:"{"uploaded_path":"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/profile\\/","download_path":"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/profile\\/","uploaded_file_name":"1566400720.png","original_filename":"1566400720.png","upload_file_extension":"png","file_size":0}";', NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-01 21:47:29', '2019-08-21 09:48:40', NULL, NULL),
(3, 1, 'gtgtgt name\'s household', '0000000003', '32', NULL, 'gtgtgt name', NULL, 'asdsad', NULL, 'stpaul33@aacom', NULL, NULL, '$2y$10$Kd.dM5RyO8uDs0At.EnMAupq2Dlz0iP/3YTQ0L.8CvnGZkTaeZoNa', NULL, 'gtgtshqp', '41', 's:316:"{"uploaded_path":"\\/var\\/www\\/html\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/profile\\/","download_path":"http:\\/\\/localhost\\/dallas\\/public\\/assets\\/uploads\\/organizations\\/1\\/profile\\/","uploaded_file_name":"1566401203.png","original_filename":"1566401203.png","upload_file_extension":"png","file_size":0}";', NULL, NULL, '30', 56, 'Adult', NULL, NULL, 'Male', NULL, '47', ',,, - ', NULL, NULL, '2019-08-01 21:48:59', '2019-08-21 09:56:43', NULL, NULL),
(4, 2, 'Lokesh\'s household', '0000000004', NULL, NULL, 'Lokesh', NULL, NULL, NULL, 'lmlokesh43@gmail.com', 'LokeshLM', NULL, '$2y$10$tbt50pKh..jg2KfcZLlC4uV4WJPQ132.u56bKX3uIlpjt97llrEJS', NULL, 'Lokelryw', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-09 18:12:04', '2019-08-09 18:12:04', NULL, NULL),
(5, 2, 'fsdafsdaf\'s household', '0000000005', '67', 'dsfsdfdsf', 'fsdafsdaf', NULL, NULL, NULL, 'fdsffdsds@fdasfds.com', NULL, NULL, '$2y$10$bSq2uOsNb6KAhvvimvUEAO64gJ9eNS1NPPPQn4vT3VDepd87CQsDO', NULL, 'fsdamiqv', '72', NULL, NULL, NULL, '61', 87, 'Adult', '9035371392', NULL, 'Male', NULL, '78', 'LM Lokesh C/O Radhakrishna Nair, next to City Beech, Ferry Road, Bolar,,Mangalore, - 575001', NULL, NULL, '2019-08-14 19:56:57', '2019-08-14 19:56:57', NULL, NULL),
(6, 3, 'Anjali Lokesh\'s household', '0000000006', NULL, NULL, 'Anjali Lokesh', NULL, NULL, NULL, 'anjali@gmail.com', 'Anjali', NULL, '$2y$10$enR5tUUi.2vl5DaWgdA3L.dfbDKUYFRFOgcvqZl7PgCzlx7hMTo6O', NULL, 'Anja438u', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-14 20:23:24', '2019-08-14 20:23:24', NULL, NULL),
(7, 3, 'anjaliL\'s household', '0000000007', '95', NULL, 'anjaliL', NULL, NULL, NULL, 'anjali123@gmail.com', NULL, NULL, '$2y$10$oVb/oj4AtI7W/nD4XxOm2uC.snlMAG3S0P8rpAl2PAs3Xag2BSlT2', NULL, 'anja014l', '101', NULL, NULL, NULL, '90', 116, 'Adult', NULL, NULL, 'Male', NULL, '107', ',,, - ', NULL, NULL, '2019-08-14 20:25:23', '2019-08-14 20:25:23', NULL, NULL),
(8, 3, 'dsfdsaf\'s household', '0000000008', '96', NULL, 'dsfdsaf', NULL, NULL, NULL, 'fsadfadsfdsa@gmail.com', NULL, NULL, '$2y$10$4Zyd56DaFsxJyVydvC6ANee2fmWhwGTzvhAMD/qfJoGtWSHnY7wRm', NULL, 'dsfdjw1x', '101', NULL, NULL, NULL, '90', 116, 'Adult', NULL, NULL, 'Male', NULL, '107', '////////////', NULL, NULL, '2019-08-14 23:23:57', '2019-08-14 23:23:57', NULL, NULL),
(10, 3, '\'s household', '0000000009', '96', 'dsfsdfdsf', NULL, NULL, NULL, NULL, 'fdsffdsdsddd@fdasfds.comf', NULL, NULL, '$2y$10$XSeACkWUxCzs./7Mo0JHfuq03l9hzQ5dbhu.MGD/QzmGs1nH9ZnWu', NULL, 'zozu', '101', NULL, NULL, NULL, '90', 116, 'Adult', '9035371392', NULL, 'Male', NULL, '107', 'LM Lokesh C/O Radhakrishna Nair, next to City Beech, Ferry Road, Bolar///dfasdsafdsafds///Mangalore///dsafdsafdsafsdaf///575001', NULL, NULL, '2019-08-15 00:20:21', '2019-08-15 00:20:21', NULL, NULL),
(11, 2, 'fsdafsdaf\'s household', '0000000010', '66', 'dsfsdfdsf', 'fsdafsdaf', NULL, NULL, NULL, 'fdsffdsds@facebook.com', NULL, NULL, '$2y$10$H7La9hDhhQzRlyhS2QBBrOTyE5rE4AbWnSfSMuAdgk9/N1vkXJCoy', NULL, 'fsdaxfqv', '72', NULL, NULL, NULL, '61', 87, 'Adult', '9035371392', NULL, 'Male', NULL, '78', 'LM Lokesh C/O Radhakrishna Nair, next to City Beech, Ferry Road, Bolar,,Mangalore, - 575001////////////', NULL, NULL, '2019-08-15 08:36:26', '2019-08-15 09:14:46', NULL, NULL),
(12, 4, 'jhonschurch\'s household', '0000000012', NULL, NULL, 'jhonschurch', NULL, NULL, NULL, 'jhonschurch@jhonschurch.com', NULL, NULL, '$2y$10$mTjJUFL6WMbL8OxbR89DQeYXqMRf8S.OhGPPPqXarxO2OPnakCNH2', NULL, 'jhoncshs', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 18:51:51', '2019-08-21 18:51:51', NULL, NULL),
(13, 5, 'Rolf\'s household', '0000000013', NULL, NULL, 'Rolf', NULL, NULL, NULL, 'rolf@gmail.com', NULL, NULL, '$2y$10$55BoNrVO5oTP2jUSYOxxeuCOSPQIflsKthoWQ5Puh.2T8SsgwrvY.', NULL, 'Rolfdcn5', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:13:58', '2019-08-21 20:13:58', NULL, NULL),
(16, 8, 'Rolf\'s household', '0000000014', NULL, NULL, 'Rolf', NULL, NULL, NULL, 'rolf@gmail.com', NULL, NULL, '$2y$10$NQNz2oMjBELzu32U.Z6MB.gI0lD0ECqFoxjjiyysG1ubcmhSEWL.W', NULL, 'Rolfr3h6', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:15:46', '2019-08-21 20:15:46', NULL, NULL),
(17, 9, 'Rolf\'s household', '0000000017', NULL, NULL, 'Rolf', NULL, NULL, NULL, 'rolf@gmail.com', NULL, NULL, '$2y$10$uQvEK1fEA.pCJTu3/Dm3qOdWoXNCqS25hg.B4UV.MsYc3ilYkP2o.', NULL, 'Rolffje9', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:18:07', '2019-08-21 20:18:07', NULL, NULL),
(18, 10, 'Rolf\'s household', '0000000018', NULL, NULL, 'Rolf', NULL, NULL, NULL, 'rolf@gmail.com', NULL, NULL, '$2y$10$qLhbbD/oXCaZ3Nh/sQoFgOL5F/6brqqYlwIxR7Hi8jQEs5y6KgvJq', NULL, 'Rolfhqzg', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:18:48', '2019-08-21 20:18:48', NULL, NULL),
(19, 11, 'asdad\'s household', '0000000019', NULL, NULL, 'asdad', NULL, NULL, NULL, 'asd@asda.om', NULL, NULL, '$2y$10$iYwMnIti5K0WVlTfJrYxoebibguBVdkqZOxU/gAdxNO5tnLGajnly', NULL, 'asdar2ho', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:19:26', '2019-08-21 20:19:26', NULL, NULL),
(20, 12, 'asdad\'s household', '0000000020', NULL, NULL, 'asdad', NULL, NULL, NULL, 'asd@asda.om', NULL, NULL, '$2y$10$sdMxYZKJ8r7tLibhR1yqW.Gq77K8cfkFlFrlNtJGqhdltq1asI1e6', NULL, 'asdalox9', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:19:35', '2019-08-21 20:19:35', NULL, NULL),
(21, 13, 'asdad\'s household', '0000000021', NULL, NULL, 'asdad', NULL, NULL, NULL, 'asd@asda.om', NULL, NULL, '$2y$10$F7fsvkPyuiQqsUGvh5i1DuGx4aj2u.fchFGQ1NAnOHvLkLpcDeLZm', NULL, 'asdaxunw', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:20:13', '2019-08-21 20:20:13', NULL, NULL),
(22, 14, 'asdas\'s household', '0000000022', NULL, NULL, 'asdas', NULL, NULL, NULL, 'asdsadas@asda.com', NULL, NULL, '$2y$10$UxUj2zJg6oVHU1//uoFIxeMtt5bJHqrDw5ogc3GplRnOlnHmA48Zm', NULL, 'asdaoxit', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:20:57', '2019-08-21 20:20:57', NULL, NULL),
(23, 15, 'asdas\'s household', '0000000023', NULL, NULL, 'asdas', NULL, NULL, NULL, 'asdsadas@asda.com', NULL, NULL, '$2y$10$B3FOg7OqPoJWKGghEsZwT.Wpo77HynqbCPWhHWpQJBhEaNR/YpS9i', NULL, 'asdabdnf', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:21:18', '2019-08-21 20:21:18', NULL, NULL),
(24, 16, 'asdad\'s household', '0000000024', NULL, NULL, 'asdad', NULL, NULL, NULL, 'admin@admin.com', NULL, NULL, '$2y$10$r7mHKoSMyjKtnXTlt/gJpudLuKvpw.N3fjVBu3GElMbjPC/K3YvVm', NULL, 'asdafayk', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:21:37', '2019-08-21 20:21:37', NULL, NULL),
(25, 17, 'asd\'s household', '0000000025', NULL, NULL, 'asd', NULL, NULL, NULL, 'admin@admin.com', NULL, NULL, '$2y$10$dBQQ7KIx82tyEdj0ocTtBOYjdxem7SVD.7iDmYBQHBLOy7jdkNqlq', NULL, 'asdlyqa', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:23:00', '2019-08-21 20:23:00', NULL, NULL),
(26, 18, 'asdsad\'s household', '0000000026', NULL, NULL, 'asdsad', NULL, NULL, NULL, 'asd@asda.com', NULL, NULL, '$2y$10$.pJQIPJd3mZcElZ6Hiu3I.6TC3OBHYA62XBdigfOfUUS/44r27SBu', NULL, 'asdsbgss', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:36:05', '2019-08-21 20:36:05', NULL, NULL),
(27, 19, 'afasf\'s household', '0000000027', NULL, NULL, 'afasf', NULL, NULL, NULL, 'asf@asda.com', NULL, NULL, '$2y$10$EIX8buYeTpgoDN2sO/8DT.QVIJUhCEOGcET0bEsKtJMIFBc4ms5E.', NULL, 'afasgnki', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:40:59', '2019-08-21 20:40:59', NULL, NULL),
(28, 20, 'sdfsfs\'s household', '0000000028', NULL, NULL, 'sdfsfs', NULL, NULL, NULL, 'sdf@asda.com', NULL, NULL, '$2y$10$qaSbJwu9ZQQZ31kIbTyCXOYnfE5i10z4japd1G8jkUrbXaPAStenS', NULL, 'sdfshvft', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:42:15', '2019-08-21 20:42:15', NULL, NULL),
(29, 21, 'asdasd\'s household', '0000000029', NULL, NULL, 'asdasd', NULL, NULL, NULL, 'asdsa@asda.com', NULL, NULL, '$2y$10$rf9ihg3CWnxHoMKd9fXUku5wfRirbbxOkjCU7z/eV957yzDd0B9Ri', NULL, 'asdapd8g', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:43:12', '2019-08-21 20:43:12', NULL, NULL),
(30, 22, 'asdad\'s household', '0000000030', NULL, NULL, 'asdad', NULL, NULL, NULL, 'asdad@asda.com', NULL, NULL, '$2y$10$Ct1bRJza3zHKQrZc9bMjH.YimUsyoTamTZ8pWE3As8Rc12hG7tlzS', NULL, 'asdabiha', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-21 20:44:15', '2019-08-21 20:44:15', NULL, NULL);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
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
  MODIFY `chId` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comm_details`
--
ALTER TABLE `comm_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `comm_masters`
--
ALTER TABLE `comm_masters`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `comm_templates`
--
ALTER TABLE `comm_templates`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `eventId` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `households`
--
ALTER TABLE `households`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `household_user`
--
ALTER TABLE `household_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `master_lookup_data`
--
ALTER TABLE `master_lookup_data`
  MODIFY `mldId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=646;
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
  MODIFY `orgId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
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
