-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 01, 2022 at 03:13 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `livewire2`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(46, '2014_10_12_000000_create_users_table', 1),
(47, '2014_10_12_100000_create_password_resets_table', 1),
(48, '2019_08_19_000000_create_failed_jobs_table', 1),
(49, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(50, '2022_05_19_111812_create_posts_table', 1),
(51, '2014_10_12_200000_add_two_factor_columns_to_users_table', 2),
(52, '2022_05_23_145145_create_sessions_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `image`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Perspiciatis est reiciendis dolores nemo natus.', 'Laudantium et magnam doloremque eius. Et voluptatibus animi quasi maiores quo natus cumque. Non earum sit eum nesciunt.', '01.jpg', 'perferendis-sint-soluta-ad-fuga-cumque', 4, '2022-05-22 07:38:36', '2022-05-22 07:38:36'),
(2, 'Quaerat id voluptates enim natus sequi molestias molestiae fuga.', 'Rem sed facere omnis eaque. Hic et placeat porro adipisci atque qui voluptas. Tenetur inventore voluptates magni aut ullam. Accusantium et commodi impedit corporis esse deserunt exercitationem.', '02.jpg', 'et-et-architecto-et-libero-ullam-eligendi-rerum-eligendi', 2, '2022-05-22 07:38:36', '2022-05-22 07:38:36'),
(3, 'Magnam saepe earum in mollitia voluptas molestiae nemo.', 'Illum voluptate alias ut tenetur. Laboriosam maxime magni et accusamus qui non beatae saepe. Et officiis officia aliquid accusamus placeat et porro nesciunt.', '03.jpg', 'aliquid-distinctio-aut-accusantium', 1, '2022-05-22 07:38:36', '2022-05-22 07:38:36'),
(4, 'Ea omnis sit error delectus.', 'Officia qui reprehenderit fugit doloribus omnis. Et deserunt occaecati ut et autem aliquid nesciunt doloribus. Voluptatem reprehenderit ipsa ducimus vel facilis eius.', '04.jpg', 'maiores-enim-et-rerum-eum', 8, '2022-05-22 07:38:36', '2022-05-22 07:38:36'),
(5, 'Dolorum aliquam consequatur doloribus nemo.', 'Ut sapiente doloribus voluptatem autem delectus. Ipsam quae exercitationem natus consequatur dolorum. In voluptatum eum maiores vel.', '05.jpg', 'consequatur-possimus-ea-delectus-hic', 7, '2022-05-22 07:38:36', '2022-05-22 07:38:36'),
(6, 'At odit minima pariatur consectetur.', 'Quas tempora animi laudantium nam amet ut. Ad facere labore esse quia qui quo. Ut illo in itaque maxime. Fuga aut sequi voluptatem voluptatem aut repudiandae.', '06.jpg', 'necessitatibus-maiores-doloribus-repellendus-et-corrupti-molestias', 3, '2022-05-22 07:38:36', '2022-05-22 07:38:36'),
(7, 'Molestiae ipsa aut facere voluptatem corporis ut.', 'Eos voluptas et dolor quis. Dolores repudiandae nisi laborum dicta. Quam in quasi suscipit ut consequatur in aut. Officiis explicabo facilis dolores.', '07.jpg', 'inventore-ex-eius-ipsa-explicabo', 7, '2022-05-22 07:38:36', '2022-05-22 07:38:36'),
(8, 'Voluptas maxime aliquid voluptas repellat.', 'Harum in dolorem recusandae. Laboriosam sed minus iusto aut voluptatum.', '08.jpg', 'adipisci-aut-dolorem-totam-cum', 9, '2022-05-22 07:38:36', '2022-05-22 07:38:36'),
(9, 'Repudiandae qui molestiae voluptatem quibusdam.', 'Atque aliquid quasi eum. Voluptatem impedit velit doloremque. Quia quia rerum repudiandae nemo dolor esse.', '09.jpg', 'laborum-ab-pariatur-enim-sunt-corrupti-est-doloremque', 2, '2022-05-22 07:38:36', '2022-05-22 07:38:36'),
(10, 'Tenetur voluptatem assumenda eius.', 'Nam consequatur laborum ipsum asperiores est. Et fugit ut veniam vel eum illo. Perspiciatis tempore quia deserunt est voluptatem et tenetur debitis. Et ratione accusamus qui doloribus qui sapiente consequatur.', '10.jpg', 'est-officia-et-et-qui-explicabo-tempora-modi', 3, '2022-05-22 07:38:36', '2022-05-22 07:38:36'),
(11, 'Voluptatem ea fugiat similique ea commodi placeat.', 'Asperiores dolor necessitatibus sapiente eum. Ad nesciunt voluptatem a tenetur incidunt id. Dolores aperiam explicabo laboriosam molestiae rerum delectus quia.', '11.jpg', 'neque-qui-architecto-est-assumenda-consectetur-omnis', 7, '2022-05-22 07:38:36', '2022-05-22 07:38:36'),
(12, 'Quas et perferendis nobis quo autem omnis placeat.', 'Incidunt ex modi vel officia doloribus ut. Repudiandae repudiandae minima quo. Quis dolores nulla magnam qui. Autem et quis veniam officiis facere.', '12.jpg', 'ut-sed-molestiae-enim-et-eveniet', 6, '2022-05-22 07:38:36', '2022-05-22 07:38:36'),
(13, 'Repudiandae blanditiis quia cumque nobis est molestiae.', 'Recusandae aut libero sed ut. Consectetur expedita consequatur et. Autem velit et provident et et aliquam. Aliquid sint quia nam harum consequuntur ducimus. Qui voluptas nulla reiciendis eius ipsam nihil.', '13.jpg', 'iusto-fugit-ipsam-mollitia-et', 3, '2022-05-22 07:38:36', '2022-05-22 07:38:36'),
(14, 'Totam ab eaque magni.', 'Accusamus ut et necessitatibus ab corporis ipsum. Nihil deserunt enim rerum est laudantium aut.', '14.jpg', 'veritatis-rem-vel-amet-aliquam-ut', 3, '2022-05-22 07:38:36', '2022-05-22 07:38:36'),
(15, 'Quia qui explicabo fugit culpa sequi quo enim.', 'Est molestias ea dolore consequatur quos aliquid. Et quas accusamus ea quisquam rem minima maxime quia.', '15.jpg', 'earum-cupiditate-temporibus-laudantium-ut-eius', 3, '2022-05-22 07:38:36', '2022-05-22 07:38:36'),
(16, 'post1', '<p>body1</p>', '63bef9797ba8408282df9ecb091e0dd0.jpg', 'slug1', 1, '2022-05-26 11:43:14', '2022-05-26 11:43:14'),
(17, 'post2', '<p>body2</p>', '0aa301c683e42d23593827718df6679a.jpg', 'slug2', 1, '2022-05-26 11:44:43', '2022-05-26 11:44:43'),
(18, 'post3', '<p>body3</p>', 'b06e09ec095342728deabe26e208d63c.jpg', 'slug3', 1, '2022-05-26 11:45:52', '2022-05-26 11:45:52'),
(19, 'post 4', '<p>body4</p>', 'c87bf90f7ee2540a324c1016efbb502a.png', 'post-4', 1, '2022-05-26 12:17:41', '2022-05-26 12:17:41'),
(20, 'post 5', '<p>body 5</p>', 'd22dfb1654beed8dd68cf3c92b171c86.jpg', 'post-5', 1, '2022-05-26 12:42:02', '2022-05-26 12:42:02'),
(21, 'post 6', '<p>body 6</p>', 'ce6f8f3ed69baccd3e1b52de80ecf2d0.jpg', 'post-6', 1, '2022-05-26 12:46:18', '2022-05-26 12:46:18'),
(22, 'post 7', '<p>body 7</p>', '40adb29abc18f4ace511be7976c8cb3b.jpg', 'post-7', 1, '2022-05-26 12:49:11', '2022-05-26 12:49:11'),
(23, 'er', '<p>fdf</p>', '6104c04ab34d1051875c073f70a94027.jpg', 'posdsd ', 1, '2022-05-26 12:50:32', '2022-05-26 12:50:32'),
(24, 'wqewe', '<p>biodd</p>', '27e8d415104f896f738f10ab799a883c.jpg', 'wqeeee', 1, '2022-05-26 12:51:50', '2022-05-26 12:51:50'),
(25, 'post9', '<p>body 9</p>', 'fc702687641c1548fa56841d3903cba6.jpg', 'post9', 1, '2022-05-29 06:11:21', '2022-05-29 06:11:21'),
(26, 'post10', '<p>post10</p>', 'dee26b96a964ce5035a367724c2441d9.jpg', 'post10', 1, '2022-05-29 06:18:41', '2022-05-29 06:18:41'),
(27, 'post11', '<p>post11</p>', 'cec5a3f353f149040dff65ed064769ae.jpg', 'post11', 1, '2022-05-29 06:29:06', '2022-05-29 06:29:06'),
(28, 'post 12', '<p>body 12</p>', 'e5c9e720782a60a056e2c9777b6638a6.jpg', 'post-12', 1, '2022-05-29 06:30:22', '2022-05-29 06:30:22');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('FNcdCGWyXSR8uSMofPm70p8gB2QUdH3R2DM0Qv1t', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUEJ3Y05HQldKVjVXS2hyR3NkeGF1MWVNWWliSk90dE9ScHMyWmVOOSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vbGl2ZXdpcmUyLnRlc3QvcG9zdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1654094665);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'emad', 'emad@ivas.com.eg', '2022-05-22 07:38:32', '$2y$10$NIqNT1gC4zrZX3dDs5SMVOZjG6vji/7EKA4S5vu/khiA3.EGaFmt6', NULL, NULL, NULL, '0DpotmRcTa', '2022-05-22 07:38:35', '2022-05-22 07:38:35'),
(2, 'Dr. Vince Roberts III', 'cummerata.thad@example.org', '2022-05-22 07:38:32', '$2y$10$NUmnM7D48fZNDYrrQmBkUulEBOccDK5Do9CEjVt4j1HOEGlEN4RBW', NULL, NULL, NULL, 'YKCKawcCxI', '2022-05-22 07:38:35', '2022-05-22 07:38:35'),
(3, 'Miss Jaida Bergstrom II', 'mdare@example.org', '2022-05-22 07:38:32', '$2y$10$2XLxjwZwXkPFEul1ak9coOqAn9ssh..3ZFhMTDK/c39tkd3Lobrra', NULL, NULL, NULL, 'lYWXUr6IPZ', '2022-05-22 07:38:35', '2022-05-22 07:38:35'),
(4, 'Dr. Dariana Daniel I', 'rice.eldred@example.net', '2022-05-22 07:38:33', '$2y$10$ug2epsKF7wzdEpYD6qEm0eMAufrohsKkw3gyTy23H45fuCvjBjC3O', NULL, NULL, NULL, 'EQHX4rrbE2', '2022-05-22 07:38:35', '2022-05-22 07:38:35'),
(5, 'Pat Block', 'harmony99@example.org', '2022-05-22 07:38:33', '$2y$10$DUKvwsBIylafGINLZx5hpeh3nD54nDzLLHh5jRKLzM41Nsv1DcpWK', NULL, NULL, NULL, 'znAOYbpynZ', '2022-05-22 07:38:35', '2022-05-22 07:38:35'),
(6, 'Regan Dibbert', 'chet34@example.net', '2022-05-22 07:38:33', '$2y$10$equl0Ig0LSobukQ.zPUaD.n4mtBqmBfI9rHuXapBFXOVf3DBxhCFm', NULL, NULL, NULL, '0TWuA1J1j9', '2022-05-22 07:38:35', '2022-05-22 07:38:35'),
(7, 'Karley Kreiger', 'magdalen49@example.com', '2022-05-22 07:38:34', '$2y$10$mY.DNB8QFJerjctCaAtqRemdeU8l/dqVNS/Xo8en62YLmtcTs9EmO', NULL, NULL, NULL, 'QGB4A9E631', '2022-05-22 07:38:35', '2022-05-22 07:38:35'),
(8, 'Lyda Weimann', 'wisozk.adolphus@example.com', '2022-05-22 07:38:34', '$2y$10$K3xqqEJDVS1Ec26JXZqk4eD7TYSf3uyWdoBSPiWIC0E7wv5zAZ2GO', NULL, NULL, NULL, 'WEy3sDqdmC', '2022-05-22 07:38:35', '2022-05-22 07:38:35'),
(9, 'Zaria Schamberger', 'zbartoletti@example.org', '2022-05-22 07:38:34', '$2y$10$LJYnMj0cScx6eU0Y8aXNquMtsLofNtdlp3Vk/ImcKlAZ/LHxNA/A6', NULL, NULL, NULL, 'P7yJedMR9G', '2022-05-22 07:38:35', '2022-05-22 07:38:35'),
(10, 'Cicero Cummings', 'keshawn.green@example.com', '2022-05-22 07:38:34', '$2y$10$e9ld5b0/CkUXXMzG0.xI6O4GdvEkgx1eg9pbNrl1LsS7fNx6PU6YC', NULL, NULL, NULL, 'NOqq2sDE37', '2022-05-22 07:38:35', '2022-05-22 07:38:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
