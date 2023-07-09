-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 09, 2023 at 02:06 PM
-- Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realtime_fuel_monitoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `identity`
--

CREATE TABLE `identity` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `titik_berangkat` varchar(255) NOT NULL,
  `titik_tujuan` varchar(255) NOT NULL,
  `volume_bbm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `identity`
--

INSERT INTO `identity` (`id`, `nama`, `tanggal`, `titik_berangkat`, `titik_tujuan`, `volume_bbm`) VALUES
(1, 'Kapal1', '2023-06-25 00:00:00', '-7.196126, 112.733842', '-7.249004, 112.803365', 100),
(2, 'Royal 1', '2023-06-25 00:00:00', '-7.2249216668, 112.78898', '-7.236, 112.801', 6),
(3, 'Royal 2', '2023-06-25 00:00:00', '-7.236, 112.801', '-7.2249216668, 112.78898', 6);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `identity_id` int(11) NOT NULL,
  `flowrate` float NOT NULL,
  `volume` bigint(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `identity_id`, `flowrate`, `volume`, `timestamp`) VALUES
(1, 1, 0, 0, '2023-06-24 18:26:49'),
(2, 1, 0, 0, '2023-06-24 18:36:39'),
(3, 1, 0, 0, '2023-06-24 18:36:45'),
(4, 1, 0, 0, '2023-06-24 18:36:50'),
(5, 1, 0, 0, '2023-06-24 18:36:55'),
(6, 1, 0, 0, '2023-06-24 18:37:01'),
(7, 1, 0, 0, '2023-06-24 18:37:06'),
(8, 1, 0, 0, '2023-06-24 18:37:11'),
(9, 1, 0, 0, '2023-06-24 18:37:16'),
(10, 1, 0, 0, '2023-06-24 18:37:21'),
(11, 1, 0, 0, '2023-06-24 18:37:27'),
(12, 1, 3.81, 296, '2023-06-24 18:37:35'),
(13, 1, 0, 296, '2023-06-24 18:37:40'),
(14, 1, 0, 296, '2023-06-24 18:37:45'),
(15, 1, 0, 296, '2023-06-24 18:37:53'),
(16, 1, 0, 296, '2023-06-24 18:37:59'),
(17, 1, 0, 296, '2023-06-24 18:38:04'),
(18, 1, 0, 296, '2023-06-24 18:38:10'),
(19, 1, 0, 296, '2023-06-24 18:38:15'),
(20, 1, 0, 296, '2023-06-24 18:38:20'),
(21, 1, 0, 296, '2023-06-24 18:38:25'),
(22, 1, 0, 296, '2023-06-24 18:38:34'),
(23, 1, 0, 296, '2023-06-24 18:38:39'),
(24, 1, 0, 296, '2023-06-24 18:38:44'),
(25, 1, 0, 296, '2023-06-24 18:38:49'),
(26, 1, 0, 296, '2023-06-24 18:38:55'),
(27, 1, 0, 296, '2023-06-24 18:39:05'),
(28, 1, 0, 296, '2023-06-24 18:39:10'),
(29, 1, 0, 296, '2023-06-24 18:39:15'),
(30, 1, 0, 296, '2023-06-24 18:39:20'),
(31, 1, 0, 296, '2023-06-24 18:39:26'),
(32, 1, 0, 0, '2023-06-24 18:40:40'),
(33, 1, 0, 0, '2023-06-24 18:40:46'),
(34, 1, 0, 0, '2023-06-24 18:40:51'),
(35, 1, 0, 0, '2023-06-24 18:40:56'),
(36, 1, 0, 0, '2023-06-24 18:41:01'),
(37, 1, 0, 0, '2023-06-24 18:41:06'),
(38, 1, 0, 0, '2023-06-24 18:41:12'),
(39, 1, 0, 0, '2023-06-24 18:41:17'),
(40, 1, 0, 0, '2023-06-24 18:41:22'),
(41, 1, 0, 0, '2023-06-24 18:41:27'),
(42, 1, 0, 0, '2023-06-24 18:41:33'),
(43, 1, 0, 0, '2023-06-24 18:41:38'),
(44, 1, 0, 0, '2023-06-24 18:41:43'),
(45, 1, 0, 0, '2023-06-24 18:41:48'),
(46, 1, 0, 0, '2023-06-24 18:41:53'),
(47, 1, 0, 0, '2023-06-24 18:41:59'),
(48, 1, 0, 0, '2023-06-24 18:42:04'),
(49, 1, 0, 0, '2023-06-24 18:42:09'),
(50, 1, 0, 0, '2023-06-24 18:42:14'),
(51, 1, 0, 0, '2023-06-24 18:42:19'),
(52, 1, 0, 0, '2023-06-24 18:42:25'),
(53, 1, 0, 0, '2023-06-24 18:42:30'),
(54, 1, 0, 0, '2023-06-24 18:42:35'),
(55, 1, 0, 0, '2023-06-24 18:42:40'),
(56, 1, 0, 0, '2023-06-24 18:42:46'),
(57, 1, 0, 0, '2023-06-24 18:42:51'),
(58, 1, 0, 0, '2023-06-24 18:42:56'),
(59, 1, 0, 0, '2023-06-24 18:43:01'),
(60, 1, 0, 0, '2023-06-24 18:43:07'),
(61, 1, 0, 0, '2023-06-24 18:43:12'),
(62, 1, 0, 0, '2023-06-24 18:43:17'),
(63, 1, 0, 0, '2023-06-24 18:43:22'),
(64, 1, 0, 0, '2023-06-24 18:43:27'),
(65, 1, 0, 0, '2023-06-24 18:43:33'),
(66, 1, 0, 0, '2023-06-24 18:43:38'),
(67, 1, 0, 0, '2023-06-25 03:34:55'),
(68, 1, 0, 0, '2023-06-25 03:35:05'),
(69, 1, 0, 0, '2023-06-25 03:35:10'),
(70, 1, 0, 0, '2023-06-25 03:35:15'),
(71, 1, 0, 0, '2023-06-25 03:35:21'),
(72, 1, 0, 0, '2023-06-25 03:35:26'),
(73, 1, 0, 0, '2023-06-25 03:35:31'),
(74, 1, 0, 0, '2023-06-25 03:35:36'),
(75, 1, 0, 0, '2023-06-25 03:35:42'),
(76, 1, 0, 0, '2023-06-25 03:35:47'),
(77, 1, 0, 0, '2023-06-25 03:35:53'),
(78, 1, 0, 0, '2023-06-25 03:35:58'),
(79, 1, 0, 0, '2023-06-25 03:36:04'),
(80, 1, 0, 0, '2023-06-25 03:36:09'),
(81, 1, 0, 0, '2023-06-25 03:36:14'),
(82, 1, 0, 0, '2023-06-25 03:36:20'),
(83, 1, 0, 0, '2023-06-25 03:36:25'),
(84, 1, 0, 0, '2023-06-25 03:36:30'),
(85, 1, 0, 0, '2023-06-25 03:36:36'),
(86, 1, 0, 0, '2023-06-25 03:36:41'),
(87, 1, 0, 0, '2023-06-25 03:36:47'),
(88, 1, 0, 0, '2023-06-25 03:36:52'),
(89, 1, 0, 0, '2023-06-25 03:36:58'),
(90, 1, 0, 0, '2023-06-25 03:37:04'),
(91, 1, 0, 0, '2023-06-25 03:37:09'),
(92, 1, 0, 0, '2023-06-25 03:37:14'),
(93, 1, 0, 0, '2023-06-25 03:37:20'),
(94, 1, 0, 0, '2023-06-25 03:37:25'),
(95, 1, 0, 0, '2023-06-25 03:37:30'),
(96, 1, 0, 0, '2023-06-25 03:37:35'),
(97, 1, 0, 0, '2023-06-25 03:37:41'),
(98, 1, 0, 0, '2023-06-25 03:37:46'),
(99, 1, 0, 0, '2023-06-25 03:37:52'),
(100, 1, 0, 0, '2023-06-25 03:37:57'),
(101, 1, 0, 0, '2023-06-25 03:38:02'),
(102, 1, 0, 0, '2023-06-25 03:38:08'),
(103, 1, 0, 0, '2023-06-25 03:38:13'),
(104, 1, 0, 0, '2023-06-25 03:38:19'),
(105, 1, 0, 0, '2023-06-25 03:38:24'),
(106, 1, 0, 0, '2023-06-25 03:38:30'),
(107, 1, 0, 0, '2023-06-25 03:38:35'),
(108, 1, 0, 0, '2023-06-25 03:38:41'),
(109, 1, 0, 0, '2023-06-25 03:38:46'),
(110, 2, 0, 0, '2023-06-25 03:38:47'),
(111, 2, 0, 0, '2023-06-25 03:38:51'),
(112, 2, 0, 0, '2023-06-25 03:38:57'),
(113, 2, 0, 0, '2023-06-25 03:39:02'),
(114, 2, 0, 0, '2023-06-25 03:39:08'),
(115, 2, 0, 0, '2023-06-25 03:39:13'),
(116, 2, 0, 0, '2023-06-25 03:39:18'),
(117, 2, 0, 0, '2023-06-25 03:39:24'),
(118, 2, 0, 0, '2023-06-25 03:39:29'),
(119, 2, 0.19, 14, '2023-06-25 03:39:34'),
(120, 2, 1.67, 143, '2023-06-25 03:39:40'),
(121, 2, 0.57, 187, '2023-06-25 03:39:45'),
(122, 2, 0.62, 235, '2023-06-25 03:39:51'),
(123, 2, 0.86, 301, '2023-06-25 03:39:56'),
(124, 2, 0.43, 334, '2023-06-25 03:40:01'),
(125, 2, 0.48, 371, '2023-06-25 03:40:07'),
(126, 2, 1.14, 459, '2023-06-25 03:40:12'),
(127, 2, 1.71, 592, '2023-06-25 03:40:17'),
(128, 2, 1.1, 677, '2023-06-25 03:40:22'),
(129, 2, 1.38, 784, '2023-06-25 03:40:28'),
(130, 2, 0, 784, '2023-06-25 03:40:33'),
(131, 2, 0, 784, '2023-06-25 03:40:38'),
(132, 2, 1.14, 872, '2023-06-25 03:40:44'),
(133, 2, 2.1, 1034, '2023-06-25 03:40:49'),
(134, 2, 1.57, 1156, '2023-06-25 03:40:55'),
(135, 2, 1.67, 1285, '2023-06-25 03:41:00'),
(136, 2, 0.48, 1322, '2023-06-25 03:41:05'),
(137, 2, 0, 1322, '2023-06-25 03:41:11'),
(138, 2, 0.05, 1325, '2023-06-25 03:41:16'),
(139, 2, 0, 1325, '2023-06-25 03:41:21'),
(140, 2, 0.29, 1347, '2023-06-25 03:41:27'),
(141, 2, 0.29, 1369, '2023-06-25 03:41:32'),
(142, 2, 0.48, 1406, '2023-06-25 03:41:38'),
(143, 2, 0.24, 1424, '2023-06-25 03:41:43'),
(144, 2, 0, 1424, '2023-06-25 03:41:48'),
(145, 2, 0, 1424, '2023-06-25 03:41:54'),
(146, 2, 0, 1424, '2023-06-25 03:41:59'),
(147, 2, 0, 1424, '2023-06-25 03:42:05'),
(148, 2, 0.19, 1438, '2023-06-25 03:42:10'),
(149, 2, 1, 1515, '2023-06-25 03:42:16'),
(150, 2, 0.05, 1518, '2023-06-25 03:42:21'),
(151, 2, 0.05, 1521, '2023-06-25 03:42:26'),
(152, 2, 0.14, 1532, '2023-06-25 03:42:32'),
(153, 2, 0.1, 1539, '2023-06-25 03:42:37'),
(154, 2, 0.14, 1550, '2023-06-25 03:42:42'),
(155, 2, 0.52, 1590, '2023-06-25 03:42:47'),
(156, 2, 0.24, 1608, '2023-06-25 03:42:53'),
(157, 2, 0.1, 1615, '2023-06-25 03:42:58'),
(158, 2, 0.19, 1629, '2023-06-25 03:43:08'),
(159, 2, 0.33, 1654, '2023-06-25 03:43:13'),
(160, 2, 0.33, 1679, '2023-06-25 03:43:19'),
(161, 2, 0.19, 1693, '2023-06-25 03:43:24'),
(162, 2, 0.19, 1707, '2023-06-25 03:43:29'),
(163, 2, 0.29, 1729, '2023-06-25 03:43:34'),
(164, 2, 0.19, 1743, '2023-06-25 03:43:40'),
(165, 2, 0.1, 1750, '2023-06-25 03:43:45'),
(166, 2, 0.43, 1783, '2023-06-25 03:43:51'),
(167, 2, 0.33, 1808, '2023-06-25 03:43:56'),
(168, 2, 0.38, 1837, '2023-06-25 03:44:01'),
(169, 2, 0.19, 1851, '2023-06-25 03:44:06'),
(170, 2, 0.29, 1873, '2023-06-25 03:44:12'),
(171, 2, 0.43, 1906, '2023-06-25 03:44:17'),
(172, 2, 0.38, 1935, '2023-06-25 03:44:22'),
(173, 2, 0.86, 2001, '2023-06-25 03:44:32'),
(174, 2, 0.19, 2015, '2023-06-25 03:44:37'),
(175, 2, 0.24, 2033, '2023-06-25 03:44:42'),
(176, 2, 0.43, 2066, '2023-06-25 03:44:48'),
(177, 2, 0.38, 2095, '2023-06-25 03:44:53'),
(178, 2, 0.48, 2132, '2023-06-25 03:44:59'),
(179, 2, 0.76, 2191, '2023-06-25 03:45:04'),
(180, 2, 0.24, 2209, '2023-06-25 03:45:09'),
(181, 2, 0.48, 2246, '2023-06-25 03:45:14'),
(182, 2, 0.33, 2271, '2023-06-25 03:45:20'),
(183, 2, 0.33, 2296, '2023-06-25 03:45:25'),
(184, 2, 0.57, 2340, '2023-06-25 03:45:35'),
(185, 2, 0.52, 2380, '2023-06-25 03:45:40'),
(186, 2, 0.33, 2405, '2023-06-25 03:45:46'),
(187, 2, 0.43, 2438, '2023-06-25 03:45:51'),
(188, 2, 0.24, 2456, '2023-06-25 03:45:56'),
(189, 2, 0.33, 2481, '2023-06-25 03:46:02'),
(190, 2, 0.43, 2514, '2023-06-25 03:46:07'),
(191, 2, 0.19, 2528, '2023-06-25 03:46:12'),
(192, 2, 0.24, 2546, '2023-06-25 03:46:18'),
(193, 2, 0.29, 2568, '2023-06-25 03:46:23'),
(194, 2, 0.14, 2579, '2023-06-25 03:46:28'),
(195, 2, 0.29, 2601, '2023-06-25 03:46:34'),
(196, 2, 0.19, 2615, '2023-06-25 03:46:39'),
(197, 2, 0.38, 2644, '2023-06-25 03:46:45'),
(198, 2, 0.48, 2681, '2023-06-25 03:46:50'),
(199, 2, 0.38, 2710, '2023-06-25 03:46:55'),
(200, 2, 0.52, 2750, '2023-06-25 03:47:00'),
(201, 2, 0.48, 2787, '2023-06-25 03:47:06'),
(202, 2, 0.33, 2812, '2023-06-25 03:47:11'),
(203, 2, 0.48, 2849, '2023-06-25 03:47:19'),
(204, 2, 0.48, 2886, '2023-06-25 03:47:25'),
(205, 2, 0.19, 2900, '2023-06-25 03:47:30'),
(206, 2, 0.38, 2929, '2023-06-25 03:47:36'),
(207, 2, 0.29, 2951, '2023-06-25 03:47:41'),
(208, 2, 0.29, 2973, '2023-06-25 03:47:47'),
(209, 2, 0.19, 2987, '2023-06-25 03:47:52'),
(210, 2, 0.19, 3001, '2023-06-25 03:47:57'),
(211, 2, 0.38, 3030, '2023-06-25 03:48:03'),
(212, 2, 0.29, 3052, '2023-06-25 03:48:08'),
(213, 2, 0.38, 3081, '2023-06-25 03:48:13'),
(214, 2, 0.71, 3136, '2023-06-25 03:48:19'),
(215, 2, 0.43, 3169, '2023-06-25 03:48:24'),
(216, 2, 0.19, 3183, '2023-06-25 03:48:30'),
(217, 2, 0.33, 3208, '2023-06-25 03:48:35'),
(218, 2, 0.38, 3237, '2023-06-25 03:48:40'),
(219, 2, 0.43, 3270, '2023-06-25 03:48:46'),
(220, 2, 0.24, 3288, '2023-06-25 03:48:51'),
(221, 2, 0.43, 3321, '2023-06-25 03:48:56'),
(222, 2, 0.29, 3343, '2023-06-25 03:49:02'),
(223, 2, 0.29, 3365, '2023-06-25 03:49:07'),
(224, 2, 0.29, 3387, '2023-06-25 03:49:13'),
(225, 2, 0.29, 3409, '2023-06-25 03:49:18'),
(226, 2, 0.33, 3434, '2023-06-25 03:49:23'),
(227, 2, 0.48, 3471, '2023-06-25 03:49:29'),
(228, 2, 0.52, 3511, '2023-06-25 03:49:34'),
(229, 2, 0.19, 3525, '2023-06-25 03:49:39'),
(230, 2, 0.48, 3562, '2023-06-25 03:49:44'),
(231, 2, 0.48, 3599, '2023-06-25 03:49:50'),
(232, 2, 0.14, 3610, '2023-06-25 03:49:55'),
(233, 2, 0.19, 3624, '2023-06-25 03:50:00'),
(234, 2, 0.43, 3657, '2023-06-25 03:50:06'),
(235, 2, 0.43, 3690, '2023-06-25 03:50:11'),
(236, 2, 0.33, 3715, '2023-06-25 03:50:17'),
(237, 2, 0.43, 3748, '2023-06-25 03:50:22'),
(238, 2, 0.43, 3781, '2023-06-25 03:50:27'),
(239, 2, 0.48, 3818, '2023-06-25 03:50:33'),
(240, 2, 0.38, 3847, '2023-06-25 03:50:38'),
(241, 2, 0.48, 3884, '2023-06-25 03:50:43'),
(242, 2, 0.57, 3928, '2023-06-25 03:50:48'),
(243, 2, 0.43, 3961, '2023-06-25 03:50:54'),
(244, 2, 0.52, 4001, '2023-06-25 03:50:59'),
(245, 2, 0.33, 4026, '2023-06-25 03:51:04'),
(246, 2, 0.57, 4070, '2023-06-25 03:51:09'),
(247, 2, 0.33, 4095, '2023-06-25 03:51:15'),
(248, 2, 0.52, 4135, '2023-06-25 03:51:20'),
(249, 2, 0.29, 4157, '2023-06-25 03:51:25'),
(250, 2, 0.24, 4175, '2023-06-25 03:51:31'),
(251, 2, 0.29, 4197, '2023-06-25 03:51:36'),
(252, 2, 0.48, 4234, '2023-06-25 03:51:41'),
(253, 2, 0.19, 4248, '2023-06-25 03:51:46'),
(254, 2, 0.19, 4262, '2023-06-25 03:51:52'),
(255, 2, 0.33, 4287, '2023-06-25 03:51:57'),
(256, 2, 0.24, 4305, '2023-06-25 03:52:02'),
(257, 2, 0.19, 4319, '2023-06-25 03:52:08'),
(258, 2, 0.38, 4348, '2023-06-25 03:52:13'),
(259, 2, 0.57, 4392, '2023-06-25 03:52:19'),
(260, 2, 0.19, 4406, '2023-06-25 03:52:24'),
(261, 2, 0.19, 4420, '2023-06-25 03:52:29'),
(262, 2, 0.38, 4449, '2023-06-25 03:52:34'),
(263, 2, 0.24, 4467, '2023-06-25 03:52:40'),
(264, 2, 0.29, 4489, '2023-06-25 03:52:45'),
(265, 2, 0.48, 4526, '2023-06-25 03:52:51'),
(266, 2, 0.29, 4548, '2023-06-25 03:52:56'),
(267, 2, 0.57, 4592, '2023-06-25 03:53:01'),
(268, 2, 0.38, 4621, '2023-06-25 03:53:07'),
(269, 2, 0.33, 4646, '2023-06-25 03:53:12'),
(270, 2, 0.33, 4671, '2023-06-25 03:53:17'),
(271, 2, 0.38, 4700, '2023-06-25 03:53:23'),
(272, 2, 0.19, 4714, '2023-06-25 03:53:28'),
(273, 2, 0.14, 4725, '2023-06-25 03:53:33'),
(274, 2, 0.14, 4736, '2023-06-25 03:53:38'),
(275, 2, 0, 4736, '2023-06-25 03:53:43'),
(276, 2, 0, 4736, '2023-06-25 03:53:49'),
(277, 2, 0, 4736, '2023-06-25 03:53:54'),
(278, 2, 0, 4736, '2023-06-25 03:54:00'),
(279, 2, 0, 4736, '2023-06-25 03:54:05'),
(280, 2, 0, 0, '2023-06-25 04:17:13'),
(281, 3, 0, 0, '2023-06-25 04:17:17'),
(282, 3, 0, 0, '2023-06-25 04:17:18'),
(283, 3, 0, 0, '2023-06-25 04:17:23'),
(284, 3, 0, 0, '2023-06-25 04:17:28'),
(285, 3, 0, 0, '2023-06-25 04:17:34'),
(286, 3, 0, 0, '2023-06-25 04:17:39'),
(287, 3, 0, 0, '2023-06-25 04:17:44'),
(288, 3, 0, 0, '2023-06-25 04:17:49'),
(289, 3, 0, 0, '2023-06-25 04:17:55'),
(290, 3, 0, 0, '2023-06-25 04:18:00'),
(291, 3, 0, 0, '2023-06-25 04:18:05'),
(292, 3, 0.1, 7, '2023-06-25 04:18:10'),
(293, 3, 0.52, 47, '2023-06-25 04:18:16'),
(294, 3, 0.9, 117, '2023-06-25 04:18:21'),
(295, 3, 1, 194, '2023-06-25 04:18:26'),
(296, 3, 1.43, 305, '2023-06-25 04:18:31'),
(297, 3, 1.14, 393, '2023-06-25 04:18:37'),
(298, 3, 0.57, 437, '2023-06-25 04:18:42'),
(299, 3, 0.38, 466, '2023-06-25 04:18:48'),
(300, 3, 0.57, 510, '2023-06-25 04:18:53'),
(301, 3, 0.76, 569, '2023-06-25 04:18:58'),
(302, 3, 0.33, 594, '2023-06-25 04:19:04'),
(303, 3, 0.71, 649, '2023-06-25 04:19:09'),
(304, 3, 0.67, 700, '2023-06-25 04:19:17'),
(305, 3, 1, 777, '2023-06-25 04:19:23'),
(306, 3, 0.62, 825, '2023-06-25 04:19:28'),
(307, 3, 0.95, 899, '2023-06-25 04:19:33'),
(308, 3, 0.19, 913, '2023-06-25 04:19:39'),
(309, 3, 0, 913, '2023-06-25 04:19:44'),
(310, 3, 0, 913, '2023-06-25 04:19:49'),
(311, 3, 0, 913, '2023-06-25 04:19:55'),
(312, 3, 0.14, 924, '2023-06-25 04:20:00'),
(313, 3, 0, 924, '2023-06-25 04:20:06'),
(314, 3, 0.14, 935, '2023-06-25 04:20:11'),
(315, 3, 0.14, 946, '2023-06-25 04:20:16'),
(316, 3, 0, 946, '2023-06-25 04:20:22'),
(317, 3, 0.05, 949, '2023-06-25 04:20:27'),
(318, 3, 0, 949, '2023-06-25 04:20:32'),
(319, 3, 0, 949, '2023-06-25 04:20:38'),
(320, 3, 0, 949, '2023-06-25 04:20:43'),
(321, 3, 0.14, 960, '2023-06-25 04:20:48'),
(322, 3, 0, 960, '2023-06-25 04:20:54'),
(323, 3, 0, 960, '2023-06-25 04:20:59'),
(324, 3, 1.1, 1045, '2023-06-25 04:21:04'),
(325, 3, 0.38, 1074, '2023-06-25 04:21:09'),
(326, 3, 0.1, 1081, '2023-06-25 04:21:15'),
(327, 3, 0.1, 1088, '2023-06-25 04:21:20'),
(328, 3, 0.29, 1110, '2023-06-25 04:21:25'),
(329, 3, 0.29, 1132, '2023-06-25 04:21:31'),
(330, 3, 0.29, 1154, '2023-06-25 04:21:36'),
(331, 3, 0.05, 1157, '2023-06-25 04:21:41'),
(332, 3, 0.1, 1164, '2023-06-25 04:21:47'),
(333, 3, 0.14, 1175, '2023-06-25 04:21:52'),
(334, 3, 0.33, 1200, '2023-06-25 04:21:57'),
(335, 3, 0.24, 1218, '2023-06-25 04:22:03'),
(336, 3, 0.1, 1225, '2023-06-25 04:22:08'),
(337, 3, 0.19, 1239, '2023-06-25 04:22:13'),
(338, 3, 0.19, 1253, '2023-06-25 04:22:19'),
(339, 3, 0.29, 1275, '2023-06-25 04:22:24'),
(340, 3, 0.24, 1293, '2023-06-25 04:22:30'),
(341, 3, 0.1, 1300, '2023-06-25 04:22:35'),
(342, 3, 0.14, 1311, '2023-06-25 04:22:40'),
(343, 3, 0.24, 1329, '2023-06-25 04:22:45'),
(344, 3, 0.1, 1336, '2023-06-25 04:22:51'),
(345, 3, 0.1, 1343, '2023-06-25 04:22:56'),
(346, 3, 0.1, 1350, '2023-06-25 04:23:01'),
(347, 3, 0.29, 1372, '2023-06-25 04:23:07'),
(348, 3, 0.14, 1383, '2023-06-25 04:23:12'),
(349, 3, 0.1, 1390, '2023-06-25 04:23:18'),
(350, 3, 0.33, 1415, '2023-06-25 04:23:23'),
(351, 3, 0.33, 1440, '2023-06-25 04:23:28'),
(352, 3, 0, 1440, '2023-06-25 04:23:34'),
(353, 3, 0, 1440, '2023-06-25 04:23:39'),
(354, 3, 0.38, 1469, '2023-06-25 04:23:44'),
(355, 3, 0.14, 1480, '2023-06-25 04:23:49'),
(356, 3, 0.29, 1502, '2023-06-25 04:23:55'),
(357, 3, 0.14, 1513, '2023-06-25 04:24:00'),
(358, 3, 0.24, 1531, '2023-06-25 04:24:05'),
(359, 3, 0.14, 1542, '2023-06-25 04:24:11'),
(360, 3, 0.19, 1556, '2023-06-25 04:24:16'),
(361, 3, 0.14, 1567, '2023-06-25 04:24:21'),
(362, 3, 0.24, 1585, '2023-06-25 04:24:27'),
(363, 3, 0.33, 1610, '2023-06-25 04:24:32'),
(364, 3, 0.24, 1628, '2023-06-25 04:24:37'),
(365, 3, 0.19, 1642, '2023-06-25 04:24:43'),
(366, 3, 0.33, 1667, '2023-06-25 04:24:48'),
(367, 3, 0.24, 1685, '2023-06-25 04:24:53'),
(368, 3, 0.29, 1707, '2023-06-25 04:24:59'),
(369, 3, 0.19, 1721, '2023-06-25 04:25:04'),
(370, 3, 0.33, 1746, '2023-06-25 04:25:10'),
(371, 3, 0.24, 1764, '2023-06-25 04:25:15'),
(372, 3, 0.43, 1797, '2023-06-25 04:25:20'),
(373, 3, 0.52, 1837, '2023-06-25 04:25:26'),
(374, 3, 0.52, 1877, '2023-06-25 04:25:31'),
(375, 3, 0.29, 1899, '2023-06-25 04:25:37'),
(376, 3, 0.38, 1928, '2023-06-25 04:25:42'),
(377, 3, 0.14, 1939, '2023-06-25 04:25:47'),
(378, 3, 0.29, 1961, '2023-06-25 04:25:53'),
(379, 3, 0.29, 1983, '2023-06-25 04:25:58'),
(380, 3, 0.19, 1997, '2023-06-25 04:26:03'),
(381, 3, 0.14, 2008, '2023-06-25 04:26:09'),
(382, 3, 0.29, 2030, '2023-06-25 04:26:14'),
(383, 3, 0.33, 2055, '2023-06-25 04:26:19'),
(384, 3, 0.24, 2073, '2023-06-25 04:26:25'),
(385, 3, 0, 2073, '2023-06-25 04:26:30'),
(386, 3, 0.43, 2106, '2023-06-25 04:26:36'),
(387, 3, 0.19, 2120, '2023-06-25 04:26:41'),
(388, 3, 0.24, 2138, '2023-06-25 04:26:46'),
(389, 3, 0.48, 2175, '2023-06-25 04:26:52'),
(390, 3, 0.33, 2200, '2023-06-25 04:26:57'),
(391, 3, 0.33, 2225, '2023-06-25 04:27:02'),
(392, 3, 0.43, 2258, '2023-06-25 04:27:08'),
(393, 3, 0.38, 2287, '2023-06-25 04:27:13'),
(394, 3, 0.38, 2316, '2023-06-25 04:27:18'),
(395, 3, 0.43, 2349, '2023-06-25 04:27:23'),
(396, 3, 0.33, 2374, '2023-06-25 04:27:29'),
(397, 3, 0.62, 2422, '2023-06-25 04:27:35'),
(398, 3, 0.33, 2447, '2023-06-25 04:27:40'),
(399, 3, 0.43, 2480, '2023-06-25 04:27:46'),
(400, 3, 0.19, 2494, '2023-06-25 04:27:51'),
(401, 3, 0.24, 2512, '2023-06-25 04:27:56'),
(402, 3, 0.33, 2537, '2023-06-25 04:28:01'),
(403, 3, 0.43, 2570, '2023-06-25 04:28:07'),
(404, 3, 0.33, 2595, '2023-06-25 04:28:12'),
(405, 3, 0.19, 2609, '2023-06-25 04:28:17'),
(406, 3, 0.19, 2623, '2023-06-25 04:28:23'),
(407, 3, 0.43, 2656, '2023-06-25 04:28:28'),
(408, 3, 0.38, 2685, '2023-06-25 04:28:33'),
(409, 3, 0.38, 2714, '2023-06-25 04:28:39'),
(410, 3, 0.29, 2736, '2023-06-25 04:28:44'),
(411, 3, 0.38, 2765, '2023-06-25 04:28:49'),
(412, 3, 0.38, 2794, '2023-06-25 04:28:54'),
(413, 3, 0.38, 2823, '2023-06-25 04:29:00'),
(414, 3, 0.14, 2834, '2023-06-25 04:29:05'),
(415, 3, 0.43, 2867, '2023-06-25 04:29:10'),
(416, 3, 0.33, 2892, '2023-06-25 04:29:16'),
(417, 3, 0.29, 2914, '2023-06-25 04:29:21'),
(418, 3, 0.19, 2928, '2023-06-25 04:29:26'),
(419, 3, 0.33, 2953, '2023-06-25 04:29:34'),
(420, 3, 0.29, 2975, '2023-06-25 04:29:41'),
(421, 3, 0.19, 2989, '2023-06-25 04:29:46'),
(422, 3, 0.71, 3044, '2023-06-25 04:29:56'),
(423, 3, 0.14, 3055, '2023-06-25 04:30:01'),
(424, 3, 0.38, 3084, '2023-06-25 04:30:07'),
(425, 3, 0.48, 3121, '2023-06-25 04:30:12'),
(426, 3, 0.38, 3150, '2023-06-25 04:30:17'),
(427, 3, 0.14, 3161, '2023-06-25 04:30:23'),
(428, 3, 0.29, 3183, '2023-06-25 04:30:28'),
(429, 3, 0.29, 3205, '2023-06-25 04:30:34'),
(430, 3, 0.52, 3245, '2023-06-25 04:30:39'),
(431, 3, 0.14, 3256, '2023-06-25 04:30:45'),
(432, 3, 0.29, 3278, '2023-06-25 04:30:50'),
(433, 3, 0.19, 3292, '2023-06-25 04:30:56'),
(434, 3, 0.29, 3314, '2023-06-25 04:31:02'),
(435, 3, 0.14, 3325, '2023-06-25 04:31:08'),
(436, 3, 0.29, 3347, '2023-06-25 04:31:13'),
(437, 3, 0.24, 3365, '2023-06-25 04:31:19'),
(438, 3, 0.38, 3394, '2023-06-25 04:31:24'),
(439, 3, 0.29, 3416, '2023-06-25 04:31:29'),
(440, 3, 0.38, 3445, '2023-06-25 04:31:35'),
(441, 3, 0.29, 3467, '2023-06-25 04:31:40'),
(442, 3, 0.33, 3492, '2023-06-25 04:31:46'),
(443, 3, 0.19, 3506, '2023-06-25 04:31:52'),
(444, 3, 0.24, 3524, '2023-06-25 04:31:59'),
(445, 3, 0.38, 3553, '2023-06-25 04:32:05'),
(446, 3, 0.14, 3564, '2023-06-25 04:32:11'),
(447, 3, 0, 3564, '2023-06-25 04:32:16'),
(448, 3, 0, 3564, '2023-06-25 04:32:23'),
(449, 3, 0, 3564, '2023-06-25 04:32:30'),
(450, 3, 0, 3564, '2023-06-25 04:32:36'),
(451, 3, 0, 3564, '2023-06-25 04:32:41'),
(452, 3, 0, 3564, '2023-06-25 04:32:56'),
(453, 3, 0, 3564, '2023-06-25 04:33:01'),
(454, 3, 0, 3564, '2023-06-25 04:33:10'),
(455, 3, 0, 3564, '2023-06-25 04:33:16'),
(456, 3, 0, 3564, '2023-06-25 04:33:32'),
(457, 3, 0, 3564, '2023-06-25 04:33:36'),
(458, 3, 0, 3564, '2023-06-25 04:33:42'),
(459, 3, 0, 3564, '2023-06-25 04:33:47'),
(460, 3, 0, 3564, '2023-06-25 04:33:53'),
(461, 3, 0, 3564, '2023-06-25 04:33:59'),
(462, 3, 0, 3564, '2023-06-25 04:34:05'),
(463, 3, 0, 3564, '2023-06-25 04:34:11'),
(464, 3, 0, 3564, '2023-06-25 04:34:17'),
(465, 3, 0, 3564, '2023-06-25 04:34:23'),
(466, 3, 0, 3564, '2023-06-25 04:34:29'),
(467, 3, 0, 3564, '2023-06-25 04:34:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `identity`
--
ALTER TABLE `identity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `identity`
--
ALTER TABLE `identity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=468;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
