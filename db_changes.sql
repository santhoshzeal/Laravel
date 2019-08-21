/*15 aug 2019*/
ALTER TABLE users DROP INDEX users_email_unique;

/* 19 Aug 2019 7.10AM   Sathish*/
ALTER TABLE `comm_detail` ADD `cdReadStatus` VARCHAR( 255 ) NOT NULL DEFAULT 'UNREAD' COMMENT 'Read status:READ,UNREAD' AFTER `cdMsgReceivedDatetime` ,
ADD `cdDeleteStatus` VARCHAR( 255 ) NOT NULL DEFAULT 'UNDELETED' COMMENT 'Message status:DELETED,UNDELETED' AFTER `cdReadStatus` ;


--
-- Table structure for table `comm_templates`
--

CREATE TABLE IF NOT EXISTS `comm_templates` (
  `ctId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ctTemplateTag` varchar(255) DEFAULT NULL,
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
  PRIMARY KEY (`ctId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;