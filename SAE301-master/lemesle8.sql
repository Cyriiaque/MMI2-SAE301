-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 23 oct. 2024 à 15:55
-- Version du serveur : 10.11.6-MariaDB-0+deb12u1
-- Version de PHP : 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `lemesle8`
--

-- --------------------------------------------------------

--
-- Structure de la table `Cart_products`
--

CREATE TABLE `Cart_products` (
  `id_cart_product` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Cart_products`
--

INSERT INTO `Cart_products` (`id_cart_product`, `id_order`, `id_product`, `quantity`) VALUES
(2, 1, 2, 4),
(3, 1, 3, 1),
(4, 2, 2, 1),
(5, 2, 3, 1),
(13, 1, 4, 4),
(14, 2, 4, 1),
(15, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Orders`
--

CREATE TABLE `Orders` (
  `id_order` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Orders`
--

INSERT INTO `Orders` (`id_order`, `id_user`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Products`
--

CREATE TABLE `Products` (
  `id_product` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `subtitle` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `image` text NOT NULL,
  `type` enum('Chaussures','Short','Tshirt') NOT NULL,
  `gender` enum('homme','femme') NOT NULL,
  `color` enum('red','blue','black','white','green','yellow','grey','orange','purple','pink') NOT NULL,
  `shoesize` decimal(3,1) DEFAULT NULL,
  `size` enum('XS','S','M','L','XL','XXL') DEFAULT NULL,
  `stock` int(32) NOT NULL,
  `promo` enum('0','5','10','15','20','25','30','35','40','45','50','55','60','65','70','75','80','85','90','95','100') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Products`
--

INSERT INTO `Products` (`id_product`, `name`, `subtitle`, `description`, `price`, `image`, `type`, `gender`, `color`, `shoesize`, `size`, `stock`, `promo`) VALUES
(1, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d56ebd9e-15f9-4aa3-9e52-c23f5b5c5930/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'red', NULL, 'XL', 3, '50'),
(2, 'Nike Pegasus', 'Chaussure de trail imperméable pour homme', 'Spécialement conçue pour le trail en hiver, la Pegasus Trail 5 protège des intempéries. Empeigne imperméable en GORE-TEX. Semelle extérieure tout-terrain. Motifs réfléchissants. Tu as tout pour affronter confortablement les éléments. Si tu ajoutes une semelle intermédiaire en mousse ReactX, tu obtiens un amorti réactif pour une foulée dynamique.', 159.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b1b4e4da-d5fa-47ca-87df-d51d96bdd035/NIKE+PEGASUS+TRAIL+5+GTX.png', 'Chaussures', 'homme', 'grey', '43.0', NULL, 5, '0'),
(3, 'Nike Academy', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Simple, doux et confortable, notre haut Academy anti-transpirant est prêt à te suivre dans tous tes entraînements quotidiens. Il est extensible et léger : tu restes très rapide dans toutes les actions de jeu. Le mesh respirant dans le dos procure un maximum de fraîcheur.', 24.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/269ae8b3-e203-4832-8a5c-d540672565d3/M+NK+DF+ACD23+TOP+SS+BR.png', 'Tshirt', 'homme', 'white', NULL, 'XXL', 8, '0'),
(4, 'Nike One', 'Short 2-en-1 taille haute 8 cm Dri-FIT pour femme', 'Pour une longue promenade, une séance de HIIT ou un tour en ville, ce short est adapté à toutes les activités. Le tissu tissé ultra-doux et soyeux intègre une technologie anti-transpirante pour t\'apporter un confort optimal et te garder au sec pendant tes entraînements. La couche intérieure ajustée évite les frottements : tu profites d\'une protection optimale pour donner le meilleur de toi-même.', 49.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/64fdd47e-f988-4281-b005-1da55fa65d21/W+NK+ONE+DF+HR+3IN+2N1+SHORT.png', 'Short', 'femme', 'black', NULL, 'M', 4, '10'),
(5, 'Nike Dunk Low', 'Chaussure pour femme', 'Créée pour les parquets mais revisitée pour le quotidien, l\'icône du basket des années 80 fait son grand retour avec une empeigne impeccable et de nouvelles associations de couleurs. Le style vintage débarque dans ton quotidien. Avec son col rembourré, tu peux la porter partout, dans le plus grand confort.', 119.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/55f3633a-8a97-4592-8418-ae94e9ae999d/W+NIKE+DUNK+LOW+NEXT+NATURE.png', 'Chaussures', 'femme', 'blue', '45.5', NULL, 0, '0'),
(9, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d462c22a-e8e3-443e-8ab0-dc48e73d1257/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'black', NULL, 'XL', 3, '50'),
(10, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/044cff47-6807-45a8-ba0d-61dbcc13a940/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'blue', NULL, 'XL', 3, '50'),
(11, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/044cff47-6807-45a8-ba0d-61dbcc13a940/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'blue', NULL, 'XXL', 3, '50'),
(12, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/044cff47-6807-45a8-ba0d-61dbcc13a940/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'blue', NULL, 'L', 3, '50'),
(13, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/044cff47-6807-45a8-ba0d-61dbcc13a940/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'blue', NULL, 'M', 3, '50'),
(14, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/044cff47-6807-45a8-ba0d-61dbcc13a940/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'blue', NULL, 'S', 3, '50'),
(15, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/044cff47-6807-45a8-ba0d-61dbcc13a940/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'blue', NULL, 'XS', 3, '50'),
(16, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d462c22a-e8e3-443e-8ab0-dc48e73d1257/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'black', NULL, 'XS', 3, '50'),
(17, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d462c22a-e8e3-443e-8ab0-dc48e73d1257/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'black', NULL, 'S', 3, '50'),
(18, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d462c22a-e8e3-443e-8ab0-dc48e73d1257/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'black', NULL, 'M', 3, '50'),
(19, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d462c22a-e8e3-443e-8ab0-dc48e73d1257/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'black', NULL, 'L', 3, '50'),
(20, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d462c22a-e8e3-443e-8ab0-dc48e73d1257/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'black', NULL, 'XXL', 3, '50'),
(21, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d56ebd9e-15f9-4aa3-9e52-c23f5b5c5930/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'red', NULL, 'XXL', 3, '50'),
(22, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d56ebd9e-15f9-4aa3-9e52-c23f5b5c5930/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'red', NULL, 'L', 3, '50'),
(23, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d56ebd9e-15f9-4aa3-9e52-c23f5b5c5930/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'red', NULL, 'M', 3, '50'),
(24, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d56ebd9e-15f9-4aa3-9e52-c23f5b5c5930/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'red', NULL, 'S', 3, '50'),
(25, 'Nike Strike', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Libère ton potentiel avec la collection Nike Strike. Des vêtements destinés aux stars montantes et aux pros du foot, conçus pour évacuer la transpiration sur le terrain. Avec sa coupe ajustée, ce haut respirant et extensible te garde au frais.', 39.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d56ebd9e-15f9-4aa3-9e52-c23f5b5c5930/M+NK+DF+STRK+TOP+SS.png', 'Tshirt', 'homme', 'red', NULL, 'XS', 3, '50'),
(26, 'Nike Pegasus', 'Chaussure de trail imperméable pour homme', 'Spécialement conçue pour le trail en hiver, la Pegasus Trail 5 protège des intempéries. Empeigne imperméable en GORE-TEX. Semelle extérieure tout-terrain. Motifs réfléchissants. Tu as tout pour affronter confortablement les éléments. Si tu ajoutes une semelle intermédiaire en mousse ReactX, tu obtiens un amorti réactif pour une foulée dynamique.', 159.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b1b4e4da-d5fa-47ca-87df-d51d96bdd035/NIKE+PEGASUS+TRAIL+5+GTX.png', 'Chaussures', 'homme', 'grey', '44.0', NULL, 5, '0'),
(27, 'Nike Pegasus', 'Chaussure de trail imperméable pour homme', 'Spécialement conçue pour le trail en hiver, la Pegasus Trail 5 protège des intempéries. Empeigne imperméable en GORE-TEX. Semelle extérieure tout-terrain. Motifs réfléchissants. Tu as tout pour affronter confortablement les éléments. Si tu ajoutes une semelle intermédiaire en mousse ReactX, tu obtiens un amorti réactif pour une foulée dynamique.', 159.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b1b4e4da-d5fa-47ca-87df-d51d96bdd035/NIKE+PEGASUS+TRAIL+5+GTX.png', 'Chaussures', 'homme', 'grey', '40.0', NULL, 5, '0'),
(28, 'Nike Pegasus', 'Chaussure de trail imperméable pour homme', 'Spécialement conçue pour le trail en hiver, la Pegasus Trail 5 protège des intempéries. Empeigne imperméable en GORE-TEX. Semelle extérieure tout-terrain. Motifs réfléchissants. Tu as tout pour affronter confortablement les éléments. Si tu ajoutes une semelle intermédiaire en mousse ReactX, tu obtiens un amorti réactif pour une foulée dynamique.', 159.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b1b4e4da-d5fa-47ca-87df-d51d96bdd035/NIKE+PEGASUS+TRAIL+5+GTX.png', 'Chaussures', 'homme', 'grey', '41.0', NULL, 5, '0'),
(29, 'Nike Pegasus', 'Chaussure de trail imperméable pour homme', 'Spécialement conçue pour le trail en hiver, la Pegasus Trail 5 protège des intempéries. Empeigne imperméable en GORE-TEX. Semelle extérieure tout-terrain. Motifs réfléchissants. Tu as tout pour affronter confortablement les éléments. Si tu ajoutes une semelle intermédiaire en mousse ReactX, tu obtiens un amorti réactif pour une foulée dynamique.', 159.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b1b4e4da-d5fa-47ca-87df-d51d96bdd035/NIKE+PEGASUS+TRAIL+5+GTX.png', 'Chaussures', 'homme', 'grey', '42.0', NULL, 5, '0'),
(31, 'Nike Pegasus', 'Chaussure de trail imperméable pour homme', 'Spécialement conçue pour le trail en hiver, la Pegasus Trail 5 protège des intempéries. Empeigne imperméable en GORE-TEX. Semelle extérieure tout-terrain. Motifs réfléchissants. Tu as tout pour affronter confortablement les éléments. Si tu ajoutes une semelle intermédiaire en mousse ReactX, tu obtiens un amorti réactif pour une foulée dynamique.', 159.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b1b4e4da-d5fa-47ca-87df-d51d96bdd035/NIKE+PEGASUS+TRAIL+5+GTX.png', 'Chaussures', 'homme', 'grey', '45.0', NULL, 5, '0'),
(34, 'Nike Pegasus', 'Chaussure de trail imperméable pour homme', 'Spécialement conçue pour le trail en hiver, la Pegasus Trail 5 protège des intempéries. Empeigne imperméable en GORE-TEX. Semelle extérieure tout-terrain. Motifs réfléchissants. Tu as tout pour affronter confortablement les éléments. Si tu ajoutes une semelle intermédiaire en mousse ReactX, tu obtiens un amorti réactif pour une foulée dynamique.', 159.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b1b4e4da-d5fa-47ca-87df-d51d96bdd035/NIKE+PEGASUS+TRAIL+5+GTX.png', 'Chaussures', 'homme', 'grey', '47.0', NULL, 5, '0'),
(37, 'Nike Academy', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Simple, doux et confortable, notre haut Academy anti-transpirant est prêt à te suivre dans tous tes entraînements quotidiens. Il est extensible et léger : tu restes très rapide dans toutes les actions de jeu. Le mesh respirant dans le dos procure un maximum de fraîcheur.', 24.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/269ae8b3-e203-4832-8a5c-d540672565d3/M+NK+DF+ACD23+TOP+SS+BR.png', 'Tshirt', 'homme', 'white', NULL, 'XL', 8, '0'),
(38, 'Nike Academy', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Simple, doux et confortable, notre haut Academy anti-transpirant est prêt à te suivre dans tous tes entraînements quotidiens. Il est extensible et léger : tu restes très rapide dans toutes les actions de jeu. Le mesh respirant dans le dos procure un maximum de fraîcheur.', 24.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/269ae8b3-e203-4832-8a5c-d540672565d3/M+NK+DF+ACD23+TOP+SS+BR.png', 'Tshirt', 'homme', 'white', NULL, 'L', 8, '0'),
(39, 'Nike Academy', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Simple, doux et confortable, notre haut Academy anti-transpirant est prêt à te suivre dans tous tes entraînements quotidiens. Il est extensible et léger : tu restes très rapide dans toutes les actions de jeu. Le mesh respirant dans le dos procure un maximum de fraîcheur.', 24.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/269ae8b3-e203-4832-8a5c-d540672565d3/M+NK+DF+ACD23+TOP+SS+BR.png', 'Tshirt', 'homme', 'white', NULL, 'M', 8, '0'),
(40, 'Nike Academy', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Simple, doux et confortable, notre haut Academy anti-transpirant est prêt à te suivre dans tous tes entraînements quotidiens. Il est extensible et léger : tu restes très rapide dans toutes les actions de jeu. Le mesh respirant dans le dos procure un maximum de fraîcheur.', 24.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/269ae8b3-e203-4832-8a5c-d540672565d3/M+NK+DF+ACD23+TOP+SS+BR.png', 'Tshirt', 'homme', 'white', NULL, 'S', 8, '0');

-- --------------------------------------------------------

--
-- Structure de la table `Users`
--

CREATE TABLE `Users` (
  `id_user` int(11) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Users`
--

INSERT INTO `Users` (`id_user`, `last_name`, `first_name`, `email`, `password`) VALUES
(1, 'Lemesle', 'Cyriaque', 'cyriaque.lemesle@etu.unilim.fr', ''),
(2, 'Lajudie', 'Francois-Pierre', 'francoispierre.lajudie@etu.unilim.fr', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Cart_products`
--
ALTER TABLE `Cart_products`
  ADD PRIMARY KEY (`id_cart_product`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_order` (`id_order`);

--
-- Index pour la table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_product` (`id_product`);

--
-- Index pour la table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Cart_products`
--
ALTER TABLE `Cart_products`
  MODIFY `id_cart_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Products`
--
ALTER TABLE `Products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `Users`
--
ALTER TABLE `Users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Cart_products`
--
ALTER TABLE `Cart_products`
  ADD CONSTRAINT `Cart_products_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `Products` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Cart_products_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `Orders` (`id_order`);

--
-- Contraintes pour la table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
