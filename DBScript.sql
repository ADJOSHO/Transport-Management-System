-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 07, 2014 at 02:48 PM
-- Server version: 5.5.28
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `transportdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `buscharter`
--

CREATE TABLE IF NOT EXISTS `buscharter` (
  `CharterID` int(5) NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(45) NOT NULL,
  `CustomerPhoneNo` varchar(20) NOT NULL,
  `Destionation` varchar(45) NOT NULL,
  `TravelDate` date NOT NULL,
  `Duration` int(4) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Paid` decimal(10,2) NOT NULL,
  `DatePaid` date NOT NULL,
  `Balance` decimal(10,2) DEFAULT NULL,
  `ReceiptNo` varchar(15) NOT NULL,
  `DateBalanced` date DEFAULT NULL,
  `DriverName` varchar(45) DEFAULT NULL,
  `HandledBy` varchar(45) NOT NULL,
  `Description` varchar(60) NOT NULL,
  PRIMARY KEY (`CharterID`),
  KEY `userNFK_idx` (`HandledBy`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `buscharter`
--

INSERT INTO `buscharter` (`CharterID`, `CustomerName`, `CustomerPhoneNo`, `Destionation`, `TravelDate`, `Duration`, `Amount`, `Paid`, `DatePaid`, `Balance`, `ReceiptNo`, `DateBalanced`, `DriverName`, `HandledBy`, `Description`) VALUES
(1, 'Idris Oleku', '0242357345', 'Kumasi', '2013-12-23', 3, '750.00', '700.00', '2013-10-24', '50.00', 'A4963h', '2013-10-28', 'David Kofi', 'manager', 'to the Gabani Inn in Kumasi with family'),
(2, 'djfjoi', '29847', 'mlkjlj', '2013-11-20', 1, '500.00', '400.00', '2013-11-20', '100.00', ',dfkjhlrek', NULL, 'lkjlj', 'manager', 'df,vjlfvju;roeiugj;roei');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `EmpID` int(4) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `HireDate` date NOT NULL,
  `Designation` varchar(30) NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `PhoneNo` varchar(20) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT 'working',
  `End_Date` date DEFAULT NULL,
  `Short_Note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`EmpID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1004 ;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmpID`, `FirstName`, `LastName`, `HireDate`, `Designation`, `Salary`, `DateOfBirth`, `PhoneNo`, `Address`, `Email`, `Status`, `End_Date`, `Short_Note`) VALUES
(1001, 'Angela Dina', 'Peter', '2011-08-23', 'Manager', '4000.00', '1986-05-20', '_+233542734789', '12 kokomlemle ring road accra', 'adjosho@rocketmail.com', 'working', NULL, NULL),
(1002, 'James', 'Ibori', '2010-05-19', 'Clerk', '700.00', '1990-10-24', '+233542734789', '20B Kokomlmle Ring Road Accra Ghana', 'adjosho@rocketmail.com', 'working', NULL, NULL),
(1003, 'Nabila', 'Affara', '2013-11-04', 'front desk officer', '900.00', '2005-11-07', '0903944895', 'nsdlkjjlkjdjk', 'smdjh@,kdsjfl.com', 'RESIGN', '2013-11-23', 'do not like the work conditions');

-- --------------------------------------------------------

--
-- Table structure for table `expenditure`
--

CREATE TABLE IF NOT EXISTS `expenditure` (
  `ExpenseID` int(6) NOT NULL AUTO_INCREMENT,
  `ReceiptNo` varchar(20) NOT NULL,
  `Item` varchar(40) NOT NULL,
  `ExpenseDate` date NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Description` varchar(60) NOT NULL,
  `HandledBy` varchar(45) NOT NULL,
  PRIMARY KEY (`ExpenseID`),
  UNIQUE KEY `ReceiptNo_UNIQUE` (`ReceiptNo`),
  KEY `EmpHanlerFK_idx` (`HandledBy`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=123102 ;

--
-- Dumping data for table `expenditure`
--

INSERT INTO `expenditure` (`ExpenseID`, `ReceiptNo`, `Item`, `ExpenseDate`, `Amount`, `Description`, `HandledBy`) VALUES
(123100, '193472', 'cables', '2013-09-24', '25.00', 'cable to connect printer to system', 'manager'),
(123101, 'AD10878', 'A4 Paper', '2013-11-01', '8.50', 'Paper for the small printing machine', 'MANAGER');

-- --------------------------------------------------------

--
-- Table structure for table `fares`
--

CREATE TABLE IF NOT EXISTS `fares` (
  `FareID` int(5) NOT NULL AUTO_INCREMENT,
  `RouteName` varchar(20) NOT NULL,
  `TicketType` varchar(30) NOT NULL,
  `FareCharged` decimal(10,2) NOT NULL,
  PRIMARY KEY (`FareID`),
  KEY `routeFK_idx` (`RouteName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40006 ;

--
-- Dumping data for table `fares`
--

INSERT INTO `fares` (`FareID`, `RouteName`, `TicketType`, `FareCharged`) VALUES
(40001, 'Acc-Los', 'one way with passport', '92.00'),
(40005, 'Acc-Lom', 'Return', '123.00');

-- --------------------------------------------------------

--
-- Table structure for table `parcelcollection`
--

CREATE TABLE IF NOT EXISTS `parcelcollection` (
  `CollectionID` int(4) NOT NULL AUTO_INCREMENT,
  `AirwayRefNo` varchar(15) NOT NULL,
  `ReceiverName` varchar(45) NOT NULL,
  `PhoneNo` varchar(20) NOT NULL,
  `EmpID` int(4) NOT NULL,
  `CollectionDate` date NOT NULL,
  PRIMARY KEY (`CollectionID`),
  KEY `airwayFK_idx` (`AirwayRefNo`),
  KEY `empNoFK_idx` (`EmpID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7002 ;

--
-- Dumping data for table `parcelcollection`
--

INSERT INTO `parcelcollection` (`CollectionID`, `AirwayRefNo`, `ReceiverName`, `PhoneNo`, `EmpID`, `CollectionDate`) VALUES
(7001, '777732', 'Gloria Mikel', '+233547823209', 1001, '2013-09-25');

-- --------------------------------------------------------

--
-- Table structure for table `parcelsend`
--

CREATE TABLE IF NOT EXISTS `parcelsend` (
  `ParcelID` int(4) NOT NULL AUTO_INCREMENT,
  `AirwayRefNo` varchar(15) NOT NULL,
  `SenderPhoneNo` varchar(20) DEFAULT NULL,
  `ReceiverPhoneNo` varchar(20) DEFAULT NULL,
  `EmpID` int(4) NOT NULL,
  `SendDate` date NOT NULL,
  `ValueDeclared` decimal(10,2) DEFAULT NULL,
  `Charges` decimal(10,2) NOT NULL,
  `ReceptionVenue` varchar(45) DEFAULT NULL,
  `DeliveryInstruction` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ParcelID`),
  KEY `refFK_idx` (`AirwayRefNo`),
  KEY `empsendfk_idx` (`EmpID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5002 ;

--
-- Dumping data for table `parcelsend`
--

INSERT INTO `parcelsend` (`ParcelID`, `AirwayRefNo`, `SenderPhoneNo`, `ReceiverPhoneNo`, `EmpID`, `SendDate`, `ValueDeclared`, `Charges`, `ReceptionVenue`, `DeliveryInstruction`) VALUES
(5001, '777732', '+23320692872', '+2347045893846', 1001, '2013-09-25', '500.00', '75.00', 'Lagos Office', '');

-- --------------------------------------------------------

--
-- Table structure for table `parcelstock`
--

CREATE TABLE IF NOT EXISTS `parcelstock` (
  `ParcelID` int(6) NOT NULL AUTO_INCREMENT,
  `AirwayRefNo` varchar(15) NOT NULL,
  `Content` varchar(60) NOT NULL,
  `Pieces` int(4) DEFAULT NULL,
  `Weight(kg)` int(4) DEFAULT NULL,
  `SenderName` varchar(45) NOT NULL,
  `SpecifiedReceiver` varchar(45) NOT NULL,
  `Origin` varchar(30) NOT NULL,
  `Destination` varchar(30) NOT NULL,
  `Status` varchar(10) NOT NULL,
  PRIMARY KEY (`AirwayRefNo`),
  UNIQUE KEY `ParcelID_UNIQUE` (`ParcelID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61004 ;

--
-- Dumping data for table `parcelstock`
--

INSERT INTO `parcelstock` (`ParcelID`, `AirwayRefNo`, `Content`, `Pieces`, `Weight(kg)`, `SenderName`, `SpecifiedReceiver`, `Origin`, `Destination`, `Status`) VALUES
(61001, '23873611', 'Rice', 2, 50, 'Blessing Infenna', 'Gitfy Obasi', 'Enugu', 'Accra', 'in'),
(61002, '672390', 'Hp laptop', 1, 12, 'Peter Obina', 'Nnekena Maduka', 'Warri', 'Accra', 'in'),
(61003, '777732', 'LG Television', 1, 15, 'Grace Mattews', 'Maxwell Keleshe', 'Owerri', 'Kumasi', 'out');

-- --------------------------------------------------------

--
-- Table structure for table `parcelvehicle`
--

CREATE TABLE IF NOT EXISTS `parcelvehicle` (
  `pVehicleID` int(6) NOT NULL AUTO_INCREMENT,
  `ManifestNo` varchar(11) NOT NULL,
  `AirwayRefNo` varchar(15) NOT NULL,
  `EmpID` int(4) DEFAULT NULL,
  `DateHandled` date NOT NULL,
  `IssuedBy` varchar(45) DEFAULT NULL,
  `Desk` varchar(45) DEFAULT NULL,
  `Status` varchar(10) NOT NULL,
  PRIMARY KEY (`pVehicleID`),
  UNIQUE KEY `AirwayRefNo_UNIQUE` (`AirwayRefNo`),
  KEY `airrefFK_idx` (`AirwayRefNo`),
  KEY `EmpVehicle_idx` (`EmpID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101003 ;

--
-- Dumping data for table `parcelvehicle`
--

INSERT INTO `parcelvehicle` (`pVehicleID`, `ManifestNo`, `AirwayRefNo`, `EmpID`, `DateHandled`, `IssuedBy`, `Desk`, `Status`) VALUES
(101001, '102846', '672390', 1001, '2013-09-23', 'Adjosho Peter', '', 'incoming'),
(101002, '102847', '777732', 1001, '2013-09-23', 'Adjosho Peter', NULL, 'incoming');

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE IF NOT EXISTS `passengers` (
  `PassengerID` int(4) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Gender` varchar(7) NOT NULL,
  `Nationality` varchar(45) NOT NULL,
  `PassportNo` varchar(20) DEFAULT NULL,
  `Occupation` varchar(30) DEFAULT NULL,
  `PhoneNo` varchar(20) DEFAULT NULL,
  `NextKinName` varchar(45) NOT NULL,
  `NextKinPhoneNo` varchar(20) NOT NULL,
  PRIMARY KEY (`PassengerID`),
  UNIQUE KEY `PassportNo_UNIQUE` (`PassportNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9000010 ;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`PassengerID`, `FirstName`, `LastName`, `Gender`, `Nationality`, `PassportNo`, `Occupation`, `PhoneNo`, `NextKinName`, `NextKinPhoneNo`) VALUES
(9000001, 'Princess', 'Wangobodo', 'female', 'Congolese', '0192AX15', 'Lecturer', '0542734781', 'Denise Olise', '0243456092'),
(9000002, 'Phillip', 'Ojukwu', 'male', 'Nigerian', 'GT94827B', 'Student', '0542733698', 'James Nnvene', '+2348039272726'),
(9000003, 'Gifty', 'Obasi', 'female', 'Nigerian', '23Q938AD', 'Student', '024593857', 'Oguna Obasi', '+2348057384739'),
(9000004, ' Maxiga', 'Adoga', 'MALE', 'Nigerian', 'A496701C', 'Trader', '+234802384701', 'Oguna', 'Aguba'),
(9000006, ' Adama', 'Obina', 'female', 'Nigerian', '3459PADC', 'Accounttant', '', 'Oguna', 'Aguba'),
(9000009, ' James', ' Thomas', 'male', 'South African', '398098409', 'Student', '0542734789', 'Billy Brown', '02347827938');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `PaymentID` int(10) NOT NULL AUTO_INCREMENT,
  `TicketNumber` varchar(11) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `PaymentDate` date NOT NULL,
  `PaymentMode` varchar(10) NOT NULL,
  `HandledBy` varchar(45) DEFAULT NULL,
  `Remark` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  UNIQUE KEY `TicketNumber_UNIQUE` (`TicketNumber`),
  KEY `ticketFK_idx` (`TicketNumber`),
  KEY `thisFK_idx` (`TicketNumber`),
  KEY `userNameFK_idx` (`HandledBy`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70004 ;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `TicketNumber`, `Amount`, `PaymentDate`, `PaymentMode`, `HandledBy`, `Remark`) VALUES
(70002, '1234KPJ', '92.00', '2013-10-24', 'Cash', 'manager', NULL),
(70003, 'fthtr234', '92.00', '2013-11-23', 'Cash', 'manager', 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE IF NOT EXISTS `route` (
  `RouteID` int(4) NOT NULL AUTO_INCREMENT,
  `RouteName` varchar(20) NOT NULL,
  `Depot` varchar(20) NOT NULL,
  `Destination` varchar(20) NOT NULL,
  `RouteType` varchar(30) NOT NULL,
  PRIMARY KEY (`RouteName`),
  UNIQUE KEY `RouteID_UNIQUE` (`RouteID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2006 ;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`RouteID`, `RouteName`, `Depot`, `Destination`, `RouteType`) VALUES
(2005, 'Acc-Da', 'Accra', 'Darka', 'Accra-Senegal'),
(2004, 'Acc-Lom', 'Ring Road', 'Mapaye', 'Accra-Lagos'),
(2001, 'Acc-Los', 'Ring Road Accra', 'Yaba Lagos', 'accra-lagos'),
(2002, 'lag-acc', 'ring road accra', 'mazamaza lagos', 'lagos-accra');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE IF NOT EXISTS `schedules` (
  `ScheduleID` int(6) NOT NULL AUTO_INCREMENT,
  `VehicleCapacity` int(4) NOT NULL,
  `RouteType` varchar(30) NOT NULL,
  `DepartureDate` date NOT NULL,
  `DepartureTime` time NOT NULL,
  `Status` varchar(5) NOT NULL DEFAULT 'in',
  PRIMARY KEY (`ScheduleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=600009 ;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`ScheduleID`, `VehicleCapacity`, `RouteType`, `DepartureDate`, `DepartureTime`, `Status`) VALUES
(600004, 24, 'lagos-accra', '2013-10-10', '07:30:00', 'out'),
(600005, 48, 'accra-lagos', '2013-10-24', '07:30:00', 'in'),
(600006, 52, 'accra-lagos', '2013-10-24', '08:30:00', 'in'),
(600007, 24, 'lagos-accra', '2013-10-31', '08:30:00', 'in'),
(600008, 90, 'Accra-Lagos', '2013-11-30', '07:30:00', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `ticketbooking`
--

CREATE TABLE IF NOT EXISTS `ticketbooking` (
  `BookingID` int(12) NOT NULL AUTO_INCREMENT,
  `TicketNumber` varchar(11) NOT NULL,
  `PassengerID` int(4) NOT NULL,
  `RouteName` varchar(20) NOT NULL,
  `SeatNo` int(4) NOT NULL,
  `IssueDate` date NOT NULL,
  `TicketType` varchar(30) NOT NULL,
  `ScheduleID` int(6) NOT NULL,
  `HandledBy` varchar(45) DEFAULT NULL,
  `Status` varchar(10) NOT NULL,
  `FareCharged` decimal(10,2) NOT NULL DEFAULT '92.00',
  PRIMARY KEY (`TicketNumber`),
  UNIQUE KEY `Booking ID_UNIQUE` (`BookingID`),
  KEY `routeFK_idx` (`RouteName`),
  KEY `passengerFK_idx` (`PassengerID`),
  KEY `schFK_idx` (`ScheduleID`),
  KEY `userFK_idx` (`HandledBy`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `ticketbooking`
--

INSERT INTO `ticketbooking` (`BookingID`, `TicketNumber`, `PassengerID`, `RouteName`, `SeatNo`, `IssueDate`, `TicketType`, `ScheduleID`, `HandledBy`, `Status`, `FareCharged`) VALUES
(18, '1234KPJ', 9000001, 'Acc-Los', 7, '2013-10-24', 'one way with passport', 600005, 'manager', 'booked', '92.00'),
(5, '19277DG', 9000002, 'Acc-Los', 4, '2013-10-24', 'return', 600004, 'manager', 'reserved', '150.00'),
(20, 'fgrtdf', 9000001, 'Acc-Los', 12, '2013-10-24', 'return', 600006, 'manager', 'reserved', '150.00'),
(21, 'fthtr234', 9000001, 'Acc-Los', 2, '2013-10-29', 'one way with passport', 600005, 'manager', 'booked', '92.00');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE IF NOT EXISTS `trips` (
  `TripID` int(4) NOT NULL AUTO_INCREMENT,
  `ScheduleID` int(4) NOT NULL,
  `VehicleID` int(4) NOT NULL,
  `ManifestNo` varchar(20) NOT NULL,
  `DriverName` varchar(45) NOT NULL,
  PRIMARY KEY (`ManifestNo`),
  UNIQUE KEY `TripID_UNIQUE` (`TripID`),
  UNIQUE KEY `ScheduleID_UNIQUE` (`ScheduleID`),
  KEY `scheduleFK_idx` (`ScheduleID`),
  KEY `vehicleFK_idx` (`VehicleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5007 ;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`TripID`, `ScheduleID`, `VehicleID`, `ManifestNo`, `DriverName`) VALUES
(5006, 600004, 10000001, 'AS23JH', 'Emeka Obi'),
(5004, 600006, 10000006, 'ASK4502', 'Billy Adaka');

-- --------------------------------------------------------

--
-- Table structure for table `usersdetails`
--

CREATE TABLE IF NOT EXISTS `usersdetails` (
  `EmpID` int(4) NOT NULL,
  `UserName` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `SecurityQuestion` varchar(45) NOT NULL,
  `SecurityAnswer` varchar(45) NOT NULL,
  `UserCategory` varchar(45) NOT NULL,
  `Status` varchar(4) NOT NULL DEFAULT 'out',
  UNIQUE KEY `UserName_UNIQUE` (`UserName`),
  KEY `empNmFK_idx` (`EmpID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usersdetails`
--

INSERT INTO `usersdetails` (`EmpID`, `UserName`, `Password`, `SecurityQuestion`, `SecurityAnswer`, `UserCategory`, `Status`) VALUES
(1002, 'funmi', '*196BDEDE2AE4F84CA44C47D54D78478C7E2BD7B7', 'what is my village', 'agogo', 'Regular', 'in'),
(1003, 'kulnabil', 'password', 'what is my name', 'sun shine', 'Regular', 'OUT'),
(1001, 'manager', '*4ACFE3202A5FF5CF467898FC58AAB1D615029441', 'where i work', 'cross country', 'admin', 'in'),
(1002, 'nnvenesandra', 'pass', 'what is my name', 'rosemary', 'Admin', 'out');

-- --------------------------------------------------------

--
-- Table structure for table `vehicleinventory`
--

CREATE TABLE IF NOT EXISTS `vehicleinventory` (
  `VehicleID` int(5) NOT NULL AUTO_INCREMENT,
  `VehicleRegNo` varchar(20) NOT NULL,
  `DateArrived` date NOT NULL,
  `DriverName` varchar(45) NOT NULL,
  `Origin` varchar(20) NOT NULL,
  `Capacity` int(4) NOT NULL,
  `Status` varchar(15) NOT NULL DEFAULT 'AVAILABLE',
  PRIMARY KEY (`VehicleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10000010 ;

--
-- Dumping data for table `vehicleinventory`
--

INSERT INTO `vehicleinventory` (`VehicleID`, `VehicleRegNo`, `DateArrived`, `DriverName`, `Origin`, `Capacity`, `Status`) VALUES
(10000001, '19283ADG', '2013-10-19', 'Desmond Elliot', 'lome', 52, 'unavailable'),
(10000002, '184AG91', '2013-10-19', 'JAMES THOMAS', 'LAGOS', 18, 'available'),
(10000003, '184AG91', '2013-10-23', 'JAMES THOMAS', 'LAGOS', 18, 'unavailable'),
(10000004, '100398DGP', '2013-10-19', 'MATTEW GUNI', 'COTONOU', 32, ''),
(10000005, '19283ADG', '2013-10-01', 'Kofi Roberts', 'Lagos', 18, 'AVAILABLE'),
(10000006, '100398DGP', '2013-10-19', 'MATTEW GUNI', 'COTONOU', 32, 'unavailable'),
(10000007, 'AJ1287BTY', '2013-08-10', 'Sandra Nnvene', 'Lagos', 12, 'AVAILABLE'),
(10000008, '678311pp', '2013-10-30', 'Emeka Ojukwu', 'Nigeria', 52, 'AVAILABLE'),
(10000009, '3490u495', '2013-11-20', 'mikle alabama', 'lome', 54, 'UNAVAILABLE');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buscharter`
--
ALTER TABLE `buscharter`
  ADD CONSTRAINT `userNFK` FOREIGN KEY (`HandledBy`) REFERENCES `usersdetails` (`UserName`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `fares`
--
ALTER TABLE `fares`
  ADD CONSTRAINT `routenameFK` FOREIGN KEY (`RouteName`) REFERENCES `route` (`RouteName`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `parcelcollection`
--
ALTER TABLE `parcelcollection`
  ADD CONSTRAINT `airwayFK` FOREIGN KEY (`AirwayRefNo`) REFERENCES `parcelstock` (`AirwayRefNo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `empNoFK` FOREIGN KEY (`EmpID`) REFERENCES `employees` (`EmpID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `parcelsend`
--
ALTER TABLE `parcelsend`
  ADD CONSTRAINT `empsendfk` FOREIGN KEY (`EmpID`) REFERENCES `employees` (`EmpID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `refFK` FOREIGN KEY (`AirwayRefNo`) REFERENCES `parcelstock` (`AirwayRefNo`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `parcelvehicle`
--
ALTER TABLE `parcelvehicle`
  ADD CONSTRAINT `airrefFK` FOREIGN KEY (`AirwayRefNo`) REFERENCES `parcelstock` (`AirwayRefNo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `EmpVehicle` FOREIGN KEY (`EmpID`) REFERENCES `employees` (`EmpID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `thisFK` FOREIGN KEY (`TicketNumber`) REFERENCES `ticketbooking` (`TicketNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userNameFK` FOREIGN KEY (`HandledBy`) REFERENCES `usersdetails` (`UserName`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `ticketbooking`
--
ALTER TABLE `ticketbooking`
  ADD CONSTRAINT `passengerFK` FOREIGN KEY (`PassengerID`) REFERENCES `passengers` (`PassengerID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `routeFK` FOREIGN KEY (`RouteName`) REFERENCES `route` (`RouteName`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `schFK` FOREIGN KEY (`ScheduleID`) REFERENCES `schedules` (`ScheduleID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `userFK` FOREIGN KEY (`HandledBy`) REFERENCES `usersdetails` (`UserName`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `scheduleFK` FOREIGN KEY (`ScheduleID`) REFERENCES `schedules` (`ScheduleID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicleFK` FOREIGN KEY (`VehicleID`) REFERENCES `vehicleinventory` (`VehicleID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `usersdetails`
--
ALTER TABLE `usersdetails`
  ADD CONSTRAINT `empNmFK` FOREIGN KEY (`EmpID`) REFERENCES `employees` (`EmpID`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
