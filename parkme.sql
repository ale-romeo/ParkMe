-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: database
-- Generation Time: May 08, 2023 at 04:45 PM
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
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `surname` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` enum('M','F','O') DEFAULT NULL,
  `Body_id` varchar(50) DEFAULT NULL,
  `Agent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `priv_email_employee` varchar(255) DEFAULT NULL,
  `expiration_contract_employee` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` (`username`, `email`, `password`, `reg_date`, `type`, `name`, `surname`, `birth_date`, `phone`, `gender`, `Body_id`, `Agent_id`, `priv_email_employee`, `expiration_contract_employee`) VALUES
('ciaoo', 'ciaoo@ciao.it', '$2y$10$RDnHeTy.57TsQrGL9GIIueE/WeTro5ys5XVi7Pnpul7kg2EVVhR3e', '2023-04-29 01:05:41', 'end_user', 'Alessandro', 'Romeo', NULL, NULL, NULL, '', NULL, NULL, NULL),
('giovanni.lombardo', 'giovanni.lombardo@comune.messina.it', '', '2023-05-08 12:46:17', 'body_emp', 'Giovanni', 'Lombardo', '2002-02-19', NULL, NULL, 'MESSINA', NULL, NULL, NULL),
('giuseppe.bonasera', 'giuseppe.buonasera@comune.messina.it', '$2y$10$vVBzzalMn6IQs2EtnnsKqeDugvmy7cCNJgSTxThGdwhRBPtwbF6i.', '2023-05-02 17:19:47', 'sup_body_emp', 'Giuseppe', 'Buonasera', '2000-03-29', '', 'M', 'MESSINA', NULL, '', NULL),
('matte.bonsi', 'matte.bonsi@comune.messina.it', '', '2023-05-08 12:47:10', 'body_emp', 'Matte', 'Bonsi', '2002-08-05', NULL, NULL, 'MESSINA', NULL, NULL, NULL),
('matteo.bonsi', 'matteo.bonsi@comune.messina.it', '', '2023-05-08 12:46:50', 'body_emp', 'Matteo', 'Bonsi', '2002-08-05', NULL, NULL, 'MESSINA', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Agent`
--

CREATE TABLE `Agent` (
  `NAME` varchar(50) NOT NULL,
  `balance` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Agent`
--

INSERT INTO `Agent` (`NAME`, `balance`) VALUES
('EASYPARK', 100000.00),
('MYCICERO', 100000.00);

-- --------------------------------------------------------

--
-- Table structure for table `Body`
--

CREATE TABLE `Body` (
  `city` varchar(50) NOT NULL,
  `balance` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Body`
--

INSERT INTO `Body` (`city`, `balance`) VALUES
('MESSINA', 10000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `Managing`
--

CREATE TABLE `Managing` (
  `id_employee` varchar(50) NOT NULL,
  `ACTION` varchar(255) NOT NULL,
  `DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Parking_Space`
--

CREATE TABLE `Parking_Space` (
  `id` varchar(4) NOT NULL,
  `STATUS` enum('Available','Occupied','Reserved','Out of order') NOT NULL,
  `id_body` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_agent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hourly_price` decimal(10,2) DEFAULT NULL,
  `periodic_price` decimal(10,2) DEFAULT NULL,
  `parking_ending_time` datetime DEFAULT NULL,
  `charging_station` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Parking_Space`
--

INSERT INTO `Parking_Space` (`id`, `STATUS`, `id_body`, `id_agent`, `hourly_price`, `periodic_price`, `parking_ending_time`, `charging_station`) VALUES
('A0', 'Available', 'MESSINA', 'EASYPARK', NULL, NULL, NULL, 0),
('A1', 'Available', 'MESSINA', 'MYCICERO', NULL, NULL, NULL, 0),
('A10', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A100', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A101', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A102', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A103', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A104', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A105', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A106', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A107', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A108', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A109', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A11', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A110', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A111', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A112', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A113', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A114', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A115', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A116', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A117', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A118', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A119', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A12', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A120', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A121', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A122', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A123', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A124', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A125', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A126', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A127', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A128', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A129', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A13', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A130', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A131', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A132', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A133', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A134', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A135', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A136', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A137', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A138', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A139', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A14', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A140', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A141', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A142', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A143', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A144', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A145', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A146', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A147', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A148', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A149', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A15', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A150', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A151', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A152', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A153', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A154', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A155', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A156', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A157', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A158', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A159', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A16', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A160', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A161', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A162', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A163', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A164', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A165', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A166', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A167', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A168', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A169', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A17', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A170', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A171', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A172', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A173', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A174', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A175', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A176', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A177', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A178', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A179', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A18', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A180', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A181', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A182', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A183', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A184', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A185', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A186', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A187', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A188', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A189', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A19', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A190', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A191', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A192', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A193', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A194', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A195', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A196', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A197', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A198', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A199', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A2', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A20', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A21', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A22', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A23', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A24', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A25', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A26', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A27', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A28', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A29', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A3', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A30', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A31', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A32', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A33', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A34', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A35', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A36', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A37', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A38', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A39', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A4', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A40', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A41', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A42', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A43', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A44', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A45', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A46', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A47', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A48', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A49', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A5', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A50', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A51', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A52', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A53', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A54', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A55', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A56', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A57', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A58', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A59', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A6', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A60', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A61', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A62', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A63', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A64', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A65', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A66', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A67', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A68', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A69', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A7', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A70', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A71', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A72', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A73', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A74', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A75', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A76', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A77', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A78', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A79', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A8', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A80', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A81', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A82', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A83', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A84', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A85', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A86', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A87', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A88', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A89', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A9', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A90', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A91', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A92', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A93', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A94', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('A95', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A96', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A97', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A98', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('A99', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B0', 'Available', 'MESSINA', 'MYCICERO', NULL, NULL, NULL, 0),
('B1', 'Available', 'MESSINA', 'EASYPARK', NULL, NULL, NULL, 1),
('B10', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B100', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B101', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B102', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B103', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B104', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B105', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B106', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B107', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B108', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B109', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B11', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B110', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B111', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B112', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B113', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B114', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B115', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B116', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B117', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B118', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B119', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B12', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B120', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B121', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B122', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B123', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B124', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B125', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B126', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B127', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B128', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B129', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B13', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B130', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B131', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B132', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B133', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B134', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B135', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B136', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B137', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B138', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B139', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B14', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B140', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B141', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B142', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B143', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B144', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B145', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B146', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B147', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B148', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B149', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B15', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B150', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B151', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B152', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B153', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B154', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B155', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B156', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B157', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B158', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B159', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B16', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B160', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B161', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B162', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B163', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B164', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B165', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B166', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B167', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B168', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B169', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B17', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B170', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B171', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B172', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B173', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B174', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B175', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B176', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B177', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B178', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B179', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B18', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B180', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B181', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B182', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B183', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B184', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B185', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B186', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B187', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B188', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B189', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B19', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B190', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B191', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B192', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B193', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B194', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B195', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B196', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B197', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B198', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B199', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B2', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B20', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B21', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B22', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B23', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B24', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B25', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B26', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B27', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B28', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B29', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B3', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B30', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B31', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B32', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B33', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B34', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B35', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B36', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B37', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B38', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B39', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B4', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B40', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B41', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B42', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B43', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B44', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B45', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B46', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B47', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B48', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B49', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B5', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B50', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B51', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B52', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B53', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B54', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B55', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B56', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B57', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B58', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B59', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B6', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B60', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B61', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B62', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B63', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B64', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B65', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B66', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B67', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B68', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B69', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B7', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B70', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B71', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B72', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B73', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B74', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B75', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B76', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B77', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B78', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B79', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B8', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B80', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B81', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B82', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B83', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B84', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B85', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B86', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B87', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B88', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B89', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B9', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B90', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B91', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B92', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B93', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B94', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B95', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B96', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B97', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('B98', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('B99', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C0', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C1', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C10', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C100', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C101', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C102', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C103', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C104', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C105', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C106', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C107', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C108', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C109', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C11', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C110', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C111', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C112', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C113', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C114', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C115', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C116', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C117', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C118', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C119', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C12', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C120', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C121', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C122', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C123', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C124', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C125', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C126', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C127', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C128', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C129', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C13', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C130', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C131', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C132', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C133', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C134', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C135', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C136', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C137', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C138', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C139', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C14', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C140', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C141', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C142', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C143', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C144', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C145', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C146', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C147', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C148', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C149', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C15', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C150', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C151', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C152', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C153', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C154', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C155', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C156', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C157', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C158', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C159', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C16', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C160', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C161', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C162', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C163', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C164', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C165', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C166', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C167', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C168', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C169', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C17', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C170', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C171', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C172', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C173', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C174', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C175', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C176', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C177', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C178', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C179', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C18', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C180', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C181', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C182', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C183', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C184', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C185', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C186', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C187', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C188', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C189', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C19', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C190', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C191', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C192', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C193', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C194', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C195', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C196', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C197', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C198', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C199', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C2', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C20', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C21', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C22', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C23', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C24', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C25', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C26', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C27', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C28', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C29', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C3', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C30', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C31', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C32', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C33', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C34', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C35', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C36', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C37', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C38', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C39', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C4', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C40', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C41', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C42', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C43', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C44', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C45', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C46', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C47', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C48', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C49', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C5', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C50', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C51', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C52', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C53', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C54', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C55', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C56', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C57', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C58', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C59', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C6', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C60', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C61', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C62', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C63', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C64', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C65', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C66', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C67', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C68', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C69', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C7', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C70', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C71', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C72', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C73', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C74', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C75', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C76', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C77', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C78', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C79', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C8', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C80', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C81', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C82', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C83', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C84', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C85', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C86', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C87', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C88', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C89', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C9', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C90', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C91', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C92', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C93', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C94', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C95', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('C96', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C97', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C98', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('C99', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D0', 'Available', 'MESSINA', 'EASYPARK', NULL, NULL, NULL, 1),
('D1', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D10', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D100', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D101', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D102', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D103', 'Available', 'MESSINA', 'EASYPARK', NULL, NULL, NULL, 0),
('D104', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D105', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D106', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D107', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D108', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D109', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D11', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D110', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D111', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D112', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D113', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D114', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D115', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D116', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D117', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D118', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D119', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D12', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D120', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D121', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D122', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D123', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D124', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D125', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D126', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D127', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D128', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D129', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D13', 'Available', 'MESSINA', 'MYCICERO', NULL, NULL, NULL, 0),
('D130', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D131', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D132', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D133', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D134', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D135', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D136', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D137', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D138', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D139', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D14', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D140', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D141', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D142', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D143', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D144', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D145', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D146', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D147', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D148', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D149', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D15', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D150', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D151', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D152', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D153', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D154', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D155', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D156', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D157', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D158', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D159', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D16', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D160', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D161', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D162', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D163', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D164', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D165', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D166', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D167', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D168', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D169', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D17', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D170', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D171', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D172', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D173', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D174', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D175', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D176', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D177', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D178', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D179', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D18', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D180', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D181', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D182', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D183', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D184', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D185', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D186', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D187', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D188', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D189', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D19', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D190', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D191', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D192', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D193', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D194', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D195', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D196', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D197', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D198', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D199', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D2', 'Available', 'MESSINA', 'MYCICERO', NULL, NULL, NULL, 1),
('D20', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D21', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D22', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D23', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D24', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D25', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D26', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D27', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D28', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D29', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D3', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D30', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D31', 'Available', 'MESSINA', 'EASYPARK', NULL, NULL, NULL, 0),
('D32', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D33', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D34', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D35', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D36', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D37', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D38', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D39', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D4', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D40', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D41', 'Available', 'MESSINA', 'EASYPARK', NULL, NULL, NULL, 1),
('D42', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D43', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D44', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D45', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D46', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D47', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D48', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D49', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D5', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D50', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D51', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D52', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D53', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D54', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D55', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D56', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D57', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D58', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D59', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D6', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D60', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D61', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D62', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D63', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D64', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D65', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D66', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D67', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D68', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D69', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D7', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D70', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D71', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D72', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D73', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D74', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D75', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D76', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D77', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D78', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D79', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D8', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D80', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D81', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D82', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D83', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D84', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D85', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D86', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D87', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D88', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D89', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D9', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D90', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D91', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D92', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D93', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D94', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D95', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D96', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D97', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('D98', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('D99', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E0', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E1', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E10', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E100', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E101', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E102', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E103', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E104', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E105', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E106', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E107', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E108', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E109', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E11', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E110', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E111', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E112', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E113', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E114', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E115', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E116', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E117', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E118', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E119', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E12', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E120', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E121', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E122', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E123', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E124', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E125', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E126', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E127', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E128', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E129', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E13', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E130', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E131', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E132', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E133', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E134', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E135', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E136', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E137', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E138', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E139', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E14', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E140', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E141', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E142', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E143', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1);
INSERT INTO `Parking_Space` (`id`, `STATUS`, `id_body`, `id_agent`, `hourly_price`, `periodic_price`, `parking_ending_time`, `charging_station`) VALUES
('E144', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E145', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E146', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E147', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E148', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E149', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E15', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E150', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E151', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E152', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E153', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E154', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E155', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E156', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E157', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E158', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E159', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E16', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E160', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E161', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E162', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E163', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E164', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E165', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E166', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E167', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E168', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E169', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E17', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E170', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E171', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E172', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E173', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E174', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E175', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E176', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E177', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E178', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E179', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E18', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E180', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E181', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E182', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E183', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E184', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E185', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E186', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E187', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E188', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E189', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E19', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E190', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E191', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E192', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E193', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E194', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E195', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E196', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E197', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E198', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E199', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E2', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E20', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E21', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E22', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E23', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E24', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E25', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E26', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E27', 'Available', 'MESSINA', 'MYCICERO', NULL, NULL, NULL, 0),
('E28', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E29', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E3', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E30', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E31', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E32', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E33', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E34', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E35', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E36', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E37', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E38', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E39', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E4', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E40', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E41', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E42', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E43', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E44', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E45', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E46', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E47', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E48', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E49', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E5', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E50', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E51', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E52', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E53', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E54', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E55', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E56', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E57', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E58', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E59', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E6', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E60', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E61', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E62', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E63', 'Available', 'MESSINA', 'MYCICERO', NULL, NULL, NULL, 1),
('E64', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E65', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E66', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E67', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E68', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E69', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E7', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E70', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E71', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E72', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E73', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E74', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E75', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E76', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E77', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E78', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E79', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E8', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E80', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E81', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E82', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E83', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E84', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E85', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E86', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E87', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E88', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E89', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E9', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E90', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E91', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E92', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E93', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E94', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E95', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E96', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E97', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 1),
('E98', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0),
('E99', 'Available', 'MESSINA', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Payment`
--

CREATE TABLE `Payment` (
  `id` int NOT NULL,
  `DATE` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `id_user` varchar(50) NOT NULL,
  `id_parking` varchar(4) DEFAULT NULL,
  `id_reservation` int DEFAULT NULL,
  `id_subscription` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Reservation`
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
-- Table structure for table `Subscription`
--

CREATE TABLE `Subscription` (
  `id` int NOT NULL,
  `TYPE` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `expiration_date` date NOT NULL,
  `id_agent` varchar(50) NOT NULL,
  `id_user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Ticket`
--

CREATE TABLE `Ticket` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `body_text` text NOT NULL,
  `id_user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Viewing_slots`
--

CREATE TABLE `Viewing_slots` (
  `id` int NOT NULL,
  `emp_id` varchar(50) DEFAULT NULL,
  `slot_zone` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `viewing_time` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Viewing_slots`
--

INSERT INTO `Viewing_slots` (`id`, `emp_id`, `slot_zone`, `viewing_time`) VALUES
(1, 'giuseppe.buonasera', 'B', '2023-05-08 15:46:39'),
(8, 'giuseppe.buonasera', 'C', '2023-05-08 16:23:04'),
(9, 'giuseppe.buonasera', 'B', '2023-05-08 16:23:05'),
(10, 'giuseppe.buonasera', 'A', '2023-05-08 16:23:06'),
(11, 'giuseppe.buonasera', 'D', '2023-05-08 16:23:08'),
(12, 'giuseppe.buonasera', 'E', '2023-05-08 16:23:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

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
-- Indexes for table `Managing`
--
ALTER TABLE `Managing`
  ADD PRIMARY KEY (`id_employee`,`ACTION`);

--
-- Indexes for table `Parking_Space`
--
ALTER TABLE `Parking_Space`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_body` (`id_body`),
  ADD KEY `id_agent` (`id_agent`);

--
-- Indexes for table `Payment`
--
ALTER TABLE `Payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_subscription` (`id_subscription`),
  ADD KEY `id_reservation` (`id_reservation`),
  ADD KEY `id_parking` (`id_parking`);

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
  ADD KEY `id_agent` (`id_agent`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `Ticket`
--
ALTER TABLE `Ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `Viewing_slots`
--
ALTER TABLE `Viewing_slots`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Payment`
--
ALTER TABLE `Payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Reservation`
--
ALTER TABLE `Reservation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Subscription`
--
ALTER TABLE `Subscription`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Ticket`
--
ALTER TABLE `Ticket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Viewing_slots`
--
ALTER TABLE `Viewing_slots`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Managing`
--
ALTER TABLE `Managing`
  ADD CONSTRAINT `Managing_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `Account` (`username`);

--
-- Constraints for table `Parking_Space`
--
ALTER TABLE `Parking_Space`
  ADD CONSTRAINT `Parking_Space_ibfk_1` FOREIGN KEY (`id_body`) REFERENCES `Body` (`city`),
  ADD CONSTRAINT `Parking_Space_ibfk_2` FOREIGN KEY (`id_agent`) REFERENCES `Agent` (`NAME`);

--
-- Constraints for table `Payment`
--
ALTER TABLE `Payment`
  ADD CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Account` (`username`),
  ADD CONSTRAINT `Payment_ibfk_2` FOREIGN KEY (`id_subscription`) REFERENCES `Subscription` (`id`),
  ADD CONSTRAINT `Payment_ibfk_3` FOREIGN KEY (`id_reservation`) REFERENCES `Reservation` (`id`),
  ADD CONSTRAINT `Payment_ibfk_4` FOREIGN KEY (`id_parking`) REFERENCES `Parking_Space` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

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
  ADD CONSTRAINT `Subscription_ibfk_1` FOREIGN KEY (`id_agent`) REFERENCES `Agent` (`NAME`),
  ADD CONSTRAINT `Subscription_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `Account` (`username`);

--
-- Constraints for table `Ticket`
--
ALTER TABLE `Ticket`
  ADD CONSTRAINT `Ticket_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Account` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
