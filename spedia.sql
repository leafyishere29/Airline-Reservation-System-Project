-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2021 at 09:43 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spedia`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`saarthak`@`localhost` PROCEDURE `GetFlightStatistics` (IN `j_date` DATE)  BEGIN
 select flight_no,departure_date,IFNULL(no_of_passengers, 0) as no_of_passengers,total_capacity from (
select f.flight_no,f.departure_date,sum(t.no_of_passengers) as no_of_passengers,j.total_capacity 
from flight_details f left join ticket_details t 
on t.booking_status='CONFIRMED' 
and t.flight_no=f.flight_no 
and f.departure_date=t.journey_date 
inner join jet_details j on j.jet_id=f.jet_id
group by flight_no,journey_date) k where departure_date=j_date;
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` varchar(20) NOT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  `staff_id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `pwd`, `staff_id`, `name`, `email`) VALUES
('saarthak29', '0719', '101', 'Saarthak Jain', 'saarthak0900@gmail.com'),
('samar420', '1234', '103', 'Samar Saini', 'akki123samar@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(20) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `address` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `pwd`, `name`, `email`, `phone_no`, `address`) VALUES
('leafy88', 'ros894hf', 'Raju Gupta', 'rj09084@gmail.com', '9378347613', 'F-85 CP, New Delhi'),
('lm10', 'rosario6', 'Leo Messi', 'lm10rox@gmail.com', '9933256132', 'A-5 Arjun Nagar, New Delhi'),
('riya123', 'riyak2', 'Riya Kapoor', 'riyak12@gmail.com', '9934521132', 'K-7 Ashok Vihar, New Delhi'),
('samari50i', 'saini123', 'Samar Singh', 'samar0980@gmail.com', '9863631132', 'R-1 DLF phase-3, Gurgaon'),
('sanjana322', 'u5h598', 'Sanjana Singhania', 'sjnia060@gmail.com', '9984521123', 'P-7  Golf Course Gurgaon'),
('sanju88', '3434', 'Sanjay Singh', 'sjn@gmail.com', '1234521123', 'K-7 Huda City Gurgaon'),
('shubh@123', 'sjk123', 'Shubham Sharma', 'sharma_shubham22@yahoo.com', '9810067338', 'K-4/55 Rohini West-2'),
('shubhamrox', 'kumar123', 'Shubham Kumar', 'shubhamkumar22@gmail.com', '9884521132', 'L-1 DLF phase-2, Gurgaon'),
('tina66', '9u609g', 'Tina Kapur', 'tina759@gmail.com', '9934133132', 'T-7 Ashok Vihar, New Delhi');

-- --------------------------------------------------------

--
-- Table structure for table `flight_details`
--

CREATE TABLE `flight_details` (
  `flight_no` varchar(10) NOT NULL,
  `from_city` varchar(20) DEFAULT NULL,
  `to_city` varchar(20) DEFAULT NULL,
  `departure_date` date NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `seats_economy` int(5) DEFAULT NULL,
  `seats_business` int(5) DEFAULT NULL,
  `price_economy` int(10) DEFAULT NULL,
  `price_business` int(10) DEFAULT NULL,
  `jet_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight_details`
--

INSERT INTO `flight_details` (`flight_no`, `from_city`, `to_city`, `departure_date`, `arrival_date`, `departure_time`, `arrival_time`, `seats_economy`, `seats_business`, `price_economy`, `price_business`, `jet_id`) VALUES
('AA106', 'Bangalore', 'Hyderabad', '2020-12-01', '2020-12-01', '13:00:00', '18:00:00', 150, 73, 3000, 3750, '10004'),
('AB106', 'Hyderabad', 'Bangalore', '2020-11-01', '2020-11-01', '13:00:00', '18:00:00', 150, 73, 3000, 3750, '10004'),
('AF106', 'New Delhi', 'Bangalore', '2020-12-01', '2020-12-01', '11:00:00', '14:00:00', 100, 50, 4000, 4750, '20448'),
('AL105', 'Bangalore', 'Chennai', '2020-12-01', '2020-12-01', '15:00:00', '22:00:00', 200, 70, 3500, 4750, '16602'),
('AL105', 'Chennai', 'Bangalore', '2020-12-02', '2020-12-02', '13:00:00', '15:00:00', 200, 70, 3500, 4750, '16602'),
('FI690', 'New Delhi', 'Chennai', '2020-12-01', '2020-12-01', '12:00:00', '17:00:00', 100, 55, 4260, 5950, '16093'),
('FL090', 'New Delhi', 'Bangalore', '2020-12-04', '2020-12-04', '12:00:00', '17:00:00', 160, 60, 8060, 10750, '40058'),
('FL156', 'New Delhi', 'Chennai', '2020-12-01', '2020-12-01', '05:00:00', '09:00:00', 200, 47, 4060, 5750, '12271'),
('FL199', 'Hyderabad', 'Bangalore', '2020-12-03', '2020-12-03', '19:00:00', '23:00:00', 150, 75, 4000, 4750, '10004'),
('FN151', 'Chennai', 'Barcelona', '2020-12-02', '2020-12-03', '22:00:00', '05:00:00', 250, 50, 14060, 19750, '12271'),
('FN151', 'Chennai', 'New Delhi', '2020-12-05', '2020-12-05', '12:00:00', '16:00:00', 250, 50, 6060, 9750, '10001'),
('GA106', 'Chennai', 'New Delhi', '2020-12-02', '2020-12-02', '01:00:00', '05:00:00', 160, 60, 4500, 5750, '40058'),
('GG106', 'Hyderabad', 'Barcelona', '2020-12-05', '2020-12-06', '22:00:00', '04:00:00', 150, 50, 24500, 35750, '66301'),
('OF106', 'Bangalore', 'New Delhi', '2020-12-02', '2020-12-02', '11:00:00', '14:00:00', 99, 50, 4000, 4750, '20448'),
('PF156', 'Barcelona', 'New Delhi', '2020-12-06', '2020-12-07', '21:00:00', '03:00:00', 152, 50, 24000, 34750, '66301'),
('RA166', 'Barcelona', 'Bangalore', '2020-12-03', '2020-12-04', '13:00:00', '23:00:00', 100, 53, 13500, 23750, '10003'),
('TL185', 'New Delhi', 'Chennai', '2020-12-04', '2020-12-04', '15:00:00', '20:00:00', 250, 50, 8500, 10750, '10001'),
('TR098', 'New Delhi', 'Hyderabad', '2020-12-08', '2020-09-09', '22:00:00', '01:10:00', 200, 75, 10000, 15000, '10002'),
('WL165', 'Barcelona', 'Bangalore', '2020-12-05', '2020-12-05', '13:00:00', '22:00:00', 250, 50, 16500, 24750, '12271');

-- --------------------------------------------------------

--
-- Table structure for table `frequent_flier_details`
--

CREATE TABLE `frequent_flier_details` (
  `frequent_flier_no` varchar(20) NOT NULL,
  `customer_id` varchar(20) DEFAULT NULL,
  `mileage` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jet_details`
--

CREATE TABLE `jet_details` (
  `jet_id` varchar(10) NOT NULL,
  `jet_type` varchar(20) DEFAULT NULL,
  `total_capacity` int(5) DEFAULT NULL,
  `active` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jet_details`
--

INSERT INTO `jet_details` (`jet_id`, `jet_type`, `total_capacity`, `active`) VALUES
('10001', 'Dreamliner', 300, 'Yes'),
('10002', 'Airbus A380', 275, 'Yes'),
('10003', 'ATR', 150, 'Yes'),
('10004', 'Boeing 737', 225, 'Yes'),
('10093', 'ATR', 150, 'Yes'),
('10301', 'Dreamliner', 200, 'Yes'),
('10402', 'Airbus A380', 300, 'Yes'),
('10462', 'Airbus A380', 300, 'Yes'),
('12271', 'Dreamliner', 300, 'Yes'),
('16093', 'ATR', 155, 'Yes'),
('16602', 'Airbus A380', 270, 'Yes'),
('20058', 'Boeing 737', 200, 'Yes'),
('20158', 'Boeing 737', 200, 'Yes'),
('20448', 'Boeing 737', 250, 'Yes'),
('29158', 'ATR', 175, 'Yes'),
('40058', 'Boeing 737', 220, 'Yes'),
('66301', 'Dreamliner', 200, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `passenger_id` int(10) NOT NULL,
  `pnr` varchar(15) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `meal_choice` varchar(5) DEFAULT NULL,
  `frequent_flier_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`passenger_id`, `pnr`, `name`, `age`, `gender`, `meal_choice`, `frequent_flier_no`) VALUES
(1, '1032321', 'Raju Gupta', 35, 'male', NULL, NULL),
(1, '4738754', 'Shubham Kumar', 20, 'male', NULL, NULL),
(1, '6360418', 'Shubham Sharma', 20, 'male', NULL, NULL),
(1, '7922254', 'Leo Messi', 33, 'male', NULL, NULL),
(1, '9316539', 'Shubham Sharma', 20, 'male', NULL, NULL),
(1, '9418397', 'Shubham Kumar', 20, 'male', NULL, NULL),
(1, '9567448', 'Riya K', 22, 'female', NULL, NULL),
(2, '7922254', 'Aguero', 32, 'male', NULL, NULL),
(2, '9316539', 'Riya Sharma', 22, 'female', NULL, NULL),
(2, '9418397', 'Sankalp ', 21, 'male', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `payment_id` varchar(20) NOT NULL,
  `pnr` varchar(15) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` int(6) DEFAULT NULL,
  `payment_mode` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`payment_id`, `pnr`, `payment_date`, `payment_amount`, `payment_mode`) VALUES
('160679134', '6360418', '2020-11-22', 8060, 'credit card'),
('260131515', '7922254', '2020-11-21', 47500, 'debit card'),
('343758176', '9316539', '2020-11-22', 11500, 'debit card'),
('388847972', '1032321', '2020-11-22', 5750, 'net banking'),
('619922859', '9567448', '2020-11-21', 4000, 'net banking'),
('867040190', '9418397', '2020-11-21', 7500, 'debit card'),
('939755044', '4738754', '2020-11-21', 24000, 'net banking');

--
-- Triggers `payment_details`
--
DELIMITER $$
CREATE TRIGGER `update_ticket_after_payment` AFTER INSERT ON `payment_details` FOR EACH ROW UPDATE ticket_details
     SET booking_status='CONFIRMED', payment_id= NEW.payment_id
   WHERE pnr = NEW.pnr
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_details`
--

CREATE TABLE `ticket_details` (
  `pnr` varchar(15) NOT NULL,
  `date_of_reservation` date DEFAULT NULL,
  `flight_no` varchar(10) DEFAULT NULL,
  `journey_date` date DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `booking_status` varchar(20) DEFAULT NULL,
  `no_of_passengers` int(5) DEFAULT NULL,
  `lounge_access` varchar(5) DEFAULT NULL,
  `priority_checkin` varchar(5) DEFAULT NULL,
  `insurance` varchar(5) DEFAULT NULL,
  `payment_id` varchar(20) DEFAULT NULL,
  `customer_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_details`
--

INSERT INTO `ticket_details` (`pnr`, `date_of_reservation`, `flight_no`, `journey_date`, `class`, `booking_status`, `no_of_passengers`, `lounge_access`, `priority_checkin`, `insurance`, `payment_id`, `customer_id`) VALUES
('1032321', '2020-11-22', 'FL156', '2020-12-01', 'business', 'CONFIRMED', 1, NULL, NULL, NULL, '388847972', 'leafy88'),
('4738754', '2020-11-21', 'PF156', '2020-12-06', 'economy', 'CONFIRMED', 1, NULL, NULL, NULL, '939755044', 'shubhamrox'),
('6360418', '2020-11-22', 'FL090', '2020-12-04', 'economy', 'CANCELED', 1, NULL, NULL, NULL, '160679134', 'shubh@123'),
('7922254', '2020-11-21', 'RA166', '2020-12-03', 'business', 'CONFIRMED', 2, NULL, NULL, NULL, '260131515', 'lm10'),
('9316539', '2020-11-22', 'FL156', '2020-12-01', 'business', 'CONFIRMED', 2, NULL, NULL, NULL, '343758176', 'shubh@123'),
('9418397', '2020-11-21', 'AA106', '2020-12-01', 'business', 'CONFIRMED', 2, NULL, NULL, NULL, '867040190', 'shubhamrox'),
('9567448', '2020-11-21', 'OF106', '2020-12-02', 'economy', 'CONFIRMED', 1, NULL, NULL, NULL, '619922859', 'riya123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `flight_details`
--
ALTER TABLE `flight_details`
  ADD PRIMARY KEY (`flight_no`,`departure_date`),
  ADD KEY `jet_id` (`jet_id`);

--
-- Indexes for table `frequent_flier_details`
--
ALTER TABLE `frequent_flier_details`
  ADD PRIMARY KEY (`frequent_flier_no`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `jet_details`
--
ALTER TABLE `jet_details`
  ADD PRIMARY KEY (`jet_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`passenger_id`,`pnr`),
  ADD KEY `pnr` (`pnr`),
  ADD KEY `frequent_flier_no` (`frequent_flier_no`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `pnr` (`pnr`);

--
-- Indexes for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD PRIMARY KEY (`pnr`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `journey_date` (`journey_date`),
  ADD KEY `flight_no` (`flight_no`),
  ADD KEY `flight_no_2` (`flight_no`,`journey_date`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flight_details`
--
ALTER TABLE `flight_details`
  ADD CONSTRAINT `flight_details_ibfk_1` FOREIGN KEY (`jet_id`) REFERENCES `jet_details` (`jet_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `frequent_flier_details`
--
ALTER TABLE `frequent_flier_details`
  ADD CONSTRAINT `frequent_flier_details_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`pnr`) REFERENCES `ticket_details` (`pnr`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `passengers_ibfk_2` FOREIGN KEY (`frequent_flier_no`) REFERENCES `frequent_flier_details` (`frequent_flier_no`) ON UPDATE CASCADE;

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`pnr`) REFERENCES `ticket_details` (`pnr`) ON UPDATE CASCADE;

--
-- Constraints for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD CONSTRAINT `ticket_details_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_details_ibfk_3` FOREIGN KEY (`flight_no`,`journey_date`) REFERENCES `flight_details` (`flight_no`, `departure_date`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
