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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;
 
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `comm_master`
--
 
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;
 
