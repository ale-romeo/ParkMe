-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: database
-- Creato il: Mag 14, 2023 alle 00:12
-- Versione del server: 8.0.33
-- Versione PHP: 8.1.18

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
-- Struttura della tabella `Account`
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
-- Dump dei dati per la tabella `Account`
--

INSERT INTO `Account` (`username`, `email`, `password`, `reg_date`, `type`, `name`, `surname`, `birth_date`, `phone`, `gender`, `Body_id`, `Agent_id`, `priv_email_employee`, `exp_emp_date`, `removed`) VALUES
('alessandro.romeo', 'alessandro.romeo@easypark.it', '$2y$10$drvTsnlVKs2Jiv.JY4y7UO9ZxVvwsmXRyetZDH88N5XZgMSrIeRgK', '2023-05-09 20:36:47', 'sup_agent_emp', 'Alessandro', 'Romeo', '2000-12-06', '', 'M', NULL, 'EASYPARK', '', NULL, 0),
('andrea.spadaro', 'andrea.spadaro@easypark.it', '$2y$10$.2hSO1MJ8ho4pDf/SU2LYuLHu9qn2zo/BdMs.D3zk3H5npaP5tFiy', '2023-05-11 22:30:49', 'agent_emp', 'Andrea', 'Spadaro', '2000-05-16', NULL, NULL, NULL, 'EASYPARK', NULL, '2024-05-11', 0),
('ariannacu', 'ariannacus@gmail.com', '$2y$10$BkgqjE3Idic4v560UwdduOAPeh8bIe9FLxXiYwGrg5kWRhLyZ4E8S', '2023-05-11 21:23:58', 'end_user', 'Arianna', 'Cuscinà', NULL, '', 'F', NULL, NULL, NULL, NULL, 0),
('davide.ciraolo', 'davide.ciraolo@comune.messina.it', '$2y$10$g8perYhsCg7tYfWPjd3yV.IJGXP1Er46n/5.qvHjTjel36qbOjSs2', '2023-05-12 08:42:09', 'body_emp', 'Davide', 'Ciraolo', '1995-01-01', NULL, NULL, 'MESSINA', NULL, NULL, '2024-05-12', 0),
('giovanni.giovane', 'giovanni.giovane@easypark.it', '$2y$10$MDzRLbvS84cL1Nxabgaae.fmylWzW19pvGyMDEbN14jUQu1Q4kkGO', '2023-05-13 01:52:05', 'agent_emp', 'Giovanni', 'Giovane', '1998-02-12', NULL, NULL, NULL, 'EASYPARK', NULL, '2024-05-13', 0),
('giuseppe.buonasera', 'giuseppe.buonasera@comune.messina.it', '$2y$10$FK/4MPBA6Pa6iB.hepOfnuqsKikwpKg0fj36Wl1vVVtDp42y2i/Ym', '2023-05-02 17:19:47', 'sup_body_emp', 'Giuseppe', 'Buonasera', '2000-03-29', '3330560840', 'F', 'MESSINA', NULL, 'ciao@ciao.it', NULL, 0),
('guido.vespa', 'guido.vespa@easypark.it', '$2y$10$TaoW9OirBhG.kbVdBfZR8u2P9Q9h5dAlUk4AuWhtNidMk4YE6trX2', '2023-05-13 01:49:09', 'agent_emp', 'Guido', 'Vespa', '1990-10-10', NULL, NULL, NULL, 'EASYPARK', NULL, '2024-05-13', 0),
('irene.cuscinà', 'irene.cuscinà@easypark.it', '$2y$10$whtVwwE2SY2iq/Qr2VX/X.x6nWhMOg3dcuR0xRdFihKM7mF9ittGm', '2023-05-11 16:21:24', 'agent_emp', 'Irene', 'Cuscinà', '2001-01-10', NULL, NULL, NULL, 'EASYPARK', NULL, '2024-05-11', 1),
('manuel.fabiano', 'manuel.fabiano@comune.messina.it', '$2y$10$OwvQ9KmgiCRUO0/jxD8OlOirT7TPt0iz3CxWTVEIyvpxGPMBJogW6', '2023-05-09 17:59:26', 'body_emp', 'Manuel', 'Fabiano', '2002-10-03', NULL, NULL, 'MESSINA', NULL, NULL, NULL, 0),
('marco.aloisi', 'marco.aloisi@comune.messina.it', '$2y$10$LkTS9d0GewpJn91PLlXVzusofxsaDU1Y8fN/88BV.T7rw..WaoRGy', '2023-05-11 22:27:31', 'body_emp', 'Marco', 'Aloisi', '2001-06-02', NULL, NULL, 'MESSINA', NULL, NULL, '2024-05-11', 0),
('matteo.deluca', 'matteo.deluca@mycicero.it', '$2y$10$drvTsnlVKs2Jiv.JY4y7UO9ZxVvwsmXRyetZDH88N5XZgMSrIeRgK', '2023-05-09 23:09:59', 'sup_agent_emp', 'Matteo', 'De Luca', '2000-12-04', NULL, NULL, NULL, 'MYCICERO', NULL, NULL, 0),
('paolo.rossi', 'paolo.rossi@easypark.it', '$2y$10$aKnHTV9JA0lmF.M3XAKye.dTC6YlTNqMY5PrjFdKjcfr1q6hU2FNO', '2023-05-13 01:45:00', 'agent_emp', 'Paolo', 'Rossi', '2001-01-01', NULL, NULL, NULL, 'EASYPARK', NULL, '2024-05-13', 0),
('pino.aloisi', 'pino.aloisi@easypark.it', '$2y$10$9La/KKwVMDveJzdE8.VfPeSyxGftv9dYxeuMD9sZzh3l7L2OgS9U6', '2023-05-13 01:48:24', 'agent_emp', 'pino', 'Aloisi', '2002-02-02', NULL, NULL, NULL, 'EASYPARK', NULL, '2024-05-13', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Agent`
--

CREATE TABLE `Agent` (
  `NAME` varchar(50) NOT NULL,
  `balance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Agent`
--

INSERT INTO `Agent` (`NAME`, `balance`) VALUES
('EASYPARK', 100000),
('MYCICERO', 100000);

-- --------------------------------------------------------

--
-- Struttura della tabella `Body`
--

CREATE TABLE `Body` (
  `city` varchar(50) NOT NULL,
  `balance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Body`
--

INSERT INTO `Body` (`city`, `balance`) VALUES
('MESSINA', 10000000);

-- --------------------------------------------------------

--
-- Struttura della tabella `Operations_Log`
--

CREATE TABLE `Operations_Log` (
  `id` int NOT NULL,
  `action` enum('Modifica Abbonamento','Modifica Tariffa','Visualizzazione Zona','Risoluzione Ticket','Assegnazione posto','Rimozione posto','Aggiunta Impiegato','Rimozione Impiegato','Rimozione Abbonamento','Aggiunta Abbonamento') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `zone_id` enum('A','B','C','D','E') DEFAULT NULL,
  `slot_id` varchar(4) DEFAULT NULL,
  `sub_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `emp_id` varchar(50) DEFAULT NULL,
  `tkt_id` int DEFAULT NULL,
  `user_id` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Operations_Log`
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
(88, 'Modifica Tariffa', 'E', NULL, NULL, NULL, NULL, NULL, 'alessandro.romeo', '2023-05-13 22:31:58');

-- --------------------------------------------------------

--
-- Struttura della tabella `Parking_Space`
--

CREATE TABLE `Parking_Space` (
  `id` varchar(4) NOT NULL,
  `STATUS` enum('Available','Occupied','Reserved','Out of order') NOT NULL,
  `zone_id` enum('A','B','C','D','E') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_body` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_agent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hourly_price` float DEFAULT NULL,
  `periodic_price` float DEFAULT NULL,
  `parking_ending_time` datetime DEFAULT NULL,
  `charging_station` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Parking_Space`
--

INSERT INTO `Parking_Space` (`id`, `STATUS`, `zone_id`, `id_body`, `id_agent`, `hourly_price`, `periodic_price`, `parking_ending_time`, `charging_station`) VALUES
('A0', 'Occupied', 'A', 'MESSINA', 'EASYPARK', 0.5, 0.45, '2023-05-14 02:01:45', 0),
('A1', 'Available', 'A', 'MESSINA', 'MYCICERO', 0.5, 0.4, NULL, 0),
('A10', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A100', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A101', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A102', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A103', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A104', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A105', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A106', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A107', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A108', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A109', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A11', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A110', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A111', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A112', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A113', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A114', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A115', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A116', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A117', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A118', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A119', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A12', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A120', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A121', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A122', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A123', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A124', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A125', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A126', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A127', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A128', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A129', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A13', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A130', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A131', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A132', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A133', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A134', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A135', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A136', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A137', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A138', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A139', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A14', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A140', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A141', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A142', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A143', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A144', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A145', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A146', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A147', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A148', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A149', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A15', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A150', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A151', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A152', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A153', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A154', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A155', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A156', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A157', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A158', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A159', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A16', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A160', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A161', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A162', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A163', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A164', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A165', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A166', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A167', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A168', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A169', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A17', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A170', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A171', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A172', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A173', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A174', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A175', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A176', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A177', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A178', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A179', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A18', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A180', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A181', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A182', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A183', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A184', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A185', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A186', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A187', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A188', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A189', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A19', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A190', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A191', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A192', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A193', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A194', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A195', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A196', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A197', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A198', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A199', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A2', 'Available', 'A', 'MESSINA', 'EASYPARK', 0.5, 0.45, NULL, 1),
('A20', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A21', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A22', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A23', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A24', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A25', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A26', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A27', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A28', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A29', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A3', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A30', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A31', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A32', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A33', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A34', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A35', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A36', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A37', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A38', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A39', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A4', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A40', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A41', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A42', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A43', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A44', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A45', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A46', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A47', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A48', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A49', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A5', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A50', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A51', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A52', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A53', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A54', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A55', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A56', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A57', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A58', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A59', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A6', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A60', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A61', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A62', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A63', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A64', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A65', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A66', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A67', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A68', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A69', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A7', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A70', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A71', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A72', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A73', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A74', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A75', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A76', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A77', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A78', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A79', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A8', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A80', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A81', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A82', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A83', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A84', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A85', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A86', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A87', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A88', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A89', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A9', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A90', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A91', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A92', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A93', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A94', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A95', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A96', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A97', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A98', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A99', 'Available', 'A', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B0', 'Available', 'B', 'MESSINA', 'EASYPARK', 0.5, 0.4, NULL, 0),
('B1', 'Available', 'B', 'MESSINA', 'EASYPARK', 0.5, 0.4, NULL, 1),
('B10', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B100', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B101', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B102', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B103', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B104', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B105', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B106', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B107', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B108', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B109', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B11', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B110', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B111', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B112', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B113', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B114', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B115', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B116', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B117', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B118', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B119', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B12', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B120', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B121', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B122', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B123', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B124', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B125', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B126', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B127', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B128', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B129', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B13', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B130', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B131', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B132', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B133', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B134', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B135', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B136', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B137', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B138', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B139', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B14', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B140', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B141', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B142', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B143', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B144', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B145', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B146', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B147', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B148', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B149', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B15', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B150', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B151', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B152', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B153', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B154', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B155', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B156', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B157', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B158', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B159', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B16', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B160', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B161', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B162', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B163', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B164', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B165', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B166', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B167', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B168', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B169', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B17', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B170', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B171', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B172', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B173', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B174', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B175', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B176', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B177', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B178', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B179', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B18', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B180', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B181', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B182', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B183', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B184', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B185', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B186', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B187', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B188', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B189', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B19', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B190', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B191', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B192', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B193', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B194', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B195', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B196', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B197', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B198', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B199', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B2', 'Available', 'B', 'MESSINA', 'MYCICERO', 0.5, 0.4, NULL, 1),
('B20', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B21', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B22', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B23', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B24', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B25', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B26', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B27', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B28', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B29', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B3', 'Available', 'B', 'MESSINA', 'EASYPARK', 0.5, 0.4, NULL, 1),
('B30', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B31', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B32', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B33', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B34', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B35', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B36', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B37', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B38', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B39', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B4', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B40', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B41', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B42', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B43', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B44', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B45', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B46', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B47', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B48', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B49', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B5', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B50', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B51', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B52', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B53', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B54', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B55', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B56', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B57', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B58', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B59', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B6', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B60', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B61', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B62', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B63', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B64', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B65', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B66', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B67', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B68', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B69', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B7', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B70', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B71', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B72', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B73', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B74', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B75', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B76', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B77', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B78', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B79', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B8', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B80', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B81', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B82', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B83', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B84', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B85', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B86', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B87', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B88', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B89', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B9', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B90', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B91', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B92', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B93', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B94', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B95', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B96', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B97', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B98', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B99', 'Available', 'B', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C0', 'Out of order', 'C', 'MESSINA', 'MYCICERO', NULL, NULL, NULL, 0),
('C1', 'Out of order', 'C', 'MESSINA', 'MYCICERO', NULL, NULL, NULL, 1),
('C10', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C100', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C101', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C102', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C103', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C104', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C105', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C106', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C107', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C108', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C109', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C11', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C110', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C111', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C112', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C113', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C114', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C115', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C116', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C117', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C118', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C119', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C12', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C120', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C121', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C122', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C123', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C124', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C125', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C126', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C127', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C128', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C129', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C13', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C130', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C131', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C132', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C133', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C134', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C135', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C136', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C137', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C138', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C139', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C14', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C140', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C141', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C142', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C143', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C144', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C145', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C146', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C147', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C148', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C149', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C15', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C150', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C151', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C152', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C153', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C154', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C155', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C156', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C157', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C158', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C159', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C16', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C160', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C161', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C162', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C163', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C164', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C165', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C166', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C167', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C168', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C169', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C17', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C170', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C171', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C172', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C173', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C174', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C175', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C176', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C177', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C178', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C179', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C18', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C180', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C181', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C182', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C183', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C184', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C185', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C186', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C187', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C188', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C189', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C19', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C190', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C191', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C192', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C193', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C194', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C195', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C196', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C197', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C198', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C199', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C2', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C20', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C21', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C22', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C23', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C24', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C25', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C26', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C27', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C28', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C29', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C3', 'Out of order', 'C', 'MESSINA', 'MYCICERO', NULL, NULL, NULL, 1),
('C30', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C31', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C32', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C33', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C34', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C35', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C36', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C37', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C38', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C39', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C4', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C40', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C41', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C42', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C43', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C44', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C45', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C46', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C47', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C48', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C49', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C5', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C50', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C51', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C52', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C53', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C54', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C55', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C56', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C57', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C58', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C59', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C6', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C60', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C61', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C62', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C63', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C64', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C65', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C66', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C67', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C68', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C69', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C7', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C70', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C71', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C72', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C73', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C74', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C75', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C76', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C77', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C78', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C79', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C8', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C80', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C81', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C82', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C83', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C84', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C85', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C86', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C87', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C88', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C89', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C9', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C90', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C91', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C92', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C93', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C94', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C95', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C96', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C97', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C98', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C99', 'Out of order', 'C', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D0', 'Occupied', 'D', 'MESSINA', 'EASYPARK', 0.55, 0.45, '2023-05-15 01:17:38', 1),
('D1', 'Available', 'D', 'MESSINA', 'MYCICERO', 0.55, 0.45, NULL, 1),
('D10', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D100', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D101', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D102', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D103', 'Available', 'D', 'MESSINA', 'EASYPARK', 0.55, 0.45, NULL, 0),
('D104', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D105', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D106', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D107', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D108', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D109', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D11', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D110', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D111', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D112', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D113', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D114', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D115', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D116', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D117', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D118', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D119', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D12', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D120', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D121', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D122', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D123', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D124', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D125', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D126', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D127', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D128', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D129', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D13', 'Available', 'D', 'MESSINA', 'MYCICERO', 0.55, 0.45, NULL, 0),
('D130', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D131', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D132', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D133', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D134', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D135', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D136', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D137', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D138', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D139', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D14', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D140', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D141', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D142', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D143', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D144', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D145', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D146', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D147', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D148', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D149', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D15', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D150', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D151', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D152', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D153', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D154', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D155', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D156', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D157', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D158', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D159', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D16', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D160', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D161', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D162', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D163', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D164', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D165', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D166', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D167', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D168', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D169', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D17', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D170', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D171', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D172', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D173', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D174', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D175', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D176', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D177', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D178', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D179', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D18', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D180', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D181', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D182', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D183', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D184', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D185', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D186', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D187', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D188', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D189', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D19', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D190', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D191', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D192', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D193', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D194', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D195', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D196', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D197', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D198', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D199', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D2', 'Available', 'D', 'MESSINA', 'MYCICERO', 0.55, 0.45, NULL, 1),
('D20', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D21', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D22', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D23', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D24', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D25', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D26', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D27', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D28', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D29', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D3', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D30', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D31', 'Available', 'D', 'MESSINA', 'EASYPARK', 0.55, 0.45, NULL, 0),
('D32', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D33', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D34', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D35', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D36', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D37', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D38', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D39', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D4', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D40', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D41', 'Available', 'D', 'MESSINA', 'EASYPARK', 0.55, 0.45, NULL, 1),
('D42', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D43', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D44', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D45', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D46', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D47', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D48', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D49', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D5', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D50', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D51', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D52', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D53', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D54', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D55', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D56', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D57', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D58', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D59', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D6', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D60', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D61', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D62', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D63', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D64', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D65', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D66', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D67', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D68', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D69', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D7', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D70', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D71', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D72', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D73', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D74', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1);
INSERT INTO `Parking_Space` (`id`, `STATUS`, `zone_id`, `id_body`, `id_agent`, `hourly_price`, `periodic_price`, `parking_ending_time`, `charging_station`) VALUES
('D75', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D76', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D77', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D78', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D79', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D8', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D80', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D81', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D82', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D83', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D84', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D85', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D86', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D87', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D88', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D89', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D9', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D90', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D91', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D92', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D93', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D94', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D95', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D96', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D97', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D98', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D99', 'Available', 'D', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E0', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E1', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E10', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E100', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E101', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E102', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E103', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E104', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E105', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E106', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E107', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E108', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E109', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E11', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E110', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E111', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E112', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E113', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E114', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E115', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E116', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E117', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E118', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E119', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E12', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E120', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E121', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E122', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E123', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E124', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E125', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E126', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E127', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E128', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E129', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E13', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E130', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E131', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E132', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E133', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E134', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E135', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E136', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E137', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E138', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E139', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E14', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E140', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E141', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E142', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E143', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E144', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E145', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E146', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E147', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E148', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E149', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E15', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E150', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E151', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E152', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E153', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E154', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E155', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E156', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E157', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E158', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E159', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E16', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E160', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E161', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E162', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E163', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E164', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E165', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E166', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E167', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E168', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E169', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E17', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E170', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E171', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E172', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E173', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E174', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E175', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E176', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E177', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E178', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E179', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E18', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E180', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E181', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E182', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E183', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E184', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E185', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E186', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E187', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E188', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E189', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E19', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E190', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E191', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E192', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E193', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E194', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E195', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E196', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E197', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E198', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E199', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E2', 'Out of order', 'E', 'MESSINA', 'MYCICERO', NULL, NULL, NULL, 0),
('E20', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E21', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E22', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E23', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E24', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E25', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E26', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E27', 'Out of order', 'E', 'MESSINA', 'MYCICERO', NULL, NULL, NULL, 0),
('E28', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E29', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E3', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E30', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E31', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E32', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E33', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E34', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E35', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E36', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E37', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E38', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E39', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E4', 'Available', 'E', 'MESSINA', 'EASYPARK', 0.5, 0.4, NULL, 0),
('E40', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E41', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E42', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E43', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E44', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E45', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E46', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E47', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E48', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E49', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E5', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E50', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E51', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E52', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E53', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E54', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E55', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E56', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E57', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E58', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E59', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E6', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E60', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E61', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E62', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E63', 'Out of order', 'E', 'MESSINA', 'MYCICERO', NULL, NULL, NULL, 1),
('E64', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E65', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E66', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E67', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E68', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E69', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E7', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E70', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E71', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E72', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E73', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E74', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E75', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E76', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E77', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E78', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E79', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E8', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E80', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E81', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E82', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E83', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E84', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E85', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E86', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E87', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E88', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E89', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E9', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E90', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E91', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E92', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E93', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E94', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E95', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E96', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E97', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E98', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E99', 'Out of order', 'E', 'MESSINA', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `Payment`
--

CREATE TABLE `Payment` (
  `id` int NOT NULL,
  `service` enum('Abbonamento','Parcheggio','Prenotazione') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` float NOT NULL,
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `park_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `sub_id` int DEFAULT NULL,
  `agent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Reservation`
--

CREATE TABLE `Reservation` (
  `id` int NOT NULL,
  `id_user` varchar(50) NOT NULL,
  `id_parking` varchar(4) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `starting_time` datetime NOT NULL,
  `ending_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Subscription`
--

CREATE TABLE `Subscription` (
  `id` int NOT NULL,
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` enum('Settimanale','Mensile','Trimestrale','Semestrale','Annuale') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` float NOT NULL,
  `reduction` float DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `id_agent` varchar(50) NOT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Subscription`
--

INSERT INTO `Subscription` (`id`, `title`, `type`, `price`, `reduction`, `expiration_date`, `id_agent`, `removed`) VALUES
(1, 'Weekly2', 'Settimanale', 4, NULL, NULL, 'EASYPARK', 1),
(3, 'Monthly', 'Settimanale', 15, NULL, NULL, 'EASYPARK', 0),
(5, 'Yearly1', 'Annuale', 49, NULL, NULL, 'EASYPARK', 1),
(6, '6m', 'Semestrale', 60, NULL, NULL, 'EASYPARK', 1),
(7, 'yearly', 'Annuale', 65, NULL, NULL, 'EASYPARK', 0),
(8, 'sem', 'Semestrale', 45, NULL, NULL, 'EASYPARK', 1),
(9, 'sect', 'Mensile', 16, NULL, NULL, 'EASYPARK', 1),
(10, 'Riduzione 0.05', 'Settimanale', 3, NULL, NULL, 'EASYPARK', 0),
(11, 'Riduzione 0.04', 'Settimanale', 2.5, 0.04, NULL, 'EASYPARK', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `Ticket`
--

CREATE TABLE `Ticket` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `body_text` text NOT NULL,
  `answer` text,
  `employee` varchar(50) DEFAULT NULL,
  `id_user` varchar(50) NOT NULL,
  `status` enum('Aperto','Chiuso') NOT NULL DEFAULT 'Aperto',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Ticket`
--

INSERT INTO `Ticket` (`id`, `title`, `body_text`, `answer`, `employee`, `id_user`, `status`, `date`) VALUES
(1, 'prova', 'prova', 'ciao', NULL, 'ariannacu', 'Chiuso', '2023-05-11 21:25:18');

-- --------------------------------------------------------

--
-- Struttura della tabella `Zone`
--

CREATE TABLE `Zone` (
  `id` enum('A','B','C','D','E') NOT NULL,
  `Coords` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Zone`
--

INSERT INTO `Zone` (`id`, `Coords`) VALUES
('A', NULL),
('B', NULL),
('C', NULL),
('D', NULL),
('E', NULL);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `Agent_rel` (`Agent_id`),
  ADD KEY `Body_rel` (`Body_id`);

--
-- Indici per le tabelle `Agent`
--
ALTER TABLE `Agent`
  ADD PRIMARY KEY (`NAME`);

--
-- Indici per le tabelle `Body`
--
ALTER TABLE `Body`
  ADD PRIMARY KEY (`city`);

--
-- Indici per le tabelle `Operations_Log`
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
-- Indici per le tabelle `Parking_Space`
--
ALTER TABLE `Parking_Space`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_body` (`id_body`),
  ADD KEY `id_agent` (`id_agent`),
  ADD KEY `Parking_Space_ibfk_3` (`zone_id`);

--
-- Indici per le tabelle `Payment`
--
ALTER TABLE `Payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`user_id`),
  ADD KEY `id_subscription` (`sub_id`),
  ADD KEY `id_reservation` (`res_id`),
  ADD KEY `id_parking` (`park_id`),
  ADD KEY `Payment_ibfk_5` (`agent_id`);

--
-- Indici per le tabelle `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_parking` (`id_parking`);

--
-- Indici per le tabelle `Subscription`
--
ALTER TABLE `Subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_agent` (`id_agent`);

--
-- Indici per le tabelle `Ticket`
--
ALTER TABLE `Ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `Ticket_ibfk_2` (`employee`);

--
-- Indici per le tabelle `Zone`
--
ALTER TABLE `Zone`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Operations_Log`
--
ALTER TABLE `Operations_Log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT per la tabella `Payment`
--
ALTER TABLE `Payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT per la tabella `Reservation`
--
ALTER TABLE `Reservation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Subscription`
--
ALTER TABLE `Subscription`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `Ticket`
--
ALTER TABLE `Ticket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Account`
--
ALTER TABLE `Account`
  ADD CONSTRAINT `Agent_rel` FOREIGN KEY (`Agent_id`) REFERENCES `Agent` (`NAME`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Body_rel` FOREIGN KEY (`Body_id`) REFERENCES `Body` (`city`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limiti per la tabella `Operations_Log`
--
ALTER TABLE `Operations_Log`
  ADD CONSTRAINT `Operations_Log_rel1` FOREIGN KEY (`user_id`) REFERENCES `Account` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Operations_Log_rel2` FOREIGN KEY (`slot_id`) REFERENCES `Parking_Space` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Operations_Log_rel3` FOREIGN KEY (`sub_id`) REFERENCES `Subscription` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Operations_Log_rel4` FOREIGN KEY (`res_id`) REFERENCES `Reservation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Operations_Log_rel5` FOREIGN KEY (`zone_id`) REFERENCES `Zone` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Operations_Log_rel6` FOREIGN KEY (`emp_id`) REFERENCES `Account` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Operations_Log_rel7` FOREIGN KEY (`tkt_id`) REFERENCES `Ticket` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limiti per la tabella `Parking_Space`
--
ALTER TABLE `Parking_Space`
  ADD CONSTRAINT `Parking_Space_ibfk_1` FOREIGN KEY (`id_body`) REFERENCES `Body` (`city`),
  ADD CONSTRAINT `Parking_Space_ibfk_2` FOREIGN KEY (`id_agent`) REFERENCES `Agent` (`NAME`),
  ADD CONSTRAINT `Parking_Space_ibfk_3` FOREIGN KEY (`zone_id`) REFERENCES `Zone` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limiti per la tabella `Payment`
--
ALTER TABLE `Payment`
  ADD CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Account` (`username`),
  ADD CONSTRAINT `Payment_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `Subscription` (`id`),
  ADD CONSTRAINT `Payment_ibfk_3` FOREIGN KEY (`res_id`) REFERENCES `Reservation` (`id`),
  ADD CONSTRAINT `Payment_ibfk_4` FOREIGN KEY (`park_id`) REFERENCES `Parking_Space` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Payment_ibfk_5` FOREIGN KEY (`agent_id`) REFERENCES `Agent` (`NAME`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limiti per la tabella `Reservation`
--
ALTER TABLE `Reservation`
  ADD CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Account` (`username`),
  ADD CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`id_parking`) REFERENCES `Parking_Space` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limiti per la tabella `Subscription`
--
ALTER TABLE `Subscription`
  ADD CONSTRAINT `Subscription_ibfk_1` FOREIGN KEY (`id_agent`) REFERENCES `Agent` (`NAME`);

--
-- Limiti per la tabella `Ticket`
--
ALTER TABLE `Ticket`
  ADD CONSTRAINT `Ticket_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Account` (`username`),
  ADD CONSTRAINT `Ticket_ibfk_2` FOREIGN KEY (`employee`) REFERENCES `Account` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
