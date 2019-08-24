

ALTER TABLE `comm_templates` CHANGE `updated_at` `updated_at` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT NULL; 

/*24 aug 2019 sathish added*/
ALTER TABLE `users` ADD `user_full_name` TEXT NULL DEFAULT NULL AFTER `nick_name` ;