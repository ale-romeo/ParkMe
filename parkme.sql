-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: database
-- Generation Time: May 15, 2023 at 07:57 PM
-- Server version: 8.0.33
-- PHP Version: 8.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parkme`
--

-- --------------------------------------------------------

--
-- Table structure for table `Account`
--

CREATE TABLE `Account` (
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `type` enum('body_emp','sup_body_emp','end_user','agent_emp','sup_agent_emp') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `surname` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` enum('M','F','O') DEFAULT NULL,
  `Body_id` varchar(50) DEFAULT NULL,
  `Agent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `priv_email_employee` varchar(255) DEFAULT NULL,
  `exp_emp_date` date DEFAULT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` (`username`, `email`, `password`, `reg_date`, `type`, `name`, `surname`, `birth_date`, `phone`, `gender`, `Body_id`, `Agent_id`, `priv_email_employee`, `exp_emp_date`, `removed`) VALUES
('alessandro.romeo', 'alessandro.romeo@easypark.it', '$2y$10$drvTsnlVKs2Jiv.JY4y7UO9ZxVvwsmXRyetZDH88N5XZgMSrIeRgK', '2023-05-09 20:36:47', 'sup_agent_emp', 'Alessandro', 'Romeo', '2000-12-06', '', 'M', NULL, 'EASYPARK', '', NULL, 0),
('andrea.spadaro', 'andrea.spadaro@easypark.it', '$2y$10$.2hSO1MJ8ho4pDf/SU2LYuLHu9qn2zo/BdMs.D3zk3H5npaP5tFiy', '2023-05-11 22:30:49', 'agent_emp', 'Andrea', 'Spadaro', '2000-05-16', NULL, NULL, NULL, 'EASYPARK', NULL, '2024-05-11', 0),
('ariannacu', 'ariannacus@gmail.com', '$2y$10$BkgqjE3Idic4v560UwdduOAPeh8bIe9FLxXiYwGrg5kWRhLyZ4E8S', '2023-05-11 21:23:58', 'end_user', 'Arianna', 'Cuscinà', NULL, '', 'F', NULL, NULL, NULL, NULL, 0),
('davide.ciraolo', 'davide.ciraolo@comune.messina.it', '$2y$10$g8perYhsCg7tYfWPjd3yV.IJGXP1Er46n/5.qvHjTjel36qbOjSs2', '2023-05-12 08:42:09', 'body_emp', 'Davide', 'Ciraolo', '1995-01-01', NULL, NULL, 'MESSINA', NULL, NULL, '2024-05-12', 0),
('francescatrinchita', 'francescatrinchita@gmail.com', '$2y$10$icOzc3J5m6vz23gADFlMbuRCr0f/njOpnfYvIPEwTsGzzonXCGYtC', '2023-05-15 10:32:00', 'end_user', 'Francesca', 'Trinchita', NULL, '', 'F', NULL, NULL, NULL, NULL, 0),
('giovanni.giovane', 'giovanni.giovane@easypark.it', '$2y$10$MDzRLbvS84cL1Nxabgaae.fmylWzW19pvGyMDEbN14jUQu1Q4kkGO', '2023-05-13 01:52:05', 'agent_emp', 'Giovanni', 'Giovane', '1998-02-12', NULL, NULL, NULL, 'EASYPARK', NULL, '2024-05-13', 0),
('giuseppe.buonasera', 'giuseppe.buonasera@comune.messina.it', '$2y$10$FK/4MPBA6Pa6iB.hepOfnuqsKikwpKg0fj36Wl1vVVtDp42y2i/Ym', '2023-05-02 17:19:47', 'sup_body_emp', 'Giuseppe', 'Buonasera', '2000-03-29', '3330560840', 'F', 'MESSINA', NULL, 'ciao@ciao.it', NULL, 0),
('guido.vespa', 'guido.vespa@easypark.it', '$2y$10$TaoW9OirBhG.kbVdBfZR8u2P9Q9h5dAlUk4AuWhtNidMk4YE6trX2', '2023-05-13 01:49:09', 'agent_emp', 'Guido', 'Vespa', '1990-10-10', NULL, NULL, NULL, 'EASYPARK', NULL, '2024-05-13', 0),
('irene.cuscinà', 'irene.cuscinà@easypark.it', '$2y$10$whtVwwE2SY2iq/Qr2VX/X.x6nWhMOg3dcuR0xRdFihKM7mF9ittGm', '2023-05-11 16:21:24', 'agent_emp', 'Irene', 'Cuscinà', '2001-01-10', NULL, NULL, NULL, 'EASYPARK', NULL, '2024-05-11', 1),
('manuel.fabiano', 'manuel.fabiano@comune.messina.it', '$2y$10$OwvQ9KmgiCRUO0/jxD8OlOirT7TPt0iz3CxWTVEIyvpxGPMBJogW6', '2023-05-09 17:59:26', 'body_emp', 'Manuel', 'Fabiano', '2002-10-03', NULL, NULL, 'MESSINA', NULL, NULL, NULL, 0),
('marco.aloisi', 'marco.aloisi@comune.messina.it', '$2y$10$LkTS9d0GewpJn91PLlXVzusofxsaDU1Y8fN/88BV.T7rw..WaoRGy', '2023-05-11 22:27:31', 'body_emp', 'Marco', 'Aloisi', '2001-06-02', NULL, NULL, 'MESSINA', NULL, NULL, '2024-05-11', 0),
('marco.garofalo', 'marco.garofalo@mycicero.it', '$2y$10$Lf3BWDqwX4CHax2Gs9Kcheb5YMxAP1upCdXyXdhk1TUi5SKdGCvne', '2023-05-15 12:25:12', 'agent_emp', 'Marco', 'Garofalo', '1995-01-01', NULL, NULL, NULL, 'MYCICERO', NULL, '2024-05-15', 0),
('marco.garofalo0', 'marco.garofalo0@mycicero.it', '$2y$10$.Y6XK36orbI3gNpo4OUyYejgQcDolsTmIcsdOKdTQb2vBEELKXdOu', '2023-05-15 12:25:31', 'agent_emp', 'Marco', 'Garofalo', '1996-12-12', NULL, NULL, NULL, 'MYCICERO', NULL, '2024-05-15', 1),
('matteo.deluca', 'matteo.deluca@mycicero.it', '$2y$10$drvTsnlVKs2Jiv.JY4y7UO9ZxVvwsmXRyetZDH88N5XZgMSrIeRgK', '2023-05-09 23:09:59', 'sup_agent_emp', 'Matteo', 'De Luca', '2000-12-04', NULL, NULL, NULL, 'MYCICERO', NULL, NULL, 0),
('paolo.rossi', 'paolo.rossi@easypark.it', '$2y$10$aKnHTV9JA0lmF.M3XAKye.dTC6YlTNqMY5PrjFdKjcfr1q6hU2FNO', '2023-05-13 01:45:00', 'agent_emp', 'Paolo', 'Rossi', '2001-01-01', NULL, NULL, NULL, 'EASYPARK', NULL, '2024-05-13', 1),
('pino.aloisi', 'pino.aloisi@easypark.it', '$2y$10$9La/KKwVMDveJzdE8.VfPeSyxGftv9dYxeuMD9sZzh3l7L2OgS9U6', '2023-05-13 01:48:24', 'agent_emp', 'pino', 'Aloisi', '2002-02-02', NULL, NULL, NULL, 'EASYPARK', NULL, '2024-05-13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Agent`
--

CREATE TABLE `Agent` (
  `NAME` varchar(50) NOT NULL,
  `balance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Agent`
--

INSERT INTO `Agent` (`NAME`, `balance`) VALUES
('EASYPARK', 10017.7),
('MYCICERO', 10041.8);

-- --------------------------------------------------------

--
-- Table structure for table `Body`
--

CREATE TABLE `Body` (
  `city` varchar(50) NOT NULL,
  `balance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Body`
--

INSERT INTO `Body` (`city`, `balance`) VALUES
('MESSINA', 10000000);

-- --------------------------------------------------------

--
-- Table structure for table `Operations_Log`
--

CREATE TABLE `Operations_Log` (
  `id` int NOT NULL,
  `action` enum('Modifica Abbonamento','Modifica Tariffa','Visualizzazione Zona','Risoluzione Ticket','Assegnazione posto','Rimozione posto','Aggiunta Impiegato','Rimozione Impiegato','Rimozione Abbonamento','Aggiunta Abbonamento') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `zone_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `slot_id` varchar(4) DEFAULT NULL,
  `sub_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `emp_id` varchar(50) DEFAULT NULL,
  `tkt_id` int DEFAULT NULL,
  `user_id` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Operations_Log`
--

INSERT INTO `Operations_Log` (`id`, `action`, `zone_id`, `slot_id`, `sub_id`, `res_id`, `emp_id`, `tkt_id`, `user_id`, `date`) VALUES
(1, 'Modifica Tariffa', NULL, 'B1', NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-12 12:16:09'),
(2, 'Modifica Abbonamento', NULL, NULL, 1, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 00:10:18'),
(3, 'Rimozione Abbonamento', NULL, NULL, 6, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 01:00:47'),
(4, 'Rimozione Abbonamento', NULL, NULL, 1, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 01:01:50'),
(5, 'Aggiunta Abbonamento', NULL, NULL, 3, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 01:12:50'),
(6, 'Aggiunta Abbonamento', NULL, NULL, 9, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 01:22:11'),
(7, 'Risoluzione Ticket', NULL, NULL, NULL, NULL, NULL, 1, 'alessandro.romeo', '2023-05-13 01:33:51'),
(8, 'Aggiunta Impiegato', NULL, NULL, NULL, NULL, 'pino.aloisi', NULL, 'alessandro.romeo', '2023-05-13 01:48:28'),
(9, 'Aggiunta Impiegato', NULL, NULL, NULL, NULL, 'guido.vespa', NULL, 'alessandro.romeo', '2023-05-13 01:49:10'),
(10, 'Rimozione Impiegato', NULL, NULL, NULL, NULL, 'paolo.rossi', NULL, 'alessandro.romeo', '2023-05-13 01:50:22'),
(11, 'Aggiunta Impiegato', NULL, NULL, NULL, NULL, 'giovanni.giovane', NULL, 'alessandro.romeo', '2023-05-13 01:52:06'),
(12, 'Aggiunta Impiegato', NULL, NULL, NULL, NULL, 'paolo.rossi', NULL, 'alessandro.romeo', '2023-05-13 01:52:34'),
(13, 'Modifica Tariffa', NULL, 'B1', NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 01:53:42'),
(14, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 02:03:45'),
(15, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 02:03:47'),
(16, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 02:04:00'),
(17, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 02:04:02'),
(18, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 02:04:09'),
(19, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 02:04:10'),
(20, 'Visualizzazione Zona', 'A', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 02:04:11'),
(21, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 02:04:12'),
(22, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:13:58'),
(23, 'Visualizzazione Zona', 'A', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:13:59'),
(24, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:16:44'),
(25, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:16:46'),
(27, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:16:50'),
(29, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:17:00'),
(30, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:17:02'),
(32, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:18:02'),
(34, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:19:05'),
(35, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:19:06'),
(36, 'Assegnazione posto', NULL, 'C3', NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:19:09'),
(37, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:20:32'),
(38, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:23:33'),
(39, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:23:35'),
(40, 'Assegnazione posto', NULL, 'B0', NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:23:41'),
(41, 'Visualizzazione Zona', 'A', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:23:55'),
(42, 'Assegnazione posto', NULL, 'A0', NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:23:58'),
(43, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:28:02'),
(44, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:28:03'),
(45, 'Assegnazione posto', NULL, 'B0', NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:28:07'),
(46, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:29:11'),
(47, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:30:20'),
(48, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:30:22'),
(49, 'Assegnazione posto', NULL, 'B0', NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:30:26'),
(50, 'Visualizzazione Zona', 'A', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:30:28'),
(51, 'Assegnazione posto', NULL, 'A0', NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:30:32'),
(52, 'Assegnazione posto', NULL, 'A0', NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:30:36'),
(53, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:34:21'),
(54, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:34:23'),
(55, 'Assegnazione posto', NULL, 'B0', NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:35:09'),
(56, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:35:11'),
(57, 'Assegnazione posto', NULL, 'B0', NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:36:55'),
(58, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:36:57'),
(59, 'Assegnazione posto', NULL, 'B0', NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:37:01'),
(60, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:37:12'),
(61, 'Visualizzazione Zona', 'A', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:38:11'),
(62, 'Assegnazione posto', NULL, 'A2', NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-13 02:38:18'),
(63, 'Rimozione Impiegato', NULL, NULL, NULL, NULL, 'marco.aloisi', NULL, 'giuseppe.buonasera', '2023-05-13 02:42:27'),
(64, 'Aggiunta Impiegato', NULL, NULL, NULL, NULL, 'marco.aloisi', NULL, 'giuseppe.buonasera', '2023-05-13 02:43:16'),
(65, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'manuel.fabiano', '2023-05-13 02:44:40'),
(66, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'manuel.fabiano', '2023-05-13 02:44:43'),
(67, 'Visualizzazione Zona', 'A', NULL, NULL, NULL, NULL, NULL, 'manuel.fabiano', '2023-05-13 02:44:44'),
(68, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'manuel.fabiano', '2023-05-13 02:44:45'),
(69, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'manuel.fabiano', '2023-05-13 02:44:46'),
(70, 'Visualizzazione Zona', 'D', NULL, NULL, NULL, NULL, NULL, 'manuel.fabiano', '2023-05-13 02:44:48'),
(71, 'Visualizzazione Zona', 'E', NULL, NULL, NULL, NULL, NULL, 'manuel.fabiano', '2023-05-13 02:44:48'),
(72, 'Visualizzazione Zona', 'D', NULL, NULL, NULL, NULL, NULL, 'manuel.fabiano', '2023-05-13 02:44:49'),
(73, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 14:56:33'),
(74, 'Rimozione Abbonamento', NULL, NULL, 9, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 16:35:47'),
(75, 'Rimozione Abbonamento', NULL, NULL, 8, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 16:35:50'),
(76, 'Aggiunta Abbonamento', NULL, NULL, 10, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 16:36:31'),
(77, 'Aggiunta Abbonamento', NULL, NULL, 11, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 16:43:39'),
(78, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 22:30:27'),
(79, 'Visualizzazione Zona', 'A', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 22:30:28'),
(80, 'Modifica Tariffa', 'A', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 22:30:42'),
(81, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 22:31:00'),
(82, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 22:31:09'),
(83, 'Visualizzazione Zona', 'D', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 22:31:11'),
(84, 'Visualizzazione Zona', 'E', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 22:31:12'),
(85, 'Visualizzazione Zona', 'E', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 22:31:30'),
(86, 'Visualizzazione Zona', 'E', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 22:31:31'),
(88, 'Modifica Tariffa', 'E', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 22:31:58'),
(89, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-14 23:35:06'),
(90, 'Visualizzazione Zona', 'A', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-14 23:35:10'),
(91, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-14 23:35:13'),
(92, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-14 23:35:17'),
(93, 'Visualizzazione Zona', 'D', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-14 23:35:30'),
(94, 'Visualizzazione Zona', 'E', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-14 23:35:33'),
(95, 'Visualizzazione Zona', 'D', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-14 23:35:38'),
(96, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-14 23:37:37'),
(97, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-14 23:37:57'),
(98, 'Modifica Tariffa', 'B', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-14 23:38:04'),
(99, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-14 23:38:14'),
(100, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-14 23:38:18'),
(101, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-14 23:39:22'),
(102, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-14 23:39:26'),
(103, 'Visualizzazione Zona', 'D', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-14 23:39:28'),
(104, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-14 23:43:40'),
(105, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:44:43'),
(107, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:50:48'),
(108, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:50:50'),
(109, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:51:56'),
(110, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:51:58'),
(111, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:52:12'),
(112, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:52:13'),
(113, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:52:15'),
(114, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:52:15'),
(115, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:53:57'),
(116, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:54:00'),
(117, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:54:28'),
(118, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:54:31'),
(120, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:54:42'),
(121, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:54:44'),
(122, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:54:46'),
(123, 'Visualizzazione Zona', 'D', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:54:51'),
(124, 'Visualizzazione Zona', 'A', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:54:55'),
(125, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 00:54:57'),
(127, 'Visualizzazione Zona', 'D', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:09:31'),
(128, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:09:39'),
(129, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:09:41'),
(130, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:10:08'),
(131, 'Visualizzazione Zona', 'D', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:11:07'),
(132, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:11:10'),
(134, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:11:23'),
(135, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:11:48'),
(136, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:11:49'),
(137, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:11:52'),
(139, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:12:08'),
(140, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:12:10'),
(143, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:14:29'),
(144, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:14:31'),
(146, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:15:02'),
(147, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:15:05'),
(149, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:15:39'),
(150, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:15:41'),
(152, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:16:34'),
(153, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:16:36'),
(154, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:16:36'),
(156, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:17:01'),
(157, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:17:02'),
(159, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:17:21'),
(160, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:17:23'),
(162, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:18:30'),
(163, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:18:32'),
(165, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:20:00'),
(166, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:20:03'),
(168, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:21:10'),
(169, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:21:13'),
(172, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:21:51'),
(173, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:21:52'),
(175, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:22:26'),
(176, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:22:27'),
(179, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:23:00'),
(180, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:23:02'),
(183, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:25:56'),
(184, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:25:59'),
(186, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:27:30'),
(187, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:27:32'),
(189, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:28:09'),
(190, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:28:10'),
(192, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:28:32'),
(194, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:29:00'),
(195, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:29:02'),
(199, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:31:01'),
(200, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:31:04'),
(202, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:31:11'),
(203, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 01:31:11'),
(204, 'Risoluzione Ticket', NULL, NULL, NULL, NULL, NULL, 1, 'alessandro.romeo', '2023-05-15 04:52:44'),
(205, 'Risoluzione Ticket', NULL, NULL, NULL, NULL, NULL, 1, 'alessandro.romeo', '2023-05-15 04:53:43'),
(206, 'Risoluzione Ticket', NULL, NULL, NULL, NULL, NULL, 1, 'alessandro.romeo', '2023-05-15 04:54:30'),
(207, 'Aggiunta Abbonamento', NULL, NULL, 12, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-15 05:30:35'),
(208, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-15 11:55:00'),
(209, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-15 11:55:05'),
(210, 'Visualizzazione Zona', 'D', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-15 11:55:07'),
(211, 'Visualizzazione Zona', 'E', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-15 11:55:17'),
(212, 'Visualizzazione Zona', 'D', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-15 11:55:18'),
(214, 'Visualizzazione Zona', 'D', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-15 11:55:26'),
(215, 'Rimozione Impiegato', NULL, NULL, NULL, NULL, 'paolo.rossi', NULL, 'alessandro.romeo', '2023-05-15 11:55:57'),
(216, 'Risoluzione Ticket', NULL, NULL, NULL, NULL, NULL, 6, 'alessandro.romeo', '2023-05-15 12:00:25'),
(217, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-15 12:01:03'),
(218, 'Assegnazione posto', NULL, 'B0', NULL, NULL, NULL, NULL, 'giuseppe.buonasera', '2023-05-15 12:02:08'),
(219, 'Aggiunta Impiegato', NULL, NULL, NULL, NULL, 'marco.garofalo', NULL, 'matteo.deluca', '2023-05-15 12:25:14'),
(220, 'Aggiunta Impiegato', NULL, NULL, NULL, NULL, 'marco.garofalo0', NULL, 'matteo.deluca', '2023-05-15 12:25:33'),
(221, 'Rimozione Impiegato', NULL, NULL, NULL, NULL, 'marco.garofalo0', NULL, 'matteo.deluca', '2023-05-15 12:25:41'),
(222, 'Aggiunta Abbonamento', NULL, NULL, 13, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 12:30:46'),
(223, 'Visualizzazione Zona', 'B', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 12:31:13'),
(224, 'Visualizzazione Zona', 'C', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 12:31:14'),
(225, 'Visualizzazione Zona', 'D', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 12:31:16'),
(226, 'Visualizzazione Zona', 'E', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 12:31:22'),
(228, 'Visualizzazione Zona', 'E', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 12:32:02'),
(229, 'Visualizzazione Zona', 'D', NULL, NULL, NULL, NULL, NULL, 'matteo.deluca', '2023-05-15 12:32:03'),
(230, 'Risoluzione Ticket', NULL, NULL, NULL, NULL, NULL, 7, 'alessandro.romeo', '2023-05-15 15:42:34'),
(231, 'Risoluzione Ticket', NULL, NULL, NULL, NULL, NULL, 7, 'alessandro.romeo', '2023-05-15 15:46:37'),
(232, 'Risoluzione Ticket', NULL, NULL, NULL, NULL, NULL, 7, 'alessandro.romeo', '2023-05-15 15:47:36'),
(233, 'Risoluzione Ticket', NULL, NULL, NULL, NULL, NULL, 5, 'alessandro.romeo', '2023-05-15 15:47:45');

-- --------------------------------------------------------

--
-- Table structure for table `Parking_Payment`
--

CREATE TABLE `Parking_Payment` (
  `id` int NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `amount` float NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `park_id` varchar(4) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Parking_Payment`
--

INSERT INTO `Parking_Payment` (`id`, `status`, `amount`, `user_id`, `park_id`, `date`) VALUES
(1, 0, 0.21, 'francescatrinchita', 'C0', '2023-05-15 14:48:27'),
(2, 0, 0.03, 'francescatrinchita', 'C0', '2023-05-15 14:48:33'),
(3, 0, 0.21, 'francescatrinchita', 'B1', '2023-05-15 14:53:12'),
(4, 0, 0.03, 'francescatrinchita', 'B1', '2023-05-15 14:53:29'),
(5, 0, 0.21, 'francescatrinchita', 'C0', '2023-05-15 16:19:23'),
(6, 0, 0.03, 'francescatrinchita', 'C0', '2023-05-15 16:19:47'),
(7, 0, 0.21, 'francescatrinchita', 'E4', '2023-05-15 16:22:25'),
(8, 0, 1.17, 'francescatrinchita', 'E4', '2023-05-15 16:23:13'),
(9, 0, 1.2, 'francescatrinchita', 'E4', '2023-05-15 16:23:17'),
(10, 0, 0.21, 'francescatrinchita', 'B1', '2023-05-15 21:41:54'),
(11, 0, 0.03, 'francescatrinchita', 'B1', '2023-05-15 21:42:03'),
(12, 0, 0.22, 'francescatrinchita', 'D0', '2023-05-15 21:43:21'),
(13, 0, 0.01, 'francescatrinchita', 'D0', '2023-05-15 21:47:18'),
(14, 0, 0.21, 'francescatrinchita', 'C0', '2023-05-15 21:48:51'),
(15, 0, 0.03, 'francescatrinchita', 'C0', '2023-05-15 21:48:56');

-- --------------------------------------------------------

--
-- Table structure for table `Parking_Space`
--

CREATE TABLE `Parking_Space` (
  `id` varchar(4) NOT NULL,
  `STATUS` enum('Available','Occupied','Reserved','Out of order') NOT NULL,
  `zone_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_body` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_agent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hourly_price` float DEFAULT NULL,
  `periodic_price` float DEFAULT NULL,
  `reservation_price` float DEFAULT NULL,
  `parking_ending_time` datetime DEFAULT NULL,
  `plate` varchar(7) DEFAULT NULL,
  `charging_station` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Parking_Space`
--

INSERT INTO `Parking_Space` (`id`, `STATUS`, `zone_id`, `id_body`, `id_agent`, `hourly_price`, `periodic_price`, `reservation_price`, `parking_ending_time`, `plate`, `charging_station`) VALUES
('A0', 'Available', 'A', 'MESSINA', 'EASYPARK', 0.5, 0.45, 0.2, NULL, NULL, 0),
('A1', 'Available', 'A', 'MESSINA', 'MYCICERO', 0.5, 0.4, 0.17, NULL, NULL, 0),
('A10', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A100', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A101', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A102', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A103', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A104', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A105', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A106', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A107', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A108', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A109', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A11', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A110', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A111', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A112', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A113', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A114', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A115', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A116', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A117', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A118', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A119', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A12', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A120', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A121', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A122', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A123', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A124', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A125', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A126', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A127', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A128', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A129', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A13', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A130', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A131', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A132', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A133', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A134', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A135', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A136', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A137', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A138', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A139', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A14', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A140', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A141', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A142', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A143', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A144', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A145', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A146', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A147', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A148', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A149', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A15', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A150', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A151', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A152', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A153', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A154', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A155', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A156', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A157', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A158', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A159', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A16', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A160', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A161', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A162', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A163', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A164', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A165', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A166', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A167', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A168', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A169', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A17', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A170', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A171', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A172', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A173', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A174', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A175', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A176', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A177', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A178', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A179', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A18', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A180', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A181', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A182', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A183', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A184', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A185', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A186', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A187', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A188', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A189', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A19', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A190', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A191', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A192', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A193', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A194', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A195', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A196', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A197', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A198', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A199', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A2', 'Available', 'A', 'MESSINA', 'EASYPARK', 0.5, 0.45, 0.2, NULL, NULL, 1),
('A20', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A21', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A22', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A23', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A24', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A25', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A26', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A27', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A28', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A29', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A3', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A30', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A31', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A32', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A33', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A34', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A35', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A36', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A37', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A38', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A39', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A4', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A40', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A41', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A42', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A43', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A44', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A45', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A46', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A47', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A48', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A49', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A5', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A50', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A51', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A52', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A53', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A54', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A55', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A56', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A57', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A58', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A59', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A6', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A60', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A61', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A62', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A63', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A64', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A65', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A66', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A67', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A68', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A69', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A7', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A70', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A71', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A72', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A73', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A74', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A75', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A76', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A77', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A78', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A79', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A8', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A80', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A81', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A82', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A83', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A84', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A85', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A86', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A87', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A88', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A89', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A9', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A90', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A91', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A92', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A93', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A94', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('A95', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A96', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A97', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A98', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('A99', 'Out of order', 'A', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B0', 'Available', 'B', 'MESSINA', NULL, 0.5, 0.45, 0.2, NULL, NULL, 0),
('B1', 'Available', 'B', 'MESSINA', 'EASYPARK', 0.5, 0.45, 0.2, NULL, NULL, 1),
('B10', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B100', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B101', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B102', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B103', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B104', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B105', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B106', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B107', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B108', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B109', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B11', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B110', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B111', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B112', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B113', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B114', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B115', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B116', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B117', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B118', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B119', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B12', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B120', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B121', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B122', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B123', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B124', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B125', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B126', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B127', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B128', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B129', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B13', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B130', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B131', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B132', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B133', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B134', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B135', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B136', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B137', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B138', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B139', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B14', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B140', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B141', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B142', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B143', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B144', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B145', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B146', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B147', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B148', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B149', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B15', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B150', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B151', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B152', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B153', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B154', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B155', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B156', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B157', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B158', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B159', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B16', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B160', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B161', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B162', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B163', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B164', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B165', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B166', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B167', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B168', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B169', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B17', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B170', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B171', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B172', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B173', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B174', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B175', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B176', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B177', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B178', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B179', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B18', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B180', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B181', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B182', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B183', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B184', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B185', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B186', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B187', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B188', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B189', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B19', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B190', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B191', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B192', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B193', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B194', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B195', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B196', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B197', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B198', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B199', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B2', 'Available', 'B', 'MESSINA', 'MYCICERO', 0.5, 0.4, 0.17, NULL, NULL, 1),
('B20', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B21', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B22', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B23', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B24', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B25', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B26', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B27', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B28', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B29', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B3', 'Available', 'B', 'MESSINA', 'EASYPARK', 0.5, 0.45, 0.2, NULL, NULL, 1),
('B30', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B31', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B32', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B33', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B34', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B35', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B36', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B37', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B38', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B39', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B4', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B40', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B41', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B42', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B43', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B44', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B45', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B46', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B47', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B48', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B49', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B5', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B50', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B51', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B52', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B53', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B54', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B55', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B56', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B57', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B58', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B59', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B6', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B60', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B61', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B62', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B63', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B64', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B65', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B66', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B67', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B68', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B69', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B7', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B70', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B71', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B72', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B73', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B74', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B75', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B76', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B77', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B78', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B79', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B8', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B80', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B81', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B82', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B83', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B84', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B85', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B86', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B87', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B88', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B89', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B9', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B90', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B91', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B92', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B93', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B94', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B95', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B96', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B97', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('B98', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('B99', 'Out of order', 'B', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C0', 'Available', 'C', 'MESSINA', 'MYCICERO', 0.5, 0.45, 0.17, NULL, NULL, 0),
('C1', 'Available', 'C', 'MESSINA', 'MYCICERO', 0.5, 0.4, 0.17, NULL, NULL, 1),
('C10', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C100', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C101', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C102', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C103', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C104', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C105', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C106', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C107', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C108', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C109', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C11', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C110', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C111', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C112', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C113', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C114', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C115', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C116', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C117', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C118', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C119', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C12', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C120', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C121', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C122', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C123', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C124', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C125', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C126', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C127', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C128', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C129', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C13', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C130', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C131', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C132', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C133', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C134', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C135', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C136', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C137', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C138', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C139', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C14', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C140', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C141', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C142', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C143', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C144', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C145', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C146', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C147', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C148', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C149', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C15', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C150', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C151', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C152', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C153', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C154', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C155', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C156', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C157', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C158', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C159', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C16', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C160', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C161', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C162', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C163', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C164', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C165', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C166', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C167', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C168', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C169', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C17', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C170', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C171', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C172', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C173', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C174', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C175', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C176', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C177', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C178', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C179', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C18', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C180', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C181', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C182', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C183', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C184', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C185', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C186', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C187', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C188', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C189', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C19', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C190', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C191', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C192', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C193', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C194', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C195', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C196', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C197', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C198', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C199', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C2', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C20', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C21', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C22', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C23', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C24', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C25', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C26', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C27', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C28', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C29', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C3', 'Out of order', 'C', 'MESSINA', 'MYCICERO', 0.5, NULL, 0.17, NULL, NULL, 1),
('C30', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C31', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C32', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C33', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C34', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C35', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C36', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C37', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C38', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C39', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C4', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C40', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C41', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C42', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C43', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C44', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C45', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C46', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C47', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C48', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C49', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C5', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C50', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C51', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C52', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C53', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C54', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C55', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C56', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C57', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C58', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C59', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C6', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C60', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C61', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C62', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C63', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C64', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C65', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C66', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C67', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C68', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C69', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C7', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C70', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C71', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C72', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C73', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C74', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C75', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C76', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C77', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C78', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C79', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C8', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C80', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C81', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C82', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C83', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C84', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C85', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C86', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C87', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C88', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C89', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C9', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C90', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C91', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C92', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C93', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C94', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C95', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('C96', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C97', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C98', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('C99', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D0', 'Available', 'D', 'MESSINA', 'EASYPARK', 0.55, 0.45, 0.2, NULL, NULL, 1),
('D1', 'Available', 'D', 'MESSINA', 'MYCICERO', 0.55, 0.45, 0.17, NULL, NULL, 1),
('D10', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D100', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D101', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D102', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D103', 'Available', 'D', 'MESSINA', 'EASYPARK', 0.55, 0.45, 0.2, NULL, NULL, 0),
('D104', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D105', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D106', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D107', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D108', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D109', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D11', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D110', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D111', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D112', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D113', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D114', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D115', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D116', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D117', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D118', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D119', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D12', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D120', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D121', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D122', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D123', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D124', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D125', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D126', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D127', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D128', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `Parking_Space` (`id`, `STATUS`, `zone_id`, `id_body`, `id_agent`, `hourly_price`, `periodic_price`, `reservation_price`, `parking_ending_time`, `plate`, `charging_station`) VALUES
('D129', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D13', 'Available', 'D', 'MESSINA', 'MYCICERO', 0.55, 0.45, 0.17, NULL, NULL, 0),
('D130', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D131', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D132', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D133', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D134', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D135', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D136', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D137', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D138', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D139', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D14', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D140', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D141', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D142', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D143', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D144', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D145', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D146', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D147', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D148', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D149', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D15', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D150', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D151', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D152', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D153', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D154', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D155', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D156', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D157', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D158', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D159', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D16', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D160', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D161', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D162', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D163', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D164', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D165', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D166', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D167', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D168', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D169', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D17', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D170', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D171', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D172', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D173', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D174', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D175', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D176', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D177', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D178', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D179', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D18', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D180', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D181', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D182', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D183', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D184', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D185', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D186', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D187', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D188', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D189', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D19', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D190', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D191', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D192', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D193', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D194', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D195', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D196', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D197', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D198', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D199', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D2', 'Available', 'D', 'MESSINA', 'MYCICERO', 0.55, 0.45, 0.17, NULL, NULL, 1),
('D20', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D21', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D22', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D23', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D24', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D25', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D26', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D27', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D28', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D29', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D3', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D30', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D31', 'Out of order', 'D', 'MESSINA', 'EASYPARK', 0.55, NULL, 0.2, NULL, NULL, 0),
('D32', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D33', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D34', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D35', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D36', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D37', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D38', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D39', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D4', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D40', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D41', 'Available', 'D', 'MESSINA', 'EASYPARK', 0.55, 0.45, 0.2, NULL, NULL, 1),
('D42', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D43', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D44', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D45', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D46', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D47', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D48', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D49', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D5', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D50', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D51', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D52', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D53', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D54', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D55', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D56', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D57', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D58', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D59', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D6', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D60', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D61', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D62', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D63', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D64', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D65', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D66', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D67', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D68', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D69', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D7', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D70', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D71', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D72', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D73', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D74', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D75', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D76', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D77', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D78', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D79', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D8', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D80', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D81', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D82', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D83', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D84', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D85', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D86', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D87', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D88', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D89', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D9', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D90', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D91', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D92', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D93', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D94', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D95', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D96', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D97', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('D98', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('D99', 'Out of order', 'D', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E0', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E1', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E10', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E100', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E101', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E102', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E103', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E104', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E105', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E106', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E107', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E108', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E109', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E11', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E110', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E111', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E112', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E113', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E114', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E115', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E116', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E117', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E118', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E119', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E12', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E120', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E121', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E122', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E123', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E124', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E125', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E126', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E127', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E128', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E129', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E13', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E130', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E131', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E132', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E133', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E134', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E135', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E136', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E137', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E138', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E139', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E14', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E140', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E141', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E142', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E143', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E144', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E145', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E146', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E147', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E148', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E149', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E15', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E150', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E151', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E152', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E153', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E154', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E155', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E156', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E157', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E158', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E159', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E16', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E160', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E161', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E162', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E163', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E164', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E165', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E166', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E167', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E168', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E169', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E17', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E170', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E171', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E172', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E173', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E174', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E175', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E176', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E177', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E178', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E179', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E18', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E180', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E181', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E182', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E183', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E184', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E185', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E186', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E187', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E188', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E189', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E19', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E190', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E191', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E192', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E193', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E194', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E195', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E196', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E197', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E198', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E199', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E2', 'Out of order', 'E', 'MESSINA', 'MYCICERO', NULL, NULL, 0.17, NULL, NULL, 0),
('E20', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E21', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E22', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E23', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E24', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E25', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E26', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E27', 'Out of order', 'E', 'MESSINA', 'MYCICERO', NULL, NULL, 0.17, NULL, NULL, 0),
('E28', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E29', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E3', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E30', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E31', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E32', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E33', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E34', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E35', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E36', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E37', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E38', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E39', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E4', 'Available', 'E', 'MESSINA', 'EASYPARK', 0.5, 0.4, 0.2, NULL, NULL, 0),
('E40', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E41', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E42', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E43', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E44', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E45', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E46', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E47', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E48', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E49', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E5', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E50', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E51', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E52', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E53', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E54', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E55', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E56', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E57', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E58', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E59', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E6', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E60', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E61', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E62', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E63', 'Available', 'E', 'MESSINA', 'MYCICERO', 0.45, 0.38, 0.17, NULL, NULL, 1),
('E64', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E65', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E66', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E67', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E68', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E69', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E7', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E70', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E71', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E72', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E73', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E74', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E75', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E76', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E77', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E78', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E79', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E8', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E80', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E81', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E82', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E83', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E84', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E85', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E86', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E87', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E88', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E89', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E9', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E90', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E91', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E92', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E93', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E94', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E95', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E96', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E97', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('E98', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0),
('E99', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Reservation`
--

CREATE TABLE `Reservation` (
  `id` int NOT NULL,
  `solved` tinyint(1) NOT NULL DEFAULT '0',
  `amount` float NOT NULL,
  `id_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_parking` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ending_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Reservation`
--

INSERT INTO `Reservation` (`id`, `solved`, `amount`, `id_user`, `id_parking`, `date`, `ending_time`) VALUES
(1, 0, 0, 'ariannacu', 'B0', '2023-05-15 02:04:19', '2023-05-15 02:14:19'),
(2, 0, 0, 'ariannacu', 'B0', '2023-05-15 02:04:40', '2023-05-15 02:14:40'),
(3, 0, 0, 'ariannacu', 'C0', '2023-05-15 02:05:25', '2023-05-15 02:15:25'),
(4, 0, 0, 'ariannacu', 'C0', '2023-05-15 02:06:10', '2023-05-15 02:16:10'),
(5, 0, 0, 'ariannacu', 'C0', '2023-05-15 02:07:02', '2023-05-15 02:17:02'),
(6, 0, 0, 'ariannacu', 'C0', '2023-05-15 02:16:19', '2023-05-15 02:26:19'),
(7, 0, 0, 'ariannacu', 'C0', '2023-05-15 02:16:44', '2023-05-15 02:26:44'),
(8, 0, 0, 'ariannacu', 'C0', '2023-05-15 02:19:02', '2023-05-15 02:29:02'),
(9, 0, 0, 'ariannacu', 'C0', '2023-05-15 02:20:15', '2023-05-15 02:30:15'),
(10, 0, 0, 'ariannacu', 'C0', '2023-05-15 02:26:13', '2023-05-15 02:36:13'),
(11, 0, 0, 'ariannacu', 'C0', '2023-05-15 02:34:28', '2023-05-15 02:44:28'),
(12, 0, 0, 'ariannacu', 'C0', '2023-05-15 02:47:14', '2023-05-15 02:57:14'),
(13, 0, 0, 'ariannacu', 'C0', '2023-05-15 02:49:41', '2023-05-15 02:59:41'),
(14, 0, 0, 'ariannacu', 'E4', '2023-05-15 02:51:31', '2023-05-15 03:01:31'),
(15, 0, 0, 'ariannacu', 'C0', '2023-05-15 02:53:12', '2023-05-15 03:03:12'),
(16, 0, 0, 'ariannacu', 'C0', '2023-05-15 02:53:25', '2023-05-15 03:03:25'),
(17, 0, 0, 'ariannacu', 'C0', '2023-05-15 02:54:48', '2023-05-15 03:04:48'),
(18, 0, 0, 'ariannacu', 'A1', '2023-05-15 02:54:56', '2023-05-15 03:04:56'),
(19, 0, 0, 'ariannacu', 'B3', '2023-05-15 02:55:20', '2023-05-15 03:05:20'),
(20, 0, 0, 'ariannacu', 'C1', '2023-05-15 02:55:35', '2023-05-15 03:05:35'),
(21, 0, 0, 'ariannacu', 'C0', '2023-05-15 02:55:46', '2023-05-15 03:05:46'),
(22, 0, 0, 'ariannacu', 'B0', '2023-05-15 03:04:12', '2023-05-15 03:14:12'),
(23, 0, 0, 'ariannacu', 'C0', '2023-05-15 03:04:20', '2023-05-15 03:14:20'),
(24, 0, 0, 'ariannacu', 'A0', '2023-05-15 03:34:17', '2023-05-15 03:44:17'),
(25, 0, 0, 'ariannacu', 'B0', '2023-05-15 03:45:10', '2023-05-15 03:55:10'),
(26, 0, 0, 'ariannacu', 'A0', '2023-05-15 04:01:51', '2023-05-15 04:11:51'),
(27, 0, 0, 'ariannacu', 'A1', '2023-05-15 04:06:37', '2023-05-15 04:16:37'),
(28, 0, 0, 'ariannacu', 'A0', '2023-05-15 04:06:55', '2023-05-15 04:16:55'),
(29, 0, 0, 'ariannacu', 'A0', '2023-05-15 04:17:03', '2023-05-15 04:27:03'),
(30, 1, 0, 'ariannacu', 'B0', '2023-05-15 04:18:06', '2023-05-15 04:28:06'),
(31, 0, 0, 'francescatrinchita', 'C0', '2023-05-15 11:38:43', '2023-05-15 11:48:43'),
(32, 0, 0.17, 'francescatrinchita', 'C0', '2023-05-15 14:48:42', '2023-05-15 14:58:42'),
(33, 0, 0.2, 'francescatrinchita', 'B1', '2023-05-15 14:51:53', '2023-05-15 15:01:53'),
(34, 0, 0.2, 'francescatrinchita', 'B1', '2023-05-15 21:42:09', '2023-05-15 21:52:09'),
(35, 0, 0.17, 'francescatrinchita', 'C0', '2023-05-15 21:42:43', '2023-05-15 21:52:43'),
(36, 1, 0.2, 'francescatrinchita', 'D0', '2023-05-15 21:43:15', '2023-05-15 21:53:15'),
(37, 1, 0.17, 'francescatrinchita', 'C0', '2023-05-15 21:47:23', '2023-05-15 21:57:23');

-- --------------------------------------------------------

--
-- Table structure for table `Subscription`
--

CREATE TABLE `Subscription` (
  `id` int NOT NULL,
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` enum('Settimanale','Mensile','Trimestrale','Semestrale','Annuale') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` float NOT NULL,
  `reduction` float DEFAULT NULL,
  `id_agent` varchar(50) NOT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Subscription`
--

INSERT INTO `Subscription` (`id`, `title`, `type`, `price`, `reduction`, `id_agent`, `removed`) VALUES
(1, 'Weekly2', 'Settimanale', 4, NULL, 'EASYPARK', 1),
(3, 'Monthly', 'Settimanale', 15, NULL, 'EASYPARK', 0),
(5, 'Yearly1', 'Annuale', 49, NULL, 'EASYPARK', 1),
(6, '6m', 'Semestrale', 60, NULL, 'EASYPARK', 1),
(7, 'yearly', 'Annuale', 65, NULL, 'EASYPARK', 0),
(8, 'sem', 'Semestrale', 45, NULL, 'EASYPARK', 1),
(9, 'sect', 'Mensile', 16, NULL, 'EASYPARK', 1),
(10, 'Riduzione 0.05', 'Settimanale', 3, NULL, 'EASYPARK', 0),
(11, 'Riduzione 0.04', 'Settimanale', 2.5, 0.04, 'EASYPARK', 0),
(12, 'ciao', 'Settimanale', 2, 0.04, 'EASYPARK', 0),
(13, 'Annuale 0.02', 'Annuale', 40, 0.02, 'MYCICERO', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Subscription_Payment`
--

CREATE TABLE `Subscription_Payment` (
  `id` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` float NOT NULL,
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sub_id` int NOT NULL,
  `expiration` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Subscription_Payment`
--

INSERT INTO `Subscription_Payment` (`id`, `date`, `amount`, `user_id`, `sub_id`, `expiration`) VALUES
(1, '2023-05-15 15:26:52', 40, 'francescatrinchita', 13, '2024-05-15 13:26:52'),
(2, '2023-05-15 21:49:02', 2, 'francescatrinchita', 12, '2023-05-22 19:49:02');

-- --------------------------------------------------------

--
-- Table structure for table `Ticket`
--

CREATE TABLE `Ticket` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `body_text` text NOT NULL,
  `answer` text,
  `employee` varchar(50) DEFAULT NULL,
  `agent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_user` varchar(50) NOT NULL,
  `status` enum('Aperto','Chiuso') NOT NULL DEFAULT 'Aperto',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Ticket`
--

INSERT INTO `Ticket` (`id`, `title`, `body_text`, `answer`, `employee`, `agent_id`, `id_user`, `status`, `date`) VALUES
(1, 'prova', 'prova', 'ciao', 'alessandro.romeo', 'EASYPARK', 'ariannacu', 'Chiuso', '2023-05-11 21:25:18'),
(4, '', '', NULL, NULL, 'EASYPARK', 'ariannacu', 'Aperto', '2023-05-15 05:16:43'),
(5, 'ciao', 'ciao', 'FUNZIONA', 'alessandro.romeo', 'EASYPARK', 'ariannacu', 'Chiuso', '2023-05-15 05:16:51'),
(6, 'ciao', 'ciao', 'ciao', 'alessandro.romeo', 'EASYPARK', 'francescatrinchita', 'Chiuso', '2023-05-15 11:53:52'),
(7, 'ciao', 'ciao', 'FUNZIONA', 'alessandro.romeo', 'EASYPARK', 'francescatrinchita', 'Chiuso', '2023-05-15 15:41:38');

-- --------------------------------------------------------

--
-- Table structure for table `Zone`
--

CREATE TABLE `Zone` (
  `id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Coords` text,
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Zone`
--

INSERT INTO `Zone` (`id`, `Coords`, `location`) VALUES
('A', NULL, NULL),
('B', NULL, NULL),
('C', NULL, NULL),
('D', NULL, NULL),
('E', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `Agent_rel` (`Agent_id`),
  ADD KEY `Body_rel` (`Body_id`);

--
-- Indexes for table `Agent`
--
ALTER TABLE `Agent`
  ADD PRIMARY KEY (`NAME`);

--
-- Indexes for table `Body`
--
ALTER TABLE `Body`
  ADD PRIMARY KEY (`city`);

--
-- Indexes for table `Operations_Log`
--
ALTER TABLE `Operations_Log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Operations_Log_rel1` (`user_id`),
  ADD KEY `Operations_Log_rel2` (`slot_id`),
  ADD KEY `Operations_Log_rel3` (`sub_id`),
  ADD KEY `Operations_Log_rel4` (`res_id`),
  ADD KEY `Operations_Log_rel5` (`zone_id`),
  ADD KEY `Operations_Log_rel6` (`emp_id`),
  ADD KEY `Operations_Log_rel7` (`tkt_id`);

--
-- Indexes for table `Parking_Payment`
--
ALTER TABLE `Parking_Payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Park_pay1` (`park_id`),
  ADD KEY `Park_pay2` (`user_id`);

--
-- Indexes for table `Parking_Space`
--
ALTER TABLE `Parking_Space`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_body` (`id_body`),
  ADD KEY `id_agent` (`id_agent`),
  ADD KEY `Parking_Space_ibfk_3` (`zone_id`);

--
-- Indexes for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_parking` (`id_parking`);

--
-- Indexes for table `Subscription`
--
ALTER TABLE `Subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_agent` (`id_agent`);

--
-- Indexes for table `Subscription_Payment`
--
ALTER TABLE `Subscription_Payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Sub_pay1` (`user_id`),
  ADD KEY `Sub_pay2` (`sub_id`);

--
-- Indexes for table `Ticket`
--
ALTER TABLE `Ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `Ticket_ibfk_2` (`employee`),
  ADD KEY `Ticket_ibfk_3` (`agent_id`);

--
-- Indexes for table `Zone`
--
ALTER TABLE `Zone`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Operations_Log`
--
ALTER TABLE `Operations_Log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `Parking_Payment`
--
ALTER TABLE `Parking_Payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `Reservation`
--
ALTER TABLE `Reservation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `Subscription`
--
ALTER TABLE `Subscription`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `Subscription_Payment`
--
ALTER TABLE `Subscription_Payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Ticket`
--
ALTER TABLE `Ticket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Account`
--
ALTER TABLE `Account`
  ADD CONSTRAINT `Agent_rel` FOREIGN KEY (`Agent_id`) REFERENCES `Agent` (`NAME`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Body_rel` FOREIGN KEY (`Body_id`) REFERENCES `Body` (`city`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Operations_Log`
--
ALTER TABLE `Operations_Log`
  ADD CONSTRAINT `Operations_Log_rel1` FOREIGN KEY (`user_id`) REFERENCES `Account` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Operations_Log_rel2` FOREIGN KEY (`slot_id`) REFERENCES `Parking_Space` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Operations_Log_rel3` FOREIGN KEY (`sub_id`) REFERENCES `Subscription` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Operations_Log_rel4` FOREIGN KEY (`res_id`) REFERENCES `Reservation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Operations_Log_rel6` FOREIGN KEY (`emp_id`) REFERENCES `Account` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Operations_Log_rel7` FOREIGN KEY (`tkt_id`) REFERENCES `Ticket` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Operations_Log_rel8` FOREIGN KEY (`zone_id`) REFERENCES `Zone` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Parking_Payment`
--
ALTER TABLE `Parking_Payment`
  ADD CONSTRAINT `Park_pay1` FOREIGN KEY (`park_id`) REFERENCES `Parking_Space` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Park_pay2` FOREIGN KEY (`user_id`) REFERENCES `Account` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Parking_Space`
--
ALTER TABLE `Parking_Space`
  ADD CONSTRAINT `Parking_Space_ibfk_1` FOREIGN KEY (`id_body`) REFERENCES `Body` (`city`),
  ADD CONSTRAINT `Parking_Space_ibfk_2` FOREIGN KEY (`id_agent`) REFERENCES `Agent` (`NAME`),
  ADD CONSTRAINT `Parking_Space_ibfk_3` FOREIGN KEY (`zone_id`) REFERENCES `Zone` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Account` (`username`),
  ADD CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`id_parking`) REFERENCES `Parking_Space` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Subscription`
--
ALTER TABLE `Subscription`
  ADD CONSTRAINT `Subscription_ibfk_1` FOREIGN KEY (`id_agent`) REFERENCES `Agent` (`NAME`);

--
-- Constraints for table `Subscription_Payment`
--
ALTER TABLE `Subscription_Payment`
  ADD CONSTRAINT `Sub_pay1` FOREIGN KEY (`user_id`) REFERENCES `Account` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Sub_pay2` FOREIGN KEY (`sub_id`) REFERENCES `Subscription` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Ticket`
--
ALTER TABLE `Ticket`
  ADD CONSTRAINT `Ticket_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Account` (`username`),
  ADD CONSTRAINT `Ticket_ibfk_2` FOREIGN KEY (`employee`) REFERENCES `Account` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Ticket_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `Agent` (`NAME`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
