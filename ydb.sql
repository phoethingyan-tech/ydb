-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 29, 2025 at 05:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ydb`
--

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
(1, '0001_01_01_000000_create_roles_table', 1),
(2, '0001_01_01_000001_create_users_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '0001_01_01_000003_create_cache_table', 1),
(5, '2025_05_24_092059_create_pdf_posts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('phoethingyan.tech@gmail.com', '$2y$12$ZZ1yBMjNrBGDvyPpCOvtqO4Nsfcqo2x/5pNBJZzo7whaz1I7nLy6O', '2025-05-28 03:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `pdf_posts`
--

CREATE TABLE `pdf_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `pdf_file` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pdf_posts`
--

INSERT INTO `pdf_posts` (`id`, `title`, `photo`, `pdf_file`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '1-5-2025', '/pdf_post/photos/2025/may/01-05-2025.jpg', '/pdf_post/pdfs/2025/may/01-05-2025.pdf', 1, NULL, '2025-05-01 03:24:35', NULL),
(2, '2-5-2025', '/pdf_post/photos/2025/may/02-05-2025.jpg', '/pdf_post/pdfs/2025/may/02-05-2025.pdf', 1, NULL, '2025-05-02 03:24:35', NULL),
(3, '3-5-2025', '/pdf_post/photos/2025/may/03-05-2025.jpg', '/pdf_post/pdfs/2025/may/03-05-2025.pdf', 1, NULL, '2025-05-03 06:24:10', NULL),
(4, '4-5-2025', '/pdf_post/photos/2025/may/04-05-2025.jpg', '/pdf_post/pdfs/2025/may/04-05-2025.pdf', 1, NULL, '2025-05-04 06:24:10', NULL),
(5, '5-5-2025', '/pdf_post/photos/2025/may/05-05-2025.jpg', '/pdf_post/pdfs/2025/may/05-05-2025.pdf', 1, NULL, '2025-05-05 06:26:05', NULL),
(6, '6-5-2025', '/pdf_post/photos/2025/may/06-05-2025.jpg', '/pdf_post/pdfs/2025/may/06-05-2025.pdf', 1, NULL, '2025-05-06 06:26:05', NULL),
(7, '7-5-2025', '/pdf_post/photos/2025/may/07-05-2025.jpg', '/pdf_post/pdfs/2025/may/07-05-2025.pdf', 1, NULL, '2025-05-07 06:29:15', NULL),
(8, '8-5-2025', '/pdf_post/photos/2025/may/08-05-2025.jpg', '/pdf_post/pdfs/2025/may/08-05-2025.pdf', 1, NULL, '2025-05-08 06:29:15', NULL),
(9, '9-5-2025', '/pdf_post/photos/2025/may/09-05-2025.jpg', '/pdf_post/pdfs/2025/may/09-05-2025.pdf', 1, NULL, '2025-05-09 06:31:16', NULL),
(10, '10-5-2025', '/pdf_post/photos/2025/may/10-05-2025.jpg', '/pdf_post/pdfs/2025/may/10-05-2025.pdf', 1, NULL, '2025-05-10 06:31:16', NULL),
(11, '11-5-2025', '/pdf_post/photos/2025/may/11-05-2025.jpg', '/pdf_post/pdfs/2025/may/11-05-2025.pdf', 1, NULL, '2025-05-11 06:32:35', NULL),
(12, '12-5-2025', '/pdf_post/photos/2025/may/12-05-2025.jpg', '/pdf_post/pdfs/2025/may/12-05-2025.pdf', 1, NULL, '2025-05-12 06:32:35', NULL),
(13, '13-5-2025', '/pdf_post/photos/2025/may/13-05-2025.jpg', '/pdf_post/pdfs/2025/may/13-05-2025.pdf', 1, NULL, '2025-05-13 06:33:49', NULL),
(14, '14-5-2025', '/pdf_post/photos/2025/may/14-05-2025.jpg', '/pdf_post/pdfs/2025/may/14-05-2025.pdf', 1, NULL, '2025-05-14 06:33:49', NULL),
(15, '15-5-2025', '/pdf_post/photos/2025/may/15-05-2025.jpg', '/pdf_post/pdfs/2025/may/15-05-2025.pdf', 1, NULL, '2025-05-15 06:34:45', NULL),
(16, '16-5-2025', '/pdf_post/photos/2025/may/16-05-2025.jpg', '/pdf_post/pdfs/2025/may/16-05-2025.pdf', 1, NULL, '2025-05-16 06:34:45', NULL),
(17, '17-5-2025', '/pdf_post/photos/2025/may/17-05-2025.jpg', '/pdf_post/pdfs/2025/may/17-05-2025.pdf', 1, NULL, '2025-05-17 06:35:58', NULL),
(18, '18-5-2025', '/pdf_post/photos/2025/may/18-05-2025.jpg', '/pdf_post/pdfs/2025/may/18-05-2025.pdf', 1, NULL, '2025-05-18 06:35:58', NULL),
(19, '19-5-2025', '/pdf_post/photos/2025/may/19-05-2025.jpg', '/pdf_post/pdfs/2025/may/19-05-2025.pdf', 1, NULL, '2025-05-19 06:37:21', NULL),
(20, '20-5-2025', '/pdf_post/photos/2025/may/20-05-2025.jpg', '/pdf_post/pdfs/2025/may/20-05-2025.pdf', 1, NULL, '2025-05-20 06:37:21', NULL),
(21, '21-5-2025', '/pdf_post/photos/2025/may/21-05-2025.jpg', '/pdf_post/pdfs/2025/may/21-05-2025.pdf', 1, NULL, '2025-05-21 06:38:29', NULL),
(22, '22-5-2025', '/pdf_post/photos/2025/may/22-05-2025.jpg', '/pdf_post/pdfs/2025/may/22-05-2025.pdf', 1, NULL, '2025-05-22 06:38:29', NULL),
(23, '၁၃၈၇ ခုနှစ်၊ ကဆုန်လပြည့်ကျော် ၁၂ ရက်၊ မေ ၂၃ ရက်၊ သောကြာနေ့။', '/pdf_post/photos/2025/may/23-05-2025.jpg', '/pdf_post/pdfs/2025/may/23-05-2025.pdf', 2, NULL, '2025-05-23 06:39:17', '2025-05-29 00:28:47'),
(24, '၁၃၈၇ ခုနှစ်၊ ကဆုန်လပြည့်ကျော် ၁၃ ရက်၊ မေ ၂၄ ရက်၊ စနေနေ့။', '/pdf_post/photos/2025/may/24-05-2025.jpg', '/pdf_post/pdfs/2025/may/24-05-2025.pdf', 2, NULL, '2025-05-24 06:39:17', '2025-05-29 00:28:25'),
(25, '၁၃၈၇ ခုနှစ်၊ ကဆုန်လပြည့်ကျော် ၁၄ ရက်၊ မေ ၂၅ ရက်၊ တနင်္ဂနွေနေ့။', '/pdf_post/photos/2025/may/25-05-2025.jpg', '/pdf_post/pdfs/2025/may/25-05-2025.pdf', 2, NULL, '2025-05-25 06:42:54', '2025-05-29 00:27:35'),
(26, '၁၃၈၇ ခုနှစ်၊ ကဆုန်လကွယ်နေ့၊ မေ ၂၆ ရက်၊ တနင်္လာနေ့။', '/pdf_post/photos/2025/may/26-05-2025.jpg', '/pdf_post/pdfs/2025/may/26-05-2025.pdf', 1, NULL, '2025-05-26 10:33:34', '2025-05-28 10:35:44'),
(27, '၁၃၈၇ ခုနှစ်၊ နယုန်လဆန်း ၁ ရက်၊ မေ ၂၇ ရက်၊ အင်္ဂါနေ့။', '/pdf_post/photos/2025/may/27-05-2025.jpg', '/pdf_post/pdfs/2025/may/27-05-2025.pdf', 1, NULL, '2025-05-27 10:29:49', '2025-05-28 10:29:49'),
(28, '၁၃၈၇ ခုနှစ်၊ နယုန်လဆန်း ၂ ရက်၊ မေ ၂၈ ရက်၊ ဗုဒ္ဓဟူးနေ့။', '/pdf_post/photos/2025/may/28-05-2025.jpg', '/pdf_post/pdfs/2025/may/28-05-2025.pdf', 1, NULL, '2025-05-28 10:14:16', '2025-05-28 10:36:22'),
(51, '၁၃၈၇ ခုနှစ်၊ နယုန်လဆန်း ၃ ရက်၊ မေ ၂၉ ရက်၊ ကြာသပတေးနေ့။', '/pdf_post/photos/2025/may/29-05-2025.png', '/pdf_post/pdfs/2025/may/29-05-2025.pdf', 2, NULL, '2025-05-29 00:21:36', '2025-05-29 01:05:15');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'post', NULL, NULL),
(3, 'user', NULL, NULL);

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
('mLHMyHZMgKVZLAdtuA4iAEshAaSLbPnfWlxSCnmt', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQjJBc2drTXZzNGxWemdTazJwNXNlTWtlZU01MUpnVEZuZjlkZktsTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9iYWNrZW5kIjt9fQ==', 1748501661),
('Q8PgIprJ1Oxxy8YMTRYUusFVYTQDlzARfwwF5Yfc', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnRRdUhXbno1TU52YVNhdUoyRG9SWmpmelg3c0JxUkRNeHpDUURreiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748527338),
('tzZAS7ggn4d1bGJWAUFaIp8W6fFuyzHpQN2PnF6I', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiZTVmY2Zid1pMYlB1RFRUZHNiWHJuSWNsZ1NScUl0NHVPS3VUQWtLYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6NDoiYXV0aCI7YToxOntzOjIxOiJwYXNzd29yZF9jb25maXJtZWRfYXQiO2k6MTc0ODUwMTIxMzt9fQ==', 1748509865),
('Vwy3BDk5cmOM9W3PhzYLRVuYvi4mn0cFVabXRwZ5', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUdERVBVWndTREN3bzdFTDhQNlFMSnBTNGl2b2VQNXhIcVVlYmhCdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748513432);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `profile`, `email`, `email_verified_at`, `password`, `role_id`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'YDB', '/images/profile/1748428902.jpg', 'ydboffice@gmail.com', NULL, '$2y$12$kpeAvzF3NOXyqc2uQVLG5urzIVDYiQIA1efXQoCqLyTH6NPH8PY5C', 1, 'RwJIaLfhlqjBypXngiRLBS1qykvZVjSQLyXvWw28uoF9Qb0VYMiHg8vsVEZp', NULL, '2025-05-28 04:11:42', '2025-05-28 04:11:42'),
(2, 'Phoethingyan', '/images/profile/1748426773.jpg', 'phoethingyan.tech@gmail.com', NULL, '$2y$12$./.4sutSEfKK8UnywuVq/eRtWnVs2ph3at9QPP2q.pteinFwSNbEW', 3, 'E2jHpBBX2l2oRZSzG8dpRPze7I7PqzkawvsDQIQ2Bp6QiPUcDI2dh3oCc3Kx', NULL, '2025-05-28 03:36:13', '2025-05-28 03:36:13');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pdf_posts`
--
ALTER TABLE `pdf_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pdf_posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pdf_posts`
--
ALTER TABLE `pdf_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pdf_posts`
--
ALTER TABLE `pdf_posts`
  ADD CONSTRAINT `pdf_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
