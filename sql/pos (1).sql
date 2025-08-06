-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2025 at 04:04 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_ID` varchar(50) NOT NULL,
  `Category_Name` varchar(50) DEFAULT NULL,
  `Product_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_ID` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone_number` int(20) DEFAULT NULL,
  `Duureg` varchar(50) DEFAULT NULL,
  `horoo` varchar(50) DEFAULT NULL,
  `hayg` varchar(50) DEFAULT NULL,
  `other_info` varchar(50) DEFAULT NULL,
  `payment_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `Belen` varchar(50) DEFAULT NULL,
  `Dansaar` varchar(50) DEFAULT NULL,
  `Kart` varchar(50) DEFAULT NULL,
  `Total_price` int(11) DEFAULT NULL,
  `delivery_total_price` int(11) DEFAULT NULL,
  `uldegdel` int(11) DEFAULT NULL,
  `hariult` int(11) DEFAULT NULL,
  `Qpay` varchar(50) DEFAULT NULL,
  `Sales_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_add`
--

CREATE TABLE `product_add` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `Barcode` varchar(30) NOT NULL,
  `Price` int(50) NOT NULL,
  `Price_received` int(50) NOT NULL,
  `profit_margin` int(30) NOT NULL,
  `Category` varchar(100) NOT NULL,
  `Measure` varchar(100) NOT NULL,
  `Begin_invertory` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `Sales_ID` int(11) NOT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `Product_name` varchar(100) DEFAULT NULL,
  `Product_Number` varchar(100) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Percent` varchar(50) DEFAULT NULL,
  `Sale` varchar(100) DEFAULT NULL,
  `Total_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tur_hadgalah`
--

CREATE TABLE `tur_hadgalah` (
  `temp_ID` int(11) NOT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_ID`),
  ADD KEY `fk_payment` (`payment_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Sales_ID` (`Sales_ID`);

--
-- Indexes for table `product_add`
--
ALTER TABLE `product_add`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`Sales_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `tur_hadgalah`
--
ALTER TABLE `tur_hadgalah`
  ADD PRIMARY KEY (`temp_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `Sales_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tur_hadgalah`
--
ALTER TABLE `tur_hadgalah`
  MODIFY `temp_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product_add` (`product_id`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `fk_payment` FOREIGN KEY (`payment_ID`) REFERENCES `payment` (`Payment_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Sales_ID`) REFERENCES `sales` (`Sales_ID`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product_add` (`product_id`);

--
-- Constraints for table `tur_hadgalah`
--
ALTER TABLE `tur_hadgalah`
  ADD CONSTRAINT `tur_hadgalah_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product_add` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
