-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : sam. 03 oct. 2020 à 13:51
-- Version du serveur :  10.5.4-MariaDB
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ocpizza_database`
--
CREATE DATABASE IF NOT EXISTS `ocpizza_database` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ocpizza_database`;

-- --------------------------------------------------------

--
-- Structure de la table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total price` float DEFAULT NULL,
  `restaurants_id` int(11) NOT NULL,
  `order_methods_id` int(11) NOT NULL,
  `cart_statuses_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_carts_restaurants1_idx` (`restaurants_id`),
  KEY `fk_carts_order_methods1_idx` (`order_methods_id`),
  KEY `fk_carts_cart_statuses1_idx` (`cart_statuses_id`),
  KEY `fk_carts_customers1_idx` (`customers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `carts`
--

INSERT INTO `carts` (`id`, `total price`, `restaurants_id`, `order_methods_id`, `cart_statuses_id`, `customers_id`) VALUES
(1, 6.9, 1, 5, 9, 1),
(2, 8.5, 1, 6, 8, 6),
(3, 15.4, 1, 5, 7, 5);

-- --------------------------------------------------------

--
-- Structure de la table `carts_has_pizzas`
--

DROP TABLE IF EXISTS `carts_has_pizzas`;
CREATE TABLE IF NOT EXISTS `carts_has_pizzas` (
  `carts_id` int(11) NOT NULL,
  `pizzas_id` int(11) NOT NULL,
  PRIMARY KEY (`carts_id`,`pizzas_id`),
  KEY `fk_carts_has_pizzas_pizzas1_idx` (`pizzas_id`),
  KEY `fk_carts_has_pizzas_carts1_idx` (`carts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `carts_has_pizzas`
--

INSERT INTO `carts_has_pizzas` (`carts_id`, `pizzas_id`) VALUES
(1, 12),
(3, 15);

-- --------------------------------------------------------

--
-- Structure de la table `cart_statuses`
--

DROP TABLE IF EXISTS `cart_statuses`;
CREATE TABLE IF NOT EXISTS `cart_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cart_statuses`
--

INSERT INTO `cart_statuses` (`id`, `status_name`) VALUES
(1, 'in progress'),
(6, 'canceled'),
(7, 'archived'),
(8, 'ordered'),
(9, 'empty');

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(55) NOT NULL,
  `first_name` varchar(55) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `street_number` int(11) NOT NULL,
  `street` varchar(55) NOT NULL,
  `city` varchar(55) NOT NULL,
  `zip_code` int(11) NOT NULL,
  `region` varchar(45) DEFAULT NULL,
  `phone_number` varchar(10) NOT NULL,
  `customer_has account` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`,`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`id`, `email`, `first_name`, `last_name`, `street_number`, `street`, `city`, `zip_code`, `region`, `phone_number`, `customer_has account`) VALUES
(1, 'misamisspapaille@gmx.com', 'Isa', 'Malon', 1, 'rue Faubourg Saint Antoine', 'Paris', 75010, 'IDF', '0601800000', 1),
(5, 'danartaud@gmail.com', 'Daniel', 'Artaud', 2, 'boulevard de Sebastopol', 'Paris', 75010, 'IDF', '0111111111', 1),
(6, 'geraldine_ospinova@caramail.com', 'Geraldine', 'Ospinova', 87, 'rue Faubourg Saint Denis', 'Paris', 75010, 'IDF', '0100000000', 1);

-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(75) NOT NULL,
  `last_name` varchar(75) NOT NULL,
  `email_address` varchar(45) NOT NULL,
  `starting_hour` time DEFAULT NULL,
  `ending_hour` time DEFAULT NULL,
  `employees_roles_id` int(11) NOT NULL,
  `restaurants_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employees_employees_roles_idx` (`employees_roles_id`),
  KEY `fk_employees_restaurants1_idx` (`restaurants_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `email_address`, `starting_hour`, `ending_hour`, `employees_roles_id`, `restaurants_id`) VALUES
(1, 'Judith', 'Yana', 'judith_y@opc-staff.com', '16:00:00', '01:30:00', 6, 1),
(2, 'Tony', 'Ricci', 'tony_r@opc.com', '17:00:00', '01:00:00', 8, 1),
(3, 'Anaïs', 'Lapierre', 'anais_l@opc.com', '17:30:00', '01:15:00', 7, 1),
(4, 'Vincent', 'Tonnerre', 'vincent_t@opc.com', '17:30:00', '00:30:00', 9, 1),
(5, 'Carolus', 'Primeur', 'carolus_p@opc.com', '11:00:00', '20:00:00', 10, 1);

-- --------------------------------------------------------

--
-- Structure de la table `employees_roles`
--

DROP TABLE IF EXISTS `employees_roles`;
CREATE TABLE IF NOT EXISTS `employees_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `employees_roles`
--

INSERT INTO `employees_roles` (`id`, `name`) VALUES
(6, 'manager'),
(7, 'crew member'),
(8, 'pizzaïolo'),
(9, 'delivery person'),
(10, 'sales executive');

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `current_quantity` float DEFAULT NULL,
  `start_quantity` float DEFAULT NULL,
  `pizza_consumption_quantity` float DEFAULT NULL,
  `minimal_availability_limit` float DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT NULL,
  `quantity_units_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ingredients_quantity_units1_idx` (`quantity_units_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `current_quantity`, `start_quantity`, `pizza_consumption_quantity`, `minimal_availability_limit`, `is_available`, `quantity_units_id`) VALUES
(1, 'sauce_tomate', 50000, 50000, 25, 100, 1, 9),
(6, 'mozzarella', 30000, 30000, 250, 1500, 1, 11),
(7, 'pâte à pizza', 60, 60, 0.5, 5, 1, 13),
(8, 'salade mâche', 8, 8, 0.2, 1, 1, 13);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_datetime` datetime NOT NULL,
  `order_sratuses_id` int(11) NOT NULL,
  `payment_status_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `Termination_datetime` datetime DEFAULT NULL,
  `carts_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_order_sratuses1_idx` (`order_sratuses_id`),
  KEY `fk_orders_payment_status1_idx` (`payment_status_id`),
  KEY `fk_orders_payment_method1_idx` (`payment_method_id`),
  KEY `fk_orders_carts1_idx` (`carts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `order_datetime`, `order_sratuses_id`, `payment_status_id`, `payment_method_id`, `Termination_datetime`, `carts_id`) VALUES
(1, '2020-10-01 15:47:16', 16, 6, 23, '2020-10-01 15:47:16', 3),
(2, '2020-10-02 19:12:46', 16, 6, 23, '2020-10-02 19:48:46', 2);

-- --------------------------------------------------------

--
-- Structure de la table `order_methods`
--

DROP TABLE IF EXISTS `order_methods`;
CREATE TABLE IF NOT EXISTS `order_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `order_methods`
--

INSERT INTO `order_methods` (`id`, `method_name`) VALUES
(1, 'in restaurant'),
(5, 'online'),
(6, 'by phone');

-- --------------------------------------------------------

--
-- Structure de la table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
CREATE TABLE IF NOT EXISTS `order_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `status_name`) VALUES
(10, 'queued'),
(11, 'started'),
(12, 'being cooked'),
(13, 'to be delivered'),
(14, 'in delivery'),
(15, 'canceled'),
(16, 'delivered');

-- --------------------------------------------------------

--
-- Structure de la table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `payment_method`
--

INSERT INTO `payment_method` (`id`, `payment_method_name`) VALUES
(1, 'cash in restaurant'),
(15, 'cash on delivery'),
(16, 'coupons on delivery'),
(17, 'gift'),
(18, 'cash and coupons in restaurant'),
(19, 'cash and coupons on delivery'),
(20, 'debit card in restaurant'),
(21, 'coupons in restaurant'),
(22, 'debit card and coupons in restaurant'),
(23, 'debit card online'),
(24, 'coupons online'),
(25, 'debit card and coupons online'),
(26, 'debit card on delivery');

-- --------------------------------------------------------

--
-- Structure de la table `payment_status`
--

DROP TABLE IF EXISTS `payment_status`;
CREATE TABLE IF NOT EXISTS `payment_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_status_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `payment_status`
--

INSERT INTO `payment_status` (`id`, `payment_status_name`) VALUES
(1, 'waiting'),
(6, 'paid'),
(7, 'gift'),
(8, 'refusal'),
(9, 'incomplete'),
(11, 'debit card failed');

-- --------------------------------------------------------

--
-- Structure de la table `pizzas`
--

DROP TABLE IF EXISTS `pizzas`;
CREATE TABLE IF NOT EXISTS `pizzas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(250) NOT NULL,
  `recipe` varchar(250) NOT NULL,
  `cooking_time_minutes` int(11) NOT NULL,
  `price` float NOT NULL,
  `is_feasible` tinyint(1) DEFAULT NULL,
  `number_of_ingredients` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pizzas`
--

INSERT INTO `pizzas` (`id`, `name`, `description`, `recipe`, `cooking_time_minutes`, `price`, `is_feasible`, `number_of_ingredients`) VALUES
(1, 'L\'Océanique', 'Une véritable pizza de la mer !', 'Pâte, sauce tomate, échalotes, ail, fruits de mer, miettes de crabe, oeufs de cabillaud fumés, filets de sole, mozzarella, aneth, origan, algues.', 20, 35.5, 0, 12),
(9, 'La Bienheureuse', 'Pour l\'Alexandre qui sommeille en toi.', 'Pâte, sauce tomate, échalotes, filets de truite, champignons, aneth, bleu d\'Auvergne, Cantal.  ', 15, 27.9, 0, 8),
(10, 'La Lainière', 'Agneau avec sa couverture de fromage.', 'Pâte, sauce tomate, souris d\'agneau marinée, canard confit, tome de brebis, mozzarella, origan.  ', 15, 25.5, 0, 7),
(11, 'La Fermière', 'Aimez-vous la volaille?', 'Pâte, sauce tomate, jambon de dinde, blanc de poulet, gésiers, canard confit, oeufs, mozzarella, origan.', 18, 28.9, 0, 9),
(12, 'Végétale', 'Simplement verte.', 'Pâte, sauce tomate, salade mâche, mozzarella.', 7, 8.5, 1, 4),
(13, 'Capitole', 'Aux oies!', 'Pâte, sauce tomate, gésiers, oeufs d\'oie, mozzarella, origan.', 8, 18.5, 0, 6),
(14, 'Voyageur', '\r\nVos sardines sont servies', 'Pâte, sauce tomate, sardines, coriandre, mozzarella.', 7, 10.99, 0, 5),
(15, 'La Base', 'Fromage sur base de tomate.', 'Pâte, sauce tomate, mozzarella.', 6, 6.9, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `pizzas_has_ingredients`
--

DROP TABLE IF EXISTS `pizzas_has_ingredients`;
CREATE TABLE IF NOT EXISTS `pizzas_has_ingredients` (
  `pizzas_id` int(11) NOT NULL,
  `ingredients_id` int(11) NOT NULL,
  `is_ingredient_available` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`pizzas_id`,`ingredients_id`),
  KEY `fk_pizzas_has_ingredients_ingredients1_idx` (`ingredients_id`),
  KEY `fk_pizzas_has_ingredients_pizzas1_idx` (`pizzas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pizzas_has_ingredients`
--

INSERT INTO `pizzas_has_ingredients` (`pizzas_id`, `ingredients_id`, `is_ingredient_available`) VALUES
(12, 1, 1),
(12, 6, 1),
(12, 7, 1),
(12, 8, 1),
(15, 1, 1),
(15, 6, 1),
(15, 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `pizzas_has_orders`
--

DROP TABLE IF EXISTS `pizzas_has_orders`;
CREATE TABLE IF NOT EXISTS `pizzas_has_orders` (
  `pizzas_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  PRIMARY KEY (`pizzas_id`,`orders_id`),
  KEY `fk_pizzas_has_orders_orders1_idx` (`orders_id`),
  KEY `fk_pizzas_has_orders_pizzas1_idx` (`pizzas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `quantity_units`
--

DROP TABLE IF EXISTS `quantity_units`;
CREATE TABLE IF NOT EXISTS `quantity_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `quantity_units`
--

INSERT INTO `quantity_units` (`id`, `unit_name`) VALUES
(1, 'mL'),
(9, 'cL'),
(10, 'L'),
(11, 'g'),
(12, 'mg'),
(13, 'kg'),
(14, 'entier'),
(15, 'pincée'),
(16, 'cuiller à soupe'),
(17, 'cuiller à café'),
(18, 'mesure');

-- --------------------------------------------------------

--
-- Structure de la table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE IF NOT EXISTS `restaurants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `street_name` varchar(45) DEFAULT NULL,
  `street_number` int(3) DEFAULT NULL,
  `city` varchar(75) DEFAULT NULL,
  `opening_hour` int(2) DEFAULT NULL,
  `closing_hour` int(2) DEFAULT NULL,
  `zip_code` int(5) DEFAULT NULL,
  `telephone` varchar(10) NOT NULL,
  `current_marketing_policy` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `street_name`, `street_number`, `city`, `opening_hour`, `closing_hour`, `zip_code`, `telephone`, `current_marketing_policy`) VALUES
(1, 'Au Régal Rital', 'rue Faubourg Saint Denis', 88, 'Paris', 16, 0, 75010, '0600060000', 'Etudiants: 5 pour le prix de 2 à partir de 21h.'),
(3, 'À Dorer ', 'chemin de la Butte', 77, 'Toulouse', 20, 233, 31400, '0909060000', '1 formation pizza au bout de 101 achats.'),
(5, 'Coeurs Fondants', 'allée des cuisiniers', 9, 'Pau', 18, 22, 64000, '0700000000', '100% des remboursements en euros.');

-- --------------------------------------------------------

--
-- Structure de la table `restaurants_has_ingredients`
--

DROP TABLE IF EXISTS `restaurants_has_ingredients`;
CREATE TABLE IF NOT EXISTS `restaurants_has_ingredients` (
  `restaurants_id` int(11) NOT NULL,
  `ingredients_id` int(11) NOT NULL,
  PRIMARY KEY (`restaurants_id`,`ingredients_id`),
  KEY `fk_restaurants_has_ingredients_ingredients1_idx` (`ingredients_id`),
  KEY `fk_restaurants_has_ingredients_restaurants1_idx` (`restaurants_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `restaurants_has_ingredients`
--

INSERT INTO `restaurants_has_ingredients` (`restaurants_id`, `ingredients_id`) VALUES
(1, 1),
(1, 6),
(1, 7),
(1, 8),
(3, 1),
(3, 6),
(3, 7),
(3, 8),
(5, 1),
(5, 6),
(5, 7),
(5, 8);

-- --------------------------------------------------------

--
-- Structure de la table `restaurants_has_pizzas`
--

DROP TABLE IF EXISTS `restaurants_has_pizzas`;
CREATE TABLE IF NOT EXISTS `restaurants_has_pizzas` (
  `restaurants_id` int(11) NOT NULL,
  `pizzas_id` int(11) NOT NULL,
  PRIMARY KEY (`restaurants_id`,`pizzas_id`),
  KEY `fk_restaurants_has_pizzas_pizzas1_idx` (`pizzas_id`),
  KEY `fk_restaurants_has_pizzas_restaurants1_idx` (`restaurants_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `restaurants_has_pizzas`
--

INSERT INTO `restaurants_has_pizzas` (`restaurants_id`, `pizzas_id`) VALUES
(1, 12),
(1, 15),
(3, 12),
(3, 15),
(5, 12),
(5, 15);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `fk_carts_cart_statuses1` FOREIGN KEY (`cart_statuses_id`) REFERENCES `cart_statuses` (`id`),
  ADD CONSTRAINT `fk_carts_customers1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_carts_order_methods1` FOREIGN KEY (`order_methods_id`) REFERENCES `order_methods` (`id`),
  ADD CONSTRAINT `fk_carts_restaurants1` FOREIGN KEY (`restaurants_id`) REFERENCES `restaurants` (`id`);

--
-- Contraintes pour la table `carts_has_pizzas`
--
ALTER TABLE `carts_has_pizzas`
  ADD CONSTRAINT `fk_carts_has_pizzas_carts1` FOREIGN KEY (`carts_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `fk_carts_has_pizzas_pizzas1` FOREIGN KEY (`pizzas_id`) REFERENCES `pizzas` (`id`);

--
-- Contraintes pour la table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_employees_roles` FOREIGN KEY (`employees_roles_id`) REFERENCES `employees_roles` (`id`),
  ADD CONSTRAINT `fk_employees_restaurants1` FOREIGN KEY (`restaurants_id`) REFERENCES `restaurants` (`id`);

--
-- Contraintes pour la table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `fk_ingredients_quantity_units1` FOREIGN KEY (`quantity_units_id`) REFERENCES `quantity_units` (`id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_carts1` FOREIGN KEY (`carts_id`) REFERENCES `carts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_order_sratuses1` FOREIGN KEY (`order_sratuses_id`) REFERENCES `order_statuses` (`id`),
  ADD CONSTRAINT `fk_orders_payment_method1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`),
  ADD CONSTRAINT `fk_orders_payment_status1` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_status` (`id`);

--
-- Contraintes pour la table `pizzas_has_ingredients`
--
ALTER TABLE `pizzas_has_ingredients`
  ADD CONSTRAINT `fk_pizzas_has_ingredients_ingredients1` FOREIGN KEY (`ingredients_id`) REFERENCES `ingredients` (`id`),
  ADD CONSTRAINT `fk_pizzas_has_ingredients_pizzas1` FOREIGN KEY (`pizzas_id`) REFERENCES `pizzas` (`id`);

--
-- Contraintes pour la table `pizzas_has_orders`
--
ALTER TABLE `pizzas_has_orders`
  ADD CONSTRAINT `fk_pizzas_has_orders_orders1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `fk_pizzas_has_orders_pizzas1` FOREIGN KEY (`pizzas_id`) REFERENCES `pizzas` (`id`);

--
-- Contraintes pour la table `restaurants_has_ingredients`
--
ALTER TABLE `restaurants_has_ingredients`
  ADD CONSTRAINT `fk_restaurants_has_ingredients_ingredients1` FOREIGN KEY (`ingredients_id`) REFERENCES `ingredients` (`id`),
  ADD CONSTRAINT `fk_restaurants_has_ingredients_restaurants1` FOREIGN KEY (`restaurants_id`) REFERENCES `restaurants` (`id`);

--
-- Contraintes pour la table `restaurants_has_pizzas`
--
ALTER TABLE `restaurants_has_pizzas`
  ADD CONSTRAINT `fk_restaurants_has_pizzas_pizzas1` FOREIGN KEY (`pizzas_id`) REFERENCES `pizzas` (`id`),
  ADD CONSTRAINT `fk_restaurants_has_pizzas_restaurants1` FOREIGN KEY (`restaurants_id`) REFERENCES `restaurants` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
