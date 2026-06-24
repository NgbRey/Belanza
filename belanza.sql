-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for belanza
CREATE DATABASE IF NOT EXISTS `belanza` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `belanza`;

-- Dumping structure for table belanza.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.cache: ~4 rows (approximately)
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('belanza-cache-5c785c036466adea360111aa28563bfd556b5fba', 'i:1;', 1782268637),
	('belanza-cache-5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1782268637;', 1782268637),
	('laravel-cache-5c785c036466adea360111aa28563bfd556b5fba', 'i:1;', 1780506020),
	('laravel-cache-5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1780506020;', 1780506020);

-- Dumping structure for table belanza.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.cache_locks: ~0 rows (approximately)

-- Dumping structure for table belanza.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` smallint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.categories: ~6 rows (approximately)
INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Pria', 'pria', 'https://images.unsplash.com/photo-1523381210434-271e8be1f52b?w=600&h=600&fit=crop', 1, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(2, 'Wanita', 'wanita', 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=600&h=600&fit=crop', 2, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(3, 'Aksesoris', 'aksesoris', 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=600&h=600&fit=crop', 3, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(4, 'Sepatu', 'sepatu', 'https://images.unsplash.com/photo-1485968579580-b6d095142e6e?w=600&h=600&fit=crop', 4, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(5, 'Tas', 'tas', 'https://images.unsplash.com/photo-1566150905458-1bf1fc113f0d?w=600&h=600&fit=crop', 5, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(6, 'Muslimah', 'muslimah', 'https://images.unsplash.com/photo-1613048605431-6057d1b3b40d?w=600&h=600&fit=crop', 6, '2026-06-03 09:56:17', '2026-06-03 09:56:17');

-- Dumping structure for table belanza.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table belanza.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.jobs: ~0 rows (approximately)

-- Dumping structure for table belanza.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.job_batches: ~0 rows (approximately)

-- Dumping structure for table belanza.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2026_05_15_163938_create_categories_table', 1),
	(5, '2026_05_15_163942_create_products_table', 1),
	(6, '2026_05_16_000001_add_is_admin_to_users_table', 1),
	(7, '2026_05_16_000002_create_settings_table', 1),
	(8, '2026_05_16_062714_add_fulltext_index_to_products', 1),
	(9, '2026_05_16_090702_add_views_to_products', 1),
	(10, '2026_05_16_110058_drop_rating_and_review_count_from_products', 1),
	(11, '2026_05_19_000001_add_weight_to_products', 1),
	(12, '2026_05_19_000002_create_orders_table', 1),
	(13, '2026_05_19_000003_create_order_items_table', 1),
	(14, '2026_05_19_000004_create_payment_banks_table', 1),
	(15, '2026_05_19_000005_create_shipping_costs_table', 1),
	(16, '2026_05_20_000001_add_cost_per_kg_to_shipping_costs', 1);

-- Dumping structure for table belanza.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_cost` int unsigned NOT NULL DEFAULT '0',
  `total_price` int unsigned NOT NULL,
  `grand_total` int unsigned NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bank_transfer',
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_due_at` timestamp NULL DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `courier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courier_service` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.orders: ~0 rows (approximately)
INSERT INTO `orders` (`id`, `order_number`, `customer_name`, `customer_phone`, `customer_email`, `shipping_address`, `shipping_city`, `shipping_cost`, `total_price`, `grand_total`, `payment_method`, `payment_status`, `payment_due_at`, `paid_at`, `bank_name`, `bank_account_number`, `bank_account_name`, `order_status`, `courier`, `courier_service`, `tracking_number`, `notes`, `created_at`, `updated_at`) VALUES
	(1, 'INV/UNNOHDCV', 'rat', '0811111111', 'ear@mail.com', 'adadaaadad', 'Bandung', 20000, 45000, 65000, 'bank_transfer', 'paid', '2026-06-04 10:03:32', '2026-06-03 10:04:04', 'Mandiri', '9876543210', 'Toko yClothes', 'delivered', 'JNE', 'OKE', '11111111', NULL, '2026-06-03 10:03:32', '2026-06-23 19:29:39');

-- Dumping structure for table belanza.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` int unsigned NOT NULL,
  `qty` int unsigned NOT NULL,
  `subtotal` int unsigned NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.order_items: ~0 rows (approximately)
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `product_price`, `qty`, `subtotal`, `size`, `color`, `created_at`, `updated_at`) VALUES
	(1, 1, 16, 'Hijab Pashmina Ceruty', 45000, 1, 45000, NULL, '#C2A56D|Gold', '2026-06-03 10:03:32', '2026-06-03 10:03:32');

-- Dumping structure for table belanza.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table belanza.payment_banks
CREATE TABLE IF NOT EXISTS `payment_banks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.payment_banks: ~2 rows (approximately)
INSERT INTO `payment_banks` (`id`, `bank_name`, `account_number`, `account_name`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'BCA', '1234567890', 'Toko Belanza', 1, '2026-06-03 09:56:19', '2026-06-23 19:27:30'),
	(2, 'Mandiri', '9876543210', 'Toko Belanza', 1, '2026-06-03 09:56:19', '2026-06-23 19:27:40');

-- Dumping structure for table belanza.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` int unsigned NOT NULL,
  `sale_price` int unsigned DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` json DEFAULT NULL,
  `sizes` json DEFAULT NULL,
  `colors` json DEFAULT NULL,
  `badge` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `views` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_foreign` (`category_id`),
  FULLTEXT KEY `products_name_description_fulltext` (`name`,`description`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.products: ~16 rows (approximately)
INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `description`, `price`, `sale_price`, `image`, `images`, `sizes`, `colors`, `badge`, `weight`, `is_featured`, `views`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Kemeja Oxford Premium', 'kemeja-oxford-premium', 'Kemeja oxford berbahan katun premium. Nyaman dipakai sehari-hari dengan potongan slim fit yang elegan.', 199000, 149000, 'https://images.unsplash.com/photo-1523381210434-271e8be1f52b?w=600&h=750&fit=crop', NULL, '["S", "M", "L", "XL"]', '[{"hex": "#FFFFFF", "name": "Putih"}, {"hex": "#2C3947", "name": "Navy"}, {"hex": "#547A95", "name": "Biru"}]', 'SALE', 250, 0, 0, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(2, 1, 'Jaket Denim Classic', 'jaket-denim-classic', 'Jaket denim klasik dengan desain timeless. Cocok untuk gaya kasual sehari-hari.', 350000, NULL, 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=600&h=750&fit=crop', NULL, '["M", "L", "XL"]', '[{"hex": "#2C3947", "name": "Navy"}, {"hex": "#547A95", "name": "Biru"}]', NULL, 600, 0, 0, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(3, 1, 'Kaos Putih Polos Premium', 'kaos-putih-polos-premium', 'Kaos putih polos dengan bahan cotton combed 30s. Lembut dan adem.', 89000, NULL, 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=600&h=750&fit=crop', NULL, '["S", "M", "L", "XL", "XXL"]', '[{"hex": "#FFFFFF", "name": "Putih"}, {"hex": "#000000", "name": "Hitam"}, {"hex": "#E8EDF2", "name": "Abu-abu"}]', 'NEW', 150, 0, 0, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(4, 1, 'Celana Chino Slim Fit', 'celana-chino-slim-fit', 'Celana chino slim fit cocok untuk gaya kasual maupun semi-formal.', 179000, 159000, 'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=600&h=750&fit=crop', NULL, '["M", "L", "XL"]', '[{"hex": "#2C3947", "name": "Navy"}, {"hex": "#C2A56D", "name": "Coklat"}, {"hex": "#547A95", "name": "Biru"}]', 'SALE', 300, 0, 0, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(5, 2, 'Dress Elegan Midaxi', 'dress-elegan-midaxi', 'Dress midaxi dengan potongan A-line. Cocok untuk acara formal maupun casual.', 279000, NULL, 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=600&h=750&fit=crop', NULL, '["S", "M", "L"]', '[{"hex": "#C2A56D", "name": "Gold"}, {"hex": "#2C3947", "name": "Navy"}, {"hex": "#547A95", "name": "Biru"}]', NULL, 350, 0, 0, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(6, 2, 'Blouse Wanita Formal', 'blouse-wanita-formal', 'Blouse wanita dengan bahan sifon lembut. Cocok untuk ke kantor atau acara formal.', 159000, 129000, 'https://images.unsplash.com/photo-1445205170230-053b83016050?w=600&h=750&fit=crop', NULL, '["S", "M", "L", "XL"]', '[{"hex": "#FFFFFF", "name": "Putih"}, {"hex": "#547A95", "name": "Biru"}, {"hex": "#E8EDF2", "name": "Abu-abu"}]', 'SALE', 200, 0, 0, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(7, 2, 'Rok Midi A-Line', 'rok-midi-a-line', 'Rok midi A-line yang elegan. Nyaman dipakai untuk berbagai acara.', 139000, NULL, 'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?w=600&h=750&fit=crop', NULL, '["M", "L"]', '[{"hex": "#2C3947", "name": "Navy"}, {"hex": "#C2A56D", "name": "Coklat"}]', NULL, 250, 0, 0, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(8, 2, 'Cardigan Rajut Premium', 'cardigan-rajut-premium', 'Cardigan rajut dengan bahan lembut. Hangat dan stylish.', 199000, 179000, 'https://images.unsplash.com/photo-1614252369475-531eba835eb1?w=600&h=750&fit=crop', NULL, '["S", "M", "L", "XL"]', '[{"hex": "#C2A56D", "name": "Coklat"}, {"hex": "#547A95", "name": "Biru"}, {"hex": "#E8EDF2", "name": "Abu-abu"}]', 'NEW', 300, 0, 0, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(9, 3, 'Jam Tangan Pria Klasik', 'jam-tangan-pria-klasik', 'Jam tangan dengan desain klasik, strap kulit asli, water resistant.', 450000, NULL, 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=600&h=750&fit=crop', NULL, '[]', '[{"hex": "#2C3947", "name": "Coklat Tua"}, {"hex": "#C2A56D", "name": "Coklat"}]', NULL, 100, 0, 0, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(10, 3, 'Kacamata Hitam Premium', 'kacamata-hitam-premium', 'Kacamata hitam dengan frame metal kokoh. UV protection 100%.', 225000, 199000, 'https://images.unsplash.com/photo-1577803645773-f96470509666?w=600&h=750&fit=crop', NULL, '[]', '[{"hex": "#000000", "name": "Hitam"}, {"hex": "#C2A56D", "name": "Coklat"}]', 'SALE', 80, 0, 0, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(11, 4, 'Sneakers Casual White', 'sneakers-casual-white', 'Sneakers putih klasik yang cocok dipadukan dengan outfit apa pun.', 329000, NULL, 'https://images.unsplash.com/photo-1485968579580-b6d095142e6e?w=600&h=750&fit=crop', NULL, '["39", "40", "41", "42", "43"]', '[{"hex": "#FFFFFF", "name": "Putih"}, {"hex": "#000000", "name": "Hitam"}]', 'BEST', 500, 0, 0, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(12, 4, 'Sepatu Formal Kulit', 'sepatu-formal-kulit', 'Sepatu formal berbahan kulit asli. Nyaman dipakai seharian.', 499000, 429000, 'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=600&h=750&fit=crop', NULL, '["39", "40", "41", "42"]', '[{"hex": "#2C3947", "name": "Navy"}, {"hex": "#000000", "name": "Hitam"}]', 'SALE', 600, 0, 0, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(13, 5, 'Tas Kulit Wanita', 'tas-kulit-wanita', 'Tas kulit asli dengan desain elegan. Kompartemen luas untuk kebutuhan sehari-hari.', 550000, NULL, 'https://images.unsplash.com/photo-1566150905458-1bf1fc113f0d?w=600&h=750&fit=crop', NULL, '[]', '[{"hex": "#2C3947", "name": "Navy"}, {"hex": "#C2A56D", "name": "Coklat"}, {"hex": "#000000", "name": "Hitam"}]', NULL, 500, 0, 0, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(14, 5, 'Ransel Pria Premium', 'ransel-pria-premium', 'Ransel premium dengan bahan kanvas tebal. Muat laptop 15 inci.', 289000, 259000, 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=600&h=750&fit=crop', NULL, '[]', '[{"hex": "#2C3947", "name": "Navy"}, {"hex": "#547A95", "name": "Biru"}]', 'SALE', 400, 0, 0, '2026-06-03 09:56:17', '2026-06-03 09:56:17'),
	(15, 6, 'Gamis Elegan Sifon', 'gamis-elegan-sifon', 'Gamis sifon dengan payet halus. Cocok untuk acara formal dan kondangan.', 349000, NULL, 'https://images.unsplash.com/photo-1613048605431-6057d1b3b40d?w=600&h=750&fit=crop', NULL, '["S", "M", "L", "XL"]', '[{"hex": "#C2A56D", "name": "Gold"}, {"hex": "#547A95", "name": "Biru"}, {"hex": "#2C3947", "name": "Navy"}]', NULL, 400, 0, 0, '2026-06-03 09:56:18', '2026-06-03 09:56:18'),
	(16, 6, 'Hijab Pashmina Ceruty', 'hijab-pashmina-ceruty', 'Hijab pashmina bahan ceruty premium. Lembut dan tidak mudah kusut.', 59000, 45000, 'https://images.unsplash.com/photo-1649819697236-7e269d8c7bc3?w=600&h=750&fit=crop', NULL, '[]', '[{"hex": "#C2A56D", "name": "Gold"}, {"hex": "#547A95", "name": "Biru"}, {"hex": "#E8EDF2", "name": "Abu-abu"}, {"hex": "#FFFFFF", "name": "Putih"}]', 'SALE', 100, 0, 0, '2026-06-03 09:56:18', '2026-06-03 09:56:18');

-- Dumping structure for table belanza.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.sessions: ~2 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('L7Fkxd7mJEJy3SQOERi6XlNbVb6fxoByZh3Cld30', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJhSmhzcllneERRTFdTOVdDc1RaTGJHZG9vMmpKT3VJcFFjSnRONTFUIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2FkbWluIiwicm91dGUiOiJhZG1pbi5kYXNoYm9hcmQifSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjF9', 1782268578),
	('LopyrAmEcELgfXTvLEYAFzgXmaHWZCGLcaFDBDEJ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJ0NHRVRFJCNTI5aUs5dEJBcTh6MjlpRkU1Z2JyaGtQOWowMmVKSDIyIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hZG1pblwvcHJvZHVjdHMiLCJyb3V0ZSI6ImFkbWluLnByb2R1Y3RzLmluZGV4In0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwidXJsIjpbXSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjF9', 1780533860);

-- Dumping structure for table belanza.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.settings: ~21 rows (approximately)
INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'wa_number', '62881081011223', '2026-06-03 09:56:19', '2026-06-03 12:01:14'),
	(2, 'brand_name', 'Belanza', '2026-06-03 09:56:19', '2026-06-23 19:26:58'),
	(3, 'color_gold', '#c2a56d', '2026-06-03 09:56:19', '2026-06-03 12:01:14'),
	(4, 'color_accent', '#547a95', '2026-06-03 09:56:19', '2026-06-03 12:01:14'),
	(5, 'social_instagram', NULL, '2026-06-03 09:56:19', '2026-06-03 09:56:19'),
	(6, 'social_facebook', NULL, '2026-06-03 09:56:19', '2026-06-03 09:56:19'),
	(7, 'social_tiktok', NULL, '2026-06-03 09:56:19', '2026-06-03 09:56:19'),
	(8, 'flash_sale_ends_at', '2026-06-03T23:59', '2026-06-03 09:56:19', '2026-06-03 09:56:19'),
	(9, 'site_title', 'Belanza', '2026-06-03 09:56:19', '2026-06-03 11:59:06'),
	(10, 'site_description', 'Toko fashion premium untuk gaya terbaikmu. Temukan koleksi pakaian, aksesoris, dan sepatu terbaru.', '2026-06-03 09:56:19', '2026-06-03 09:56:19'),
	(11, 'hero_title', 'Koleksi Terbaru<br>Musim Ini', '2026-06-03 09:56:19', '2026-06-03 09:56:19'),
	(12, 'hero_subtitle', 'Temukan gaya terbaikmu dengan koleksi fashion premium. Dari kasual hingga formal, semua ada di sini.', '2026-06-03 09:56:19', '2026-06-03 09:56:19'),
	(13, 'banner_title', 'Belanja Nyaman Kualitas Aman', '2026-06-03 09:56:19', '2026-06-03 09:56:19'),
	(14, 'banner_text', 'Temukan gaya terbaikmu dengan koleksi fashion premium. Dari kasual hingga formal, semua ada di sini.', '2026-06-03 09:56:19', '2026-06-03 09:56:19'),
	(15, 'cta_text', 'Shop Now →', '2026-06-03 09:56:19', '2026-06-03 09:56:19'),
	(16, 'cta_link', '/products', '2026-06-03 09:56:19', '2026-06-03 09:56:19'),
	(17, 'store_location', 'Mandasyeh', '2026-06-03 09:56:19', '2026-06-03 12:01:14'),
	(18, 'banner_button', 'Belanja Sekarang', '2026-06-03 09:56:19', '2026-06-03 09:56:19'),
	(19, 'banner_link', '/products', '2026-06-03 09:56:19', '2026-06-03 09:56:19'),
	(20, 'cara_belanja_content', '<div>Berikut adalah langkah-langkah mudah untuk berbelanja di Website Kami.</div><ol><li>Pilih Produk</li><li>Jelajahi katalog produk kami di halaman <a href="/products">Produk</a>. Kamu bisa filter berdasarkan kategori atau mencari produk favoritmu.</li><li>Pilih Varian</li><li>Setelah menemukan produk yang diinginkan, pilih ukuran dan warna yang sesuai. Pastikan untuk memeriksa panduan ukuran jika tersedia.</li><li>Masukkan ke Keranjang</li><li>Klik tombol "Tambah ke Keranjang" dan produk akan tersimpan di keranjang belanja kamu. Kamu bisa lanjut berbelanja atau langsung checkout.</li><li>Checkout</li><li>Masukkan alamat pengiriman dan pilih metode pembayaran. Kami menerima transfer bank dan pembayaran online melalui Midtrans.</li><li>Konfirmasi Pembayaran</li><li>Lakukan pembayaran sesuai petunjuk dan konfirmasi melalui WhatsApp jika menggunakan transfer bank. Pesanan akan segera diproses setelah pembayaran dikonfirmasi.</li><li>Terima Pesanan</li><li>Pesanan akan dikirim dan kamu bisa melacak status pengiriman melalui halaman <a href="/order/track">Lacak Pesanan</a>.</li></ol><div>Ada pertanyaan? Hubungi kami via WhatsApp untuk bantuan lebih lanjut.</div>', '2026-06-03 09:56:19', '2026-06-03 12:01:14'),
	(21, 'about_content', '<div>Visi Kami</div><div>Menjadi destinasi fashion terdepan di Indonesia yang memberikan pengalaman belanja online terbaik dengan produk berkualitas dan pelayanan memuaskan.</div><div>Misi Kami</div><ul><li>Menyediakan produk fashion berkualitas dengan harga terjangkau</li><li>Memberikan pengalaman belanja online yang mudah, aman, dan nyaman</li><li>Terus berinovasi mengikuti tren fashion terkini</li><li>Memberikan pelayanan pelanggan terbaik</li></ul><div>Mengapa Memilih?</div><ul><li>Kualitas Terjamin: Setiap produk melalui proses quality control ketat sebelum dikirim.</li><li>Pengiriman Cepat: Dikirim dari kota terdekat dengan estimasi 2-4 hari kerja.</li><li>Layanan Pelanggan: Tim support siap membantu melalui WhatsApp selama jam kerja.</li></ul>', '2026-06-03 09:56:19', '2026-06-03 12:01:14');

-- Dumping structure for table belanza.shipping_costs
CREATE TABLE IF NOT EXISTS `shipping_costs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` int unsigned NOT NULL,
  `cost_per_kg` int unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.shipping_costs: ~6 rows (approximately)
INSERT INTO `shipping_costs` (`id`, `city_name`, `cost`, `cost_per_kg`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'Banda Aceh', 10000, 5000, 1, '2026-06-03 09:56:19', '2026-06-03 10:05:19'),
	(2, 'Sabang', 20000, 5000, 1, '2026-06-03 09:56:19', '2026-06-23 19:27:53'),
	(3, 'Naganraya', 25000, 5000, 1, '2026-06-03 09:56:19', '2026-06-23 19:28:00'),
	(4, 'Lhokseumawe', 22000, 5000, 1, '2026-06-03 09:56:19', '2026-06-23 19:28:19'),
	(5, 'Kota Langsa', 20000, 5000, 1, '2026-06-03 09:56:19', '2026-06-23 19:28:29'),
	(6, 'Medan', 35000, 7000, 1, '2026-06-03 09:56:19', '2026-06-03 09:56:19');

-- Dumping structure for table belanza.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table belanza.users: ~0 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin@belanza.test', '2026-06-03 09:56:18', '$2y$12$.gslbouk2KwBig4/d1D6F.jYeh9PMf5cOqGTpyz3OayOHX/ktHt.e', 'boQNbbIpQxEB6qZLhlO0xEREiSbPn5gZJvGTzRiyfevKy5YylIOXCUGTUmra', 1, '2026-06-03 09:56:19', '2026-06-23 19:26:37');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
