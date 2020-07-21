-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2020 at 12:10 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payroll_system`
--
CREATE DATABASE IF NOT EXISTS `payroll_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `payroll_system`;

-- --------------------------------------------------------

--
-- Table structure for table `employee_attendance`
--

CREATE TABLE `employee_attendance` (
  `attendance_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `is_leave` enum('yes','no') NOT NULL,
  `present_status` enum('yes','no') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_attendance`
--

INSERT INTO `employee_attendance` (`attendance_id`, `employee_id`, `attendance_date`, `is_leave`, `present_status`) VALUES
(37, 1, '2020-03-10', 'no', 'yes'),
(38, 2, '2020-03-10', 'yes', 'no'),
(39, 3, '2020-03-10', 'no', 'yes'),
(40, 4, '2020-03-10', 'no', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `employee_category`
--

CREATE TABLE `employee_category` (
  `category_id` varchar(20) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `basic_salary` float NOT NULL,
  `leave_per_month` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_category`
--

INSERT INTO `employee_category` (`category_id`, `category_name`, `basic_salary`, `leave_per_month`) VALUES
('CL', 'Clerk', 24000, 3),
('JD', 'Junior Developer', 21000, 2),
('SD', 'Senior Developer', 35000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `employee_info`
--

CREATE TABLE `employee_info` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `father_name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `pan_no` varchar(20) NOT NULL,
  `aadhar_no` varchar(20) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `category_id` varchar(20) NOT NULL,
  `date_of_joining` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_info`
--

INSERT INTO `employee_info` (`employee_id`, `employee_name`, `father_name`, `date_of_birth`, `pan_no`, `aadhar_no`, `address`, `category_id`, `date_of_joining`) VALUES
(1, 'Rajesh Sharma', 'Mr Amit Sharma', '1998-03-26', 'ABCDE789J', '180019872001', 'Model Town Nawanshar, Punjab', 'JD', '2019-03-26'),
(2, 'Matli Mittal', 'Mr Sarvesh Mittal', '1998-02-26', 'MACDE789J', '180019872002', 'Model Town Ambala', 'SD', '2019-01-24'),
(3, 'Rashi Bansal', 'Mr. Rajiv Bansal', '1999-12-27', 'ABCFG987P', '180019990909', 'Ram Nagar Nangal', 'JD', '2017-03-23'),
(4, 'Avnika Mehra', 'Mr. Aman Mehra', '1998-12-27', 'ABCFG987A', '180019990911', 'Ram Nagar Ludhiana', 'SD', '2018-03-23');

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary`
--

CREATE TABLE `employee_salary` (
  `salary_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `salary_month` varchar(50) NOT NULL,
  `salary_year` int(11) NOT NULL,
  `gross_salary` float NOT NULL,
  `salary_date` datetime NOT NULL,
  `basic_salary` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_salary`
--

INSERT INTO `employee_salary` (`salary_id`, `employee_id`, `salary_month`, `salary_year`, `gross_salary`, `salary_date`, `basic_salary`) VALUES
(2, 1, 'March', 2020, 6834.54, '2020-03-29 23:14:25', 21000);

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary_details`
--

CREATE TABLE `employee_salary_details` (
  `salary_details_id` int(11) NOT NULL,
  `salary_id` int(11) NOT NULL,
  `wage_id` int(11) NOT NULL,
  `wage_amount` float NOT NULL,
  `wage_percentage` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_salary_details`
--

INSERT INTO `employee_salary_details` (`salary_details_id`, `salary_id`, `wage_id`, `wage_amount`, `wage_percentage`) VALUES
(7, 2, 1, -2520, 12),
(8, 2, 2, 5250, 25),
(9, 2, 3, 2100, 10),
(10, 2, 4, 6300, 30),
(11, 2, 5, -2100, 10),
(12, 2, 6, -3150, 15);

-- --------------------------------------------------------

--
-- Table structure for table `login_info`
--

CREATE TABLE `login_info` (
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_info`
--

INSERT INTO `login_info` (`user_name`, `password`, `email_id`, `role_name`, `last_login`) VALUES
('admin', 'Admin#123', 'admin@payroll.com', 'Admin', NULL),
('hr', 'HR#123', 'hr@payroll.com', 'HR', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `salary_wages`
--

CREATE TABLE `salary_wages` (
  `wage_id` int(11) NOT NULL,
  `wage_name` varchar(100) NOT NULL,
  `wage_percentage` float NOT NULL,
  `wage_type` enum('additions','deductions') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salary_wages`
--

INSERT INTO `salary_wages` (`wage_id`, `wage_name`, `wage_percentage`, `wage_type`) VALUES
(1, 'Provident Fund', 12, 'deductions'),
(2, 'Dearness Allowance', 25, 'additions'),
(3, 'Travelling Allowance', 10, 'additions'),
(4, 'House Rent Allowance', 30, 'additions'),
(5, 'Income Tax', 10, 'deductions'),
(6, 'Medical Insurance', 15, 'deductions');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee_attendance`
--
ALTER TABLE `employee_attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee_category`
--
ALTER TABLE `employee_category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `unq_category_name` (`category_name`);

--
-- Indexes for table `employee_info`
--
ALTER TABLE `employee_info`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `pan_no` (`pan_no`),
  ADD UNIQUE KEY `aadhar_no` (`aadhar_no`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `employee_salary`
--
ALTER TABLE `employee_salary`
  ADD PRIMARY KEY (`salary_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee_salary_details`
--
ALTER TABLE `employee_salary_details`
  ADD PRIMARY KEY (`salary_details_id`),
  ADD KEY `salary_id` (`salary_id`),
  ADD KEY `wage_id` (`wage_id`);

--
-- Indexes for table `login_info`
--
ALTER TABLE `login_info`
  ADD PRIMARY KEY (`user_name`),
  ADD UNIQUE KEY `unq_login_info_email_id` (`email_id`);

--
-- Indexes for table `salary_wages`
--
ALTER TABLE `salary_wages`
  ADD PRIMARY KEY (`wage_id`),
  ADD UNIQUE KEY `wage_name` (`wage_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee_attendance`
--
ALTER TABLE `employee_attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `employee_info`
--
ALTER TABLE `employee_info`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_salary`
--
ALTER TABLE `employee_salary`
  MODIFY `salary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee_salary_details`
--
ALTER TABLE `employee_salary_details`
  MODIFY `salary_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `salary_wages`
--
ALTER TABLE `salary_wages`
  MODIFY `wage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_attendance`
--
ALTER TABLE `employee_attendance`
  ADD CONSTRAINT `employee_attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee_info` (`employee_id`);

--
-- Constraints for table `employee_info`
--
ALTER TABLE `employee_info`
  ADD CONSTRAINT `employee_info_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `employee_category` (`category_id`);

--
-- Constraints for table `employee_salary`
--
ALTER TABLE `employee_salary`
  ADD CONSTRAINT `employee_salary_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee_info` (`employee_id`);

--
-- Constraints for table `employee_salary_details`
--
ALTER TABLE `employee_salary_details`
  ADD CONSTRAINT `employee_salary_details_ibfk_1` FOREIGN KEY (`salary_id`) REFERENCES `employee_salary` (`salary_id`),
  ADD CONSTRAINT `employee_salary_details_ibfk_2` FOREIGN KEY (`wage_id`) REFERENCES `salary_wages` (`wage_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
