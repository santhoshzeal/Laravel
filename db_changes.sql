

ALTER TABLE `comm_templates` CHANGE `updated_at` `updated_at` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT NULL; 

/*24 aug 2019 sathish added*/
ALTER TABLE `users` ADD `full_name` TEXT NULL DEFAULT NULL AFTER `nick_name` ;

/*24 aug 2019 ananth added*/
ALTER TABLE `checkins` CHANGE `chKind` `chKind` ENUM('Regular','Guest','Volunteer') NULL DEFAULT 'Regular' COMMENT 'user type with \'Regular\',\'Guest\',\'Volunteer\'';

/*25 aug 2019 sathish*/

ALTER TABLE `events` ADD `eventShowTime` TIME NULL DEFAULT NULL AFTER `eventCheckin` ;
ALTER TABLE `events` ADD `orgId` BIGINT( 20 ) NULL DEFAULT NULL AFTER `eventId` ;

/*25 Aug 2019 Lokesh*/
ALTER TABLE `comm_masters` ADD `name` TEXT NULL DEFAULT NULL AFTER `tag`;

/*31 Aug 2019 Sathish for the rooms and resources*/


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


--added by ananth
ALTER TABLE `resources` ADD `orgId` INT(11) NOT NULL AFTER `id`;
ALTER TABLE `rooms` ADD `orgId` INT(11) NOT NULL AFTER `id`

--added by ananth
INSERT INTO `master_lookup_data` (`mldId`, `orgId`, `mldKey`, `mldValue`, `mldType`, `mldOption`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES (NULL, '0', 'resource_category', 'Electronic', 'A', '4', NULL, '2019-08-23 03:33:55', NULL, '2019-08-23 03:33:55', NULL, NULL);
