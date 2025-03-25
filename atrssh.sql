-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 10 mars 2025 à 02:30
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `atrssh`
--

-- --------------------------------------------------------

--
-- Structure de la table `agents_traitants`
--

CREATE TABLE `agents_traitants` (
  `traitantID` int(11) NOT NULL,
  `nom_prénoms_agent_traitant` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctorants`
--

CREATE TABLE `doctorants` (
  `doctorantID` int(11) NOT NULL,
  `laboID` int(11) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prénoms` varchar(255) DEFAULT NULL,
  `thème_de_recherche` text DEFAULT NULL,
  `directeur_de_thèse` varchar(255) DEFAULT NULL,
  `date_d_inscription_au` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `affiliation_équipe` varchar(255) DEFAULT NULL,
  `compte_google_scholar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

CREATE TABLE `domaine` (
  `domaineID` int(11) NOT NULL,
  `domaine` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `laboratoires`
--

CREATE TABLE `laboratoires` (
  `laboID` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `acronyme` varchar(50) DEFAULT NULL,
  `établissement` varchar(255) DEFAULT NULL,
  `région` varchar(255) DEFAULT NULL,
  `année_création` int(11) DEFAULT NULL,
  `intitulé_francais` varchar(255) DEFAULT NULL,
  `intitulé_arabe` varchar(255) DEFAULT NULL,
  `domaine` varchar(255) DEFAULT NULL,
  `filière` varchar(255) DEFAULT NULL,
  `spécialité` varchar(255) DEFAULT NULL,
  `évaluation_csp` varchar(255) DEFAULT NULL,
  `évaluation_atrssh` varchar(255) DEFAULT NULL,
  `ancien_directeur` varchar(255) DEFAULT NULL,
  `nouveau_directeur` varchar(255) DEFAULT NULL,
  `directeur_téléphone` varchar(50) DEFAULT NULL,
  `email_expéditeur` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `manifestations_scientifiques`
--

CREATE TABLE `manifestations_scientifiques` (
  `laboID` int(11) DEFAULT NULL,
  `manifestationID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `membres_équipes`
--

CREATE TABLE `membres_équipes` (
  `membreID` int(11) NOT NULL,
  `équipeID` int(11) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prénoms` varchar(255) DEFAULT NULL,
  `Grade` varchar(100) DEFAULT NULL,
  `établissement_de_rattachement` varchar(255) DEFAULT NULL,
  `domaine` varchar(255) DEFAULT NULL,
  `spécialité` varchar(255) DEFAULT NULL,
  `centre_d_intérêts` text DEFAULT NULL,
  `téléphone` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `compte_google_scholar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `objets_requêtes`
--

CREATE TABLE `objets_requêtes` (
  `objetID` int(11) NOT NULL,
  `requeteID` int(11) DEFAULT NULL,
  `objet_requete` varchar(255) DEFAULT NULL,
  `nombre_documents_attachés` int(11) DEFAULT NULL,
  `description_documents_attachés` text DEFAULT NULL,
  `date_de_traitement` date DEFAULT NULL,
  `agent_traitant` varchar(255) DEFAULT NULL,
  `remarques` text DEFAULT NULL,
  `éléments_de_réponse` text DEFAULT NULL,
  `date_d_envoi_de_réponse` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `productions_scientifiques`
--

CREATE TABLE `productions_scientifiques` (
  `laboID` int(11) DEFAULT NULL,
  `productionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `projets`
--

CREATE TABLE `projets` (
  `projetID` int(11) NOT NULL,
  `laboID` int(11) DEFAULT NULL,
  `intitulé_du_projet` varchar(255) DEFAULT NULL,
  `type_de_projet` varchar(255) DEFAULT NULL,
  `porteur_du_projet` varchar(255) DEFAULT NULL,
  `membre_d_équipe` varchar(255) DEFAULT NULL,
  `durée_du_projet` varchar(255) DEFAULT NULL,
  `date_d_obtention_d_agrément` date DEFAULT NULL,
  `financement` varchar(255) DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE `region` (
  `regionID` int(11) NOT NULL,
  `region` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `requêtes`
--

CREATE TABLE `requêtes` (
  `requeteID` int(11) NOT NULL,
  `laboID` int(11) DEFAULT NULL,
  `date_de_reception_de_requete` date DEFAULT NULL,
  `description_detaillée_requete` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `spécialité`
--

CREATE TABLE `spécialité` (
  `spécialitéID` int(11) NOT NULL,
  `spécialité` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `équipes`
--

CREATE TABLE `équipes` (
  `équipeID` int(11) NOT NULL,
  `laboID` int(11) DEFAULT NULL,
  `code_équipe` varchar(50) NOT NULL,
  `date_de_création` date DEFAULT NULL,
  `acronyme_équipe` varchar(50) DEFAULT NULL,
  `intitulé_de_l_équipe` varchar(255) DEFAULT NULL,
  `chef_d_équipe` varchar(255) DEFAULT NULL,
  `téléphone_chef_d_équipe` varchar(50) DEFAULT NULL,
  `email_chef_d_équipe` varchar(255) DEFAULT NULL,
  `compte_google_scholar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `établissements`
--

CREATE TABLE `établissements` (
  `établissementID` int(11) NOT NULL,
  `régionID` int(11) DEFAULT NULL,
  `nom_établissement` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agents_traitants`
--
ALTER TABLE `agents_traitants`
  ADD PRIMARY KEY (`traitantID`);

--
-- Index pour la table `doctorants`
--
ALTER TABLE `doctorants`
  ADD PRIMARY KEY (`doctorantID`),
  ADD KEY `laboID` (`laboID`);

--
-- Index pour la table `domaine`
--
ALTER TABLE `domaine`
  ADD PRIMARY KEY (`domaineID`);

--
-- Index pour la table `laboratoires`
--
ALTER TABLE `laboratoires`
  ADD PRIMARY KEY (`laboID`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Index pour la table `manifestations_scientifiques`
--
ALTER TABLE `manifestations_scientifiques`
  ADD PRIMARY KEY (`manifestationID`),
  ADD KEY `laboID` (`laboID`);

--
-- Index pour la table `membres_équipes`
--
ALTER TABLE `membres_équipes`
  ADD PRIMARY KEY (`membreID`),
  ADD KEY `équipeID` (`équipeID`);

--
-- Index pour la table `objets_requêtes`
--
ALTER TABLE `objets_requêtes`
  ADD PRIMARY KEY (`objetID`),
  ADD KEY `requeteID` (`requeteID`);

--
-- Index pour la table `productions_scientifiques`
--
ALTER TABLE `productions_scientifiques`
  ADD PRIMARY KEY (`productionID`),
  ADD KEY `laboID` (`laboID`);

--
-- Index pour la table `projets`
--
ALTER TABLE `projets`
  ADD PRIMARY KEY (`projetID`),
  ADD KEY `laboID` (`laboID`);

--
-- Index pour la table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`regionID`);

--
-- Index pour la table `requêtes`
--
ALTER TABLE `requêtes`
  ADD PRIMARY KEY (`requeteID`),
  ADD KEY `laboID` (`laboID`);

--
-- Index pour la table `spécialité`
--
ALTER TABLE `spécialité`
  ADD PRIMARY KEY (`spécialitéID`);

--
-- Index pour la table `équipes`
--
ALTER TABLE `équipes`
  ADD PRIMARY KEY (`équipeID`),
  ADD UNIQUE KEY `code_équipe` (`code_équipe`),
  ADD KEY `laboID` (`laboID`);

--
-- Index pour la table `établissements`
--
ALTER TABLE `établissements`
  ADD PRIMARY KEY (`établissementID`),
  ADD KEY `régionID` (`régionID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agents_traitants`
--
ALTER TABLE `agents_traitants`
  MODIFY `traitantID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `doctorants`
--
ALTER TABLE `doctorants`
  MODIFY `doctorantID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `domaine`
--
ALTER TABLE `domaine`
  MODIFY `domaineID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `laboratoires`
--
ALTER TABLE `laboratoires`
  MODIFY `laboID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `manifestations_scientifiques`
--
ALTER TABLE `manifestations_scientifiques`
  MODIFY `manifestationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `membres_équipes`
--
ALTER TABLE `membres_équipes`
  MODIFY `membreID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `objets_requêtes`
--
ALTER TABLE `objets_requêtes`
  MODIFY `objetID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `productions_scientifiques`
--
ALTER TABLE `productions_scientifiques`
  MODIFY `productionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `projets`
--
ALTER TABLE `projets`
  MODIFY `projetID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `region`
--
ALTER TABLE `region`
  MODIFY `regionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `requêtes`
--
ALTER TABLE `requêtes`
  MODIFY `requeteID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `spécialité`
--
ALTER TABLE `spécialité`
  MODIFY `spécialitéID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `équipes`
--
ALTER TABLE `équipes`
  MODIFY `équipeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `établissements`
--
ALTER TABLE `établissements`
  MODIFY `établissementID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `doctorants`
--
ALTER TABLE `doctorants`
  ADD CONSTRAINT `doctorants_ibfk_1` FOREIGN KEY (`laboID`) REFERENCES `laboratoires` (`laboID`);

--
-- Contraintes pour la table `manifestations_scientifiques`
--
ALTER TABLE `manifestations_scientifiques`
  ADD CONSTRAINT `manifestations_scientifiques_ibfk_1` FOREIGN KEY (`laboID`) REFERENCES `laboratoires` (`laboID`);

--
-- Contraintes pour la table `membres_équipes`
--
ALTER TABLE `membres_équipes`
  ADD CONSTRAINT `membres_équipes_ibfk_1` FOREIGN KEY (`équipeID`) REFERENCES `équipes` (`équipeID`);

--
-- Contraintes pour la table `objets_requêtes`
--
ALTER TABLE `objets_requêtes`
  ADD CONSTRAINT `objets_requêtes_ibfk_1` FOREIGN KEY (`requeteID`) REFERENCES `requêtes` (`requeteID`);

--
-- Contraintes pour la table `productions_scientifiques`
--
ALTER TABLE `productions_scientifiques`
  ADD CONSTRAINT `productions_scientifiques_ibfk_1` FOREIGN KEY (`laboID`) REFERENCES `laboratoires` (`laboID`);

--
-- Contraintes pour la table `projets`
--
ALTER TABLE `projets`
  ADD CONSTRAINT `projets_ibfk_1` FOREIGN KEY (`laboID`) REFERENCES `laboratoires` (`laboID`);

--
-- Contraintes pour la table `requêtes`
--
ALTER TABLE `requêtes`
  ADD CONSTRAINT `requêtes_ibfk_1` FOREIGN KEY (`laboID`) REFERENCES `laboratoires` (`laboID`);

--
-- Contraintes pour la table `équipes`
--
ALTER TABLE `équipes`
  ADD CONSTRAINT `équipes_ibfk_1` FOREIGN KEY (`laboID`) REFERENCES `laboratoires` (`laboID`);

--
-- Contraintes pour la table `établissements`
--
ALTER TABLE `établissements`
  ADD CONSTRAINT `établissements_ibfk_1` FOREIGN KEY (`régionID`) REFERENCES `region` (`regionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
