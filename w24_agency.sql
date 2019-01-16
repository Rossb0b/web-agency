-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 16 Janvier 2019 à 09:53
-- Version du serveur :  5.7.24-0ubuntu0.16.04.1
-- Version de PHP :  7.1.25-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `w24_agency`
--

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `resume` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `book`
--

INSERT INTO `book` (`id`, `title`, `author`, `date`, `resume`, `category_id`, `image_id`, `client_id`) VALUES
(6, 'test2', 'test2', '2014-01-01', 'test2', 1, 8, 7),
(7, 'tedf', 'dsqfds', '2014-01-01', 'd', 1, 9, 7),
(8, 'imagetest', 'tedsqf', '2014-01-01', 'f', 1, 10, 7),
(9, 'dqsd', 'dsqd', '2014-01-01', 'qsd', 1, 11, 7),
(10, 'dqsdsqd', 'dqsdsq', '2014-01-01', 'dqsdsqdsqddsq', 1, 12, 7),
(11, 'Le Seigneur des anneaux - Tome 1 : La communauté de l\'anneau', 'Tolkien', '2014-07-19', 'Dans les vertes prairies de la Comté, les Hobbits, ou Semi-hommes, vivaient en paix... Jusqu\'au jour fatal où l\'un d\'entre eux, au cours de ses voyages, entra en possession de l\'Anneau Unique aux immenses pouvoirs.', 6, 14, NULL),
(12, 'Beren et Luthien', 'Tolkien', '2014-01-01', 'Découvrez l’histoire d’amour qui a donné naissance au monde du Seigneur des Anneaux et du Hobbit ! Des milliers d’années avant Aragorn et Arwen, un homme et une Elfe tentent de vivre un amour interdit et..', 6, 18, 6);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Science-fiction'),
(2, 'Amour'),
(3, 'Historique'),
(6, 'Aventure'),
(7, 'Policier');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifiant` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`id`, `firstname`, `lastname`, `identifiant`) VALUES
(6, 'Nicolas', 'Hallaert', '406fe4c4'),
(7, 'Pierre', 'Dumoulin', 'de11eb67'),
(8, 'Allo', 'Lemonde', '6c4b0993'),
(9, 'Nick', 'Ola', '2a4aca8e');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `src` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `image`
--

INSERT INTO `image` (`id`, `src`, `text`) VALUES
(7, '5ae4acdebaada08ac8bb8c02f8de9c9b.jpeg', 'etetdf'),
(8, 'c90e4b4014178635279b39c21e30bc03.jpeg', 'test'),
(9, '5ae4acdebaada08ac8bb8c02f8de9c9b.jpeg', 'dqsd'),
(10, '5ae4acdebaada08ac8bb8c02f8de9c9b.jpeg', 'fsdfsd'),
(11, '5ae4acdebaada08ac8bb8c02f8de9c9b.jpeg', 'dqsdqsd'),
(12, '5ae4acdebaada08ac8bb8c02f8de9c9b.jpeg', 'dsqdddddddddddddfsd'),
(14, 'b9ff65125d45894c133359d70685c221.jpeg', 'Couverture Tome 1 Seigneur des anneaux'),
(18, '7aee942806b386d229a25a7776190c29.jpeg', 'Couverture Beren et Luthien');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20190103090959'),
('20190103091207'),
('20190103092339'),
('20190103092719'),
('20190103092937'),
('20190108124241'),
('20190108124539'),
('20190108124640'),
('20190108143107'),
('20190115105519'),
('20190116081141');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'test@test.test', '$2y$12$HkkM3bO0xY/IwdFSPpPvAekBLR00VL0rqcThspXuo8S5.rr7rzC3u');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CBE5A33112469DE2` (`category_id`),
  ADD KEY `IDX_CBE5A3313DA5256D` (`image_id`),
  ADD KEY `IDX_CBE5A33119EB6921` (`client_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FK_CBE5A33112469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_CBE5A33119EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `FK_CBE5A3313DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
