
SET FOREIGN_KEY_CHECKS=0;
truncate checkins;
truncate comm_details;
truncate comm_masters;
truncate comm_templates;
truncate events;
truncate households;
truncate household_user;
truncate master_lookup_data;
truncate model_has_permissions;
truncate model_has_roles;
truncate organization;
truncate permissions;
truncate resources;
truncate roles;
truncate role_has_permissions;
truncate rooms;
truncate users;
SET FOREIGN_KEY_CHECKS=1;


INSERT INTO `comm_templates` (`id`, `tag`, `name`, `subject`, `body`, `org_id`, `createdBy`, `created_at`, `updatedBy`, `updated_at`, `deletedBy`, `deleted_at`) VALUES
(1, 'welcome', 'Welcome Email', 'Welcome Email Sujbect', 'Welcome Email Body', 0, NULL, '2019-08-22 10:31:18', NULL, '0000-00-00 00:00:00', NULL, NULL),
(2, 'household_added', 'household_added name', 'household_added subj', 'household_added body', 0, NULL, '2019-08-22 10:31:18', NULL, '0000-00-00 00:00:00', NULL, NULL),
(3, 'event_added', 'event_added name', 'event_added sub ', 'event_added body', 0, NULL, '2019-08-22 10:31:35', NULL, '0000-00-00 00:00:00', NULL, NULL);




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
(29, 0, 'grade_name', '3rd', 'A', 4, NULL, '2019-07-11 00:13:30', NULL, '2019-07-16 23:09:52', NULL, NULL);


INSERT INTO `permissions` (`id`, `orgId`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 0, 'Nextgen Checkin', 'web', '2019-05-05 13:51:47', '2019-05-05 13:51:47'),
(2, 0, 'Member Directory', 'web', '2019-05-05 13:51:47', '2019-05-05 13:51:47'),
(3, 0, 'Scheduling', 'web', '2019-05-05 13:51:47', '2019-05-05 14:43:48'),
(4, 0, 'Event management', 'web', '2019-05-05 13:51:47', '2019-05-05 13:51:47'),
(5, 0, 'Small Group', 'web', '2019-05-05 14:30:09', '2019-05-05 14:38:33'),
(6, 0, 'Accounting', 'web', '2019-05-05 14:30:21', '2019-05-05 14:38:37');



INSERT INTO `roles` (`id`, `orgId`, `name`, `guard_name`, `role_tag`, `created_at`, `updated_at`) VALUES
(1, 0, 'Super Adminin', 'web', 'superadmin', '2019-05-05 08:22:07', '2019-05-05 08:22:07'),
(2, 0, 'Adminstrator', 'web', 'admin', '2019-05-05 08:22:08', '2019-08-25 02:57:41'),
(3, 0, 'Member', 'web', 'member', '2019-05-05 09:20:10', '2019-05-05 09:20:10'),
(4, 0, 'Volunteer', 'web', 'volunteer', '2019-07-26 04:48:18', '2019-07-26 04:48:18'),
(5, 0, 'Pastor', 'pastor', 'pastor', '2019-08-25 02:59:13', NULL),
(6, 0, 'First Time Guest', 'First Time Guest\r\n', 'firsttimeguest', '2019-08-25 02:59:13', NULL),
(7, 0, 'Inactive Member', 'Inactive Member', 'InactiveMember', '2019-08-25 02:59:52', NULL),
(8, 0, 'Checkin Volunteer', 'Checkin Volunteer', 'CheckinVolunteer', '2019-08-25 02:59:52', NULL),
(9, 0, 'Event Organizer', 'Event Organizer', 'EventOrganizer', '2019-08-25 03:00:12', NULL),
(10, 0, 'Production Manager', 'Production Manager', 'ProductionManager', '2019-08-25 03:00:12', NULL),
(11, 0, 'Accounts Admin', 'Accounts Admin', 'AccountsAdmin', '2019-08-25 03:00:29', NULL),
(12, 0, 'Visitor', 'Visitor', 'Visitor', '2019-08-25 03:00:29', NULL);

