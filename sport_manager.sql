-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  lun. 12 fév. 2018 à 12:25
-- Version du serveur :  10.2.8-MariaDB
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `sport_manager`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonnement`
--

DROP TABLE IF EXISTS `abonnement`;
CREATE TABLE IF NOT EXISTS `abonnement` (
  `AB_id` int(11) NOT NULL,
  `AB_client` int(11) NOT NULL,
  `AB_dateDebut` int(11) DEFAULT NULL,
  `AB_nbSeancesRealisees` int(11) DEFAULT 0,
  `AB_nbSeancesRestantes` int(11) DEFAULT NULL,
  `AB_forfait` int(11) DEFAULT NULL,
  PRIMARY KEY (`AB_id`,`AB_client`),
  KEY `AB_client` (`AB_client`),
  KEY `AB_id` (`AB_id`),
  KEY `FK_AB_FO` (`AB_forfait`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `abonnement`
--

INSERT INTO `abonnement` (`AB_id`, `AB_client`, `AB_dateDebut`, `AB_nbSeancesRealisees`, `AB_nbSeancesRestantes`, `AB_forfait`) VALUES
(1, 1, 1518437662, 0, 40, 1),
(1, 2, 1518437662, 0, 40, 1),
(2, 2, 1518437662, 0, 40, 1);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `CL_id` int(11) NOT NULL AUTO_INCREMENT,
  `CL_nom` varchar(65) NOT NULL,
  `CL_prenom` varchar(65) NOT NULL,
  `CL_mail` varchar(65) NOT NULL,
  `CL_adresse` varchar(255) NOT NULL,
  `CL_telFixe` varchar(10) DEFAULT NULL,
  `CL_telPortable` varchar(10) DEFAULT NULL,
  `CL_remarque` text DEFAULT NULL,
  PRIMARY KEY (`CL_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Informations des clients';

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`CL_id`, `CL_nom`, `CL_prenom`, `CL_mail`, `CL_adresse`, `CL_telFixe`, `CL_telPortable`, `CL_remarque`) VALUES
(1, 'EYA', 'Thierry', '123@mail.com', 'adresse 25000 Besançon', '0303030303', '0606060606', NULL),
(2, 'RITTER', 'Jonathan', '123@mail.com', 'adresse 25000 Besançon', '0303030303', '0606060606', NULL),
(3, 'TEIXERA', 'Tiago', '123@mail.com', 'adresse 25000 Besançon', '0303030303', '0606060606', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `forfait`
--

DROP TABLE IF EXISTS `forfait`;
CREATE TABLE IF NOT EXISTS `forfait` (
  `FO_id` int(11) NOT NULL AUTO_INCREMENT,
  `FO_validite` int(11) NOT NULL,
  `FO_tarif` int(11) NOT NULL,
  `FO_nbSeances` int(11) NOT NULL,
  PRIMARY KEY (`FO_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `forfait`
--

INSERT INTO `forfait` (`FO_id`, `FO_validite`, `FO_tarif`, `FO_nbSeances`) VALUES
(1, 52, 15, 52);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
CREATE TABLE IF NOT EXISTS `lieu` (
  `LI_id` int(11) NOT NULL AUTO_INCREMENT,
  `LI_adresse` varchar(255) NOT NULL,
  PRIMARY KEY (`LI_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`LI_id`, `LI_adresse`) VALUES
(1, 'adresse 25000 Besançon'),
(2, 'adresse2 25000 Besançon');

-- --------------------------------------------------------

--
-- Structure de la table `lieu_abonnement`
--

DROP TABLE IF EXISTS `lieu_abonnement`;
CREATE TABLE IF NOT EXISTS `lieu_abonnement` (
  `LA_lieu` int(11) NOT NULL,
  `LA_abo` int(11) NOT NULL,
  `LA_lieufDefaut` tinyint(1) NOT NULL,
  PRIMARY KEY (`LA_lieu`,`LA_abo`),
  KEY `LA_abo` (`LA_abo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lieu_abonnement`
--

INSERT INTO `lieu_abonnement` (`LA_lieu`, `LA_abo`, `LA_lieufDefaut`) VALUES
(1, 1, 1),
(2, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `planning`
--

DROP TABLE IF EXISTS `planning`;
CREATE TABLE IF NOT EXISTS `planning` (
  `PL_id` int(11) NOT NULL AUTO_INCREMENT,
  `PL_abo` int(11) NOT NULL,
  `PL_jour` int(11) NOT NULL,
  `PL_hDebut` int(11) NOT NULL,
  `PL_hFin` int(11) NOT NULL,
  PRIMARY KEY (`PL_id`),
  KEY `FK_PL_AB` (`PL_abo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `planning`
--

INSERT INTO `planning` (`PL_id`, `PL_abo`, `PL_jour`, `PL_hDebut`, `PL_hFin`) VALUES
(1, 1, 1, 1800, 1900),
(2, 1, 3, 1700, 1800);

-- --------------------------------------------------------

--
-- Structure de la table `reglement`
--

DROP TABLE IF EXISTS `reglement`;
CREATE TABLE IF NOT EXISTS `reglement` (
  `RE_id` int(11) NOT NULL AUTO_INCREMENT,
  `RE_abo` int(11) DEFAULT NULL,
  `RE_date` date NOT NULL DEFAULT current_timestamp(),
  `RE_somme` int(11) NOT NULL,
  PRIMARY KEY (`RE_id`),
  KEY `FK_RE_AB` (`RE_abo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `SE_id` int(11) NOT NULL AUTO_INCREMENT,
  `SE_abo` int(11) DEFAULT NULL,
  `SE_date` date NOT NULL,
  `SE_hDebut` int(11) NOT NULL,
  `SE_hFin` int(11) NOT NULL,
  `SE_realisee` tinyint(1) NOT NULL DEFAULT 0,
  `SE_due` tinyint(1) NOT NULL DEFAULT 0,
  `SE_lieu` int(11) DEFAULT NULL,
  PRIMARY KEY (`SE_id`),
  KEY `SE_id` (`SE_id`),
  KEY `FK_SE_AB` (`SE_abo`),
  KEY `FK_SE_LA` (`SE_lieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `abonnement`
--
ALTER TABLE `abonnement`
  ADD CONSTRAINT `FK_AB_FO` FOREIGN KEY (`AB_forfait`) REFERENCES `forfait` (`FO_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `abonnement_ibfk_1` FOREIGN KEY (`AB_client`) REFERENCES `client` (`CL_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lieu_abonnement`
--
ALTER TABLE `lieu_abonnement`
  ADD CONSTRAINT `lieu_abonnement_ibfk_1` FOREIGN KEY (`LA_lieu`) REFERENCES `lieu` (`LI_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lieu_abonnement_ibfk_2` FOREIGN KEY (`LA_abo`) REFERENCES `abonnement` (`AB_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `planning`
--
ALTER TABLE `planning`
  ADD CONSTRAINT `FK_PL_AB` FOREIGN KEY (`PL_abo`) REFERENCES `abonnement` (`AB_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reglement`
--
ALTER TABLE `reglement`
  ADD CONSTRAINT `FK_RE_AB` FOREIGN KEY (`RE_abo`) REFERENCES `abonnement` (`AB_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `FK_SE_AB` FOREIGN KEY (`SE_abo`) REFERENCES `abonnement` (`AB_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SE_LA` FOREIGN KEY (`SE_lieu`) REFERENCES `lieu_abonnement` (`LA_lieu`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
