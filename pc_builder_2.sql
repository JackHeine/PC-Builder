-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 15, 2023 at 08:34 PM
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
-- Database: `pc_builder_2`
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

--
-- Dumping data for table `CPU`
--

INSERT INTO `CPU` (`CPU_ID`, `Model`, `Power_Usage`, `Cost`, `Stock`, `Socket_ID`, `Make_ID`) VALUES
(1, 'Core i9-13900K', 253, '589.99', 20, 1, 1),
(5, 'Core i7-13700K', 253, '409.00', 26, 1, 1),
(6, 'Core i5-13600K', 181, '319.00', 10, 1, 1),
(7, 'Ryzen 9 7950X', 230, '699.00', 80, 2, 2),
(8, 'Ryzen 7 7700X', 142, '399.00', 78, 2, 2),
(9, 'Ryzen 5 7600X', 142, '299.00', 181, 2, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cpu_info`
-- (See below for the actual view)
--
CREATE TABLE `cpu_info` (
`Make_ID` int(11)
,`Socket_ID` int(11)
,`CPU_ID` int(11)
,`Model` varchar(50)
,`Power_Usage` int(11)
,`Cost` decimal(7,2)
,`Stock` int(11)
,`Name` varchar(50)
,`Manufacturer` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `Drive_Type`
--

CREATE TABLE `Drive_Type` (
  `Type_ID` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Drive_Type`
--

INSERT INTO `Drive_Type` (`Type_ID`, `Type`) VALUES
(1, 'SATA SSD'),
(2, 'NVME SSD'),
(3, 'Hard Drive');

-- --------------------------------------------------------

--
-- Table structure for table `Form_Factor`
--

CREATE TABLE `Form_Factor` (
  `Form_ID` int(11) NOT NULL,
  `Form_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Form_Factor`
--

INSERT INTO `Form_Factor` (`Form_ID`, `Form_Name`) VALUES
(1, 'Standard ATX (Full Tower)'),
(2, 'Micro ATX (Half Tower)');

-- --------------------------------------------------------

--
-- Stand-in structure for view `gpu_info`
-- (See below for the actual view)
--
CREATE TABLE `gpu_info` (
`Make_ID` int(11)
,`GPU_ID` int(11)
,`Model` varchar(50)
,`Memory` int(11)
,`Power_Usage` int(11)
,`Cost` decimal(7,2)
,`Stock` int(11)
,`Manufacturer` varchar(50)
);

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

--
-- Dumping data for table `Graphics_Card`
--

INSERT INTO `Graphics_Card` (`GPU_ID`, `Model`, `Make_ID`, `Memory`, `Power_Usage`, `Cost`, `Stock`) VALUES
(1, 'TUF Gaming GeForce RTX™ 4080', 3, 16, 320, '1199.99', 15),
(3, 'WINDFORCE GeForce RTX 4070', 4, 12, 200, '599.00', 100);

-- --------------------------------------------------------

--
-- Table structure for table `Manufacturer`
--

CREATE TABLE `Manufacturer` (
  `Make_ID` int(11) NOT NULL,
  `Manufacturer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Manufacturer`
--

INSERT INTO `Manufacturer` (`Make_ID`, `Manufacturer`) VALUES
(1, 'Intel'),
(2, 'AMD'),
(3, 'ASUS'),
(4, 'Gigabyte'),
(5, 'MSI'),
(6, 'Crucial'),
(7, 'Corsair');

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

--
-- Dumping data for table `Motherboard`
--

INSERT INTO `Motherboard` (`Motherboard_ID`, `Model`, `Make_ID`, `Cost`, `Stock`, `Form_ID`, `Socket_ID`) VALUES
(1, 'ROG Maximus Z790 Hero (WiFi 6E) ', 3, '609.00', 34, 1, 1),
(2, 'MAG B560M Mortar Gaming Motherboard', 5, '109.00', 12, 2, 1),
(3, 'X670 AORUS ELITE AX', 4, '289.00', 12, 1, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `motherboard_info`
-- (See below for the actual view)
--
CREATE TABLE `motherboard_info` (
`Socket_ID` int(11)
,`Make_ID` int(11)
,`Form_ID` int(11)
,`Motherboard_ID` int(11)
,`Model` varchar(50)
,`Cost` decimal(7,2)
,`Stock` int(11)
,`Form_Name` varchar(50)
,`Manufacturer` varchar(50)
,`Name` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `PC_Build`
--

CREATE TABLE `PC_Build` (
  `PC_ID` int(11) NOT NULL,
  `Nickname` varchar(50) NOT NULL,
  `Price` decimal(8,2) DEFAULT NULL,
  `Order_Placed` tinyint(1) NOT NULL DEFAULT 0,
  `Shipped` tinyint(1) NOT NULL DEFAULT 0,
  `User_ID` int(11) NOT NULL,
  `Chasis_ID` int(11) DEFAULT NULL,
  `PSU_ID` int(11) DEFAULT NULL,
  `RAM_ID` int(11) DEFAULT NULL,
  `CPU_ID` int(11) DEFAULT NULL,
  `Motherboard_ID` int(11) DEFAULT NULL,
  `Storage_ID` int(11) DEFAULT NULL,
  `GPU_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PC_Build`
--

INSERT INTO `PC_Build` (`PC_ID`, `Nickname`, `Price`, `Order_Placed`, `Shipped`, `User_ID`, `Chasis_ID`, `PSU_ID`, `RAM_ID`, `CPU_ID`, `Motherboard_ID`, `Storage_ID`, `GPU_ID`) VALUES
(1, 'foo', NULL, 0, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(2, 'Test', NULL, 0, 0, 1, NULL, NULL, NULL, 5, 1, NULL, NULL),
(8, 'Ultimate Gaming', NULL, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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

--
-- Dumping data for table `Power_Supply`
--

INSERT INTO `Power_Supply` (`PSU_ID`, `Model`, `Make_ID`, `Wattage`, `Cost`, `Stock`) VALUES
(1, 'RM Series RM850', 7, 850, '140.00', 10);

-- --------------------------------------------------------

--
-- Stand-in structure for view `psu_info`
-- (See below for the actual view)
--
CREATE TABLE `psu_info` (
`Make_ID` int(11)
,`PSU_ID` int(11)
,`Model` varchar(50)
,`Wattage` int(11)
,`Cost` decimal(7,2)
,`Stock` int(11)
,`Manufacturer` varchar(50)
);

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

--
-- Dumping data for table `RAM`
--

INSERT INTO `RAM` (`RAM_ID`, `Model`, `Make_ID`, `Size`, `Speed`, `Cost`, `Stock`) VALUES
(1, ' VENGEANCE LPX', 7, 16, 3600, '43.00', 15);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ram_info`
-- (See below for the actual view)
--
CREATE TABLE `ram_info` (
`Make_ID` int(11)
,`RAM_ID` int(11)
,`Model` varchar(50)
,`Size` int(11)
,`Speed` int(11)
,`Cost` decimal(7,2)
,`Stock` int(11)
,`Manufacturer` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `Socket`
--

CREATE TABLE `Socket` (
  `Socket_ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Socket`
--

INSERT INTO `Socket` (`Socket_ID`, `Name`) VALUES
(1, 'LGA 1700 (Intel)'),
(2, 'AM5 (AMD)');

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
-- Dumping data for table `User`
--

INSERT INTO `User` (`User_ID`, `Email`, `Password`, `First_Name`, `Last_Name`) VALUES
(1, 'test@mail.com', 'Password', 'Test', 'Man');

-- --------------------------------------------------------

--
-- Structure for view `cpu_info`
--
DROP TABLE IF EXISTS `cpu_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cpu_info`  AS   (select `cpu`.`Make_ID` AS `Make_ID`,`cpu`.`Socket_ID` AS `Socket_ID`,`cpu`.`CPU_ID` AS `CPU_ID`,`cpu`.`Model` AS `Model`,`cpu`.`Power_Usage` AS `Power_Usage`,`cpu`.`Cost` AS `Cost`,`cpu`.`Stock` AS `Stock`,`socket`.`Name` AS `Name`,`manufacturer`.`Manufacturer` AS `Manufacturer` from ((`cpu` join `socket` on(`cpu`.`Socket_ID` = `socket`.`Socket_ID`)) join `manufacturer` on(`cpu`.`Make_ID` = `manufacturer`.`Make_ID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `gpu_info`
--
DROP TABLE IF EXISTS `gpu_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gpu_info`  AS   (select `graphics_card`.`Make_ID` AS `Make_ID`,`graphics_card`.`GPU_ID` AS `GPU_ID`,`graphics_card`.`Model` AS `Model`,`graphics_card`.`Memory` AS `Memory`,`graphics_card`.`Power_Usage` AS `Power_Usage`,`graphics_card`.`Cost` AS `Cost`,`graphics_card`.`Stock` AS `Stock`,`manufacturer`.`Manufacturer` AS `Manufacturer` from (`graphics_card` join `manufacturer` on(`graphics_card`.`Make_ID` = `manufacturer`.`Make_ID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `motherboard_info`
--
DROP TABLE IF EXISTS `motherboard_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `motherboard_info`  AS   (select `motherboard`.`Socket_ID` AS `Socket_ID`,`motherboard`.`Make_ID` AS `Make_ID`,`motherboard`.`Form_ID` AS `Form_ID`,`motherboard`.`Motherboard_ID` AS `Motherboard_ID`,`motherboard`.`Model` AS `Model`,`motherboard`.`Cost` AS `Cost`,`motherboard`.`Stock` AS `Stock`,`form_factor`.`Form_Name` AS `Form_Name`,`manufacturer`.`Manufacturer` AS `Manufacturer`,`socket`.`Name` AS `Name` from (((`motherboard` join `form_factor` on(`motherboard`.`Form_ID` = `form_factor`.`Form_ID`)) join `manufacturer` on(`motherboard`.`Make_ID` = `manufacturer`.`Make_ID`)) join `socket` on(`motherboard`.`Socket_ID` = `socket`.`Socket_ID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `psu_info`
--
DROP TABLE IF EXISTS `psu_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `psu_info`  AS   (select `power_supply`.`Make_ID` AS `Make_ID`,`power_supply`.`PSU_ID` AS `PSU_ID`,`power_supply`.`Model` AS `Model`,`power_supply`.`Wattage` AS `Wattage`,`power_supply`.`Cost` AS `Cost`,`power_supply`.`Stock` AS `Stock`,`manufacturer`.`Manufacturer` AS `Manufacturer` from (`power_supply` join `manufacturer` on(`power_supply`.`Make_ID` = `manufacturer`.`Make_ID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `ram_info`
--
DROP TABLE IF EXISTS `ram_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ram_info`  AS   (select `ram`.`Make_ID` AS `Make_ID`,`ram`.`RAM_ID` AS `RAM_ID`,`ram`.`Model` AS `Model`,`ram`.`Size` AS `Size`,`ram`.`Speed` AS `Speed`,`ram`.`Cost` AS `Cost`,`ram`.`Stock` AS `Stock`,`manufacturer`.`Manufacturer` AS `Manufacturer` from (`ram` join `manufacturer` on(`ram`.`Make_ID` = `manufacturer`.`Make_ID`)))  ;

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
  MODIFY `CPU_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Drive_Type`
--
ALTER TABLE `Drive_Type`
  MODIFY `Type_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Form_Factor`
--
ALTER TABLE `Form_Factor`
  MODIFY `Form_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Graphics_Card`
--
ALTER TABLE `Graphics_Card`
  MODIFY `GPU_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Manufacturer`
--
ALTER TABLE `Manufacturer`
  MODIFY `Make_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Motherboard`
--
ALTER TABLE `Motherboard`
  MODIFY `Motherboard_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `PC_Build`
--
ALTER TABLE `PC_Build`
  MODIFY `PC_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Power_Supply`
--
ALTER TABLE `Power_Supply`
  MODIFY `PSU_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `RAM`
--
ALTER TABLE `RAM`
  MODIFY `RAM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Socket`
--
ALTER TABLE `Socket`
  MODIFY `Socket_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Storage`
--
ALTER TABLE `Storage`
  MODIFY `Storage_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
