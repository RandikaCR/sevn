-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2025 at 07:24 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sevn`
--

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `bank_code` varchar(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_branches`
--

CREATE TABLE `bank_branches` (
  `id` bigint(20) NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `branch_code` varchar(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `businesses`
--

CREATE TABLE `businesses` (
  `id` bigint(20) NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `business` varchar(500) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `businesses`
--

INSERT INTO `businesses` (`id`, `ref_id`, `business`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'a8d2f073d2e1b508897d5055e2bc7025114cf0f2', 'SEVN Clothings', NULL, 1, '2024-10-26 08:57:32', '2024-10-26 08:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `coupon_rule_id` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `no_of_coupons` varchar(255) DEFAULT NULL,
  `is_unlimited_coupons` tinyint(4) DEFAULT NULL,
  `per_user` varchar(255) DEFAULT NULL,
  `is_unlimited_per_user` tinyint(4) DEFAULT NULL,
  `free_shipping` tinyint(4) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_rules`
--

CREATE TABLE `coupon_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `coupon_rule` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rule_value` varchar(255) DEFAULT NULL,
  `product_ids` varchar(255) DEFAULT NULL,
  `category_ids` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `coupon_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `status_user_id` bigint(20) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `designation` varchar(500) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `per_user` varchar(255) DEFAULT NULL,
  `is_unlimited_per_user` tinyint(4) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_rules`
--

CREATE TABLE `discount_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `discount_rule` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rule_value` varchar(255) DEFAULT NULL,
  `product_ids` varchar(255) DEFAULT NULL,
  `category_ids` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_usages`
--

CREATE TABLE `discount_usages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `discount_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(255) NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `ref_id`, `district`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Colombo', 1, '2024-06-23 18:15:04', '2024-06-23 18:15:04'),
(2, NULL, 'Gampaha', 1, '2024-06-23 18:15:04', '2024-06-23 18:15:04'),
(3, NULL, 'Kalutara', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(4, NULL, 'Galle', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(5, NULL, 'Matara', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(6, NULL, 'Hambanthota', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(7, NULL, 'Kandy', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(8, NULL, 'Matale', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(9, NULL, 'Nuwara Eliya', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(10, NULL, 'Kegalle', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(11, NULL, 'Ratnapura', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(12, NULL, 'Kurunegala', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(13, NULL, 'Puttalam', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(14, NULL, 'Anuradhapura', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(15, NULL, 'Polonnaruwa', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(16, NULL, 'Badulla', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(17, NULL, 'Monaragala', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(18, NULL, 'Trincomalee', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(19, NULL, 'Batticalao', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(20, NULL, 'Ampara', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(21, NULL, 'Jaffna', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(22, NULL, 'Mannar', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(23, NULL, 'Mullaitivu', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(24, NULL, 'Vavuniya', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24'),
(25, NULL, 'Kilinochchi', 1, '2024-06-23 18:18:24', '2024-06-23 18:18:24');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `track_id` varchar(255) DEFAULT NULL,
  `billing_first_name` varchar(255) DEFAULT NULL,
  `billing_last_name` varchar(255) DEFAULT NULL,
  `billing_street_address` varchar(255) DEFAULT NULL,
  `billing_address_2` varchar(255) DEFAULT NULL,
  `billing_email` varchar(255) DEFAULT NULL,
  `billing_phone` varchar(255) DEFAULT NULL,
  `billing_phone_2` varchar(255) DEFAULT NULL,
  `billing_town` varchar(255) DEFAULT NULL,
  `billing_district_id` int(11) DEFAULT NULL,
  `billing_postal_code` varchar(255) DEFAULT NULL,
  `billing_location` varchar(255) DEFAULT NULL,
  `shipping_first_name` varchar(255) DEFAULT NULL,
  `shipping_last_name` varchar(255) DEFAULT NULL,
  `shipping_street_address` varchar(255) DEFAULT NULL,
  `shipping_address_2` varchar(255) DEFAULT NULL,
  `shipping_email` varchar(255) DEFAULT NULL,
  `shipping_phone` varchar(255) DEFAULT NULL,
  `shipping_phone_2` varchar(255) DEFAULT NULL,
  `shipping_town` varchar(255) DEFAULT NULL,
  `shipping_district_id` int(11) DEFAULT NULL,
  `shipping_postal_code` varchar(255) DEFAULT NULL,
  `shipping_location` varchar(255) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `shipping_cost` float DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_progresses`
--

CREATE TABLE `order_progresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(255) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `type_id` tinyint(4) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `sub_category_id` bigint(20) DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `preorder` tinyint(4) DEFAULT NULL,
  `out_of_stock` tinyint(4) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `credit_availability` tinyint(4) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `is_primary` tinyint(4) DEFAULT NULL,
  `is_secondary` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_inventories`
--

CREATE TABLE `product_inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `batch_no` varchar(255) DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `manufacture_date` datetime DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `stock_date` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount_type_id` bigint(20) DEFAULT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `shipping` double(8,2) DEFAULT NULL,
  `vat` double(8,2) DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `profit` double(8,2) DEFAULT NULL,
  `profit_note` text DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `screens`
--

CREATE TABLE `screens` (
  `id` bigint(20) NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `screen` varchar(255) DEFAULT NULL,
  `screen_prefix` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `screens`
--

INSERT INTO `screens` (`id`, `ref_id`, `screen`, `screen_prefix`, `status`, `created_at`, `updated_at`) VALUES
(1, '8fd259f944b52c8b21b5218c2222e0b2bf909de8', 'Users', 'users', 1, '2024-10-26 09:23:44', '2024-10-26 09:23:44'),
(2, 'eb4085f7ab34d7d7906c65ca44d82eb9756ad7d9', 'User Roles', 'user_roles', 1, '2024-10-26 09:24:00', '2024-10-26 09:24:00'),
(3, '9a4fe584080493f3760c24d87102c67ef5473d8f', 'User Designations', 'user_designations', 1, '2024-10-26 09:24:12', '2024-10-26 09:24:12'),
(4, 'b814882ed812ee454cd99bdf6dce79195fc10f4a', 'User Screens', 'user_screens', 1, '2024-10-26 09:24:44', '2024-10-26 09:24:44'),
(5, '271f722d1a27425919b380ba636b54e8525d1963', 'Screens', 'screens', 1, '2024-10-26 09:25:02', '2024-10-26 09:25:02'),
(6, '41849fc87e4b7e2e7f847afb4f4ee26f9d4a6084', 'User Contact Bank Account Details', 'user_contact_bank_account_details', 1, '2024-10-26 09:25:49', '2024-10-26 09:25:49'),
(7, '6e8da621fcde0b87ca335ae14845864e1554a31a', 'User Contacts', 'user_contacts', 1, '2024-10-26 09:26:03', '2024-10-26 09:26:03'),
(8, '9b34d3e9529284ec7d225796f180c7f11dcdecdd', 'User Businesses', 'user_businesses', 1, '2024-10-26 09:27:06', '2024-10-26 09:27:06'),
(9, '25592812cf8ec0d03ccf9f34cd6b8d71bcbb1f31', 'Businesses', 'businesses', 1, '2024-10-26 09:27:17', '2024-10-26 09:27:17'),
(10, 'e56e84a53f307e088ec782efda29accfbcf6259e', 'Banks', 'banks', 1, '2024-10-26 09:29:23', '2024-10-26 09:29:23'),
(11, 'df779c8949f6a27a8a28c1796cc73f76f972a78a', 'Bank Branches', 'bank_branches', 1, '2024-10-26 09:29:39', '2024-10-26 09:29:39'),
(12, '641fc3fc05bf105ac7d533f0732a5b471d80ce9f', 'Clients', 'clients', 1, '2024-10-26 09:29:55', '2024-10-26 09:29:55'),
(13, '0f5e746166d71c7f2be8dec526ba7efb7a6fcc5a', 'Client Contacts', 'client_contacts', 1, '2024-10-26 09:30:11', '2024-10-26 09:30:11'),
(14, 'e122f5226160a182039fc9442b32260cd11b6a31', 'Client Contact Bank Account Details', 'client_contact_bank_account_details', 1, '2024-10-26 09:30:29', '2024-10-26 09:30:29'),
(15, '2315d37cd4beb47b8615c93674e8108efd2a816f', 'Client Statuses', 'client_statuses', 1, '2024-10-26 09:30:45', '2024-10-26 09:30:45'),
(16, 'f52e4da81f6917176347684fadbb556b2ed81406', 'Designations', 'designations', 1, '2024-10-26 09:31:21', '2024-10-26 09:31:21'),
(17, '3ce4f224daf5d8c5296a4bcca2dab5710b71e0e5', 'Events', 'events', 1, '2024-10-26 09:32:08', '2024-10-26 09:32:08'),
(18, 'db7ede1ec50f5a900189d74980e3ae722eddc607', 'Event Expenses', 'event_expenses', 1, '2024-10-26 09:32:36', '2024-10-26 09:32:36'),
(19, '50105b24cdea5d520d177d64b0529137049866b9', 'Event Expense Attachments', 'event_expense_attachments', 1, '2024-10-26 09:32:52', '2024-10-26 09:32:52'),
(20, 'bd52ead5f5b745bf95a1022a81ad36755e4921d8', 'Event Expense Types', 'event_expense_types', 1, '2024-10-26 09:33:12', '2024-10-26 09:33:12'),
(21, '1a2ad25fc019d4cbd803a49cfd1aba61eacaaa87', 'Event Incomes', 'event_incomes', 1, '2024-10-26 09:33:33', '2024-10-26 09:33:33'),
(22, '39d9f5a2dbe52d7ac8eaa8c8e28c6c06c2c18551', 'Event Income Attachments', 'event_income_attachments', 1, '2024-10-26 09:33:50', '2024-10-26 09:33:50'),
(23, '404849b046eab358aaedae4dd3092cac885793d4', 'Event Income Types', 'event_income_types', 1, '2024-10-26 09:34:03', '2024-10-26 09:34:03'),
(24, '3648be4c1ddeb197851f19690d6881b88ce5d293', 'Event Logs', 'event_logs', 1, '2024-10-26 09:34:19', '2024-10-26 09:34:19'),
(25, '169863c468d20cd1c6ffe76b58808899762bb02e', 'Event Log Types', 'event_log_types', 1, '2024-10-26 09:34:35', '2024-10-26 09:34:35'),
(26, 'a1cdd9b995274fb57fed6f4a38e706ba8d4555db', 'Event Statuses', 'event_statuses', 1, '2024-10-26 09:34:51', '2024-10-26 09:34:51'),
(27, 'a407f646587def1784177c40e7286a87a79a969b', 'Vendors', 'vendors', 1, '2024-10-26 09:35:18', '2024-10-26 09:35:18'),
(28, '51d7c0533e289638c99ae4dbd26d058f6880ecd0', 'Vendor Categories', 'vendor_categories', 1, '2024-10-26 09:35:31', '2024-10-26 09:35:31'),
(29, '17ff15f2c3e3eb9d0d066cac024e6b2ca59deeb2', 'Vendor Category Details', 'vendor_category_details', 1, '2024-10-26 09:35:49', '2024-10-26 09:35:49'),
(30, '5c835ff7c9fc9b36dbec2e82f3e2d40af4e6b4f6', 'Vendor Contacts', 'vendor_contacts', 1, '2024-10-26 09:36:04', '2024-10-26 09:36:04'),
(31, '980dc3402a35e95da311bdd55048b45d47042eff', 'Vendor Contact Bank Account Details', 'vendor_contact_bank_account_details', 1, '2024-10-26 09:36:23', '2024-10-26 09:36:23'),
(32, '4803811d5c12e268efb3f2d74f296c6bd490599d', 'Vendor Statuses', 'vendor_statuses', 1, '2024-10-26 09:36:40', '2024-10-26 09:36:40');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7sjmNKcBUyVDOhYCHLXwwhkgCCJHHZFI6a24C9Pj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:139.0) Gecko/20100101 Firefox/139.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFBTSk1XTW1wYUhvRmNuenhTdHpXQ0YxR3BzYTBQOXh5SVJISmVZTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTE6Imh0dHA6Ly9zZXZuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747642487),
('bdSTDUyhRRUrE5ElTgwaKWcJ0YH6L9LERWW97QwZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:139.0) Gecko/20100101 Firefox/139.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVlYaHZYdkhyeFcyZnBKa2F3ZGIwWTZDYmJJVlYwUHl5Z1VOT1doMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTE6Imh0dHA6Ly9zZXZuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748149991),
('enzocySJe7JN9NAErbN7tv76pbFrVE0s99f7ekJl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:139.0) Gecko/20100101 Firefox/139.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjNTVEo5NG5mMUg3cjRHcDYxSHI1Wjk5cDNQeTIxZGNzTkVNZWZ4RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTE6Imh0dHA6Ly9zZXZuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747592282),
('H4fxLQarayM6GghLO1B75dpZrMHJ0esuTczVs3Wv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:139.0) Gecko/20100101 Firefox/139.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVNwYmJxMURWRTZNSTdCMnF6UFpMMWdiUHJ1ZFZoM2xlOXdEWnZzVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTE6Imh0dHA6Ly9zZXZuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747682395),
('JnbHhxU8VcsAjvxdL61ptYcqHymgDwMIj91AVPcO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:139.0) Gecko/20100101 Firefox/139.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWlESWVoeGxzT1B5THNZajFzR3hFcW93WHZaSmNEZ3ptSkpmclN1ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTE6Imh0dHA6Ly9zZXZuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747575642),
('LbVnCCROYtXPFUJZ4ndIAgfq7eKd4BVLZS4X19TA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:139.0) Gecko/20100101 Firefox/139.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWZNU0JERjUxVEttQzVBUk83MWVPUnhGV0RWRXZ6c1dzNHdIeTB0UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTE6Imh0dHA6Ly9zZXZuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747556018),
('Tdn4tmSaYmMnS2vAO9m3tEOfgGxZkmpce9cocVv7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0RQSlpROHpUNmNKV2J1bDNtUjhiQ2ViRlNDUkxzOVNCZEx6bWZpZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTE6Imh0dHA6Ly9zZXZuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749230627),
('uglFjRi21UyDIKJCxIhypxQFjaAEX2q0Ev7OeDe4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:139.0) Gecko/20100101 Firefox/139.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2JkNzFZS1IzY0tEclhBcGM2dkhNM0Y0TFd2VU56OVNhVXRnSVVBNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTE6Imh0dHA6Ly9zZXZuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747647359),
('vkYhXMvx1gszYq9us8BZrAm1tzbOv3iTyZEOjpj0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlh4Q012YWVwekdDT0J0MXRtRlVoOUgwcjk1bWo1TjhjaG1PQ1R4MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTE6Imh0dHA6Ly9zZXZuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748886661);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `user_role_id` bigint(20) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `business_id` bigint(20) DEFAULT NULL,
  `public_key` varchar(255) DEFAULT NULL,
  `user_code` varchar(255) DEFAULT NULL,
  `is_email_subscribed` tinyint(4) DEFAULT NULL,
  `is_phone_subscribed` tinyint(4) DEFAULT NULL,
  `is_discount_available` tinyint(4) DEFAULT NULL,
  `discount_rule_id` bigint(20) DEFAULT NULL,
  `profit_margin_on_sale` double DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_businesses`
--

CREATE TABLE `user_businesses` (
  `id` bigint(20) NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `business_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `id` bigint(20) NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_1` varchar(20) DEFAULT NULL,
  `phone_2` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postcode` varchar(20) DEFAULT NULL,
  `is_primary` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_bank_account_details`
--

CREATE TABLE `user_contact_bank_account_details` (
  `id` bigint(255) NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `user_contact_id` bigint(20) DEFAULT NULL,
  `bank_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `is_primary` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_designations`
--

CREATE TABLE `user_designations` (
  `id` bigint(20) NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `business_id` bigint(20) DEFAULT NULL,
  `designation_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `user_role` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `badge` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `ref_id`, `user_role`, `display_name`, `label`, `badge`, `status`, `created_at`, `updated_at`) VALUES
(1, '6dc8eec06f907eb245c8e0edf2d04302030094e5', 'Super Admin', 'Admin', 'Admin', 'primary', 1, '2024-10-26 09:13:34', '2024-10-26 09:13:34'),
(2, 'e8add3db8fe3252ae33cfbb47e99b8568cda1755', 'Admin', 'Admin', 'Admin', 'primary', 1, '2024-10-26 09:13:45', '2024-10-26 09:13:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_screens`
--

CREATE TABLE `user_screens` (
  `id` bigint(20) NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `business_id` bigint(20) DEFAULT NULL,
  `screen_id` bigint(20) DEFAULT NULL,
  `is_view` tinyint(4) DEFAULT NULL,
  `is_create` tinyint(4) DEFAULT NULL,
  `is_update` tinyint(4) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id` (`ref_id`);

--
-- Indexes for table `bank_branches`
--
ALTER TABLE `bank_branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id` (`ref_id`),
  ADD KEY `bank_id` (`bank_id`);

--
-- Indexes for table `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id` (`ref_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `coupon_rules`
--
ALTER TABLE `coupon_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id` (`ref_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `discounts_code_unique` (`code`);

--
-- Indexes for table `discount_rules`
--
ALTER TABLE `discount_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_usages`
--
ALTER TABLE `discount_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_progresses`
--
ALTER TABLE `order_progresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `screens`
--
ALTER TABLE `screens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id` (`ref_id`),
  ADD KEY `screen_prefix` (`screen_prefix`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_businesses`
--
ALTER TABLE `user_businesses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id` (`ref_id`);

--
-- Indexes for table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id` (`ref_id`);

--
-- Indexes for table `user_contact_bank_account_details`
--
ALTER TABLE `user_contact_bank_account_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id` (`ref_id`),
  ADD KEY `account_number` (`account_number`);

--
-- Indexes for table `user_designations`
--
ALTER TABLE `user_designations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id` (`ref_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id` (`ref_id`);

--
-- Indexes for table `user_screens`
--
ALTER TABLE `user_screens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id` (`ref_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `business_id` (`business_id`),
  ADD KEY `screen_id` (`screen_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_branches`
--
ALTER TABLE `bank_branches`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `businesses`
--
ALTER TABLE `businesses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_rules`
--
ALTER TABLE `coupon_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_rules`
--
ALTER TABLE `discount_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_usages`
--
ALTER TABLE `discount_usages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_progresses`
--
ALTER TABLE `order_progresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_inventories`
--
ALTER TABLE `product_inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `screens`
--
ALTER TABLE `screens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_businesses`
--
ALTER TABLE `user_businesses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_contact_bank_account_details`
--
ALTER TABLE `user_contact_bank_account_details`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_designations`
--
ALTER TABLE `user_designations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_screens`
--
ALTER TABLE `user_screens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
