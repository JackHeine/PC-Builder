-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 04, 2023 at 12:59 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pc_builder`
--

-- --------------------------------------------------------

--
-- Table structure for table `Chasis`
--

CREATE TABLE `Chasis` (
  `Chasis_ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Cost` decimal(7,2) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Make_ID` int(11) NOT NULL,
  `Form_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CPU`
--

CREATE TABLE `CPU` (
  `CPU_ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Power_Usage` int(11) NOT NULL,
  `Cost` decimal(7,2) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Socket_ID` int(11) NOT NULL,
  `Make_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Drive_Type`
--

CREATE TABLE `Drive_Type` (
  `Type_ID` int(11) NOT NULL,
  `Type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Form_Factor`
--

CREATE TABLE `Form_Factor` (
  `Form_ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Graphics_Card`
--

CREATE TABLE `Graphics_Card` (
  `GPU_ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Make_ID` int(11) NOT NULL,
  `Memory` int(11) NOT NULL,
  `Power_Usage` int(11) NOT NULL,
  `Cost` decimal(7,2) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Manufacturer`
--

CREATE TABLE `Manufacturer` (
  `Make_ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Motherboard`
--

CREATE TABLE `Motherboard` (
  `Motherboard_ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Make_ID` int(11) NOT NULL,
  `Cost` decimal(7,2) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Form_ID` int(11) NOT NULL,
  `Socket_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PC_Build`
--

CREATE TABLE `PC_Build` (
  `PC_ID` int(11) NOT NULL,
  `Price` decimal(8,2) DEFAULT NULL,
  `Shipped` tinyint(1) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Chasis_ID` int(11) DEFAULT NULL,
  `PSU_ID` int(11) DEFAULT NULL,
  `RAM_ID` int(11) DEFAULT NULL,
  `CPU_ID` int(11) DEFAULT NULL,
  `Motherboard_ID` int(11) DEFAULT NULL,
  `Storage_ID` int(11) DEFAULT NULL,
  `GPU_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Power_Supply`
--

CREATE TABLE `Power_Supply` (
  `PSU_ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Make_ID` int(11) NOT NULL,
  `Wattage` int(11) NOT NULL,
  `Cost` decimal(7,2) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RAM`
--

CREATE TABLE `RAM` (
  `RAM_ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Make_ID` int(11) NOT NULL,
  `Size` int(11) NOT NULL,
  `Speed` int(11) NOT NULL,
  `Cost` decimal(7,2) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Socket`
--

CREATE TABLE `Socket` (
  `Socket_ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Storage`
--

CREATE TABLE `Storage` (
  `Storage_ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Make_ID` int(11) NOT NULL,
  `Type_ID` int(11) NOT NULL,
  `Cost` decimal(7,2) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `User_ID` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Chasis`
--
ALTER TABLE `Chasis`
  ADD PRIMARY KEY (`Chasis_ID`),
  ADD KEY `Make_ID` (`Make_ID`),
  ADD KEY `Form_ID` (`Form_ID`);

--
-- Indexes for table `CPU`
--
ALTER TABLE `CPU`
  ADD PRIMARY KEY (`CPU_ID`),
  ADD KEY `Socket_ID` (`Socket_ID`),
  ADD KEY `Make_ID` (`Make_ID`);

--
-- Indexes for table `Drive_Type`
--
ALTER TABLE `Drive_Type`
  ADD PRIMARY KEY (`Type_ID`);

--
-- Indexes for table `Form_Factor`
--
ALTER TABLE `Form_Factor`
  ADD PRIMARY KEY (`Form_ID`);

--
-- Indexes for table `Graphics_Card`
--
ALTER TABLE `Graphics_Card`
  ADD PRIMARY KEY (`GPU_ID`),
  ADD KEY `Make_ID` (`Make_ID`);

--
-- Indexes for table `Manufacturer`
--
ALTER TABLE `Manufacturer`
  ADD PRIMARY KEY (`Make_ID`);

--
-- Indexes for table `Motherboard`
--
ALTER TABLE `Motherboard`
  ADD PRIMARY KEY (`Motherboard_ID`),
  ADD KEY `Form_ID` (`Form_ID`),
  ADD KEY `Socket_ID` (`Socket_ID`),
  ADD KEY `Make_ID` (`Make_ID`);

--
-- Indexes for table `PC_Build`
--
ALTER TABLE `PC_Build`
  ADD PRIMARY KEY (`PC_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Chasis_ID` (`Chasis_ID`),
  ADD KEY `PSU_ID` (`PSU_ID`),
  ADD KEY `RAM_ID` (`RAM_ID`),
  ADD KEY `CPU_ID` (`CPU_ID`),
  ADD KEY `Motherboard_ID` (`Motherboard_ID`),
  ADD KEY `Storage_ID` (`Storage_ID`),
  ADD KEY `GPU_ID` (`GPU_ID`);

--
-- Indexes for table `Power_Supply`
--
ALTER TABLE `Power_Supply`
  ADD PRIMARY KEY (`PSU_ID`),
  ADD KEY `Make_ID` (`Make_ID`);

--
-- Indexes for table `RAM`
--
ALTER TABLE `RAM`
  ADD PRIMARY KEY (`RAM_ID`),
  ADD KEY `make` (`Make_ID`);

--
-- Indexes for table `Socket`
--
ALTER TABLE `Socket`
  ADD PRIMARY KEY (`Socket_ID`);

--
-- Indexes for table `Storage`
--
ALTER TABLE `Storage`
  ADD PRIMARY KEY (`Storage_ID`),
  ADD KEY `Make_ID` (`Make_ID`),
  ADD KEY `type` (`Type_ID`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`User_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Chasis`
--
ALTER TABLE `Chasis`
  MODIFY `Chasis_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CPU`
--
ALTER TABLE `CPU`
  MODIFY `CPU_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Drive_Type`
--
ALTER TABLE `Drive_Type`
  MODIFY `Type_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Form_Factor`
--
ALTER TABLE `Form_Factor`
  MODIFY `Form_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Manufacturer`
--
ALTER TABLE `Manufacturer`
  MODIFY `Make_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Motherboard`
--
ALTER TABLE `Motherboard`
  MODIFY `Motherboard_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PC_Build`
--
ALTER TABLE `PC_Build`
  MODIFY `PC_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Power_Supply`
--
ALTER TABLE `Power_Supply`
  MODIFY `PSU_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `RAM`
--
ALTER TABLE `RAM`
  MODIFY `RAM_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Socket`
--
ALTER TABLE `Socket`
  MODIFY `Socket_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Storage`
--
ALTER TABLE `Storage`
  MODIFY `Storage_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Chasis`
--
ALTER TABLE `Chasis`
  ADD CONSTRAINT `chasis_ibfk_1` FOREIGN KEY (`Make_ID`) REFERENCES `Manufacturer` (`Make_ID`),
  ADD CONSTRAINT `chasis_ibfk_2` FOREIGN KEY (`Form_ID`) REFERENCES `Form_Factor` (`Form_ID`);

--
-- Constraints for table `CPU`
--
ALTER TABLE `CPU`
  ADD CONSTRAINT `cpu_ibfk_1` FOREIGN KEY (`Socket_ID`) REFERENCES `Socket` (`Socket_ID`),
  ADD CONSTRAINT `cpu_ibfk_2` FOREIGN KEY (`Make_ID`) REFERENCES `Manufacturer` (`Make_ID`);

--
-- Constraints for table `Graphics_Card`
--
ALTER TABLE `Graphics_Card`
  ADD CONSTRAINT `graphics_card_ibfk_1` FOREIGN KEY (`Make_ID`) REFERENCES `Manufacturer` (`Make_ID`);

--
-- Constraints for table `Motherboard`
--
ALTER TABLE `Motherboard`
  ADD CONSTRAINT `motherboard_ibfk_1` FOREIGN KEY (`Form_ID`) REFERENCES `Form_Factor` (`Form_ID`),
  ADD CONSTRAINT `motherboard_ibfk_2` FOREIGN KEY (`Socket_ID`) REFERENCES `Socket` (`Socket_ID`),
  ADD CONSTRAINT `motherboard_ibfk_3` FOREIGN KEY (`Make_ID`) REFERENCES `Manufacturer` (`Make_ID`);

--
-- Constraints for table `PC_Build`
--
ALTER TABLE `PC_Build`
  ADD CONSTRAINT `pc_build_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `User` (`User_ID`),
  ADD CONSTRAINT `pc_build_ibfk_2` FOREIGN KEY (`Chasis_ID`) REFERENCES `Chasis` (`Chasis_ID`),
  ADD CONSTRAINT `pc_build_ibfk_3` FOREIGN KEY (`PSU_ID`) REFERENCES `Power_Supply` (`PSU_ID`),
  ADD CONSTRAINT `pc_build_ibfk_4` FOREIGN KEY (`RAM_ID`) REFERENCES `RAM` (`RAM_ID`),
  ADD CONSTRAINT `pc_build_ibfk_5` FOREIGN KEY (`CPU_ID`) REFERENCES `CPU` (`CPU_ID`),
  ADD CONSTRAINT `pc_build_ibfk_6` FOREIGN KEY (`Motherboard_ID`) REFERENCES `Motherboard` (`Motherboard_ID`),
  ADD CONSTRAINT `pc_build_ibfk_7` FOREIGN KEY (`Storage_ID`) REFERENCES `Storage` (`Storage_ID`),
  ADD CONSTRAINT `pc_build_ibfk_8` FOREIGN KEY (`GPU_ID`) REFERENCES `Graphics_Card` (`GPU_ID`);

--
-- Constraints for table `Power_Supply`
--
ALTER TABLE `Power_Supply`
  ADD CONSTRAINT `power_supply_ibfk_1` FOREIGN KEY (`Make_ID`) REFERENCES `Manufacturer` (`Make_ID`);

--
-- Constraints for table `RAM`
--
ALTER TABLE `RAM`
  ADD CONSTRAINT `make` FOREIGN KEY (`Make_ID`) REFERENCES `Manufacturer` (`Make_ID`);

--
-- Constraints for table `Storage`
--
ALTER TABLE `Storage`
  ADD CONSTRAINT `storage_ibfk_1` FOREIGN KEY (`Make_ID`) REFERENCES `Manufacturer` (`Make_ID`),
  ADD CONSTRAINT `type` FOREIGN KEY (`Type_ID`) REFERENCES `Drive_Type` (`Type_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
