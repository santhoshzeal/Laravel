

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