-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: database
-- Creato il: Apr 28, 2023 alle 22:03
-- Versione del server: 8.0.31
-- Versione PHP: 8.0.27

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
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `surname` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` enum('M','F','O') DEFAULT NULL,
  `priv_email_employee` varchar(255) DEFAULT NULL,
  `expiration_contract_employee` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Agent`
--

CREATE TABLE `Agent` (
  `NAME` varchar(50) NOT NULL,
  `balance` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Body`
--

CREATE TABLE `Body` (
  `city` varchar(50) NOT NULL,
  `balance` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Managing`
--

CREATE TABLE `Managing` (
  `id_employee` varchar(50) NOT NULL,
  `ACTION` varchar(255) NOT NULL,
  `DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Parking_Space`
--

CREATE TABLE `Parking_Space` (
  `id` int NOT NULL,
  `STATUS` enum('Available','Occupied','Reserved','Out of order') NOT NULL,
  `id_body` varchar(50),
  `id_agent` varchar(50),
  `hourly_price` decimal(10,2)
  `periodic_price` decimal(10,2),
  `parking_ending_time` datetime,
  `charging_station` tinyint(1) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Payment`
--

CREATE TABLE `Payment` (
  `id` int NOT NULL,
  `DATE` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `id_user` varchar(50) NOT NULL,
  `id_parking` int DEFAULT NULL,
  `id_reservation` int DEFAULT NULL,
  `id_subscription` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Reservation`
--

CREATE TABLE `Reservation` (
  `id` int NOT NULL,
  `id_user` varchar(50) NOT NULL,
  `id_parking` int NOT NULL,
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
  `TYPE` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `expiration_date` date NOT NULL,
  `id_agent` varchar(50) NOT NULL,
  `id_user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Ticket`
--

CREATE TABLE `Ticket` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `body_text` text NOT NULL,
  `id_user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Viewing_Slots`
--

CREATE TABLE `Viewing_Slots` (
  `id_body_employee` varchar(50) NOT NULL,
  `DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

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
-- Indici per le tabelle `Managing`
--
ALTER TABLE `Managing`
  ADD PRIMARY KEY (`id_employee`,`ACTION`);

--
-- Indici per le tabelle `Parking_Space`
--
ALTER TABLE `Parking_Space`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_body` (`id_body`),
  ADD KEY `id_agent` (`id_agent`);

--
-- Indici per le tabelle `Payment`
--
ALTER TABLE `Payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_subscription` (`id_subscription`),
  ADD KEY `id_reservation` (`id_reservation`),
  ADD KEY `id_parking` (`id_parking`);

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
  ADD KEY `id_agent` (`id_agent`),
  ADD KEY `id_user` (`id_user`);

--
-- Indici per le tabelle `Ticket`
--
ALTER TABLE `Ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indici per le tabelle `Viewing_Slots`
--
ALTER TABLE `Viewing_Slots`
  ADD PRIMARY KEY (`id_body_employee`,`DATE`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Parking_Space`
--
ALTER TABLE `Parking_Space`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Payment`
--
ALTER TABLE `Payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Reservation`
--
ALTER TABLE `Reservation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Subscription`
--
ALTER TABLE `Subscription`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Ticket`
--
ALTER TABLE `Ticket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Managing`
--
ALTER TABLE `Managing`
  ADD CONSTRAINT `Managing_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `Account` (`username`);

--
-- Limiti per la tabella `Parking_Space`
--
ALTER TABLE `Parking_Space`
  ADD CONSTRAINT `Parking_Space_ibfk_1` FOREIGN KEY (`id_body`) REFERENCES `Body` (`city`),
  ADD CONSTRAINT `Parking_Space_ibfk_2` FOREIGN KEY (`id_agent`) REFERENCES `Agent` (`NAME`);

--
-- Limiti per la tabella `Payment`
--
ALTER TABLE `Payment`
  ADD CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Account` (`username`),
  ADD CONSTRAINT `Payment_ibfk_2` FOREIGN KEY (`id_subscription`) REFERENCES `Subscription` (`id`),
  ADD CONSTRAINT `Payment_ibfk_3` FOREIGN KEY (`id_reservation`) REFERENCES `Reservation` (`id`),
  ADD CONSTRAINT `Payment_ibfk_4` FOREIGN KEY (`id_parking`) REFERENCES `Parking_Space` (`id`);

--
-- Limiti per la tabella `Reservation`
--
ALTER TABLE `Reservation`
  ADD CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Account` (`username`),
  ADD CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`id_parking`) REFERENCES `Parking_Space` (`id`);

--
-- Limiti per la tabella `Subscription`
--
ALTER TABLE `Subscription`
  ADD CONSTRAINT `Subscription_ibfk_1` FOREIGN KEY (`id_agent`) REFERENCES `Agent` (`NAME`),
  ADD CONSTRAINT `Subscription_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `Account` (`username`);

--
-- Limiti per la tabella `Ticket`
--
ALTER TABLE `Ticket`
  ADD CONSTRAINT `Ticket_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Account` (`username`);

--
-- Limiti per la tabella `Viewing_Slots`
--
ALTER TABLE `Viewing_Slots`
  ADD CONSTRAINT `Viewing_Slots_ibfk_1` FOREIGN KEY (`id_body_employee`) REFERENCES `Account` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
