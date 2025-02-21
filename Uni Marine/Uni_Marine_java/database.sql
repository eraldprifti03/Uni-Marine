CREATE TABLE `owner` (
  `OwnerID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Company_Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`OwnerID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `company` (
  `CompID` int(11) NOT NULL AUTO_INCREMENT,
  `OwnerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CompID`),
  KEY `OwnerID` (`OwnerID`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`OwnerID`) REFERENCES `owner` (`OwnerID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `vessel` (
  `IMO` int(11) NOT NULL,
  `Name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Crewsize` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Flag` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Capacity` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompID` int(11) DEFAULT NULL,
  PRIMARY KEY (`IMO`),
  KEY `CompID` (`CompID`),
  CONSTRAINT `vessel_ibfk_1` FOREIGN KEY (`CompID`) REFERENCES `company` (`CompID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `captain` (
  `CaptID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CaptID`),
  KEY `IMO` (`IMO`),
  CONSTRAINT `captain_ibfk_1` FOREIGN KEY (`IMO`) REFERENCES `vessel` (`IMO`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `port` (
  `PortID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PortID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `route` (
  `RouteID` int(11) NOT NULL AUTO_INCREMENT,
  `Beginning` int(11) DEFAULT NULL,
  `Destination` int(11) DEFAULT NULL,
  `Estimated_time` time DEFAULT NULL,
  PRIMARY KEY (`RouteID`),
  KEY `Beginning` (`Beginning`),
  KEY `Destination` (`Destination`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`Beginning`) REFERENCES `port` (`PortID`),
  CONSTRAINT `route_ibfk_2` FOREIGN KEY (`Destination`) REFERENCES `port` (`PortID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `passengers` (
  `PassengerID` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Last_Name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Age` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Ethnicity` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMO` int(11) NOT NULL,
  `routeId` int(11) NOT NULL,
  PRIMARY KEY (`PassengerID`),
  KEY `IMO` (`IMO`),
  KEY `routeId` (`routeId`),
  CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`IMO`) REFERENCES `vessel` (`IMO`),
  CONSTRAINT `passengers_ibfk_2` FOREIGN KEY (`routeId`) REFERENCES `route` (`RouteID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

