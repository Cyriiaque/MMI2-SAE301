-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : sam. 26 oct. 2024 à 22:29
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
(61, 1, 51, 4),
(62, 2, 1, 2);

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
(1, 22),
(2, 22),
(3, 22);

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
(40, 'Nike Academy', 'Haut de foot à manches courtes Dri-FIT pour homme', 'Simple, doux et confortable, notre haut Academy anti-transpirant est prêt à te suivre dans tous tes entraînements quotidiens. Il est extensible et léger : tu restes très rapide dans toutes les actions de jeu. Le mesh respirant dans le dos procure un maximum de fraîcheur.', 24.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/269ae8b3-e203-4832-8a5c-d540672565d3/M+NK+DF+ACD23+TOP+SS+BR.png', 'Tshirt', 'homme', 'white', NULL, 'S', 8, '0'),
(45, 'Nike Mercurial Superfly 10 Elite', 'Chaussure de foot montante à crampons', 'Tenue ajustée. Si tu préfères une tenue un peu plus ample, on te conseille de commander une demi-pointure au-dessus.', 279.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5a9dab66-a459-46f8-9b3f-4650645561d1/ZM+SUPERFLY+10+ELITE+FG.png', 'Chaussures', 'homme', 'yellow', '36.0', NULL, 10, '20'),
(46, 'Nike Mercurial Superfly 10 Elite', 'Chaussure de foot montante à crampons', 'Tenue ajustée. Si tu préfères une tenue un peu plus ample, on te conseille de commander une demi-pointure au-dessus.', 279.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5477ee47-0f7b-4ce8-ad2b-82c27aa313fb/ZM+SUPERFLY+10+ELITE+FG.png', 'Chaussures', 'homme', 'black', '36.0', NULL, 10, '20'),
(47, 'Nike Mercurial Superfly 10 Elite', 'Chaussure de foot montante à crampons', 'Tenue ajustée. Si tu préfères une tenue un peu plus ample, on te conseille de commander une demi-pointure au-dessus.', 279.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/f4fefcee-a7d7-46db-ae9f-d71e68b93e5d/ZM+SUPERFLY+10+ELITE+FG.png', 'Chaussures', 'homme', 'blue', '38.0', NULL, 10, '20'),
(48, 'Nike DNA Crossover', 'Short de basket 20 cm Dri-FIT pour homme', 'Les projecteurs brillent. Tu t\'apprêtes à entrer sur le terrain. Saisis toutes tes chances avec ce short de basket DNA. Ce design innovant mise tout sur la performance. La matière légère et résistante évacue la transpiration pour te garder au sec. Tu peux te concentrer à 100 % sur ton jeu. La poche à zip te permet de ranger tes affaires en sécurité, sur le terrain comme au quotidien.', 47.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/56fdb990-d40a-41b9-9141-5fd67f140783/M+NK+DF+DNA+CRSOVR+8IN+SSNL.png', 'Short', 'homme', 'red', NULL, 'S', 5, '20'),
(49, 'Nike DNA Crossover', 'Short de basket 20 cm Dri-FIT pour homme', 'La vitesse est ton obsession ? C\'est aussi celle des plus grandes stars du foot. Cette chaussure à crampons Elite avec unité Air Zoom 3/4 améliorée a été conçue pour ça. Elle te donne la sensation de propulsion nécessaire pour percer la défense et imiter les joueurs et joueuses les plus rapides. Résultat : c\'est la Mercurial la plus réactive de toutes. Parce que tu mérites l\'excellence, pour toi-même et tes chaussures.', 47.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/56fdb990-d40a-41b9-9141-5fd67f140783/M+NK+DF+DNA+CRSOVR+8IN+SSNL.png', 'Short', 'homme', 'red', NULL, 'XL', 10, '20'),
(50, 'Nike DNA Crossover', 'Short de basket 20 cm Dri-FIT pour homme', 'La vitesse est ton obsession ? C\'est aussi celle des plus grandes stars du foot. Cette chaussure à crampons Elite avec unité Air Zoom 3/4 améliorée a été conçue pour ça. Elle te donne la sensation de propulsion nécessaire pour percer la défense et imiter les joueurs et joueuses les plus rapides. Résultat : c\'est la Mercurial la plus réactive de toutes. Parce que tu mérites l\'excellence, pour toi-même et tes chaussures.', 47.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/56fdb990-d40a-41b9-9141-5fd67f140783/M+NK+DF+DNA+CRSOVR+8IN+SSNL.png', 'Short', 'homme', 'red', NULL, 'M', 10, '20'),
(51, 'Nike ACG « Reservoir Goat »', 'Short pour homme', 'Léger, extensible et facile à ranger, ce short à séchage rapide « Reservoir Goat » signé ACG est le compagnon idéal. Le tissu déperlant évacue l\'humidité après une randonnée dans la brume ou une baignade rafraîchissante. La coupe décontractée tombe au-dessus du genou et suit tes mouvements sans te gêner quand tu avances sur les sentiers.', 74.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8492a0ad-6c27-4ac3-a69e-221b6dfa658b/M+ACG+RESERVOIR+GOAT+SHORT.png', 'Short', 'homme', 'purple', NULL, 'XS', 5, '0'),
(52, 'Nike ACG « Reservoir Goat »', 'Short pour homme', 'Léger, extensible et facile à ranger, ce short à séchage rapide « Reservoir Goat » signé ACG est le compagnon idéal. Le tissu déperlant évacue l\'humidité après une randonnée dans la brume ou une baignade rafraîchissante. La coupe décontractée tombe au-dessus du genou et suit tes mouvements sans te gêner quand tu avances sur les sentiers.', 74.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/90e9f0be-e8e4-42c2-86fa-18c8cc8a6af1/M+ACG+RESERVOIR+GOAT+SHORT.png', 'Short', 'homme', 'green', NULL, 'XS', 7, '0'),
(53, 'Nike ACG « Reservoir Goat »', 'Short pour homme', 'Léger, extensible et facile à ranger, ce short à séchage rapide « Reservoir Goat » signé ACG est le compagnon idéal. Le tissu déperlant évacue l\'humidité après une randonnée dans la brume ou une baignade rafraîchissante. La coupe décontractée tombe au-dessus du genou et suit tes mouvements sans te gêner quand tu avances sur les sentiers.', 74.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5adf07f0-d8d0-4f12-8bb9-39430e7ed498/M+ACG+RESERVOIR+GOAT+SHORT.png', 'Short', 'homme', 'blue', NULL, 'M', 4, '0'),
(54, 'Nike ACG « Reservoir Goat »', 'Short pour homme', 'Léger, extensible et facile à ranger, ce short à séchage rapide « Reservoir Goat » signé ACG est le compagnon idéal. Le tissu déperlant évacue l\'humidité après une randonnée dans la brume ou une baignade rafraîchissante. La coupe décontractée tombe au-dessus du genou et suit tes mouvements sans te gêner quand tu avances sur les sentiers.', 74.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8b2903a1-21e4-42da-977b-28983b1a1033/M+ACG+RESERVOIR+GOAT+SHORT.png', 'Short', 'homme', 'black', NULL, 'L', 7, '0'),
(55, 'Nike ACG « Reservoir Goat »', 'Short pour homme', 'Léger, extensible et facile à ranger, ce short à séchage rapide « Reservoir Goat » signé ACG est le compagnon idéal. Le tissu déperlant évacue l\'humidité après une randonnée dans la brume ou une baignade rafraîchissante. La coupe décontractée tombe au-dessus du genou et suit tes mouvements sans te gêner quand tu avances sur les sentiers.', 74.99, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8b2903a1-21e4-42da-977b-28983b1a1033/M+ACG+RESERVOIR+GOAT+SHORT.png', 'Short', 'homme', 'black', NULL, 'M', 7, '0');

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
(1, 'Lemesle', 'Cyriaque', 'cyriaque.lemesle@etu.unilim.fr', '$2y$10$7Tu27d58fdXuigNi2/s3VebBY4qTNUi4dIDZ1tcpnZ0moth/JZpfy'),
(22, 'Mora', 'Frédéric', 'frederic.mora@unilim.fr', '$2y$10$RTc4fwav2zKp1ysKc6pZ2eH1Xm1KftpIQ762TVJNbOFnuVYFAl1he');

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
  MODIFY `id_cart_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT pour la table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `Products`
--
ALTER TABLE `Products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `Users`
--
ALTER TABLE `Users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
