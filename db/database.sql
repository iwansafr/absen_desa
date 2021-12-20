SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


DROP TABLE IF EXISTS `absensi`;
CREATE TABLE `absensi` (
  `id` int NOT NULL,
  `karyawan_id` int NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1=berangkat,2=telat, 3=pulang cepat, 4=pulang,5=izin, 6=absen',
  `selisih_waktu` int NOT NULL,
  `jam_jadwal` time NOT NULL,
  `visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `absensi` (`id`, `karyawan_id`, `status`, `selisih_waktu`, `jam_jadwal`, `visit_time`) VALUES
(3, 1, 0, 0, '00:00:00', '2021-07-17 10:39:17'),
(4, 1, 0, 0, '00:00:00', '2021-10-27 02:24:07'),
(5, 1, 0, 0, '00:00:00', '2021-10-27 05:08:12'),
(7, 1, 4, 106, '13:00:00', '2021-11-01 07:46:25'),
(8, 1, 2, 369, '06:00:00', '2021-11-02 05:09:39'),
(9, 2, 2, 369, '06:00:00', '2021-11-02 05:09:41'),
(10, 1, 4, 34, '11:45:00', '2021-11-02 05:19:30');

DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int NOT NULL,
  `par_id` int DEFAULT NULL,
  `user_role_ids` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '1',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `admin_menu` (`id`, `par_id`, `user_role_ids`, `title`, `icon`, `link`, `sort_order`, `created`, `updated`) VALUES
(1, 0, ',1,2,3,', 'Dashboard', 'fa fa-tachometer-alt', '/', 1, '2019-03-30 03:05:59', '2020-07-02 22:52:29'),
(2, 0, ',1,2,3,', 'Content', 'fa fa-file-alt', '/content', 2, '2019-03-30 03:24:19', '2020-07-02 22:52:29'),
(3, 2, ',1,2,3,', 'Category', 'fa fa-list', '/content/category', 21, '2019-03-30 03:26:22', '2020-07-02 22:52:29'),
(4, 2, ',1,2,3,', 'Add Content', 'fa fa-pencil-alt', '/content/edit', 22, '2019-03-30 03:35:27', '2020-07-02 22:52:29'),
(5, 2, ',1,2,3,', 'Content List', 'fa fa-list', '/content/list', 23, '2019-03-30 03:35:44', '2020-07-02 22:52:29'),
(6, 2, ',1,2,3,', 'Tag', 'fa fa-list', '/content/tag', 24, '2019-03-30 03:36:06', '2020-07-02 22:52:29'),
(7, 0, ',1,2,3,', 'Gallery', 'fa fa-images', '/gallery', 3, '2019-03-31 22:53:29', '2020-07-02 22:52:29'),
(8, 7, ',1,2,3,', 'Images', 'fa fa-image', '/gallery', 31, '2019-03-31 22:53:57', '2020-07-02 22:52:29'),
(9, 0, ',1,2,', 'User', 'fa fa-user', '/user', 4, '2019-03-31 22:54:25', '2020-07-02 22:52:29'),
(10, 9, ',1,2,', 'User List', 'fa fa-dot-circle', '/user/list', 41, '2019-03-31 22:55:32', '2020-07-02 22:52:29'),
(11, 9, ',1,2,', 'User Edit', 'fa fa-dot-circle', '/user/edit', 42, '2019-03-31 22:58:48', '2020-07-02 22:52:29'),
(12, 9, ',1,', 'User Role', 'fa fa-dot-circle', '/user/role', 43, '2019-03-31 22:59:13', '2020-07-02 22:52:29'),
(13, 0, ',1,2,', 'Menu', 'fa fa-list', '/menu', 5, '2019-03-31 22:59:33', '2020-07-02 22:52:29'),
(14, 13, ',1,2,', 'Add Menu', 'fa fa-pencil-alt', '/menu/edit', 51, '2019-03-31 22:59:58', '2020-07-02 22:52:29'),
(15, 13, ',1,2,', 'Menu List', 'fa fa-pencil-alt', '/menu/list', 52, '2019-03-31 23:00:18', '2020-07-02 22:52:29'),
(16, 13, ',1,2,', 'Menu Position', 'fa fa-list', '/menu/position', 53, '2019-03-31 23:00:37', '2020-07-02 22:52:29'),
(17, 0, ',1,', 'Admin Menu', 'fa fa-list', '/admin_menu', 6, '2019-03-31 23:01:10', '2020-07-02 22:52:29'),
(18, 17, ',1,', 'Add Menu', 'fa fa-pencil-alt', '/admin_menu/edit', 61, '2019-04-01 05:45:00', '2020-07-02 22:52:29'),
(19, 17, ',1,', 'Menu List', 'fa fa-list', '/admin_menu/list', 62, '2019-04-01 05:45:20', '2020-07-02 22:52:29'),
(20, 17, ',1,', 'Menu Parent', 'fa fa-list', '/admin_menu/list?id=0', 63, '2019-04-01 05:46:00', '2020-07-02 22:52:29'),
(21, 0, ',1,2,', 'Data', 'fa fa-database', '/visitor', 7, '2019-04-01 05:46:34', '2020-07-02 22:52:29'),
(22, 21, ',1,2,', 'Visitor', 'fa fa-chart-bar', '/visitor', 72, '2019-04-01 05:46:56', '2020-07-02 22:52:29'),
(23, 0, ',1,2,', 'Configuration', 'fa fa-cog', '/config', 8, '2019-04-01 06:03:37', '2020-07-02 22:52:29'),
(24, 23, ',1,2,', 'Logo', 'fa fa-cog', '/config/logo', 81, '2019-04-01 06:04:28', '2020-07-02 22:52:29'),
(25, 23, ',1,2,', 'Site', 'fa fa-cog', '/config/site', 82, '2019-04-01 06:04:41', '2020-07-02 22:52:29'),
(26, 23, ',1,2,', 'Templates', 'fa fa-cog', '/config/templates', 83, '2019-04-01 06:04:57', '2020-07-02 22:52:29'),
(27, 23, ',1,2,', 'Contact', 'fa fa-cog', '/config/contact', 84, '2019-04-01 06:05:14', '2020-07-02 22:52:29'),
(28, 23, ',1,2,', 'Style', 'fa fa-cog', '/config/style', 86, '2019-04-01 06:06:52', '2020-07-02 22:52:29'),
(29, 23, ',1,2,', 'Script', 'fa fa-cog', '/config/script', 87, '2019-04-01 06:07:29', '2020-07-02 22:52:29'),
(30, 21, ',1,2,', 'Backup', 'fa fa-download', '/backup', 73, '2019-04-01 06:08:04', '2020-07-02 22:52:29'),
(31, 21, ',1,2,', 'Restore', 'fa fa-upload', '/restore', 74, '2019-04-01 06:08:15', '2020-07-02 22:52:29'),
(32, 21, ',1,2,', 'Delete Cache', 'fa fa-trash', '/config/delete_cache', 75, '2019-04-04 00:08:10', '2020-07-02 22:52:29'),
(33, 21, ',1,2,', 'Invoice', 'fa fa-money', '/invoice', 71, '2019-04-05 23:07:23', '2020-07-02 22:52:29'),
(34, 23, ',1,2,', 'Bank Account', 'fa fa-user', '/bank_account', 85, '2019-04-06 01:37:09', '2020-07-02 22:52:29'),
(35, 23, ',1,', 'Dashboard', 'fa fa-chart-bar', '/config/dashboard', 88, '2019-04-19 18:37:39', '2020-07-02 22:52:29'),
(37, 21, ',1,', 'Subscribers', 'fa fa-user', '/subscriber', 1, '2019-04-22 06:37:13', '2020-07-02 22:52:29'),
(38, 0, ',1,2,', 'Karyawan', 'fa fa-user', '#', 1, '2021-07-11 12:01:47', '2021-07-17 10:00:53'),
(39, 38, ',1,2,', 'Tambah Karyawan', 'fa fa-plus', '/karyawan/edit', 1, '2021-07-11 12:02:23', '2021-07-17 10:01:17'),
(40, 38, ',1,2,', 'Data Karyawan', 'fa fa-list', '/karyawan/list', 1, '2021-07-11 12:02:35', '2021-07-17 10:01:25');

DROP TABLE IF EXISTS `bank_account`;
CREATE TABLE `bank_account` (
  `id` int UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `person_name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `bank_number` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `bank_account` (`id`, `bank_name`, `person_name`, `icon`, `bank_number`, `created`, `updated`) VALUES
(1, 'BCA', 'Iwan Safrudin', 'icon_BCA.png', '0312609779', '2019-04-14 16:18:57', '2020-07-02 22:52:30'),
(2, 'BNI', 'Iwan Safrudin', 'icon_BNI.png', '0813920638', '2019-04-14 16:19:55', '2020-07-02 22:52:30');

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int NOT NULL,
  `par_id` int NOT NULL,
  `module` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=content,2=product',
  `module_id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unread, 1=read',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `config` (`id`, `name`, `value`) VALUES
(1, 'templates', '{\"public_template\":\"school\",\"admin_template\":\"AdminLTE\"}'),
(2, 'sites', '{\"title\":\"SISPUDES\",\"link\":\"https:\\/\\/sispudes.mdw.co.id\",\"image\":\"image_PRAMESTHA_MOUNTAIN_CITY.png\",\"keyword\":\"\",\"description\":\"\",\"year\":\"2020\",\"lang\":\"id\",\"use_cache\":\"0\"}'),
(3, 'logo', '{\"title\":\"faceprint\",\"image\":\"image_faceprint.png\",\"width\":\"100\",\"height\":\"50\",\"display\":\"image\"}'),
(19, 'site', '{\"title\":\"faceprint\",\"link\":\"\",\"image\":\"image_faceprint.png\",\"keyword\":\"faceapi\",\"description\":\"\",\"year\":\"\",\"lang\":\"id\",\"use_cache\":\"0\"}'),
(20, 'jam_kerja', '{\"jam_berangkat_awal\":\"06:00\",\"jam_berangkat_akhir\":\"11:30\",\"jam_pulang_awal\":\"11:45\",\"jam_pulang_akhir\":\"16:00\"}'),
(21, 'instansi', '{\"nama\":\"PEMERINTAHAN DESA TULAKAN\"}');

DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int NOT NULL,
  `cat_ids` mediumtext NOT NULL,
  `par_id` int DEFAULT '0',
  `tpl` varchar(255) DEFAULT '0',
  `tag_ids` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `intro` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `source` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `image_link` varchar(255) NOT NULL,
  `images` text NOT NULL,
  `videos` text,
  `document` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `hits` int NOT NULL,
  `last_hits` datetime NOT NULL,
  `rating` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `publish` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `content` (`id`, `cat_ids`, `par_id`, `tpl`, `tag_ids`, `title`, `slug`, `description`, `keyword`, `intro`, `content`, `source`, `image`, `icon`, `image_link`, `images`, `videos`, `document`, `author`, `hits`, `last_hits`, `rating`, `params`, `created`, `updated`, `publish`) VALUES
(1, ',1,', 0, '0', ',1,2,', 'Hello World', 'hello-world', 'Hello World\r\n', 'Hello World', 'Hello World\r\n', '<p>Hello World</p>\r\n', '', 'image_Hello_World_1541950550.png', '', '', '[\"images_Hello_World_0_1541950550.png\",\"images_Hello_World_1_1541950550.png\"]', NULL, '', 'admin', 153, '0000-00-00 00:00:00', '', '', '2018-11-11 22:35:50', '2020-07-03 05:52:30', 1);

DROP TABLE IF EXISTS `content_cat`;
CREATE TABLE `content_cat` (
  `id` int NOT NULL,
  `par_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `description` mediumtext NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `content_cat` (`id`, `par_id`, `title`, `slug`, `image`, `icon`, `description`, `publish`, `created`, `updated`) VALUES
(1, 0, 'Uncategorized', 'uncategorized', '', '', '', 1, '2018-11-11 22:23:38', '2020-07-03 05:52:30');

DROP TABLE IF EXISTS `content_tag`;
CREATE TABLE `content_tag` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `total` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `payment_method` tinyint(1) NOT NULL DEFAULT '1',
  `notes` varchar(255) NOT NULL,
  `items` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `ppn` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `jabatan` (`id`, `title`) VALUES
(1, 'Guru'),
(2, 'Karyawan'),
(3, 'Siswa');

DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE `karyawan` (
  `id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jabatan_id` int NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `jk` char(1) NOT NULL COMMENT 'L=laki-laki,P=Perempuan',
  `hp` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `karyawan` (`id`, `nama`, `jabatan_id`, `kelas`, `jk`, `hp`, `alamat`, `photo`) VALUES
(1, 'Iwan safrudin ', 1, '', 'L', '085290335332', '-', 'photo_Iwan_safrudin_.jpg'),
(2, 'Marulina Fivit Oktavia', 2, '', 'P', '082322202227', '', 'photo_Marulina_Fivit_Oktavia.jpg'),
(3, 'zefan', 3, '1', 'L', '0', '-', 'photo_zefan.jpg');

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int NOT NULL,
  `par_id` int NOT NULL DEFAULT '0',
  `position_id` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` mediumtext NOT NULL,
  `tpl` varchar(255) NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `menu` (`id`, `par_id`, `position_id`, `sort_order`, `title`, `link`, `tpl`, `publish`) VALUES
(1, 1, 1, 0, 'Home', ' ', '', 1),
(2, 0, 1, 0, 'Cluster', '#', '', 0),
(3, 2, 1, 0, 'Padmagriya', '#', '', 1),
(4, 2, 1, 0, 'Anapuri', '#', '', 1),
(5, 0, 1, 0, 'Plaza', '#', '', 0),
(6, 1, 1, 0, 'Fasilitas', 'https://www.pramestha.mdw.co.id/fasilitas.html', '', 1),
(7, 0, 1, 0, 'Tentang Kami', '#', '', 0),
(9, 0, 1, 1, 'CLUSTER ALINDA', '#', '', 1),
(10, 0, 1, 2, 'VILLA', '#', '', 1),
(11, 1, 1, 4, 'FASILITAS', 'https://www.pramestha.mdw.co.id/fasilitas.html', '', 1),
(12, 1, 1, 5, 'OUR DEVELOPMENT', 'https://www.pramestha.mdw.co.id/our-development.html', '', 1),
(14, 0, 1, 4, 'SEPUTAR PROPERTY', 'category/seputar-property.html', '', 1),
(15, 1, 1, 7, 'SPESIAL PROMO & EVENT', 'category/spesial-promo-event.html', '', 1),
(16, 9, 1, 0, 'TYPE 3 KAMAR', 'https://www.pramestha.mdw.co.id/alinda.html', '', 1),
(17, 0, 5, 1, 'ALINDA', '#', '', 1),
(18, 5, 5, 2, 'AMALA', 'https://www.pramestha.mdw.co.id/category/spesial-promo-event.html', '', 1),
(19, 9, 1, 0, 'TYPE 4 KAMAR', 'https://www.pramestha.mdw.co.id/type-4-kamar.html', '', 1),
(20, 5, 5, 3, 'WOOD VILLA', 'https://www.pramestha.mdw.co.id/category/spesial-promo-event.html', '', 1),
(21, 10, 1, 0, 'AMALA', 'https://www.pramestha.mdw.co.id/amala.html', '', 1),
(22, 6, 6, 0, 'SPECIAL PROMO & EVENT', 'category/spesial-promo-event.html', '', 1),
(23, 6, 6, 0, 'OUR DEVELOPMENT', 'category/spesial-promo-event.html', '', 1),
(24, 10, 1, 0, 'WOOD VILLA', 'https://www.pramestha.mdw.co.id/wood-villa.html', '', 1),
(26, 0, 1, 0, 'HOME', ' ', '', 1),
(29, 1, 1, 7, 'SPECIAL PROMO & EVENT', 'category/spesial-promo-event.html', '', 1),
(31, 6, 6, 0, 'SPECIAL PROMO & EVENT', 'https://www.pramestha.mdw.co.id/category/spesial-promo-event.html', '', 1),
(32, 6, 6, 0, 'OUR DEVELOPMENT', 'https://www.pramestha.mdw.co.id/our-development.html', '', 1),
(33, 0, 6, 2, 'SPECIAL PROMO & EVENT', 'https://www.pramestha.mdw.co.id/category/spesial-promo-event.html', '', 1),
(34, 5, 5, 0, 'AMALA', 'https://www.pramestha.mdw.co.id/amala.html', '', 1),
(35, 5, 5, 0, 'WOOD VILLA', 'https://www.pramestha.mdw.co.id/wood-villa.html', '', 1),
(36, 0, 5, 4, 'FASILITAS', 'https://www.pramestha.mdw.co.id/fasilitas.html', '', 1),
(37, 0, 5, 2, 'AMALA', 'https://www.pramestha.mdw.co.id/amala.html', '', 1),
(38, 0, 5, 3, 'WOOD VILLA', 'https://www.pramestha.mdw.co.id/wood-villa.html', '', 1),
(39, 0, 6, 1, 'OUR DEVELOPMENT', 'https://www.pramestha.mdw.co.id/our-development.html', '', 1),
(40, 0, 1, 3, 'ABOUT PRAMESTHA', '#', '', 1),
(41, 40, 1, 0, 'FASILITAS', '  https://www.pramestha.mdw.co.id/fasilitas.html', '', 1),
(42, 40, 1, 0, 'OUR DEVELOPMENT', 'https://www.pramestha.mdw.co.id/our-development.html', '', 1),
(43, 40, 1, 0, 'SPECIAL PROMO & EVENT', 'category/klaster.html', 'content_category', 1),
(44, 0, 1, 0, 'UPSLOPE', 'category/upslope-21.html', '', 0);

DROP TABLE IF EXISTS `menu_position`;
CREATE TABLE `menu_position` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `menu_position` (`id`, `title`, `created`, `updated`) VALUES
(1, 'Top Menu', '2018-11-12 02:16:02', '2020-07-02 22:52:30'),
(2, 'Bottom Menu', '2018-11-15 12:39:27', '2020-07-02 22:52:30');

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=unread,2=read',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int NOT NULL,
  `cat_ids` text NOT NULL,
  `tag_ids` text NOT NULL,
  `image` varchar(11) NOT NULL,
  `images` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(255) NOT NULL,
  `discount` double NOT NULL,
  `qty` int NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = not publish, 1 = publish',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `product_cat`;
CREATE TABLE `product_cat` (
  `id` int NOT NULL,
  `par_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `product_tag`;
CREATE TABLE `product_tag` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `total` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `subscriber`;
CREATE TABLE `subscriber` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `subscriber` (`id`, `email`, `created`, `updated`) VALUES
(1, 'iwansafr@gmail.com', '2019-04-22 06:39:07', '2020-07-02 22:52:31');

DROP TABLE IF EXISTS `trash`;
CREATE TABLE `trash` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `table_id` int NOT NULL,
  `table_title` varchar(255) NOT NULL,
  `table_content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `user_role_id` int NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = active, 0 = not active',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `user` (`id`, `username`, `password`, `email`, `image`, `user_role_id`, `active`, `created`, `updated`) VALUES
(1, 'root', '$2y$10$45QWDhukYbXFXViCxA70su93e5OsxUdAxFi20whzXxGE2NkM7BMY6', 'root@esoftgreat.com', 'image_root.jpeg', 1, 1, '2018-11-03 07:36:32', '2020-07-03 05:52:31'),
(2, 'admin', '$2y$10$Cl4.5IqxiOiB.osC76GZr.TreZcuenu/YxSScom7nQYgyekBdFD1G', 'pramestha@gmail.com', 'image_admin.png', 2, 1, '2020-05-15 14:27:40', '2020-07-03 05:52:31');

DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `ip` varchar(15) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=failed, 1=success',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user_login` (`id`, `user_id`, `ip`, `browser`, `status`, `created`) VALUES
(1, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 1, '2021-07-11 17:42:52'),
(2, 0, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 0, '2021-07-15 22:01:27'),
(3, 2, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 1, '2021-07-15 22:01:31'),
(4, 2, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 1, '2021-07-17 11:57:40'),
(5, 2, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 1, '2021-07-17 12:50:08'),
(6, 1, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', 1, '2021-10-27 09:21:08'),
(7, 1, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', 1, '2021-10-30 19:21:48'),
(8, 1, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', 1, '2021-11-01 13:41:15'),
(9, 1, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', 1, '2021-11-02 12:10:37');

DROP TABLE IF EXISTS `user_login_failed`;
CREATE TABLE `user_login_failed` (
  `id` int NOT NULL,
  `user_login_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user_login_failed` (`id`, `user_login_id`, `username`, `password`) VALUES
(1, 2, 'root', 'Dks_080308');

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int NOT NULL,
  `level` tinyint NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user_role` (`id`, `level`, `title`, `description`, `created`, `updated`) VALUES
(1, 1, 'root', 'super user', '2018-11-02 22:57:22', '2020-07-02 22:52:31'),
(2, 2, 'admin', 'the administrator', '2018-11-02 22:57:22', '2020-07-02 22:52:31'),
(3, 5, 'Member', 'User member yang hanya berlangganan saja', '2018-11-04 12:59:26', '2020-07-02 22:52:31');

DROP TABLE IF EXISTS `visitor`;
CREATE TABLE `visitor` (
  `id` int NOT NULL,
  `ip` varchar(50) NOT NULL,
  `visited` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `region` varchar(50) NOT NULL,
  `country` varchar(10) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `visitor` (`id`, `ip`, `visited`, `city`, `region`, `country`, `browser`, `created`) VALUES
(1, '::1', 'http://localhost/faceapi/home/index', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 17:44:01'),
(2, '::1', 'http://localhost/faceapi/home/index', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 17:44:34'),
(3, '::1', 'http://localhost/faceapi/home/index', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 17:45:18'),
(4, '::1', 'http://localhost/faceapi/home/content/list', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 17:45:48'),
(5, '::1', 'http://localhost/faceapi/home/content', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 17:45:50'),
(6, '::1', 'http://localhost/faceapi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 18:00:58'),
(7, '::1', 'http://localhost/faceapi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 18:01:11'),
(8, '::1', 'http://localhost/faceapi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 18:01:26'),
(9, '::1', 'http://localhost/faceapi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 18:01:32'),
(10, '::1', 'http://localhost/faceapi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 18:01:38'),
(11, '::1', 'http://localhost/faceapi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 18:02:20'),
(12, '::1', 'http://localhost/faceapi/public/models/face_recognition_model-weights_manifest.json', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:06:14'),
(13, '::1', 'http://localhost/faceapi/public/models/face_landmark_68_model-weights_manifest.json', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:06:15'),
(14, '::1', 'http://localhost/faceapi/public/models/ssd_mobilenetv1_model-weights_manifest.json', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:06:16'),
(15, '::1', 'http://localhost/faceapi/images/modules/anggota/Black%20Widow/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:07:44'),
(16, '::1', 'http://localhost/faceapi/images/modules/anggota/Hawkeye/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:07:45'),
(17, '::1', 'http://localhost/faceapi/images/modules/anggota/Captain%20America/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:07:45'),
(18, '::1', 'http://localhost/faceapi/images/modules/anggota/Jim%20Rhodes/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:07:46'),
(19, '::1', 'http://localhost/faceapi/images/modules/anggota/Tony%20Stark/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:07:46'),
(20, '::1', 'http://localhost/faceapi/images/modules/anggota/Thor/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:07:47'),
(21, '::1', 'http://localhost/faceapi/images/modules/anggota/Captain%20Marvel/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:07:47'),
(22, '::1', 'http://localhost/faceapi/images/modules/anggota/iwan/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:07:47'),
(23, '::1', 'http://localhost/faceapi/images/modules/anggota/lina/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:07:48'),
(24, '::1', 'http://localhost/faceapi/images/modules/anggota/Black%20Widow/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:08:07'),
(25, '::1', 'http://localhost/faceapi/images/modules/anggota/Captain%20America/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:08:08'),
(26, '::1', 'http://localhost/faceapi/images/modules/anggota/Hawkeye/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:08:08'),
(27, '::1', 'http://localhost/faceapi/images/modules/anggota/Jim%20Rhodes/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:08:09'),
(28, '::1', 'http://localhost/faceapi/images/modules/anggota/Thor/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:08:10'),
(29, '::1', 'http://localhost/faceapi/images/modules/anggota/Tony%20Stark/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:08:10'),
(30, '::1', 'http://localhost/faceapi/images/modules/anggota/Captain%20Marvel/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:08:11'),
(31, '::1', 'http://localhost/faceapi/images/modules/anggota/iwan/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:08:11'),
(32, '::1', 'http://localhost/faceapi/images/modules/anggota/lina/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:08:11'),
(33, '::1', 'http://localhost/faceapi/images/modules/anggota/Black%20Widow/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:13:47'),
(34, '::1', 'http://localhost/faceapi/images/modules/anggota/Captain%20America/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:13:47'),
(35, '::1', 'http://localhost/faceapi/images/modules/anggota/Jim%20Rhodes/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:13:48'),
(36, '::1', 'http://localhost/faceapi/images/modules/anggota/Tony%20Stark/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:13:48'),
(37, '::1', 'http://localhost/faceapi/images/modules/anggota/Hawkeye/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:13:49'),
(38, '::1', 'http://localhost/faceapi/images/modules/anggota/Thor/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:13:49'),
(39, '::1', 'http://localhost/faceapi/images/modules/anggota/Captain%20Marvel/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:13:50'),
(40, '::1', 'http://localhost/faceapi/images/modules/anggota/iwan/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:13:51'),
(41, '::1', 'http://localhost/faceapi/images/modules/anggota/lina/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:13:51'),
(42, '::1', 'http://localhost/faceapi/images/modules/anggota/Black%20Widow/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:25:54'),
(43, '::1', 'http://localhost/faceapi/images/modules/anggota/Captain%20America/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:25:54'),
(44, '::1', 'http://localhost/faceapi/images/modules/anggota/Hawkeye/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:25:55'),
(45, '::1', 'http://localhost/faceapi/images/modules/anggota/Jim%20Rhodes/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:25:56'),
(46, '::1', 'http://localhost/faceapi/images/modules/anggota/Tony%20Stark/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:25:57'),
(47, '::1', 'http://localhost/faceapi/images/modules/anggota/Thor/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:25:58'),
(48, '::1', 'http://localhost/faceapi/images/modules/anggota/Captain%20Marvel/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:25:59'),
(49, '::1', 'http://localhost/faceapi/images/modules/anggota/iwan/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:25:59'),
(50, '::1', 'http://localhost/faceapi/images/modules/anggota/lina/1.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-11 19:26:00'),
(51, '::1', 'http://localhost/faceapi/home/pengunjung', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-12 06:19:46'),
(52, '::1', 'http://localhost/faceapi/assets/sound/welcome.mp3', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-12 06:25:52'),
(53, '::1', 'http://localhost/faceapi/home/pengunjung', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-12 16:21:13'),
(54, '::1', 'http://localhost/faceapi/assets/js/script.js%22%3E%3C/script%3E', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-12 16:23:07'),
(55, '::1', 'http://localhost/faceapi/assets/sound/welcome.mp3', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-12 18:24:07'),
(56, '::1', 'http://localhost/faceapi/assets/sound/welcome.mp3', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-12 18:24:29'),
(57, '::1', 'http://localhost/faceapi/assets/background/background.png', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-07-17 07:51:28'),
(58, '::1', 'http://localhost/absen_desa/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '2021-11-02 12:24:58');


ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `bank_account`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `content_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

ALTER TABLE `content_tag`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `menu_position`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `product_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `trash`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_login_failed`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `absensi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `admin_menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

ALTER TABLE `bank_account`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

ALTER TABLE `content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

ALTER TABLE `content_cat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

ALTER TABLE `content_tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `invoice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

ALTER TABLE `jabatan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `karyawan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

ALTER TABLE `menu_position`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `message`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `product_cat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `product_tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `subscriber`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `trash`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=360;

ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `user_login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `user_login_failed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `user_role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `visitor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;


ALTER TABLE `trash`
  ADD CONSTRAINT `trash_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
