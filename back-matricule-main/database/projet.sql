-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 25 mai 2025 à 20:06
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `enregistrements_peage`
--

CREATE TABLE `enregistrements_peage` (
  `id` int(11) NOT NULL,
  `plaque_immatriculation` varchar(50) NOT NULL,
  `date_heure_passage` datetime NOT NULL,
  `id_station_peage` varchar(100) NOT NULL,
  `reference_photo` varchar(255) DEFAULT NULL,
  `date_enregistrement_db` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enregistrements_peage`
--

INSERT INTO `enregistrements_peage` (`id`, `plaque_immatriculation`, `date_heure_passage`, `id_station_peage`, `reference_photo`, `date_enregistrement_db`) VALUES
(1, 'ABC123', '2025-05-15 14:30:00', 'SP001', '/images/abc123.jpg', '2025-05-19 23:49:52'),
(2, 'DEF456', '2025-05-16 15:45:00', 'SP002', '', '2025-05-19 23:49:52'),
(3, 'GHI789', '2025-05-15 16:00:00', 'SP003', '/images/ghi789.jpg', '2025-05-19 23:49:52'),
(4, 'JKL012', '2025-05-15 16:15:30', 'SP004', '/images/jkl012.jpg', '2025-05-19 23:49:52'),
(5, 'ABC123', '2025-05-15 14:30:00', 'SP001', '/images/abc123.jpg', '2025-05-20 00:00:23'),
(6, 'DEF456', '2025-05-16 15:45:00', 'SP002', '', '2025-05-20 00:00:23'),
(7, 'GHI789', '2025-05-15 16:00:00', 'SP003', '/images/ghi789.jpg', '2025-05-20 00:00:23'),
(8, 'JKL012', '2025-05-15 16:15:30', 'SP004', '/images/jkl012.jpg', '2025-05-20 00:00:23');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
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
-- Structure de la table `jobs`
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
-- Structure de la table `job_batches`
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
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '0001_01_01_000000_create_users_table', 1),
(11, '0001_01_01_000001_create_cache_table', 1),
(12, '0001_01_01_000002_create_jobs_table', 1),
(13, '2025_05_18_181249_create_personal_access_tokens_table', 1),
(14, '2025_05_18_192940_add_phone_to_users_table', 1),
(15, '2025_05_19_205215_add_matricle_to_users_table', 1),
(16, '2025_05_19_210741_create_passages_table', 1),
(17, '2025_05_19_220524_add_user_id_to_passages_table', 1),
(18, '2025_05_20_180237_create_ocr_results_table', 1),
(19, '2025_05_20_195841_modify_matricules_in_users_table', 1),
(20, '2025_05_21_005250_remove_matricules_from_users_table', 2),
(21, '2025_05_21_092741_add_solde_to_users_table', 3),
(22, '2025_05_21_093020_create_recharges_table', 4);

-- --------------------------------------------------------

--
-- Structure de la table `ocr_results`
--

CREATE TABLE `ocr_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matricule` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL,
  `station_name` varchar(255) NOT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `ocr_image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `idpaiement` int(11) NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `idpassage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `passage`
--

CREATE TABLE `passage` (
  `idpassage` int(11) NOT NULL,
  `datePassage` datetime NOT NULL DEFAULT current_timestamp(),
  `montant` decimal(10,2) DEFAULT NULL,
  `photoPassage` blob DEFAULT NULL,
  `idvehicule` int(11) NOT NULL,
  `idstation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `passages`
--

CREATE TABLE `passages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matricule` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL,
  `station_name` varchar(255) NOT NULL,
  `photo_path` varchar(255) NOT NULL,
  `ocr_image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'api-token', '591c9c290b33c1df375a21983efe609f3bca28015af0063aff0a86fff0847387', '[\"*\"]', NULL, NULL, '2025-05-20 19:30:51', '2025-05-20 19:30:51'),
(2, 'App\\Models\\User', 1, 'api-token', '7a53055a8ba11ccf3108bb0b201e319308b0629e9df108259e80edcd47199cab', '[\"*\"]', NULL, NULL, '2025-05-20 19:31:21', '2025-05-20 19:31:21'),
(3, 'App\\Models\\User', 2, 'api-token', 'f594a1b21a3ab6c25640a53a474cc3f9e3fa69d31c9567a93cf50aea1c048b32', '[\"*\"]', NULL, NULL, '2025-05-20 22:52:45', '2025-05-20 22:52:45'),
(4, 'App\\Models\\User', 1, 'api-token', 'f74d44f7d4cc944a3c1bf323eaf5f6f38f69c885af4fc0f41f1991a5d10492d3', '[\"*\"]', '2025-05-21 00:27:39', NULL, '2025-05-20 22:54:04', '2025-05-21 00:27:39'),
(5, 'App\\Models\\User', 1, 'api-token', '7c4ce6b90f468f6808125a0bc362a3b5c57b451723ee98a333de69ebb535c3e4', '[\"*\"]', '2025-05-21 20:25:53', NULL, '2025-05-21 09:38:07', '2025-05-21 20:25:53'),
(6, 'App\\Models\\User', 1, 'api-token', '53044d3c61c70c6e7bf961c60e43d75feb25067a73afea20d4d1c81a5211e486', '[\"*\"]', NULL, NULL, '2025-05-21 20:26:10', '2025-05-21 20:26:10'),
(7, 'App\\Models\\User', 3, 'api-token', '3b654a6e3977420d3ef654a8bc1117179c4728a28be35c52d814deae0a41769c', '[\"*\"]', NULL, NULL, '2025-05-21 20:28:21', '2025-05-21 20:28:21');

-- --------------------------------------------------------

--
-- Structure de la table `recharges`
--

CREATE TABLE `recharges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `numero_carte` varchar(255) NOT NULL,
  `date_expiration` varchar(255) NOT NULL,
  `cvv` varchar(255) NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recharges`
--

INSERT INTO `recharges` (`id`, `user_id`, `numero_carte`, `date_expiration`, `cvv`, `montant`, `created_at`, `updated_at`) VALUES
(1, 1, '4111111111111111', '12/26', '123', 100.00, '2025-05-21 09:41:08', '2025-05-21 09:41:08'),
(2, 1, '4111111111111111', '12/26', '123', 100.00, '2025-05-21 20:25:38', '2025-05-21 20:25:38');

-- --------------------------------------------------------

--
-- Structure de la table `resultats_ocr`
--

CREATE TABLE `resultats_ocr` (
  `id` int(11) NOT NULL,
  `matricule` varchar(50) NOT NULL,
  `date_detection` datetime NOT NULL,
  `nom_station` varchar(100) NOT NULL,
  `chemin_photo` varchar(255) DEFAULT NULL,
  `chemin_image_ocr` varchar(255) DEFAULT NULL,
  `date_insertion` datetime DEFAULT NULL,
  `montant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `resultats_ocr`
--

INSERT INTO `resultats_ocr` (`id`, `matricule`, `date_detection`, `nom_station`, `chemin_photo`, `chemin_image_ocr`, `date_insertion`, `montant`) VALUES
(1, 'AN-154-TS', '2025-05-20 19:46:33', 'Station Paris', '5.jpg', 'plates\\plate_20250520_194623_903565.jpg', '2025-05-20 18:49:26', NULL),
(2, 'AN-154-TS', '2025-05-21 19:47:54', 'Station Marseille', '5.jpg', 'plates\\plate_20250521_194747_452873.jpg', '2025-05-24 19:21:45', NULL),
(3, 'AN-154-TS', '2025-05-21 21:25:40', 'Station Marseille', '5.jpg', 'plates\\plate_20250521_212531_831214.jpg', '2025-05-24 19:21:45', NULL),
(4, 'AN-154-TS', '2025-05-21 21:27:41', 'Station Marseille', '5.jpg', 'plates\\plate_20250521_212732_145013.jpg', '2025-05-24 19:21:45', NULL),
(5, 'AN-154-TS', '2025-05-21 21:44:12', 'Station Marseille', '5.jpg', 'plates\\plate_20250521_214402_175779.jpg', '2025-05-24 19:21:45', NULL),
(6, 'AN-154-TS', '2025-05-21 22:05:57', 'Station Paris', '5.jpg', 'plates\\plate_20250521_220547_660246.jpg', '2025-05-24 19:21:45', NULL),
(7, 'AN-154-TS', '2025-05-21 22:10:57', 'Station Marseille', '5.jpg', 'plates\\plate_20250521_221045_718920.jpg', '2025-05-24 19:21:45', NULL),
(8, 'AN-154-TS', '2025-05-24 19:56:18', 'Station Paris', '5.jpg', 'plates\\plate_20250524_195606_639328.jpg', '2025-05-24 19:21:45', NULL),
(9, 'AN-154-TS', '2025-05-24 20:17:20', 'Station Marseille', '5.jpg', 'plates\\plate_20250524_201713_295880.jpg', '2025-05-24 19:21:45', NULL),
(10, 'AN-154-TS', '2025-05-24 19:56:18', 'Station Paris', '5.jpg', 'plates/plate_20250524_195606_639328.jpg', '2025-05-24 19:22:23', 23),
(11, 'ABC123', '2025-05-24 10:15:00', 'Station Paris', 'path/to/image.jpg', 'path/to/cropped.jpg', '2025-05-24 19:49:21', 23),
(12, 'AN-154-TS', '2025-05-24 20:52:05', 'Station Marseille', '5.jpg', 'plates\\plate_20250524_205158_448651.jpg', '2025-05-24 19:52:07', 30);

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
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
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('BpcWn9alY9pbINUWGJLxyOiP6qdE40pSikRJala8', NULL, '127.0.0.1', 'PostmanRuntime/7.44.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlVEemY0VVJTZ1o4bmI5aVhBWmR5REJFOXB2OTZkemd3RDRDTThPRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9waW5nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747784751),
('my1tRGtBCi7xvYnkdyKZd869zMoiMysY2z8PaNoa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0Y3VENUdEsxdUJSZDU5M3V3WEVHaW9McVNNYXZMQnVyQkxIUkxSZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747784831);

-- --------------------------------------------------------

--
-- Structure de la table `station`
--

CREATE TABLE `station` (
  `idstation` int(11) NOT NULL,
  `nomStation` varchar(45) NOT NULL,
  `localisation` varchar(45) DEFAULT NULL,
  `tarifStation` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `matricule` varchar(255) DEFAULT NULL,
  `solde` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `phone`, `matricule`, `solde`) VALUES
(1, 'saad', 'saad@example.com', NULL, '$2y$12$EogJj1.ThmntTlFVgELk4Od/qI11pD3BgVE2MUeRA3hksNgjwdnCi', NULL, '2025-05-20 19:28:29', '2025-05-21 20:25:38', '+212600000000', 'AN-154-TS', 200.00),
(2, 'houcine', 'houcine@example.com', NULL, '$2y$12$82.PW4TQ2lmpKF5BKZpB1eXAoJQ.SJBulguncOjpqLHg4i5MFi2Be', NULL, '2025-05-20 19:30:51', '2025-05-20 19:30:51', '+212600000000', 'Ar-155-TS', 0.00),
(3, 'hajar', 'hajare@example.com', NULL, '$2y$12$nESbTHV7mlINlfqyTvr0hOtis/HXCCI2/5YwGnZKtiRmi0ISUm2OO', NULL, '2025-05-21 20:28:21', '2025-05-21 20:28:21', '+212600000011', 'Ar-155-TR', 0.00);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `iduser` int(11) NOT NULL,
  `nomUser` varchar(255) NOT NULL,
  `prenomUser` varchar(45) DEFAULT NULL,
  `emailUser` varchar(45) DEFAULT NULL,
  `telUser` varchar(45) DEFAULT NULL,
  `passwordUser` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE `vehicule` (
  `idvehicule` int(11) NOT NULL,
  `plaqueImmat` varchar(45) NOT NULL,
  `marque` varchar(45) DEFAULT NULL,
  `modele` varchar(45) DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL,
  `photo` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `enregistrements_peage`
--
ALTER TABLE `enregistrements_peage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_enregistrements_peage_id` (`id`),
  ADD KEY `ix_enregistrements_peage_plaque_immatriculation` (`plaque_immatriculation`),
  ADD KEY `ix_enregistrements_peage_date_heure_passage` (`date_heure_passage`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ocr_results`
--
ALTER TABLE `ocr_results`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`idpaiement`),
  ADD KEY `fk_paiement_passage_idx` (`idpassage`);

--
-- Index pour la table `passage`
--
ALTER TABLE `passage`
  ADD PRIMARY KEY (`idpassage`),
  ADD KEY `fk_passage_vehicule_idx` (`idvehicule`),
  ADD KEY `fk_passage_station_idx` (`idstation`);

--
-- Index pour la table `passages`
--
ALTER TABLE `passages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `passages_user_id_foreign` (`user_id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `recharges`
--
ALTER TABLE `recharges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recharges_user_id_foreign` (`user_id`);

--
-- Index pour la table `resultats_ocr`
--
ALTER TABLE `resultats_ocr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_resultats_ocr_id` (`id`),
  ADD KEY `ix_resultats_ocr_matricule` (`matricule`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`idstation`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `emailUser` (`emailUser`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`idvehicule`),
  ADD UNIQUE KEY `plaqueImmat` (`plaqueImmat`),
  ADD KEY `fk_vehicule_utilisateur_idx` (`iduser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `enregistrements_peage`
--
ALTER TABLE `enregistrements_peage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `ocr_results`
--
ALTER TABLE `ocr_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `idpaiement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `passage`
--
ALTER TABLE `passage`
  MODIFY `idpassage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `passages`
--
ALTER TABLE `passages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `recharges`
--
ALTER TABLE `recharges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `resultats_ocr`
--
ALTER TABLE `resultats_ocr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `station`
--
ALTER TABLE `station`
  MODIFY `idstation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vehicule`
--
ALTER TABLE `vehicule`
  MODIFY `idvehicule` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `fk_paiement_passage` FOREIGN KEY (`idpassage`) REFERENCES `passage` (`idpassage`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `passage`
--
ALTER TABLE `passage`
  ADD CONSTRAINT `fk_passage_station` FOREIGN KEY (`idstation`) REFERENCES `station` (`idstation`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_passage_vehicule` FOREIGN KEY (`idvehicule`) REFERENCES `vehicule` (`idvehicule`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `passages`
--
ALTER TABLE `passages`
  ADD CONSTRAINT `passages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `recharges`
--
ALTER TABLE `recharges`
  ADD CONSTRAINT `recharges_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `fk_vehicule_utilisateur` FOREIGN KEY (`iduser`) REFERENCES `utilisateur` (`iduser`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
