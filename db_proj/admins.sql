-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Creato il: Dic 29, 2022 alle 01:51
-- Versione del server: 8.0.31
-- Versione PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Parking MS`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `admins`
--

CREATE TABLE `admins` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Expiration pass` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Surname` varchar(255) DEFAULT NULL,
  `Phone Number` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `admins`
--

INSERT INTO `admins` (`email`, `username`, `password`, `Expiration pass`, `Name`, `Surname`, `Phone Number`) VALUES
('ciccio@pasticcio.com', 'cicciopasticcio', '$2y$10$2dueQ3aqLtXykHgMOXHBrO4tazMRKxEdJ2U3zKWKad.naAkoWbckG', NULL, NULL, NULL, NULL),
('marco@aloisi.com', 'marcoaloisi', '$2y$10$Ik6SZDojQzWLBaOJVHSGZ.blyGRfuucylQmmV2mvLMLFQiaoRc4ta', NULL, NULL, NULL, NULL);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `username` (`username`);
ALTER TABLE `admins` ADD FULLTEXT KEY `E-mail` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
