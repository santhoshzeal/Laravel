

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



--added by ananth
INSERT INTO `master_lookup_data` (`mldId`, `orgId`, `mldKey`, `mldValue`, `mldType`, `mldOption`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES (NULL, '0', 'room_group', 'Group1', 'A', '4', NULL, '2019-08-23 03:33:55', NULL, '2019-08-23 03:33:55', NULL, NULL);

ALTER TABLE `events` ADD `eventRoom` INT(11) NULL AFTER `eventLocation`, ADD `eventResource` INT(11) NULL AFTER `eventRoom`;

--------------- Dynamic forms Table Structure
CREATE TABLE IF NOT EXISTS `forms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(20) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `fields` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

--------------- Dynamic form_submissions Table Structure
CREATE TABLE IF NOT EXISTS `form_submissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(20) DEFAULT NULL,
  `form_id` bigint(20) DEFAULT NULL,
  `profile_fields` varchar(1000) DEFAULT NULL,
  `general_fields` varchar(1000) DEFAULT NULL,
  `fields` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

------------------ Altering FORM table
ALTER TABLE `forms` ADD `is_active` INT NOT NULL DEFAULT '1' COMMENT '1 - active, 2 - deactive' AFTER `fields`;

------------------ Altering FORM table and adding profile_fields Column
ALTER TABLE `forms` ADD `profile_fields` VARCHAR(250) NULL AFTER `fields`;

------------------ Altering form_submissions Table and dropping fields column
ALTER TABLE `form_submissions` DROP `fields`;

------------------ Altering FORM table and adding general_fields Column Lokesh
ALTER TABLE `forms` ADD `general_fields` VARCHAR(500) NULL DEFAULT NULL AFTER `profile_fields`;

-----07-Sep-2019  Sathish
ALTER TABLE `resources` ADD `room_id` BIGINT( 20 ) NULL DEFAULT NULL AFTER `approval_group` ;
ALTER TABLE `resources` CHANGE `approval_group` `approval_group` INT( 20 ) NULL DEFAULT NULL COMMENT 'From ''roles'' table role id resepective of orgId';

ALTER TABLE `rooms` ADD `approval_group` INT( 20 ) NULL DEFAULT NULL COMMENT 'From ''''roles'''' table role id resepective of orgId' AFTER `building_number` ;
ALTER TABLE `resources` ADD `quantity` INT( 20 ) NULL DEFAULT NULL AFTER `approval_group` ;

------ 09-Sep-2019 Lokesh
ALTER TABLE `forms` CHANGE `fields` `fields` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

--11 Sep 2019 Sathish
DROP TABLE `groups`, `group_has_tags`, `group_tag_element`, `group_tag_header`, `group_type`;


--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `notes` text,
  `image_path` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=Enable,2=Disable',
  `meeting_schedule` text,
  `locationId` bigint(20) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `visible_leaders_fields` text COMMENT 'store in serialized data',
  `visible_members_fields` text COMMENT 'store in serialized data',
  `is_enroll_autoClose_on` date DEFAULT NULL,
  `is_enroll_autoClose_count` tinyint(1) DEFAULT '1' COMMENT '1=Allow to search,2=Do not allow to search',
  `enroll_autoClose_count` int(11) DEFAULT NULL,
  `is_enroll_notify_count` tinyint(1) NOT NULL DEFAULT '1',
  `enroll_notify_count` int(11) DEFAULT NULL,
  `can_leaders_search_people` tinyint(1) NOT NULL DEFAULT '1',
  `is_event_public` tinyint(1) NOT NULL DEFAULT '1',
  `is_event_remind` tinyint(1) NOT NULL DEFAULT '1',
  `event_remind_before` int(11) DEFAULT NULL,
  `can_leaders_take_attendance` tinyint(11) NOT NULL DEFAULT '1',
  `enroll_status` tinyint(1) NOT NULL DEFAULT '1',
  `enroll_msg` text,
  `leader_visibility_publicly` tinyint(1) NOT NULL DEFAULT '1',
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
  `isMutiDay_event` tinyint(1) NOT NULL DEFAULT '1',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `repeat` varchar(255) DEFAULT NULL,
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
-- Table structure for table `group_events_attendace`
--

CREATE TABLE IF NOT EXISTS `group_events_attendace` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(22) DEFAULT NULL,
  `group_event_id` bigint(22) DEFAULT NULL,
  `user_id` bigint(22) DEFAULT NULL,
  `checkin_at` datetime DEFAULT NULL,
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
  `group_id` bigint(22) DEFAULT NULL,
  `user_id` bigint(22) DEFAULT NULL,
  `role` int(11) NOT NULL,
  `member_since` date DEFAULT NULL,
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
-- Table structure for table `group_resources`
--

CREATE TABLE IF NOT EXISTS `group_resources` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(22) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `source` text,
  `description` text,
  `visibility` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_types`
--

CREATE TABLE IF NOT EXISTS `group_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgId` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `d_isPublic` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=Enable,2=Disable',
  `d_meeting_schedule` text,
  `d_description` text,
  `locationId` bigint(20) DEFAULT NULL,
  `d_contact_email` varchar(255) DEFAULT NULL,
  `d_visible_leaders_fields` text COMMENT 'store in serialized data',
  `d_visible_members_fields` text COMMENT 'store in serialized data',
  `d_is_enroll_autoClose_on` date DEFAULT NULL,
  `d_is_enroll_autoClose_count` tinyint(1) DEFAULT '1' COMMENT '1=Allow to search,2=Do not allow to search',
  `d_enroll_autoClose_count` int(11) DEFAULT NULL,
  `d_is_enroll_notify_count` tinyint(1) NOT NULL DEFAULT '1',
  `d_enroll_notify_count` int(11) DEFAULT NULL,
  `d_can_leaders_search_people` tinyint(1) NOT NULL DEFAULT '1',
  `d_is_event_public` tinyint(1) NOT NULL DEFAULT '1',
  `d_is_event_remind` tinyint(1) NOT NULL DEFAULT '1',
  `d_event_remind_before` int(11) DEFAULT NULL,
  `d_can_leaders_take_attendance` tinyint(11) NOT NULL DEFAULT '1',
  `d_enroll_status` tinyint(1) NOT NULL DEFAULT '1',
  `d_enroll_msg` text,
  `d_leader_visibility_publicly` tinyint(1) NOT NULL DEFAULT '1',
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
  `name` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
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
  `isPublic` tinyint(1) NOT NULL DEFAULT '1',
  `isMultiple_select` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) DEFAULT NULL,
  `createdBy` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` text,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deletedBy` text,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- Group related Tables Changes 11-9-2019 Lokesh
ALTER TABLE `group_types` DROP `d_is_enroll_autoClose_on`;
ALTER TABLE `group_types` CHANGE `d_isPublic` `d_isPublic` BOOLEAN NOT NULL DEFAULT TRUE COMMENT '1=Enable,0=Disable';
ALTER TABLE `group_types` DROP `locationId`;
ALTER TABLE `group_types` ADD `d_location` VARCHAR(150) NULL DEFAULT NULL AFTER `d_description`;
ALTER TABLE `group_types` ADD `d_is_enroll_autoClose` BOOLEAN NOT NULL DEFAULT FALSE AFTER `d_visible_members_fields`;
ALTER TABLE `group_types` ADD `d_enroll_autoClose_on` DATE NULL DEFAULT NULL AFTER `d_is_enroll_autoClose`;
ALTER TABLE `group_types` CHANGE `d_is_enroll_autoClose_count` `d_is_enroll_autoClose_count` TINYINT NULL DEFAULT '0' COMMENT '1=Enable,2=Disable';
ALTER TABLE `group_types` CHANGE `d_is_enroll_notify_count` `d_is_enroll_notify_count` BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE `group_types` CHANGE `d_event_remind_before` `d_event_remind_before` VARCHAR(25) NULL DEFAULT NULL;
ALTER TABLE `group_types` CHANGE `d_can_leaders_search_people` `d_can_leaders_search_people` BOOLEAN NOT NULL DEFAULT TRUE;
ALTER TABLE `group_types` CHANGE `d_can_leaders_take_attendance` `d_can_leaders_take_attendance` BOOLEAN NOT NULL DEFAULT TRUE;
ALTER TABLE `group_types` CHANGE `d_is_event_public` `d_is_event_public` BOOLEAN NOT NULL DEFAULT TRUE;
ALTER TABLE `groups` CHANGE `orgId` `orgId` BIGINT(20) NOT NULL;
ALTER TABLE `groups` ADD `groupType_id` BIGINT(20) NULL DEFAULT NULL AFTER `orgId`;
ALTER TABLE `groups` CHANGE `isPublic` `isPublic` TINYINT NOT NULL DEFAULT '1' COMMENT '1=Enable,0=Disable';
ALTER TABLE `groups` CHANGE `locationId` `location` VARCHAR(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;
ALTER TABLE `groups` DROP `is_enroll_autoClose_on`;
ALTER TABLE `groups` ADD `is_enroll_autoClose` BOOLEAN NOT NULL DEFAULT FALSE AFTER `visible_members_fields`;
ALTER TABLE `groups` ADD `enroll_autoClose_on` DATE NULL DEFAULT NULL AFTER `is_enroll_autoClose`;
ALTER TABLE `groups` CHANGE `is_enroll_autoClose_count` `is_enroll_autoClose_count` BOOLEAN NULL DEFAULT FALSE COMMENT '1=enable, 0=desable';
ALTER TABLE `groups` CHANGE `is_enroll_notify_count` `is_enroll_notify_count` BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE `groups` CHANGE `event_remind_before` `event_remind_before` VARCHAR(25) NULL DEFAULT NULL;
ALTER TABLE `groups` CHANGE `can_leaders_search_people` `can_leaders_search_people` BOOLEAN NOT NULL DEFAULT TRUE;
ALTER TABLE `groups` CHANGE `can_leaders_take_attendance` `can_leaders_take_attendance` BOOLEAN NOT NULL DEFAULT TRUE;
ALTER TABLE `groups` CHANGE `is_event_public` `is_event_public` BOOLEAN NOT NULL DEFAULT TRUE;

--- Pastor board related tables Sathish 11- Sep 2019


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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

INSERT INTO `dallas`.`master_lookup_data` (`mldId`, `orgId`, `mldKey`, `mldValue`, `mldType`, `mldOption`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES (NULL, '0', 'pastor_board', 'Electronic', 'A', '1', NULL, CURRENT_TIMESTAMP, NULL, '0000-00-00 00:00:00', NULL, NULL), (NULL, '0', 'pastor_board', 'Home Care', 'A', '1', NULL, CURRENT_TIMESTAMP, NULL, '0000-00-00 00:00:00', NULL, NULL);
