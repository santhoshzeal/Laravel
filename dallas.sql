-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 16, 2019 at 07:34 AM
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
  `chINDateTime` timestamp NULL DEFAULT NULL,
  `chOUTDateTime` timestamp NULL DEFAULT NULL,
  `chKind` int(11) DEFAULT NULL COMMENT 'user type with ''Regular'',''Guest'',''Volunteer''',
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
-- Table structure for table `comm_detail`
--

CREATE TABLE IF NOT EXISTS `comm_detail` (
  `cdId` bigint(20) NOT NULL AUTO_INCREMENT,
  `cmId` bigint(20) NOT NULL,
  `cdToId` bigint(20) NOT NULL,
  `cdMsgReceivedDatetime` datetime DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comm_master`
--

CREATE TABLE IF NOT EXISTS `comm_master` (
  `cmId` bigint(20) NOT NULL AUTO_INCREMENT,
  `cmType` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Email,2=Notification',
  `cmSubject` varchar(255) DEFAULT NULL,
  `cmBody` text,
  `cmFromId` bigint(20) DEFAULT NULL COMMENT 'From UserId',
  `cmMsgSentDatetime` datetime DEFAULT NULL,
  `cmReadStatus` varchar(150) NOT NULL DEFAULT 'UNREAD' COMMENT 'Read status:READ,UNREAD',
  `cmDeleteStatus` varchar(150) NOT NULL DEFAULT 'UNDELETED' COMMENT 'Message status:DELETED,UNDELETED',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `eventId` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `households`
--

CREATE TABLE IF NOT EXISTS `households` (
  `hhId` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(20) NOT NULL,
  `hhPrimaryUserId` bigint(20) NOT NULL,
  `hhdName` varchar(250) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`hhId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `households`
--

INSERT INTO `households` (`hhId`, `orgId`, `hhPrimaryUserId`, `hhdName`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 2, 'gt gtgtg', NULL, '2019-08-09 16:06:22', NULL, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `household_details`
--

CREATE TABLE IF NOT EXISTS `household_details` (
  `hhdId` bigint(20) NOT NULL AUTO_INCREMENT,
  `hhId` bigint(20) NOT NULL,
  `hhdUserId` bigint(20) NOT NULL,
  `hhIsPrimary` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=Primary,2=Normal User',
  `createdBy` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`hhdId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `household_details`
--

INSERT INTO `household_details` (`hhdId`, `hhId`, `hhdUserId`, `hhIsPrimary`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 1, 2, 1, NULL, '2019-08-09 16:06:40', NULL, '0000-00-00 00:00:00', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=130 ;

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
(61, 0, 'marital_status', 'Legally separated', 'A', 1, NULL, '2019-08-10 14:03:54', NULL, '0000-00-00 00:00:00', NULL, NULL),
(62, 0, 'marital_status', 'Divorced', 'A', 1, NULL, '2019-08-10 14:03:54', NULL, '0000-00-00 00:00:00', NULL, NULL),
(63, 0, 'marital_status', 'unknown', 'A', 1, NULL, '2019-08-10 14:03:54', NULL, '0000-00-00 00:00:00', NULL, NULL),
(64, 1, 'marital_status', 'Legally separated', 'A', 1, NULL, '2019-08-10 08:33:54', NULL, '0000-00-00 00:00:00', NULL, NULL),
(65, 1, 'marital_status', 'Divorced', 'A', 1, NULL, '2019-08-10 08:33:54', NULL, '0000-00-00 00:00:00', NULL, NULL),
(66, 1, 'marital_status', 'unknown', 'A', 1, NULL, '2019-08-10 08:33:54', NULL, '0000-00-00 00:00:00', NULL, NULL),
(67, 2, 'school_name', 'High School', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(68, 2, 'school_name', 'Middle School', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(69, 2, 'name_prefix', 'Mr.', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(70, 2, 'name_prefix', 'Mrs.', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(71, 2, 'name_prefix', 'Ms.', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(72, 2, 'name_prefix', 'Miss', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(73, 2, 'name_prefix', 'Dr.', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(74, 2, 'name_prefix', 'Rev.', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(75, 2, 'name_suffix', 'Jr.', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(76, 2, 'name_suffix', 'Sr.', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(77, 2, 'name_suffix', 'Ph.D.', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(78, 2, 'name_suffix', 'II', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(79, 2, 'name_suffix', 'III', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(80, 2, 'membership_inactive_reason', 'Moved', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(81, 2, 'membership_inactive_reason', 'New Church', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(82, 2, 'membership_inactive_reason', 'Deceased', 'A', 4, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(83, 2, 'marital_status', 'Single', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(84, 2, 'marital_status', 'Married', 'A', 4, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(85, 2, 'marital_status', 'Widowed', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(86, 2, 'membership_status', 'Member', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(87, 2, 'membership_status', 'Regular Attender', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(88, 2, 'membership_status', 'Visitor', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(89, 2, 'membership_status', 'Participant', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(90, 2, 'membership_status', 'In Progress', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(91, 2, 'grade_name', 'Pre-K', 'A', 4, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(92, 2, 'grade_name', 'K', 'A', 4, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(93, 2, 'grade_name', '1st', 'A', 4, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(94, 2, 'grade_name', '2nd', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(95, 2, 'grade_name', '3rd', 'A', 4, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(96, 2, 'marital_status', 'Legally separated', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(97, 2, 'marital_status', 'Divorced', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL),
(98, 2, 'marital_status', 'unknown', 'A', 1, NULL, '2019-08-14 10:19:58', NULL, '2019-08-14 10:19:58', NULL, NULL);

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
(2, 'App\\User', 2),
(5, 'App\\User', 2),
(2, 'App\\User', 3),
(2, 'App\\User', 4),
(8, 'App\\User', 4);

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
('07a0d977f849e382f28e564ca3e849f094522fdb38f70fa0edc387c74172964d837fbcc2f9fa4eb7', 102, 1, 'dollar', '[]', 0, '2019-08-01 00:18:44', '2019-08-01 00:18:44', '2020-08-01 05:48:44'),
('0b579cabfeb9d77c7f2b911e4b14ec69836badaa842cf9c2dd5c0a3ac160b648bbe48e6fa9c8d5ba', 2, 1, 'dollar', '[]', 0, '2019-08-15 10:58:35', '2019-08-15 10:58:35', '2020-08-15 16:28:35'),
('0c21ab37326a5fe60f6253712867a195e044c83a78ca936e1d976a743be49064c0782fb9375bbb23', 2, 1, 'dollar', '[]', 0, '2019-08-09 00:55:24', '2019-08-09 00:55:24', '2020-08-09 06:25:24'),
('1a90bf58b10200f51daa2ba4bf23595592496cdc0b6893ff5c160409ba3609ec43196ec7cb164c1d', 102, 1, 'dollar', '[]', 0, '2019-07-28 01:54:42', '2019-07-28 01:54:42', '2020-07-28 07:24:42'),
('1ce0b7eb3eef6daef603e83eecd898b65d29d23e40b4a1e23627093565a780934260d64c21ec096c', 108, 1, 'dollar', '[]', 0, '2019-08-01 20:30:56', '2019-08-01 20:30:56', '2020-08-02 02:00:56'),
('21a4f8e567513b729d9d1ea891cf9a3ade6f2dae425aecc3c6ce078a6924219192e818744d6ffad2', 87, 1, 'dollar', '[]', 0, '2019-07-08 17:29:30', '2019-07-08 17:29:30', '2020-07-09 04:29:30'),
('28fa779f44500257026b3967c06a29f3d9b77b1396540e7515d685136f0dd718599ad367780b9182', 2, 1, 'dollar', '[]', 0, '2019-08-01 21:22:44', '2019-08-01 21:22:44', '2020-08-02 02:52:44'),
('36bdd74e89292be6eef5b0cb8e38a0b58bc494fffe1c51ecad0ba24827d66f243bd0892b5db52a53', 87, 1, 'dollar', '[]', 0, '2019-07-21 08:17:55', '2019-07-21 08:17:55', '2020-07-21 13:47:55'),
('391a907e599a8b11088852ad6c0be3deabf032751a058b5da2cb04f29f2c01dc3bf3f49918d758e0', 88, 1, 'dollar', '[]', 0, '2019-07-07 21:00:48', '2019-07-07 21:00:48', '2020-07-08 08:00:48'),
('3f03c17ffaa316e2f40544c23dfad0bca53686e077c31f26eaabd3cfc931051d52e54dae2ef95a03', 2, 1, 'dollar', '[]', 0, '2019-08-15 06:19:46', '2019-08-15 06:19:46', '2020-08-15 11:49:46'),
('3f23ab8d6c51854fdb06e7981ba08f6eb3241d321a959f1857a170288212c1215817d7a40e030c80', 87, 1, 'dollar', '[]', 0, '2019-07-01 23:41:27', '2019-07-01 23:41:27', '2020-07-02 10:41:27'),
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
('60b2f22a4f7872ded260040b471111183e9d09be5fa76937ee14236deaf49b88ac6ef185d25af745', 2, 1, 'dollar', '[]', 0, '2019-08-15 06:20:35', '2019-08-15 06:20:35', '2020-08-15 11:50:35'),
('7a8ed7f6784155e6f79aafd98622bd4701dc405dfc7aaea06e4ae2f390ffc556e5a216404ead66c2', 102, 1, 'dollar', '[]', 0, '2019-07-30 06:19:21', '2019-07-30 06:19:21', '2020-07-30 11:49:21'),
('7cd0affdc7cf0d59cfbe6f349e92c8373f43cf6029b92ffcf14bd2346025320bffb2c1d0cc67b42b', 87, 1, 'dollar', '[]', 0, '2019-07-19 05:16:31', '2019-07-19 05:16:31', '2020-07-19 10:46:31'),
('85eed215edfab464c4242fe6b10a30ee3ac274aecbb31d9e0342863ab60772a729eccf0eb7e0b1be', 2, 1, 'dollar', '[]', 0, '2019-08-09 10:30:44', '2019-08-09 10:30:44', '2020-08-09 16:00:44'),
('8dfb82e9ee2286648a760362c9dc41a360bdf7a3afa845467991c178da35bb77c6843e8a1cddacfc', 87, 1, 'dollar', '[]', 0, '2019-07-20 06:49:51', '2019-07-20 06:49:51', '2020-07-20 12:19:51'),
('9262250e837dad1b323e9d5a88be720bf5226bfb7e5e09786c430abe01e1611bb4b4569de15063ca', 102, 1, 'dollar', '[]', 0, '2019-07-28 21:42:12', '2019-07-28 21:42:12', '2020-07-29 03:12:12'),
('9350e3dceb288328d7cc193b76abc3d7a6079abd17e0aa4d72a276ddc59f4258b0a33bbb76fc7fa1', 87, 1, 'dollar', '[]', 0, '2019-07-02 22:51:19', '2019-07-02 22:51:19', '2020-07-03 09:51:19'),
('966ff81d182c248a96dbe1eba2f4bf014a5165d887948a5fdb6dcfe131adf023376e0cee93726984', 87, 1, 'dollar', '[]', 0, '2019-07-20 06:02:44', '2019-07-20 06:02:44', '2020-07-20 11:32:44'),
('97455615e8404b7eb4f4c3c405a36c3bdd0d1be70c567d34abb65652ee1e2c0f9d2e42b87dd1b249', 109, 1, 'dollar', '[]', 0, '2019-08-01 20:41:57', '2019-08-01 20:41:57', '2020-08-02 02:11:57'),
('98e1fd302a1802860adb5aacf630c18b587ef8b3b8d1fbddc6b50338470ba33c553b8e24bb71183d', 2, 1, 'dollar', '[]', 0, '2019-08-01 21:21:28', '2019-08-01 21:21:28', '2020-08-02 02:51:28'),
('998f75837a26d1ecf33769de49cf9c4d1d8e4e7d3a378795676fc63f9e96b696ff6d5c8d3b23c75c', 102, 1, 'dollar', '[]', 0, '2019-08-01 19:42:12', '2019-08-01 19:42:12', '2020-08-02 01:12:12'),
('9a89208149fd4708e7c5270e86e8a4c9c48331cc27a56e10232dec5246a0d4f485cacc8548901fde', 2, 1, 'dollar', '[]', 0, '2019-08-01 21:47:44', '2019-08-01 21:47:44', '2020-08-02 03:17:44'),
('9acc811b09067b2ef20f6bbac4ce8c7e1bdabf41506952b327a3d2f3b1ed1dd8591e44827941e409', 87, 1, 'dollar', '[]', 0, '2019-07-24 05:55:30', '2019-07-24 05:55:30', '2020-07-24 11:25:30'),
('a1525dec8a326cc17169ac39feb7c53ab48f7ec45677cfc1f4b07d5a4a9ae9d1d86761185fe40e4b', 102, 1, 'dollar', '[]', 0, '2019-07-29 22:22:03', '2019-07-29 22:22:03', '2020-07-30 03:52:03'),
('a695fb2ae5c4f9b5d7d4a3c39bc283d99223a4ee885aaa6bf990d53c0f275d5661d55d9b8106594a', 2, 1, 'dollar', '[]', 0, '2019-08-13 08:46:03', '2019-08-13 08:46:03', '2020-08-13 14:16:03'),
('a89fbd0a3af31335251962bbf5451fecf1849c8ccae7c22faf84f43914806cb175024f19003c2952', 102, 1, 'dollar', '[]', 0, '2019-07-26 19:34:32', '2019-07-26 19:34:32', '2020-07-27 01:04:32'),
('aaebcf0c802dd1e25fb95000b199418ac631b5139dfe3a592c317b16644f8788afaaca1551496c9c', 87, 1, 'dollar', '[]', 0, '2019-07-19 21:37:53', '2019-07-19 21:37:53', '2020-07-20 03:07:53'),
('b483701a33738b0d4bddf6669ae0dc3bfb78a639400ee51b078f0da648d57fa9823604cc5c6276ca', 2, 1, 'dollar', '[]', 0, '2019-08-14 21:42:50', '2019-08-14 21:42:50', '2020-08-15 03:12:50'),
('b6e2732b2d8e641029c0bc214a57a3c2397651e46926f9c2a4b8cd950f0e0d8fb85ebe29e7c5398a', 97, 1, 'dollar', '[]', 0, '2019-07-26 05:12:32', '2019-07-26 05:12:32', '2020-07-26 10:42:32'),
('c54b31c0741ecc7f2f82f3bdad658ffb025623487138922067ba8dda2c296e4cfc17849be45ba82e', 2, 1, 'dollar', '[]', 0, '2019-08-15 08:59:52', '2019-08-15 08:59:52', '2020-08-15 14:29:52'),
('c5a1f10286c5cf1f2f491168f52dc87be1fda2f3209b3c870ccc995af5488efa0a9a64ad5223be4b', 87, 1, 'dollar', '[]', 0, '2019-07-20 06:02:52', '2019-07-20 06:02:52', '2020-07-20 11:32:52'),
('c74dee57928433395de16ae5b3c31fafd226b40ed47504a80e6420bc18977a259fe4ad16cb06a37b', 87, 1, 'dollar', '[]', 0, '2019-07-21 10:18:06', '2019-07-21 10:18:06', '2020-07-21 15:48:06'),
('c8b7cffc21183dade88db801fa144c0bf9b537ce9cdd24b3039199be1bf2acaa92adbfd1646e3dbe', 87, 1, 'dollar', '[]', 0, '2019-07-21 10:17:40', '2019-07-21 10:17:40', '2020-07-21 15:47:40'),
('cbc85c023bed7682d964f90aac54f6a323e113d3c671366632cc3a4067149f76a0469a75e70c571d', 87, 1, 'dollar', '[]', 0, '2019-07-17 23:26:19', '2019-07-17 23:26:19', '2020-07-18 04:56:19'),
('cbf6e87f2c98a13fe8b705c23b5038bcaa2d1309f096f1ee8deadd2c6073c91ad6df07bd77d0c961', 2, 1, 'dollar', '[]', 0, '2019-08-15 11:17:08', '2019-08-15 11:17:08', '2020-08-15 16:47:08'),
('cce2dd49c4c06218a7f6b74c60526b2468ce4b24d2def7ef12db4ce3fcc42d8a20e104161e8cd297', 102, 1, 'dollar', '[]', 0, '2019-07-30 06:33:24', '2019-07-30 06:33:24', '2020-07-30 12:03:24'),
('ccf054bc061a897d428de73a1d7cb16e6424263369cb49a4d52f6d33c267cf0859e33dde2ddb2077', 87, 1, 'dollar', '[]', 0, '2019-07-21 20:15:11', '2019-07-21 20:15:11', '2020-07-22 01:45:11'),
('cf143b92d0c3ba8ef30545797731b6272d432441b277f57ebc2207cd3c90573c45f5e6dc4383159c', 102, 1, 'dollar', '[]', 0, '2019-07-29 03:56:51', '2019-07-29 03:56:51', '2020-07-29 09:26:51'),
('d9a1e66bc3175e5bc39164cfde20bc1e3e3c033cd29f1a56582a19e5298c72e6405fd390f3c888ea', 109, 1, 'dollar', '[]', 0, '2019-08-01 20:40:14', '2019-08-01 20:40:14', '2020-08-02 02:10:14'),
('da42a4b6ea2d457cee636c5d9f4c90fd249a65f8a98540a6f6718c3f7c00c4adbded23fd41473ae2', 2, 1, 'dollar', '[]', 0, '2019-08-01 21:12:19', '2019-08-01 21:12:19', '2020-08-02 02:42:19'),
('dc3aa91d30153caaaa19ee77aa2f081f76c50b1d232cefe4fb99e0fc0ad7467bd143d773c9579cae', 87, 1, 'dollar', '[]', 0, '2019-07-22 05:01:45', '2019-07-22 05:01:45', '2020-07-22 10:31:45'),
('df9e400ec2ff66aad5cdeb79459ed5fb2bbce5fca4ebabd4200e942d3dbaf58ef2b09110bf51f72e', 87, 1, 'dollar', '[]', 0, '2019-07-03 23:19:12', '2019-07-03 23:19:12', '2020-07-04 10:19:12'),
('e4c9348b64a9a9830946ca63e1f28194adfa46e95eba6ea67476f254f6552b108ee437a4fae6d247', 87, 1, 'dollar', '[]', 0, '2019-07-22 23:25:50', '2019-07-22 23:25:50', '2020-07-23 04:55:50'),
('e75da22da958377c6f65d3cc7cf4114fe52e1fc9d1bf9a2ce83839653248e9ef721f63cf66944d84', 102, 1, 'dollar', '[]', 0, '2019-08-01 05:36:49', '2019-08-01 05:36:49', '2020-08-01 11:06:49'),
('e928db91b7e977eb82798a814620e88f26a12e6fabb250dd20635be624c860e12b09996a4e623d81', 102, 1, 'dollar', '[]', 0, '2019-07-30 21:07:17', '2019-07-30 21:07:17', '2020-07-31 02:37:17'),
('eebb59b7600ad24bf44a683072fd4163f9883253a44581e6347415f785688c0590873cd5fa2d7772', 2, 1, 'dollar', '[]', 0, '2019-08-15 04:17:07', '2019-08-15 04:17:07', '2020-08-15 09:47:07'),
('ef9763080456367398a41f2c96b021695bcf0431474633faabbd80c994ffccbc720d1d89b4142b53', 6, 1, 'dollar', '[]', 0, '2019-08-01 21:39:23', '2019-08-01 21:39:23', '2020-08-02 03:09:23'),
('f8b681130c91002bf693e6d379079f80fb226f46684eb934e28e8d56366d556ef9e7a86590e6897e', 2, 1, 'dollar', '[]', 0, '2019-08-10 06:55:37', '2019-08-10 06:55:37', '2020-08-10 12:25:37'),
('f9acd31cd5e915ce5b198de1177029c663b37be6e96530cabc30ccab9fa24bb9f44dc5f8ba75fa9a', 102, 1, 'dollar', '[]', 0, '2019-07-28 07:37:33', '2019-07-28 07:37:33', '2020-07-28 13:07:33');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`orgId`, `orgName`, `orgAddress`, `orgAptUnitBox`, `orgCity`, `orgState`, `orgPincode`, `orgPhone`, `orgLogo`, `orgTimeZone`, `orgTimeCountry`, `orgTimeFormat`, `orgDateFormat`, `orgCurrency`, `orgEmail`, `orgWebsite`, `orgTaxIdNo`, `orgDomain`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 'stpaul', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pacific/Samoa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'stpaul', NULL, '2019-08-01 21:47:28', NULL, '2019-08-15 02:33:01', NULL, NULL),
(2, 'patrick church', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'America/Tijuana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'patrick', NULL, '2019-08-14 10:19:57', NULL, '2019-08-15 02:33:09', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=20 ;

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
(13, 2, 'Nextgen Checkin', 'web', NULL, NULL),
(14, 2, 'Member Directory', 'web', NULL, NULL),
(15, 2, 'Scheduling', 'web', NULL, NULL),
(16, 2, 'Event management', 'web', NULL, NULL),
(17, 2, 'Small Group', 'web', NULL, NULL),
(18, 2, 'Accounting', 'web', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=11 ;

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
(8, 2, 'Admin', 'web', 'admin', '2019-08-14 15:49:57', NULL),
(9, 2, 'Member', 'web', 'member', '2019-08-14 15:49:57', NULL),
(10, 2, 'Volunteer', 'web', 'volunteer', '2019-08-14 15:49:57', NULL);

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
(7, 5),
(8, 5),
(9, 5),
(10, 5),
(11, 5),
(12, 5),
(7, 6),
(7, 7),
(13, 8),
(14, 8),
(15, 8),
(16, 8),
(17, 8),
(18, 8),
(13, 9),
(13, 10);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `orgId`, `householdName`, `personal_id`, `name_prefix`, `given_name`, `first_name`, `last_name`, `middle_name`, `nick_name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `referal_code`, `name_suffix`, `profile_pic`, `dob`, `doa`, `school_name`, `grade_id`, `life_stage`, `mobile_no`, `home_phone_no`, `gender`, `social_profile`, `marital_status`, `address`, `medical_note`, `congregration_status`, `created_at`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, NULL, 'Admin', '0000000001', 'Admin', 'Admin', 'Admin', NULL, NULL, NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'stpaul my name''s household', '0000000002', NULL, NULL, 'stpaul my name', NULL, NULL, NULL, 'stpaul@gmail.com', 'stpaul', NULL, '$2y$10$TT/yxAXlArEmU6dszc75/u5YcuLc.itz4kwBUNO6crWld0jh9oiBC', NULL, 'stpab7bx', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-01 21:47:29', '2019-08-01 21:47:29', NULL, NULL),
(3, 1, 'gtgtgt name''s household', '0000000003', '32', NULL, 'gtgtgt name', NULL, 'asdsad', NULL, 'stpaul@gmail.com', NULL, NULL, '$2y$10$Kd.dM5RyO8uDs0At.EnMAupq2Dlz0iP/3YTQ0L.8CvnGZkTaeZoNa', NULL, 'gtgtshqp', '41', NULL, NULL, NULL, '31', 56, 'Adult', NULL, NULL, 'Male', NULL, '47', 'dede////////////', NULL, NULL, '2019-08-01 21:48:59', '2019-08-15 09:02:31', NULL, NULL),
(4, 2, 'asdad''s household', '0000000004', NULL, NULL, 'asdad', NULL, NULL, NULL, 'admin@admin.com', NULL, NULL, '$2y$10$fHPzRztVSvGX//aAQC3ZCOpxcgPhrAfQfNVp99cVvq6D.VTD7ln6e', NULL, 'asdarmda', NULL, NULL, NULL, NULL, NULL, NULL, 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-14 10:19:58', '2019-08-14 10:19:58', NULL, NULL);

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
