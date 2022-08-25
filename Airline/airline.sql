-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 07, 2018 at 11:02 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Airline`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `viewflights` ()  SELECT fi.InstanceId, f.flight_no, fi.DepartureDate, fi.DepartTime, fi.ArriveTime, ta.CityName, fa.CityName FROM flight f JOIN flight_instance fi ON f.flight_no =  fi.Flight_no JOIN airport ta ON f.From_Airport_id = ta.AirportId JOIN airport fa ON f.To_Airport_id = fa.AirportId$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `UserName` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`UserName`, `Password`) VALUES
('admin1@gmail.com', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `AirportId` varchar(50) NOT NULL,
  `CityName` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`AirportId`, `CityName`, `State`) VALUES
('1', 'Dallas', 'Texas'),
('2', 'Los Angeles', 'California'),
('3', 'Chicago', 'Illinois'),
('4', 'New York', 'New York');

-- --------------------------------------------------------

--
-- Table structure for table `available_seats`
--

CREATE TABLE `available_seats` (
  `CategoryId` varchar(10) NOT NULL DEFAULT '',
  `InstanceId` varchar(10) NOT NULL DEFAULT '',
  `Availability` varchar(10) DEFAULT NULL,
  `Total_Seats` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `available_seats`
--

INSERT INTO `available_seats` (`CategoryId`, `InstanceId`, `Availability`, `Total_Seats`) VALUES
('Business', '111', '30', '35'),
('Business', '223', '35', '40'),
('Business E', '777', '9', '10'),
('Economy', '112', '36', '40'),
('Economy', '222', '25', '30'),
('Economy', '224', '39', '40'),
('Economy', '23', '4', '5'),
('Economy', '5', '4', '5'),
('Economy', '666', '49', '50'),
('Economy', '888', '29', '30');

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flight_no` varchar(10) NOT NULL DEFAULT '',
  `SheduledDeparture` time DEFAULT NULL,
  `ScheduledArrival` time DEFAULT NULL,
  `From_Airport_id` varchar(10) DEFAULT NULL,
  `To_Airport_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flight_no`, `SheduledDeparture`, `ScheduledArrival`, `From_Airport_id`, `To_Airport_id`) VALUES
('11', '12:00:00', '14:00:00', '1', '2'),
('13', '00:45:00', '05:45:00', '1', '4'),
('22', '16:00:00', '18:00:00', '2', '1'),
('33', '09:00:00', '12:00:00', '3', '1'),
('34', '02:02:00', '13:03:00', '2', '3'),
('44', '13:00:00', '16:00:00', '3', '4'),
('55', '01:00:00', '07:00:00', '1', '4'),
('66', '12:00:00', '16:00:00', '3', '4'),
('77', '15:00:00', '21:00:00', '4', '3'),
('88', '13:00:00', '17:00:00', '3', '1');

-- --------------------------------------------------------

--
-- Table structure for table `flight_instance`
--

CREATE TABLE `flight_instance` (
  `InstanceId` varchar(10) NOT NULL DEFAULT '',
  `ArriveTime` time DEFAULT NULL,
  `DepartTime` time DEFAULT NULL,
  `ArrivalDate` date DEFAULT NULL,
  `DepartureDate` date DEFAULT NULL,
  `Flight_no` varchar(10) DEFAULT NULL,
  `Status` int(5) NOT NULL DEFAULT '1',
  `Fare` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flight_instance`
--

INSERT INTO `flight_instance` (`InstanceId`, `ArriveTime`, `DepartTime`, `ArrivalDate`, `DepartureDate`, `Flight_no`, `Status`, `Fare`) VALUES
('111', '14:00:00', '12:00:00', '2018-12-09', '2018-12-06', '11', 0, NULL),
('112', '18:00:00', '13:00:00', '2018-12-08', '2018-12-06', '34', 1, NULL),
('222', '18:00:00', '16:00:00', '2018-12-10', '2018-12-09', '22', 0, NULL),
('223', '21:00:00', '23:00:00', '2018-12-08', '2018-12-07', '22', 0, NULL),
('224', '06:00:00', '01:00:00', '2018-12-09', '2018-12-08', '22', 1, NULL),
('23', '13:03:00', '02:02:00', '2018-12-10', '2018-12-09', '34', 1, 2500),
('5', '05:45:00', '00:45:00', '2018-12-11', '2018-12-10', '13', 1, 6000),
('666', '16:00:00', '12:00:00', '2018-12-13', '2018-12-12', '66', 0, 300),
('777', '21:00:00', '15:00:00', '2018-12-14', '2018-12-13', '77', 1, 400),
('888', '17:00:00', '13:00:00', '2018-12-08', '2018-12-07', '88', 1, 700);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `title` varchar(25) NOT NULL,
  `action` varchar(25) NOT NULL,
  `adatetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `title`, `action`, `adatetime`) VALUES
(1, 'santhu@gmail.com', 'usercreated', '2018-11-18 11:54:14'),
(2, 'gunthi56@gmail.com', 'usercreated', '2018-11-19 08:38:27'),
(3, '', 'usercreated', '2018-11-24 15:03:13'),
(4, 'sanath@gmail.com', 'usercreated', '2018-12-05 06:17:08'),
(5, 'sa@gmail.com', 'usercreated', '2018-12-05 18:28:08'),
(6, 'SANAS@gmail.com', 'usercreated', '2018-12-06 10:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `PassengerId` varchar(10) NOT NULL DEFAULT '',
  `Passenger_Name` varchar(20) DEFAULT NULL,
  `Passenger_Age` int(3) DEFAULT NULL,
  `Meal_Preference` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`PassengerId`, `Passenger_Name`, `Passenger_Age`, `Meal_Preference`) VALUES
('452e2', 'sa', 22, 'Vegetarian'),
('4e810', 'abc', 23, 'Vegetarian'),
('51e9b', 'nasa', 24, 'Vegetarian'),
('59678', 'Pass1', 12, 'Vegetarian'),
('5ed32', 'pass', 2, 'Vegetarian'),
('74d2f', 'Abc', 2, 'Vegetarian'),
('760e8', 'Hij', 3, 'NonVegetar'),
('7c95d', 'nasa', 21, 'Vegetarian'),
('a8497', 'A', 1, 'Vegetarian'),
('ab8df', 'Passenger', 10, 'Vegetarian'),
('cde1c', 'san', 23, 'Vegetarian'),
('e3e01', 'vish', 24, 'Vegetarian'),
('e8c5f', 'Passenger', 10, 'Vegetarian'),
('f720c', 'Passenger', 20, 'Vegetarian'),
('fc4f1', 'p1', 2, 'Vegetarian'),
('fd27d', 'Passenger', 10, 'Vegetarian'),
('ff980', 'Pass2', 14, 'Vegetarian');

-- --------------------------------------------------------

--
-- Table structure for table `passenger_reservation`
--

CREATE TABLE `passenger_reservation` (
  `PassengerId` varchar(20) NOT NULL DEFAULT '',
  `ReservationId` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `passenger_reservation`
--

INSERT INTO `passenger_reservation` (`PassengerId`, `ReservationId`) VALUES
('452e2', '86a50'),
('59678', 'c8fc6'),
('5ed32', '7d51c'),
('74d2f', '51415'),
('760e8', '51415'),
('7c95d', '86a50'),
('a8497', '7efef'),
('ab8df', '869eb'),
('e3e01', 'b5116'),
('e8c5f', 'e4156'),
('f720c', '6832a'),
('fc4f1', '86931'),
('fd27d', 'afb94'),
('ff980', 'c8fc6');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentId` varchar(10) NOT NULL,
  `Card_no` varchar(10) NOT NULL,
  `Amount` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentId`, `Card_no`, `Amount`) VALUES
('1', 'xyz123', '200');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `ReservationId` varchar(10) NOT NULL DEFAULT '',
  `Amount` varchar(10) DEFAULT NULL,
  `UserName` varchar(30) DEFAULT NULL,
  `InstanceId` varchar(10) DEFAULT NULL,
  `ReturnInstanceId` int(11) DEFAULT NULL,
  `PaymentId` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`ReservationId`, `Amount`, `UserName`, `InstanceId`, `ReturnInstanceId`, `PaymentId`) VALUES
('362f2', NULL, 'shakti.shivaputra@utdallas.edu', '777', 666, NULL),
('36b27', NULL, 'emma.watson@gmail.com', '224', 0, NULL),
('51415', NULL, 'shakti.shivaputra@utdallas.edu', '111', 224, NULL),
('6832a', NULL, 'shakti.shivaputra@utdallas.edu', '222', 111, NULL),
('7d51c', NULL, 'shakti.shivaputra@utdallas.edu', '222', 0, NULL),
('7efef', NULL, 'shakti.shivaputra@utdallas.edu', '222', 0, NULL),
('86931', NULL, 'shakti.shivaputra@utdallas.edu', '222', 111, NULL),
('869eb', NULL, 'shakti.shivaputra@utdallas.edu', '222', 111, NULL),
('86a50', NULL, 'emma.watson@gmail.com', '224', 0, NULL),
('afb94', NULL, 'shakti.shivaputra@utdallas.edu', '222', 111, NULL),
('b5116', NULL, 'emma.watson@gmail.com', '224', 0, NULL),
('c5fac', NULL, 'shakti.shivaputra@utdallas.edu', '777', 666, NULL),
('c8fc6', NULL, 'shakti.shivaputra@utdallas.edu', '111', 0, NULL),
('e4156', NULL, 'shakti.shivaputra@utdallas.edu', '222', 111, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `Seat_no` varchar(10) NOT NULL,
  `Seat_Category` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`Seat_no`, `Seat_Category`) VALUES
('03f09', 'Economy'),
('0675d', 'Economy'),
('13a6a', 'Economy'),
('13c2f', 'Economy'),
('23f2f', 'Economy'),
('25fa0', 'Economy'),
('30cf8', 'Economy'),
('3e5f7', 'Economy'),
('42f1a', 'Economy'),
('4f7fd', 'Economy'),
('502d3', 'Economy'),
('66a8d', 'Economy'),
('6a2f2', 'Economy'),
('6c6f2', 'Economy'),
('7aed6', 'Economy'),
('7afb3', 'Economy'),
('7c835', 'Economy'),
('80f74', 'Economy'),
('83bad', 'Economy'),
('84fa3', 'Economy'),
('948fe', 'Economy'),
('97ea4', 'Economy'),
('991a2', 'Economy'),
('9e9d9', 'Economy'),
('a3911', 'Economy'),
('a879b', 'Economy'),
('aeab5', 'Economy'),
('b1b2a', 'Economy'),
('b47df', 'Economy'),
('b5908', 'Economy'),
('ba0fa', 'Economy'),
('ca09e', 'Economy'),
('cb047', 'Economy'),
('cf3ca', 'Economy'),
('d3164', 'Economy'),
('d76ad', 'Economy'),
('d90b5', 'Economy'),
('d9ab3', 'Economy'),
('da16b', 'Economy'),
('dab75', 'Economy'),
('dc008', 'Economy'),
('de592', 'Economy'),
('e5016', 'Economy'),
('ef68c', 'Economy'),
('f2c3d', 'Economy'),
('f7387', 'Economy'),
('ffde4', 'Economy');

-- --------------------------------------------------------

--
-- Table structure for table `seats_reservation`
--

CREATE TABLE `seats_reservation` (
  `Seat_no` varchar(10) NOT NULL DEFAULT '',
  `ReservationId` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seats_reservation`
--

INSERT INTO `seats_reservation` (`Seat_no`, `ReservationId`) VALUES
('13c2f', '869eb'),
('23f2f', 'c8fc6'),
('25fa0', '362f2'),
('30cf8', 'c8fc6'),
('42f1a', 'e4156'),
('4f7fd', '86931'),
('66a8d', 'afb94'),
('6a2f2', '51415'),
('7c835', '51415'),
('80f74', '6832a'),
('83bad', 'c5fac'),
('84fa3', '51415'),
('948fe', '7efef'),
('97ea4', 'c5fac'),
('a879b', '51415'),
('aeab5', '86a50'),
('b1b2a', '7efef'),
('b47df', '362f2'),
('ba0fa', '51415'),
('ca09e', '6832a'),
('cb047', '7d51c'),
('cf3ca', 'e4156'),
('d3164', '869eb'),
('d76ad', '86931'),
('d90b5', '7d51c'),
('d9ab3', 'b5116'),
('da16b', 'c8fc6'),
('dab75', '86a50'),
('dc008', '86a50'),
('de592', '36b27'),
('f2c3d', 'afb94'),
('f7387', '51415'),
('ffde4', 'b5116');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserName` varchar(50) NOT NULL,
  `FirstName` varchar(10) NOT NULL,
  `LastName` varchar(10) NOT NULL,
  `Street_no` varchar(10) NOT NULL,
  `City` varchar(10) NOT NULL,
  `State` varchar(20) NOT NULL,
  `ZipCode` int(10) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserName`, `FirstName`, `LastName`, `Street_no`, `City`, `State`, `ZipCode`, `Password`, `Dob`) VALUES
('', '', '', '', '', '', 0, '', '0000-00-00'),
('emma.watson@gmail.com', 'Emma', 'Watson', '', '', '', 0, 'user1', '2016-11-04'),
('gunthi56@gmail.com', 'gun', 'thi', '', '', '', 0, 'gun', '1998-05-06'),
('sa@gmail.com', 'sa', 'kas', '', '', '', 0, 'das', '2018-12-04'),
('SANAS@gmail.com', 'sa', 'kas', '', '', '', 0, 'sa', '2018-12-07'),
('sanath@gmail.com', 'Sanath', 'kashyap', '', '', '', 0, '123456', '2001-06-06'),
('sanathkashyap@gmail.com', 'Sanath', 'Kashy', '', '', '', 0, 'goku', '0000-00-00'),
('santhu@gmail.com', 'santosh', 'ks', '', '', '', 0, 'santhu', '2018-01-02'),
('shakti.shivaputra@utdallas.edu', 'Shakti', 'Shivaputra', '', '', '', 0, 'abc123', '0000-00-00'),
('tesla@gmail.com', 'Tesla', 'P', '', '', '', 0, 'bce123', '0000-00-00'),
('tsp@goku.com', 't s ', 'Prajwal', '', '', '', 0, 'gohan', '1996-11-07');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `usercreated` AFTER INSERT ON `user` FOR EACH ROW INSERT INTO log VALUES(null,NEW.UserName,'usercreated',NOW())
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`UserName`);

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`AirportId`);

--
-- Indexes for table `available_seats`
--
ALTER TABLE `available_seats`
  ADD PRIMARY KEY (`CategoryId`,`InstanceId`),
  ADD KEY `InstanceId` (`InstanceId`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flight_no`),
  ADD KEY `From_Airport_id` (`From_Airport_id`),
  ADD KEY `To_Airport_id` (`To_Airport_id`);

--
-- Indexes for table `flight_instance`
--
ALTER TABLE `flight_instance`
  ADD PRIMARY KEY (`InstanceId`),
  ADD KEY `Flight_no` (`Flight_no`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`PassengerId`);

--
-- Indexes for table `passenger_reservation`
--
ALTER TABLE `passenger_reservation`
  ADD PRIMARY KEY (`PassengerId`,`ReservationId`),
  ADD KEY `ReservationId` (`ReservationId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentId`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ReservationId`),
  ADD KEY `UserName` (`UserName`),
  ADD KEY `InstanceId` (`InstanceId`),
  ADD KEY `PaymentId` (`PaymentId`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`Seat_no`);

--
-- Indexes for table `seats_reservation`
--
ALTER TABLE `seats_reservation`
  ADD PRIMARY KEY (`Seat_no`,`ReservationId`),
  ADD KEY `ReservationId` (`ReservationId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `available_seats`
--
ALTER TABLE `available_seats`
  ADD CONSTRAINT `available_seats_ibfk_1` FOREIGN KEY (`InstanceId`) REFERENCES `flight_instance` (`InstanceId`) ON UPDATE CASCADE;

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`From_Airport_id`) REFERENCES `airport` (`AirportId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`To_Airport_id`) REFERENCES `airport` (`AirportId`) ON UPDATE CASCADE;

--
-- Constraints for table `flight_instance`
--
ALTER TABLE `flight_instance`
  ADD CONSTRAINT `flight_instance_ibfk_1` FOREIGN KEY (`Flight_no`) REFERENCES `flight` (`flight_no`) ON UPDATE CASCADE;

--
-- Constraints for table `passenger_reservation`
--
ALTER TABLE `passenger_reservation`
  ADD CONSTRAINT `passenger_reservation_ibfk_1` FOREIGN KEY (`PassengerId`) REFERENCES `passenger` (`PassengerId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `passenger_reservation_ibfk_2` FOREIGN KEY (`ReservationId`) REFERENCES `reservation` (`ReservationId`) ON UPDATE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`UserName`) REFERENCES `user` (`UserName`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`InstanceId`) REFERENCES `flight_instance` (`InstanceId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`PaymentId`) REFERENCES `payment` (`PaymentId`) ON UPDATE CASCADE;

--
-- Constraints for table `seats_reservation`
--
ALTER TABLE `seats_reservation`
  ADD CONSTRAINT `seats_reservation_ibfk_1` FOREIGN KEY (`ReservationId`) REFERENCES `reservation` (`ReservationId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `seats_reservation_ibfk_2` FOREIGN KEY (`Seat_no`) REFERENCES `seats` (`Seat_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
