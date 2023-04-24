-- =====================
--
--
-- BEFORE EXECUTING THIS SCRIPT, PLEASE READ THE FOLLOWING:
-- To Ensure that the script runs correctly, please ensure that you have the following:
-- utf8mb4-general-ci is the needed collation for the database to work correctly
-- SET GLOBAL log_bin_trust_function_creators = 1
-- WITHOUT THIS, THE SCRIPT WILL NOT RUN CORRECTLY FUNCTIONS WONT BE CREATED
--
--
-- =====================


-- =====================
-- Create Table and Insert Data
-- =====================


CREATE TABLE `Chassis` (
  `Chassis_ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Cost` decimal(7,2) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Make_ID` int(11) NOT NULL,
  `Form_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `Chassis` (`Chassis_ID`, `Model`, `Cost`, `Stock`, `Make_ID`, `Form_ID`) VALUES
(1, 'iCUE 5000X RGB Tempered Glass Mid-Tower', 189.99, 45, 7, 1),
(2, 'LANCOOL 216', 95.99, 89, 8, 1),
(3, 'O11-Dynamic-mini', 120.99, 99, 8, 2);


CREATE TABLE `CPU` (
  `CPU_ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Power_Usage` int(11) NOT NULL,
  `Cost` decimal(7,2) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Socket_ID` int(11) NOT NULL,
  `Make_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `CPU` (`CPU_ID`, `Model`, `Power_Usage`, `Cost`, `Stock`, `Socket_ID`, `Make_ID`) VALUES
(1, 'Core i9-13900K', 253, '589.99', 21, 1, 1),
(5, 'Core i7-13700K', 253, '409.00', 26, 1, 1),
(6, 'Core i5-13600K', 181, '319.00', 10, 1, 1),
(7, 'Ryzen 9 7950X', 230, '699.00', 79, 2, 2),
(8, 'Ryzen 7 7700X', 142, '399.00', 78, 2, 2),
(9, 'Ryzen 5 7600X', 142, '299.00', 180, 2, 2);



CREATE TABLE `Drive_Type` (
  `Type_ID` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `Drive_Type` (`Type_ID`, `Type`) VALUES
(1, 'SATA SSD'),
(2, 'NVME SSD'),
(3, 'Hard Drive');

CREATE TABLE `Form_Factor` (
  `Form_ID` int(11) NOT NULL,
  `Form_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `Form_Factor` (`Form_ID`, `Form_Name`) VALUES
(1, 'Standard ATX (Full Tower)'),
(2, 'Micro ATX (Half Tower)');

CREATE TABLE `Graphics_Card` (
  `GPU_ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Make_ID` int(11) NOT NULL,
  `Memory` int(11) NOT NULL,
  `Power_Usage` int(11) NOT NULL,
  `Cost` decimal(7,2) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `Graphics_Card` (`GPU_ID`, `Model`, `Make_ID`, `Memory`, `Power_Usage`, `Cost`, `Stock`) VALUES
(1, 'TUF Gaming GeForce RTX™ 4080', 3, 16, 320, '1199.99', 15),
(3, 'WINDFORCE GeForce RTX 4070', 4, 12, 200, '599.00', 100);


CREATE TABLE `Motherboard` (
  `Motherboard_ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Make_ID` int(11) NOT NULL,
  `Cost` decimal(7,2) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Form_ID` int(11) NOT NULL,
  `Socket_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `Motherboard` (`Motherboard_ID`, `Model`, `Make_ID`, `Cost`, `Stock`, `Form_ID`, `Socket_ID`) VALUES
(1, 'ROG Maximus Z790 Hero (WiFi 6E) ', 3, '609.00', 34, 1, 1),
(2, 'MAG B560M Mortar Gaming Motherboard', 5, '109.00', 12, 2, 1),
(3, 'X670 AORUS ELITE AX', 4, '289.00', 11, 1, 2);


CREATE TABLE `Power_Supply` (
  `PSU_ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Make_ID` int(11) NOT NULL,
  `Wattage` int(11) NOT NULL,
  `Cost` decimal(7,2) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `Power_Supply` (`PSU_ID`, `Model`, `Make_ID`, `Wattage`, `Cost`, `Stock`) VALUES
(1, 'RM Series RM850', 7, 850, '140.00', 10);

CREATE TABLE `RAM` (
  `RAM_ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Make_ID` int(11) NOT NULL,
  `Size` int(11) NOT NULL,
  `Speed` int(11) NOT NULL,
  `Cost` decimal(7,2) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `RAM` (`RAM_ID`, `Model`, `Make_ID`, `Size`, `Speed`, `Cost`, `Stock`) VALUES
(1, 'VENGEANCE LPX', 7, 16, 3600, '43.00', 15),
(2, 'VENGANCE RGP PRO', 7, 32, 3600, '99.00', 20);


CREATE TABLE `Storage` (
  `Storage_ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Make_ID` int(11) NOT NULL,
  `Type_ID` int(11) NOT NULL,
  `Size` int(11) NOT NULL,
  `Cost` decimal(7,2) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `Storage` (`Storage_ID`, `Model`, `Make_ID`, `Type_ID`, `Size`, `Cost`, `Stock`) VALUES
(1, 'P2', 6, 2, 1000, 68.78, 20),
(2, 'P2', 6, 2, 2000, 126.99, 19),
(3, 'MX500', 6, 1, 1000, 56.99, 21),
(4, 'MX500', 6, 1, 2000, 107.21, 70),
(5, 'Blue', 9, 3, 1000, 39.99, 11),
(6, 'Blue', 9, 3, 2000, 59.99, 60),
(7, 'Blue', 9, 3, 4000, 89.99, 35);


CREATE TABLE `User` (
  `User_ID` int(11) NOT NULL,
  `Admin` int(1) NOT NULL DEFAULT 0,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `User` (`User_ID`, `Admin`, `Email`, `Password`, `First_Name`, `Last_Name`) VALUES
(1, 0, 'test@mail.com', 'Password', 'Test', 'Man');


CREATE TABLE `Manufacturer` (
  `Make_ID` int(11) NOT NULL,
  `Manufacturer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `Manufacturer` (`Make_ID`, `Manufacturer`) VALUES
(1, 'Intel'),
(2, 'AMD'),
(3, 'ASUS'),
(4, 'Gigabyte'),
(5, 'MSI'),
(6, 'Crucial'),
(7, 'Corsair'),
(8, 'Lian Li'),
(9, 'Western Digital');


CREATE TABLE `Socket` (
  `Socket_ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `Socket` (`Socket_ID`, `Name`) VALUES
(1, 'LGA 1700 (Intel)'),
(2, 'AM5 (AMD)');


CREATE TABLE `PC_Build` (
  `PC_ID` int(11) NOT NULL,
  `Nickname` varchar(50) NOT NULL,
  `Price` decimal(8,2) DEFAULT NULL,
  `Order_Placed` tinyint(1) NOT NULL DEFAULT 0,
  `Shipped` tinyint(1) NOT NULL DEFAULT 0,
  `User_ID` int(11) NOT NULL,
  `Chassis_ID` int(11) DEFAULT NULL,
  `PSU_ID` int(11) DEFAULT NULL,
  `RAM_ID` int(11) DEFAULT NULL,
  `CPU_ID` int(11) DEFAULT NULL,
  `Motherboard_ID` int(11) DEFAULT NULL,
  `Storage_ID` int(11) DEFAULT NULL,
  `GPU_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `PC_Build` (`PC_ID`, `Nickname`, `Price`, `Order_Placed`, `Shipped`, `User_ID`, `Chassis_ID`, `PSU_ID`, `RAM_ID`, `CPU_ID`, `Motherboard_ID`, `Storage_ID`, `GPU_ID`) VALUES
(1, 'Demo PC', NULL, 0, 0, 1, NULL, NULL, NULL, 7, 3, NULL, NULL),
(2, 'Test', NULL, 0, 0, 1, NULL, NULL, NULL, 5, 1, NULL, NULL),
(8, 'Ultimate Gaming', NULL, 0, 0, 1, NULL, NULL, NULL, 9, NULL, NULL, NULL);



-- =====================----
-- Indexes for dumped tables and Constraints
-- Generated by phpMyAdmin
-- =====================----

--
-- Indexes for table `Chassis`
--
ALTER TABLE `Chassis`
  ADD PRIMARY KEY (`Chassis_ID`),
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
  ADD KEY `Chassis_ID` (`Chassis_ID`),
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
-- AUTO_INCREMENT for table `Chassis`
--
ALTER TABLE `Chassis`
  MODIFY `Chassis_ID` int(11) NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `Chassis`
--
ALTER TABLE `Chassis`
  ADD CONSTRAINT `chassis_ibfk_1` FOREIGN KEY (`Make_ID`) REFERENCES `Manufacturer` (`Make_ID`),
  ADD CONSTRAINT `chassis_ibfk_2` FOREIGN KEY (`Form_ID`) REFERENCES `Form_Factor` (`Form_ID`);

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
  ADD CONSTRAINT `pc_build_ibfk_2` FOREIGN KEY (`Chassis_ID`) REFERENCES `Chassis` (`Chassis_ID`),
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


-- =====================----
-- Views
-- Rewritten for import, not generated by phpMyAdmin
-- =====================----


CREATE VIEW `chassis_info` AS (
    SELECT * FROM `Chassis`
    NATURAL JOIN `Manufacturer`
    NATURAL JOIN `Form_Factor`
);

CREATE VIEW `cpu_info` AS (
    SELECT * FROM `CPU`
    NATURAL JOIN `Socket`
    NATURAL JOIN `Manufacturer`
);

CREATE VIEW `gpu_info` AS (
    SELECT * FROM `Graphics_Card`
    NATURAL JOIN `Manufacturer`
);

CREATE VIEW `motherboard_info` AS (
    SELECT * FROM `Motherboard`
    NATURAL JOIN `Form_Factor`
    NATURAL JOIN `Socket`
    NATURAL JOIN `Manufacturer`
);

CREATE VIEW `psu_info` AS (
    SELECT * FROM `Power_Supply`
    NATURAL JOIN `Manufacturer`
);

CREATE VIEW `ram_info` AS (
    SELECT * FROM `RAM`
    NATURAL JOIN `Manufacturer`
);

CREATE VIEW `storage_info` AS (
    SELECT * FROM `Storage`
    NATURAL JOIN `Manufacturer`
    NATURAL JOIN `Drive_Type`
);

-- =====================----
-- Triggers
-- generated by phpMyAdmin
-- =====================----

DELIMITER $$
CREATE TRIGGER `update_cpu_stock` AFTER UPDATE ON `PC_Build` FOR EACH ROW BEGIN
   IF NOT(NEW.CPU_ID <=> OLD.CPU_ID) THEN
      UPDATE CPU SET CPU.Stock = (SELECT Stock FROM CPU AS C WHERE C.CPU_ID = NEW.CPU_ID) - 1 WHERE CPU_ID = NEW.CPU_ID;
      UPDATE CPU SET CPU.Stock = (SELECT Stock FROM CPU AS C WHERE C.CPU_ID = OLD.CPU_ID) + 1 WHERE CPU_ID = OLD.CPU_ID;
   END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_motherboard_stock` AFTER UPDATE ON `PC_Build` FOR EACH ROW BEGIN
   IF NOT(NEW.Motherboard_ID <=> OLD.Motherboard_ID) THEN
      UPDATE Motherboard SET Motherboard.Stock = (SELECT Stock FROM Motherboard AS M WHERE M.Motherboard_ID = NEW.Motherboard_ID) - 1 WHERE Motherboard_ID = NEW.Motherboard_ID;
      UPDATE Motherboard SET Motherboard.Stock = (SELECT Stock FROM Motherboard AS M WHERE M.Motherboard_ID = OLD.Motherboard_ID) + 1 WHERE Motherboard_ID = OLD.Motherboard_ID;
   END IF;
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `update_ram_stock` AFTER UPDATE ON `PC_Build` FOR EACH ROW BEGIN
   IF NOT(NEW.RAM_ID <=> OLD.RAM_ID) THEN
      UPDATE RAM SET RAM.Stock = (SELECT Stock FROM RAM AS M WHERE M.RAM_ID = NEW.RAM_ID) - 1 WHERE RAM_ID = NEW.RAM_ID;
      UPDATE RAM SET RAM.Stock = (SELECT Stock FROM RAM AS M WHERE M.RAM_ID = OLD.RAM_ID) + 1 WHERE RAM_ID = OLD.RAM_ID;
   END IF;
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `update_gpu_stock` AFTER UPDATE ON `PC_Build` FOR EACH ROW BEGIN
   IF NOT(NEW.GPU_ID <=> OLD.GPU_ID) THEN
      UPDATE Graphics_Card SET Graphics_Card.Stock = (SELECT Stock FROM Graphics_Card AS M WHERE M.GPU_ID = NEW.GPU_ID) - 1 WHERE GPU_ID = NEW.GPU_ID;
      UPDATE Graphics_Card SET Graphics_Card.Stock = (SELECT Stock FROM Graphics_Card AS M WHERE M.GPU_ID = OLD.GPU_ID) + 1 WHERE GPU_ID = OLD.GPU_ID;
   END IF;
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `update_psu_stock` AFTER UPDATE ON `PC_Build` FOR EACH ROW BEGIN
   IF NOT(NEW.PSU_ID <=> OLD.PSU_ID) THEN
      UPDATE Power_Supply SET Power_Supply.Stock = (SELECT Stock FROM Power_Supply AS M WHERE M.PSU_ID = NEW.PSU_ID) - 1 WHERE PSU_ID = NEW.PSU_ID;
      UPDATE Power_Supply SET Power_Supply.Stock = (SELECT Stock FROM Power_Supply AS M WHERE M.PSU_ID = OLD.PSU_ID) + 1 WHERE PSU_ID = OLD.PSU_ID;
   END IF;
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `update_chassis_stock` AFTER UPDATE ON `PC_Build` FOR EACH ROW BEGIN
   IF NOT(NEW.Chassis_ID <=> OLD.Chassis_ID) THEN
      UPDATE Chassis SET Chassis.Stock = (SELECT Stock FROM Chassis AS M WHERE M.Chassis_ID = NEW.Chassis_ID) - 1 WHERE Chassis_ID = NEW.Chassis_ID;
      UPDATE Chassis SET Chassis.Stock = (SELECT Stock FROM Chassis AS M WHERE M.Chassis_ID = OLD.Chassis_ID) + 1 WHERE Chassis_ID = OLD.Chassis_ID;
   END IF;
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `update_storage_stock` AFTER UPDATE ON `PC_Build` FOR EACH ROW BEGIN
   IF NOT(NEW.Storage_ID <=> OLD.Storage_ID) THEN
      UPDATE Storage SET Storage.Stock = (SELECT Stock FROM Storage AS M WHERE M.Storage_ID = NEW.Storage_ID) - 1 WHERE Storage_ID = NEW.Storage_ID;
      UPDATE Storage SET Storage.Stock = (SELECT Stock FROM Storage AS M WHERE M.Storage_ID = OLD.Storage_ID) + 1 WHERE Storage_ID = OLD.Storage_ID;
   END IF;
END
$$
DELIMITER ;

-- =====================----
-- Functions
-- generated by phpMyAdmin
-- NEEDED: SET GLOBAL log_bin_trust_function_creators = 1;
-- =====================----

DELIMITER $$

CREATE FUNCTION `Current_Build_Percent` (`Build` INT) RETURNS INT(11)  BEGIN
DECLARE Percent INT;

SELECT ROUND(((
    CASE WHEN CPU_ID IS NOT NULL THEN 1 ELSE 0 END + 
    CASE WHEN Motherboard_ID IS NOT NULL THEN 1 ELSE 0 END + 
    CASE WHEN GPU_ID IS NOT NULL THEN 1 ELSE 0 END + 
    CASE WHEN RAM_ID IS NOT NULL THEN 1 ELSE 0 END + 
    CASE WHEN Storage_ID IS NOT NULL THEN 1 ELSE 0 END + 
    CASE WHEN PSU_ID IS NOT NULL THEN 1 ELSE 0 END + 
    CASE WHEN Chassis_ID IS NOT NULL THEN 1 ELSE 0 END 
    ) * (1/7)) * 100) INTO Percent FROM PC_Build
    WHERE PC_Build.PC_ID = Build;
    RETURN Percent;
    END$$



CREATE FUNCTION `Current_Build_Price` (`Build` INT) RETURNS DECIMAL(10,0)  BEGIN
DECLARE Price Decimal;
SELECT 
(ifnull(CPU.Cost, 0) + 
ifnull(Motherboard.Cost, 0) +
ifnull(Graphics_Card.Cost, 0) + 
ifnull(RAM.Cost, 0) +
ifnull(Storage.Cost, 0) + 
ifnull(Power_Supply.Cost, 0) +
ifnull(Chassis.Cost, 0)) INTO Price FROM `PC_Build`
LEFT JOIN CPU ON CPU.CPU_ID = PC_Build.CPU_ID
LEFT JOIN Motherboard ON Motherboard.Motherboard_ID = PC_Build.Motherboard_ID
LEFT JOIN Graphics_Card ON Graphics_Card.GPU_ID = PC_Build.GPU_ID
LEFT JOIN RAM ON RAM.RAM_ID = PC_Build.RAM_ID
LEFT JOIN Storage ON Storage.Storage_ID = PC_Build.Storage_ID
LEFT JOIN Power_Supply ON Power_Supply.PSU_ID = PC_Build.PSU_ID
LEFT JOIN Chassis ON Chassis.Chassis_ID = PC_Build.Chassis_ID
WHERE PC_Build.PC_ID = Build;

RETURN Price;

END$$

DELIMITER ;

