-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 17 okt 2024 om 09:54
-- Serverversie: 9.0.1
-- PHP-versie: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `us_rea_kyano_a`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `spCreateCountry`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCreateCountry` (IN `Name` VARCHAR(250), IN `CapitalCity` VARCHAR(250), IN `Continent` VARCHAR(250), IN `Population` INT UNSIGNED, IN `Zipcode` VARCHAR(6))   BEGIN

    INSERT INTO Country (
        Name,
        CapitalCity,
        Continent,
        Population,
        Zipcode
    ) VALUES (
        Name,
        CapitalCity,
        Continent,
        Population,
        Zipcode
    );

END$$

DROP PROCEDURE IF EXISTS `spDeleteCountryById`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteCountryById` (IN `Id` INT UNSIGNED)   BEGIN
    DELETE  
    FROM    Country AS COUN
    WHERE   COUN.Id = Id;
END$$

DROP PROCEDURE IF EXISTS `spGetAllCountries`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetAllCountries` ()   BEGIN

    SELECT  COUN.Id,
            COUN.Name,
            COUN.CapitalCity,
            COUN.Continent,
            COUN.Population,
            COUN.Zipcode
    FROM    Country AS COUN
    ORDER BY COUN.Id ASC;

END$$

DROP PROCEDURE IF EXISTS `spSelectCountryById`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectCountryById` (IN `Id` INT UNSIGNED)   BEGIN

    SELECT  COUN.Id,
            COUN.Name,
            COUN.CapitalCity,
            COUN.Continent,
            COUN.Population,
            COUN.Zipcode
    FROM    Country AS COUN
    WHERE   COUN.Id = Id;

END$$

DROP PROCEDURE IF EXISTS `spUpdateCountryById`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateCountryById` (IN `Id` INT UNSIGNED, IN `Name` VARCHAR(250), IN `CapitalCity` VARCHAR(250), IN `Continent` VARCHAR(250), IN `Population` INT UNSIGNED, IN `Zipcode` VARCHAR(6))   BEGIN
    UPDATE  Country AS  COUN
    SET     COUN.Name = Name,
            COUN.CapitalCity = CapitalCity,
            COUN.Continent = Continent,
            COUN.Population = Population,
            COUN.Zipcode = Zipcode
    WHERE   COUN.Id = Id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `allergeen`
--

DROP TABLE IF EXISTS `allergeen`;
CREATE TABLE IF NOT EXISTS `allergeen` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Naam` varchar(255) NOT NULL,
  `Omschrijving` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) NOT NULL,
  `CapitalCity` varchar(250) NOT NULL,
  `Continent` varchar(250) NOT NULL,
  `Population` int UNSIGNED NOT NULL,
  `Zipcode` varchar(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `country`
--

INSERT INTO `country` (`Id`, `Name`, `CapitalCity`, `Continent`, `Population`, `Zipcode`) VALUES
(2, 'Tanzania', 'Dodoma', 'Afrika', 63590000, '1234SD'),
(4, 'Japan', 'Tokio', 'Azi&euml;', 125700000, ''),
(5, 'Zwitserlandd', 'Bern', 'Europa', 8703000, ''),
(6, 'Noorwegen', 'Oslo', 'Europa', 5550203, ''),
(11, 'Litouwen', 'Vilnius', 'Europa', 340000000, ''),
(15, 'Marokko', 'Rabat', 'Afrika', 37500000, ''),
(16, 'Nepal', 'Kathmandu', 'Azi&euml;', 30000000, ''),
(17, 'Chili', 'Santiago', 'Zuid-Amerika', 18276870, '');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leverancier`
--

DROP TABLE IF EXISTS `leverancier`;
CREATE TABLE IF NOT EXISTS `leverancier` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Naam` varchar(100) NOT NULL,
  `ContactPersoon` varchar(100) NOT NULL,
  `LeverancierNummer` varchar(100) NOT NULL,
  `Mobiel` varchar(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `magazijn`
--

DROP TABLE IF EXISTS `magazijn`;
CREATE TABLE IF NOT EXISTS `magazijn` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ProductId` int NOT NULL,
  `VerpakkingEenheidKG` decimal(15,2) NOT NULL,
  `AantalAanwezig` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK-Magazijn-Product` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Naam` varchar(255) NOT NULL,
  `Barcode` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `productperallergeen`
--

DROP TABLE IF EXISTS `productperallergeen`;
CREATE TABLE IF NOT EXISTS `productperallergeen` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ProductId` int NOT NULL,
  `AllergeenId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK-ProducAllergeen-Product` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `productperleverancier`
--

DROP TABLE IF EXISTS `productperleverancier`;
CREATE TABLE IF NOT EXISTS `productperleverancier` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LeverancierId` int NOT NULL,
  `ProductId` int NOT NULL,
  `DatumLevering` date NOT NULL,
  `Aantal` int NOT NULL,
  `DatumEerstVolgendeLevering` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK-ProductLeverancier-Product` (`ProductId`),
  KEY `FK-ProductLeverancier-Leverancier` (`LeverancierId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reuzenrad`
--

DROP TABLE IF EXISTS `reuzenrad`;
CREATE TABLE IF NOT EXISTS `reuzenrad` (
  `Id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Naam` varchar(100) NOT NULL,
  `Hoogte` smallint NOT NULL,
  `Land` varchar(100) NOT NULL,
  `Kosten` int NOT NULL,
  `AantalPassagiers` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `reuzenrad`
--

INSERT INTO `reuzenrad` (`Id`, `Naam`, `Hoogte`, `Land`, `Kosten`, `AantalPassagiers`) VALUES
(6, 'Ain Dubai', 250, 'Verenigde Arabische Emiraten', 270, 1750),
(7, 'High Roller', 168, 'Verenigde Staten', 203, 1120),
(8, 'Singapore Flyer', 165, 'Singapore', 240, 784),
(9, 'Star of Nanchang', 160, 'China', 57, 480),
(10, 'London Eye', 135, 'Engeland', 65, 320);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `zangeres`
--

DROP TABLE IF EXISTS `zangeres`;
CREATE TABLE IF NOT EXISTS `zangeres` (
  `Id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Naam` varchar(100) NOT NULL,
  `NettoWaarde` smallint NOT NULL,
  `Land` varchar(100) NOT NULL,
  `Mobiel` varchar(20) NOT NULL,
  `Leeftijd` tinyint NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `zangeres`
--

INSERT INTO `zangeres` (`Id`, `Naam`, `NettoWaarde`, `Land`, `Mobiel`, `Leeftijd`) VALUES
(1, 'Rihanna', 1400, 'Barbados', '+1246240001862400', 36),
(2, 'Madonna', 575, 'Verenigde Staten', '+1 3425 185876', 65),
(3, 'Taylor', 570, 'Verenigde Staten', '+1 5876 236512', 34),
(4, 'Beyoncé', 420, 'Verenigde Staten', '+1 6794908465', 42),
(5, 'Jennifer Lopez', 400, 'Verenigde Staten', '+1 3131 857345', 54);

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `magazijn`
--
ALTER TABLE `magazijn`
  ADD CONSTRAINT `FK-Magazijn-Product` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `productperallergeen`
--
ALTER TABLE `productperallergeen`
  ADD CONSTRAINT `FK-ProducAllergeen-Product` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `productperleverancier`
--
ALTER TABLE `productperleverancier`
  ADD CONSTRAINT `FK-ProductLeverancier-Leverancier` FOREIGN KEY (`LeverancierId`) REFERENCES `leverancier` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK-ProductLeverancier-Product` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
