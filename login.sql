-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2020 at 04:18 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `login`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE `adminlogin` (
  `admin_user_name` varchar(30) NOT NULL,
  `admin_password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`admin_user_name`, `admin_password`) VALUES
('shruti', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `flight_detail`
--

CREATE TABLE `flight_detail` (
  `flight_id` varchar(30) NOT NULL,
  `origin` varchar(30) NOT NULL,
  `destination` varchar(30) NOT NULL,
  `flight_date` date NOT NULL,
  `flight_time` time NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight_detail`
--

INSERT INTO `flight_detail` (`flight_id`, `origin`, `destination`, `flight_date`, `flight_time`, `price`) VALUES
('I123', 'Patna', 'Hyderabad', '2020-12-12', '10:30:00', 5999),
('SG586', 'Hyderabad', 'Patna', '2020-12-02', '15:20:00', 4385),
('SG587', 'Patna', 'Hyderabad', '2020-12-12', '14:05:00', 3200);

-- --------------------------------------------------------

--
-- Table structure for table `flight_info`
--

CREATE TABLE `flight_info` (
  `flight_name` varchar(30) NOT NULL,
  `flight_id` varchar(30) NOT NULL,
  `origin` varchar(30) NOT NULL,
  `destination` varchar(30) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_date` date NOT NULL,
  `arrival_time` time NOT NULL,
  `number_of_stop` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight_info`
--

INSERT INTO `flight_info` (`flight_name`, `flight_id`, `origin`, `destination`, `departure_date`, `departure_time`, `arrival_date`, `arrival_time`, `number_of_stop`, `price`) VALUES
('Goair', 'go112', 'Delhi', 'Mumbai', '2021-01-26', '20:00:00', '2021-01-26', '22:30:00', 1, 4500),
('Goair', 'go113', 'Delhi', 'Mumbai', '2021-01-26', '09:30:00', '2021-01-26', '12:00:00', 0, 6700),
('Indigo', 'In111', 'Patna', 'Hyderabad', '2020-12-12', '10:00:00', '2020-12-12', '11:45:00', 0, 4500),
('Indigo', 'In112', 'Bengaluru', 'Delhi', '2021-01-01', '14:00:00', '2021-01-01', '16:00:00', 1, 3500),
('Spicejet', 'sj111', 'Delhi', 'Mumbai', '2021-01-26', '14:30:00', '2021-01-26', '17:00:00', 0, 9500);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`username`, `password`, `first_name`, `last_name`, `email`, `phone`) VALUES
('shruti', '1234', 'shruti', 'priya', 's@gmail.com', 7661802094);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminlogin`
--
ALTER TABLE `adminlogin`
  ADD PRIMARY KEY (`admin_user_name`);

--
-- Indexes for table `flight_detail`
--
ALTER TABLE `flight_detail`
  ADD PRIMARY KEY (`flight_id`);

--
-- Indexes for table `flight_info`
--
ALTER TABLE `flight_info`
  ADD PRIMARY KEY (`flight_id`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
