-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2017 at 07:57 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_digital_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'updated', 1, 'Tyondo\\Mnara\\Models\\User', 1, 'Tyondo\\Mnara\\Models\\User', '{\"attributes\":{\"name\":\"admin\",\"email\":\"admin@admin.com\"},\"old\":{\"name\":\"admin\",\"email\":\"admin@admin.com\"}}', '2017-05-24 14:52:19', '2017-05-24 14:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `draft_orders`
--

CREATE TABLE `draft_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_number_id` int(11) NOT NULL,
  `product` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `product_total_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `draft_orders`
--

INSERT INTO `draft_orders` (`id`, `user_id`, `order_number_id`, `product`, `quantity`, `unit_price`, `product_total_order`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Mobile Phone2', 2, 302, 604, '2017-05-24 10:24:12', '2017-05-24 10:24:12'),
(2, 1, 2, 'Mobile Phone3', 2, 245, 490, '2017-05-24 10:24:12', '2017-05-24 10:24:12'),
(3, 1, 2, 'Mobile Phone1', 1, 350, 350, '2017-05-24 10:24:12', '2017-05-24 10:24:12'),
(4, 1, 2, 'Red Mobile', 1, 65, 65, '2017-05-24 10:24:12', '2017-05-24 10:24:12'),
(5, 1, 3, 'Mobile Phone2', 10, 302, 604, '2017-05-24 12:55:53', '2017-05-24 14:30:39'),
(6, 1, 3, 'Mobile Phone3', 3, 245, 490, '2017-05-24 12:55:53', '2017-05-24 14:25:06');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2015_01_20_084450_create_roles_table', 1),
(4, '2015_01_20_084525_create_role_user_table', 1),
(5, '2015_01_24_080208_create_permissions_table', 1),
(6, '2015_01_24_080433_create_permission_role_table', 1),
(7, '2015_12_04_003040_add_more_data_to_user_table', 1),
(8, '2015_12_04_003040_add_special_role_column', 1),
(9, '2017_02_22_195250_add_to_authentication_to_users_table', 1),
(10, '2017_04_02_162205_create_order_numbers_table', 1),
(11, '2017_04_03_192520_create_orders_table', 1),
(12, '2017_04_14_073936_create_draft_orders_table', 1),
(13, '2017_05_22_100824_create_activity_log_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_status` enum('draft','submitted','processing','completed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `order_number_id` int(11) NOT NULL,
  `product` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `product_total_order` int(11) DEFAULT NULL,
  `sub_total` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_numbers`
--

CREATE TABLE `order_numbers` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` enum('draft','deleted','submitted','processing','completed','rejected') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_numbers`
--

INSERT INTO `order_numbers` (`id`, `order_number`, `order_status`, `created_at`, `updated_at`) VALUES
(1, 'CAH1', 'draft', '2017-05-23 17:53:17', '2017-05-23 17:53:17'),
(2, 'CAH2', 'draft', '2017-05-24 10:24:12', '2017-05-24 10:24:12'),
(3, 'CAH3', 'draft', '2017-05-24 12:55:53', '2017-05-24 12:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Show Mnara Dashboard', 'show.mnara.index', 'View the mnara dashboard shortcuts page', NULL, NULL),
(2, 'Show user list', 'show.user.index', 'Can show the user list on the index page', NULL, NULL),
(3, 'Create user', 'create.user', 'Create a user', NULL, NULL),
(4, 'View user', 'show.user', 'See an individual user info', NULL, NULL),
(5, 'Edit user', 'edit.user', 'Edit an existing user', NULL, NULL),
(6, 'Destroy user', 'destroy.user', 'Remove a user permanently', NULL, NULL),
(7, 'Synchronize users with roles', 'sync.user.roles', 'Used for both the user matrix and user role pages.', NULL, NULL),
(8, 'User search', 'search.user', 'Able to search users', NULL, NULL),
(9, 'Show role list', 'show.role.index', 'Can show the role list on the index page', NULL, NULL),
(10, 'Create role', 'create.role', 'Create a role', NULL, NULL),
(11, 'View role', 'show.role', 'See an individual role info', NULL, NULL),
(12, 'Edit role', 'edit.role', 'Edit an existing role', NULL, NULL),
(13, 'Destroy role', 'destroy.role', 'Remove a role permanently', NULL, NULL),
(14, 'Synchronize roles with users', 'sync.role.users', 'Syncs a role with multiple users.', NULL, NULL),
(15, 'Synchronize roles with permissions', 'sync.role.permissions', 'Used for both the role matrix and role permissions pages.', NULL, NULL),
(16, 'role search', 'search.role', 'Able to search roles', NULL, NULL),
(17, 'Show permission list', 'show.permission.index', 'Can show the permission list on the index page', NULL, NULL),
(18, 'Create permission', 'create.permission', 'Create a permission', NULL, NULL),
(19, 'View permission', 'show.permission', 'See an individual permission info', NULL, NULL),
(20, 'Edit permission', 'edit.permission', 'Edit an existing permission', NULL, NULL),
(21, 'Destroy permission', 'destroy.permission', 'Remove a permission permanently', NULL, NULL),
(22, 'Synchronize permissions with roles', 'sync.permission.roles', 'Syncs a permission with multiple roles.', NULL, NULL),
(23, 'permission search', 'search.permission', 'Able to search permissions', NULL, NULL),
(24, 'Show user profile', 'show.user.profile', 'Show current user profile', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 8, 1, NULL, NULL),
(9, 9, 1, NULL, NULL),
(10, 10, 1, NULL, NULL),
(11, 11, 1, NULL, NULL),
(12, 12, 1, NULL, NULL),
(13, 13, 1, NULL, NULL),
(14, 14, 1, NULL, NULL),
(15, 15, 1, NULL, NULL),
(16, 16, 1, NULL, NULL),
(17, 17, 1, NULL, NULL),
(18, 18, 1, NULL, NULL),
(19, 19, 1, NULL, NULL),
(20, 20, 1, NULL, NULL),
(21, 21, 1, NULL, NULL),
(22, 22, 1, NULL, NULL),
(23, 23, 1, NULL, NULL),
(24, 24, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `special` enum('all-access','no-access') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`, `special`) VALUES
(1, 'Super User', 'root', 'Have all access to all areas', NULL, NULL, 'all-access'),
(2, 'Administrator', 'admin', 'Some admin area access', NULL, NULL, NULL),
(3, 'User', 'user', 'No admin access', NULL, NULL, NULL),
(4, 'Deactivated', 'deactivated', 'Have no access to any areas', NULL, NULL, 'no-access');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google2fa_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g2fa_active` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `first_name`, `last_name`, `mobile_number`, `google2fa_secret`, `g2fa_active`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$uQo5LTnx5thgsz2Fslc3jeKipelBSzTIY26L2xCeRU/VPI9HIiCnG', 'BtRRh0uMUHOoQoaHi8NPdeXDhW1ebtkrFc8rEI6JcGolwIEupYQFsrtHzVNv', NULL, NULL, NULL, NULL, NULL, 'QA3EOXSBPWWUE56EHMVR5L53RY54A5XL', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `draft_orders`
--
ALTER TABLE `draft_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `draft_orders_user_id_index` (`user_id`),
  ADD KEY `draft_orders_order_number_id_index` (`order_number_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_index` (`user_id`),
  ADD KEY `orders_order_number_id_index` (`order_number_id`);

--
-- Indexes for table `order_numbers`
--
ALTER TABLE `order_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_index` (`role_id`),
  ADD KEY `role_user_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `draft_orders`
--
ALTER TABLE `draft_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_numbers`
--
ALTER TABLE `order_numbers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
