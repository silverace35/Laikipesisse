-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.19 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Export de la structure de la base pour bobart
CREATE DATABASE IF NOT EXISTS `bobart` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bobart`;

-- Export de la structure de la table bobart. ideas
CREATE TABLE IF NOT EXISTS `ideas` (
  `ideaID` int(11) NOT NULL AUTO_INCREMENT,
  `ideaIMG_Location` varchar(50) DEFAULT NULL,
  `ideaDescription` mediumtext,
  `userID` int(11) NOT NULL,
  `ideaSociety` varchar(50) NOT NULL,
  PRIMARY KEY (`ideaID`),
  KEY `FK_Ideas_users` (`userID`),
  CONSTRAINT `FK_Ideas_users` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Export de données de la table bobart.ideas : ~3 rows (environ)
/*!40000 ALTER TABLE `ideas` DISABLE KEYS */;
INSERT INTO `ideas` (`ideaID`, `ideaIMG_Location`, `ideaDescription`, `userID`, `ideaSociety`) VALUES
	(1, NULL, 'le multiplat, une des voitures les plus ridicule du siecle encore vendu', 3, 'Fiat'),
	(2, NULL, 'un panneau pour les aveugles', 4, 'atole'),
	(3, 'C:\\laragon\\www\\cours\\Projet\\prj\\img\\Spiderman.jpg', 'oui ', 1, 'Paname'),
	(4, NULL, 'test', 2, 'Cookie');
/*!40000 ALTER TABLE `ideas` ENABLE KEYS */;

-- Export de la structure de la table bobart. notes
CREATE TABLE IF NOT EXISTS `notes` (
  `noteID` int(11) NOT NULL AUTO_INCREMENT,
  `ideaID` int(11) NOT NULL,
  `noteValue` int(11) DEFAULT '5',
  PRIMARY KEY (`noteID`),
  KEY `FK_notes_ideas` (`ideaID`),
  CONSTRAINT `FK_notes_ideas` FOREIGN KEY (`ideaID`) REFERENCES `ideas` (`ideaID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Export de données de la table bobart.notes : ~5 rows (environ)
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` (`noteID`, `ideaID`, `noteValue`) VALUES
	(1, 1, 5),
	(2, 1, 2),
	(3, 1, 5),
	(4, 2, 4),
	(5, 2, 5);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;

-- Export de la structure de la table bobart. users
CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userLastName` varchar(50) NOT NULL,
  `userFirstName` varchar(50) NOT NULL,
  `userPseudo` varchar(50) NOT NULL,
  `userMdp` varchar(50) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userPseudo` (`userPseudo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Export de données de la table bobart.users : ~5 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`userID`, `userLastName`, `userFirstName`, `userPseudo`, `userMdp`) VALUES
	(1, 'Jean', 'Pierre', 'Compta1', 'Azerty35'),
	(2, 'Therese', 'ponsabledugroupe', 'Commercial1', 'Azerty35'),
	(3, 'méwi', 'séclaire', 'Commercial2', 'Qsdfgh35'),
	(4, 'bob', 'artichaud', 'farfelu1', 'Azerty35'),
	(5, 'jérémi', 'lepécésurlebureau', 'BigBoss', 'ez'),
	(6, 'patrick', 'DeLaCompta', 'Compta2', 'Azerty35'),
	(7, 'Patrcik', 'leparatonnere', 'Commercial3', 'Azerty35'),
	(8, 'Thor', 'Latrick', 'Commercial4', 'Azerty35'),
	(9, 'Patrick', 'Latrick', 'Commercial5', 'Azerty35'),
	(10, 'Jack', 'lopaire', 'Commercial6', 'Azerty35'),
	(11, 'Litu', 'Tartare', 'Commercial7', 'Azerty35'),
	(12, 'farfouille', 'Farfulle', 'farfelu2', 'Azerty35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
