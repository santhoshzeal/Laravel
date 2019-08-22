/*15 aug 2019*/
ALTER TABLE users DROP INDEX users_email_unique;

/* 22 Aug 2019 7.10AM   Sathish*/



CREATE TABLE IF NOT EXISTS `comm_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comm_master_id` bigint(20) NOT NULL,
  `cdToUserId` bigint(20) NOT NULL,
  `cdMsgReceivedDatetime` datetime DEFAULT NULL,
  `cdReadStatus` varchar(255) NOT NULL DEFAULT 'UNREAD' COMMENT 'Read status:READ,UNREAD',
  `cdDeleteStatus` varchar(255) NOT NULL DEFAULT 'UNDELETED' COMMENT 'Message status:DELETED,UNDELETED',
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
-- Table structure for table `comm_master`
--

CREATE TABLE IF NOT EXISTS `comm_master` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comm_templates_id` bigint(20) NOT NULL,
  `orgId` bigint(20) NOT NULL,
  `cmType` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Email,2=Notification',
  `cmSubject` varchar(255) DEFAULT NULL,
  `cmBody` text,
  `cmFromUserId` bigint(20) DEFAULT NULL COMMENT 'From UserId',
  `cmMsgSentDatetime` datetime DEFAULT NULL,
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
-- Table structure for table `comm_templates`
--

CREATE TABLE IF NOT EXISTS `comm_templates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ctTag` varchar(255) DEFAULT NULL,
  `ctName` varchar(255) DEFAULT NULL,
  `ctSubject` text,
  `ctBody` text,
  `orgId` bigint(20) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `comm_templates`
--

INSERT INTO `comm_templates` (`id`, `ctTag`, `ctName`, `ctSubject`, `ctBody`, `orgId`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 0, NULL, '2019-08-22 16:01:18', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 0, NULL, '2019-08-22 16:01:18', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 0, NULL, '2019-08-22 16:01:35', NULL, '0000-00-00 00:00:00', NULL, NULL),
(4, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 1, NULL, '2019-08-22 10:31:18', NULL, '2019-08-22 16:02:10', NULL, NULL),
(5, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 1, NULL, '2019-08-22 10:31:18', NULL, '2019-08-22 16:02:12', NULL, NULL),
(6, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 1, NULL, '2019-08-22 10:31:35', NULL, '2019-08-22 16:02:13', NULL, NULL);


ALTER TABLE `events` CHANGE `eventCheckin` `eventCheckin` TIME NULL DEFAULT NULL ,
CHANGE `eventStartCheckin` `eventStartCheckin` TIME NULL DEFAULT NULL ,
CHANGE `eventEndCheckin` `eventEndCheckin` TIME NULL DEFAULT NULL ;

ALTER TABLE `events` ADD `eventDesc` TEXT NULL DEFAULT NULL AFTER `eventFreq` ;

ALTER TABLE `checkins` ADD `user_id` BIGINT( 20 ) NULL DEFAULT NULL AFTER `eventId` ;