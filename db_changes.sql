

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

/*04 Aug 2019 Sathish*/

CREATE TABLE IF NOT EXISTS `group_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(20) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `description` text,
  `map_view_public_grp` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=Enable,2=Disable',
  `meeting_schedule` text,
  `group_description` text,
  `location_id` bigint(20) DEFAULT NULL,
  `show_map` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Show,2=DoNotShow',
  `mem_vis_see_leader` text COMMENT 'store in serialized data',
  `mem_vis_see_other_mem` text COMMENT 'store in serialized data',
  `enroll_sett_autoclose_on` date DEFAULT NULL,
  `enroll_sett_autoclose_reaches` int(11) DEFAULT NULL,
  `enroll_sett_autoclose_exceeds` int(11) DEFAULT NULL,
  `leader_access_search_people` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Allow to search,2=Do not allow to search',
  `evt_sett_calendar_pub` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=List,2=Do not list',
  `evt_sett_ask_leader_attend` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Attend,2=Do not attend',
  `send_remind_email_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=on,2=off',
  `send_remind_email` varchar(255) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*04 Aug 2019 Sathish*/

--
-- Table structure for table `group_tag_element`
--

CREATE TABLE IF NOT EXISTS `group_tag_element` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(20) DEFAULT NULL,
  `group_tag_header_id` bigint(20) DEFAULT NULL,
  `group_tag_element_name` varchar(255) DEFAULT NULL,
  `element_order` int(20) DEFAULT NULL,
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
-- Table structure for table `group_tag_header`
--

CREATE TABLE IF NOT EXISTS `group_tag_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(20) DEFAULT NULL,
  `group_tag_header_name` varchar(255) DEFAULT NULL,
  `display_public` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=display,2=donot display',
  `allow_to_select_multiple` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Allow multiple,2=Allow Single only',
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(20) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `group_description` text,
  `group_type_id` bigint(20) DEFAULT NULL,
  `meeting_schedule` text,
  `display_meeting_schedule` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Display,2=Do not display',
  `location_id` bigint(20) DEFAULT NULL,
  `show_map` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=Show,2=DoNotShow',
  `enroll_sett_autoclose_on` date DEFAULT NULL,
  `enroll_sett_autoclose_reaches` int(11) DEFAULT NULL,
  `enroll_sett_autoclose_exceeds` int(11) DEFAULT NULL,
  `leader_access_search_people` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Allow to search,2=Do not allow to search',
  `evt_sett_ask_leader_attend` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Attend,2=Do not attend',
  `attd_remind_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=on,2=off',
  `attd_remind_email_user_id` bigint(20) DEFAULT NULL,
  `send_remind_email_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=on,2=off',
  `send_remind_email` varchar(255) DEFAULT NULL,
  `group_page_visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Public,2=Private',
  `group_enrollment` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Open,2=Closed',
  `group+contact_person_email` text,
  `list_leader_name_publicly` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Show,2=DoNotShow',
  `calendar_settings` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Show,2=DoNotShow',
  `group_image` text,
  `group_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Active,2=Archive',
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
-- Table structure for table `group_has_tags`
--

CREATE TABLE IF NOT EXISTS `group_has_tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) DEFAULT NULL,
  `group_tag_element_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;