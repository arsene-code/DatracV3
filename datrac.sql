-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 12 avr. 2022 à 23:44
-- Version du serveur :  10.4.19-MariaDB
-- Version de PHP : 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `datrac`
--

-- --------------------------------------------------------

--
-- Structure de la table `actes`
--

CREATE TABLE `actes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cotation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `actes`
--

INSERT INTO `actes` (`id`, `cotation`, `libelle`, `created_at`, `updated_at`) VALUES
(1, 'QAJA013', 'Parage et/ou suture de plaie superficielle de la peau de la face de moins de 3 cm de grand axe', NULL, NULL),
(2, 'QCJA001', 'Parage et/ou suture de plaie profonde de la peau et des tissus mous de la main', NULL, NULL),
(3, 'QZGA002', 'Ablation ou changement implant pharmacologique souscutané', NULL, NULL),
(4, 'DEQP003', 'Électrocardiographie sur au moins 12 dérivations', NULL, NULL),
(5, 'FGLB001', 'Séance injection extrait allergénique à concentration donnée pour désensibilisation spécifique', NULL, NULL),
(6, 'QZRB001', 'Séance acupuncture', NULL, NULL),
(7, 'YYYY010', 'Traitement de premier recours de cas nécessitant des actes techniques (pose perfusion, administration oxygène, soins de réanimation cardio-respiratoire...)', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `acte_assurances`
--

CREATE TABLE `acte_assurances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tarif_conventionne` int(11) NOT NULL,
  `ticket_moderateur_id` bigint(20) UNSIGNED NOT NULL,
  `acte_id` bigint(20) UNSIGNED NOT NULL,
  `assurance_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `administrateurs`
--

CREATE TABLE `administrateurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matricule` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sexe` enum('f','m') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'm',
  `date_nais` date NOT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `affections`
--

CREATE TABLE `affections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `type_affection_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `affections`
--

INSERT INTO `affections` (`id`, `code`, `titre`, `seen`, `statut`, `type_affection_id`, `created_at`, `updated_at`) VALUES
(1, 'A00', 'Choléra', 0, 1, 1, NULL, NULL),
(2, 'A01', 'Fièvres typhoïdes et paratyphoïdes', 0, 1, 1, NULL, NULL),
(3, 'A04', 'Autres infections bactériennes intestinales', 0, 1, 1, NULL, NULL),
(4, 'A06', 'Amibiase', 0, 1, 1, NULL, NULL),
(5, 'A09', 'Diarrhée et gastro-entérite origine infectieuse présumée', 0, 1, 1, NULL, NULL),
(6, 'A15-A19', 'Tuberculose', 0, 1, 1, NULL, NULL),
(7, 'A20', 'Peste (Yersinia pestis)', 0, 1, 1, NULL, NULL),
(8, 'A21', 'Tularémie', 0, 1, 1, NULL, NULL),
(9, 'A30', 'Lèpre (maladie de Hansen) (infection à Mycobacterium leprae)', 0, 1, 1, NULL, NULL),
(10, 'A32', 'Listériose', 0, 1, 1, NULL, NULL),
(11, 'A33', 'Tétanos néonatal', 0, 1, 1, NULL, NULL),
(12, 'A34', 'Tétanos obstétrical', 0, 1, 1, NULL, NULL),
(13, 'A36', 'Diphtérie', 0, 1, 1, NULL, NULL),
(14, 'A37', 'Coqueluche', 0, 1, 1, NULL, NULL),
(15, 'A38', 'Scarlatine', 0, 1, 1, NULL, NULL),
(16, 'A50-A64', 'Infections dont le mode de transmission est essentiellement sexuel', 0, 1, 1, NULL, NULL),
(17, 'A65-A69', 'Autres maladies à spirochètes', 0, 1, 1, NULL, NULL),
(18, 'A70-A74', 'Autres maladies à Chlamydia', 0, 1, 1, NULL, NULL),
(19, 'A75-A79', 'Rickettsioses', 0, 1, 1, NULL, NULL),
(20, 'A80-A89', 'Infections virales du système nerveux central', 0, 1, 1, NULL, NULL),
(21, 'A92-A99', 'Fièvres virales transmises par des arthropodes et fièvres virales hémorragiques', 0, 1, 1, NULL, NULL),
(22, 'B00-B09', 'Infections virales caractérisées par des lésions cutanéo-muqueuses', 0, 1, 1, NULL, NULL),
(23, 'B15-B19', 'Hépatite virale', 0, 1, 1, NULL, NULL),
(24, 'B20-B24', 'Maladies dues au virus de immunodéficience humaine (VIH)', 0, 1, 1, NULL, NULL),
(25, 'B35-B49', 'Mycoses', 0, 1, 1, NULL, NULL),
(26, 'B54', 'Paludisme', 0, 1, 1, NULL, NULL),
(27, 'B65-B83', 'Helminthiases', 0, 1, 1, NULL, NULL),
(28, 'C00-C14', 'Tumeurs malignes, lèvre, cavité buccale et pharynx', 0, 1, 2, NULL, NULL),
(29, 'C15-C26', 'Tumeurs malignes, organes digestifs', 0, 1, 2, NULL, NULL),
(30, 'C30-C39', 'Tumeurs malignes, organes respiratoires et intrathoraciques', 0, 1, 2, NULL, NULL),
(31, 'C40-C41', 'Tumeurs malignes, os et cartilage articulaire', 0, 1, 2, NULL, NULL),
(32, 'C43-C44', 'Tumeurs malignes, peau', 0, 1, 2, NULL, NULL),
(33, 'C45-C49', 'Tissu mésothélial et tissus mous', 0, 1, 2, NULL, NULL),
(34, 'D10-D36', 'Tumeurs bénignes', 0, 1, 2, NULL, NULL),
(35, 'D50-D53', 'Anémies nutritionnelles', 0, 1, 3, NULL, NULL),
(36, 'D55-D59', 'Anémies hémolytiques', 0, 1, 3, NULL, NULL),
(37, 'D60-D64', 'Aplasies médullaires et autres anémies', 0, 1, 3, NULL, NULL),
(38, 'D65-D69', 'Anomalies de la coagulation, purpura et autres affections hémorragiques', 0, 1, 3, NULL, NULL),
(39, 'D70-D77', 'Autres maladies du sang et des organes hématopoïétiques', 0, 1, 3, NULL, NULL),
(40, 'D80-D89', 'Certaines anomalies du système immunitaire', 0, 1, 3, NULL, NULL),
(41, 'E00-E07', 'Affections de la glande thyroïde', 0, 1, 4, NULL, NULL),
(42, 'E10-E14', 'Diabète sucré', 0, 1, 4, NULL, NULL),
(43, 'E15-E16', 'Autres anomalies de la régulation du glucose et de la sécrétion pancréatique interne', 0, 1, 4, NULL, NULL),
(44, 'E20-E35', 'Maladie des autres glandes endocrine', 0, 1, 4, NULL, NULL),
(45, 'E40-E46', 'Malnutrition', 0, 1, 4, NULL, NULL),
(46, 'E50-E64', 'Autres carences nutritionnelles', 0, 1, 4, NULL, NULL),
(47, 'E65-E68', 'Obésité et autres excès apport', 0, 1, 4, NULL, NULL),
(48, 'E70-E90', 'Anomalies du métabolisme', 0, 1, 4, NULL, NULL),
(49, 'E70-E90', 'Anomalies du métabolisme', 0, 1, 4, NULL, NULL),
(50, 'F00-F09', 'Troubles mentaux organiques, y compris les troubles symptomatiques', 0, 1, 5, NULL, NULL),
(51, 'F10-F19', 'Troubles mentaux et du comportement liés à utilisation de substances psycho-actives', 0, 1, 5, NULL, NULL),
(52, 'F20-F29', 'Schizophrénie, troubles schizotypiques et troubles délirants', 0, 1, 5, NULL, NULL),
(53, 'F30-F39', 'Troubles de humeur (affectifs)', 0, 1, 5, NULL, NULL),
(54, 'F40-F48', 'Troubles névrotiques, troubles liés à des facteurs de stress et troubles somatoformes', 0, 1, 5, NULL, NULL),
(55, 'F50-F59', 'Syndromes comportementaux associés à des perturbations physiologiques et à des facteurs physiques', 0, 1, 5, NULL, NULL),
(56, 'F60-F69', 'Troubles de la personnalité et du comportement chez adulte', 0, 1, 5, NULL, NULL),
(57, 'F70-F79', 'Retard mental', 0, 1, 5, NULL, NULL),
(58, 'F80-F89', 'Troubles du développement psychologique', 0, 1, 5, NULL, NULL),
(59, 'F90-F98', 'Troubles du comportement et troubles émotionnels apparaissant habituellement durant enfance et adolescence', 0, 1, 5, NULL, NULL),
(60, 'G00-G09', 'Maladies inflammatoires du système nerveux central', 0, 1, 6, NULL, NULL),
(61, 'G10-G13', 'Affections dégénératives systémiques affectant principalement le système nerveux central', 0, 1, 6, NULL, NULL),
(62, 'G20-G26', 'Syndromes extrapyramidaux et troubles de la motricité', 0, 1, 6, NULL, NULL),
(63, 'G70-G73', 'Affections musculaires et neuro-musculaires', 0, 1, 6, NULL, NULL),
(64, 'H00-H06', 'Affections de la paupière, de appareil lacrymal et de orbite', 0, 1, 7, NULL, NULL),
(65, 'H10-H13', 'Affections de la conjonctive', 0, 1, 7, NULL, NULL),
(66, 'H15-H22', 'Affections de la sclérotique, de la cornée, de iris et du corps ciliaire', 0, 1, 7, NULL, NULL),
(67, 'H25-H28', 'Affections du cristallin', 0, 1, 7, NULL, NULL),
(68, 'H30-H36', 'Affections de la choroïde et de la rétine', 0, 1, 7, NULL, NULL),
(69, 'H40-H42', 'Glaucome', 0, 1, 7, NULL, NULL),
(70, 'H46-H48', 'Affections du nerf et des voies optiques', 0, 1, 7, NULL, NULL),
(71, 'H49-H52', 'Affections des muscles oculaires, des mouvements binoculaires, de accommodation et de la réfraction', 0, 1, 7, NULL, NULL),
(72, 'H53-H54', 'Troubles de la vision et cécité', 0, 1, 7, NULL, NULL),
(73, 'H60-H62', 'Maladies de oreille externe', 0, 1, 8, NULL, NULL),
(74, 'H65-H75', 'Maladies de oreille moyenne et de apophyse mastoïde', 0, 1, 8, NULL, NULL),
(75, 'H80-H83', 'Maladies de oreille interne', 0, 1, 8, NULL, NULL),
(76, 'H90-H95', 'Autres affections de oreille', 0, 1, 8, NULL, NULL),
(77, 'K00-K14', 'Maladies de la cavité buccale, des glandes salivaires et des maxillaires', 0, 1, 9, NULL, NULL),
(78, 'K20-K31', 'Maladies œsophage, estomac et du duodénum', 0, 1, 9, NULL, NULL),
(79, 'K35-K38', 'Maladies de appendice', 0, 1, 9, NULL, NULL),
(80, 'K40-K46', 'Hernies', 0, 1, 9, NULL, NULL),
(81, 'K50-K52', 'Entérites et colites non infectieuses', 0, 1, 9, NULL, NULL),
(82, 'K55-K63', 'Autres maladies de intestin', 0, 1, 9, NULL, NULL),
(83, 'K65-K67', 'Maladies du péritoine', 0, 1, 9, NULL, NULL),
(84, 'K70-K77', 'Maladies du foie', 0, 1, 9, NULL, NULL),
(85, 'K80-K87', 'Maladies de la vésicule biliaire, des voies biliaires et du pancréas', 0, 1, 9, NULL, NULL),
(86, 'K90-K93', 'Autres maladies de appareil digestif', 0, 1, 9, NULL, NULL),
(87, 'J00-J06', 'Affections aiguës des voies respiratoires supérieures', 0, 1, 10, NULL, NULL),
(88, 'J09-J18', 'Grippe et pneumopathie', 0, 1, 10, NULL, NULL),
(89, 'J20-J22', 'Autres affections aiguës des voies respiratoires inférieures', 0, 1, 10, NULL, NULL),
(90, 'J30-J39', 'Autres maladies des voies respiratoires supérieures', 0, 1, 10, NULL, NULL),
(91, 'J95-J99', 'Autres maladies de appareil respiratoire', 0, 1, 10, NULL, NULL),
(92, 'L00-L08', 'Infections de la peau et du tissu cellulaire sous-cutané', 0, 1, 12, NULL, NULL),
(93, 'L10-L14', 'Dermatoses bulleuses', 0, 1, 12, NULL, NULL),
(94, 'L20-L30', 'Dermatoses et eczéma (syndrome)s', 0, 1, 12, NULL, NULL),
(95, 'L40-L45', 'Lésions papulo-squameuses', 0, 1, 12, NULL, NULL),
(96, 'L50-L54', 'Urticaire et érythème', 0, 1, 12, NULL, NULL),
(97, 'L55-L59', 'Affections de la peau et du tissu cellulaire sous-cutané liées à une irradiation', 0, 1, 12, NULL, NULL),
(98, 'L60-L75', 'Maladies des phanères et des annexes de la peau', 0, 1, 12, NULL, NULL),
(99, 'L80-L99', 'Autres infections de la peau et du tissu cellulaire sous-cutané', 0, 1, 12, NULL, NULL),
(100, 'M00-M25', 'Arthropathies', 0, 1, 13, NULL, NULL),
(101, 'M30-M36', 'Affections disséminées du tissu conjonctif', 0, 1, 13, NULL, NULL),
(102, 'M40-M54', 'Dorsopathies', 0, 1, 13, NULL, NULL),
(103, 'M80-M94', 'Ostéopathies et chondropathies', 0, 1, 13, NULL, NULL),
(104, 'M95-M99', 'Autres maladies du système ostéo-articulaire, des muscles et du tissu conjonctif', 0, 1, 13, NULL, NULL),
(105, 'N00-N39', 'Maladies du système génital : système urinaire', 0, 1, 14, NULL, NULL),
(106, 'N00-N08', 'Glomérulopathies', 0, 1, 14, NULL, NULL),
(107, 'N10-N16', 'Maladies rénales tubulo-interstitielles', 0, 1, 14, NULL, NULL),
(108, 'N17-N19', 'Insuffisance rénale', 0, 1, 14, NULL, NULL),
(109, 'N20-N23', 'Urolithiase', 0, 1, 14, NULL, NULL),
(110, 'N25-N29', 'Dysfonctionnement du rein et urètre', 0, 1, 14, NULL, NULL),
(111, 'N30-N39', 'Autres maladie du système urinaire', 0, 1, 14, NULL, NULL),
(112, 'N40-N51', 'Maladies des organes génitaux masculins', 0, 1, 14, NULL, NULL),
(113, 'N60-N64', 'Troubles du sein', 0, 1, 14, NULL, NULL),
(114, 'N70-N77', 'Maladies inflammatoires des organes pelviens féminins', 0, 1, 14, NULL, NULL),
(115, 'N80-N98', 'Affections non inflammatoires appareil génital féminin', 0, 1, 14, NULL, NULL),
(116, 'N99', 'Autres affections appareil génito-urinaire', 0, 1, 14, NULL, NULL),
(117, 'O00–O08', 'Grossesse se terminant par un avortement', 0, 1, 15, NULL, NULL),
(118, 'O10–O16', 'Œdème, protéinurie et hypertension au cours de la grossesse, accouchement et de la puerpéralité', 0, 1, 15, NULL, NULL),
(119, 'O20–O29', 'Autre pathologie maternelle principalement liées à la grossesse', 0, 1, 15, NULL, NULL),
(120, 'O60–O75', 'Complications du travail et accouchement', 0, 1, 15, NULL, NULL),
(121, 'O80–O84', 'Accouchement', 0, 1, 15, NULL, NULL),
(122, 'O85–O92', 'Complications principalement liées à la naissance, post-partum', 0, 1, 15, NULL, NULL),
(123, 'O95–O99', 'Autres conditions obstétricales, non classés ailleurs', 0, 1, 15, NULL, NULL),
(124, 'P00-P04', 'Fœtus et nouveau-né affectés par des troubles maternels et par des complications de la grossesse, du travail et accouchement', 0, 1, 16, NULL, NULL),
(125, 'P05-P08', 'Anomalies liées à la durée de la gestation et à la croissance du fœtus', 0, 1, 16, NULL, NULL),
(126, 'P10-P15', 'Traumatismes obstétricaux', 0, 1, 16, NULL, NULL),
(127, 'P20-P29', 'Affections respiratoires et cardio-vasculaires spécifiques de la période périnatale', 0, 1, 16, NULL, NULL),
(128, 'P35-P39', 'Infections spécifiques de la période périnatale', 0, 1, 16, NULL, NULL),
(129, 'P50-P61', 'Affections hémorragiques et hématologiques du fœtus et du nouveau-né', 0, 1, 16, NULL, NULL),
(130, 'P70-P74', 'Anomalies endocriniennes et métaboliques transitoires spécifiques du fœtus et du nouveau-né', 0, 1, 16, NULL, NULL),
(131, 'P75-P78', 'Affections appareil digestif du fœtus et du nouveau-né', 0, 1, 16, NULL, NULL),
(132, 'P80-P83', 'Affections intéressant les téguments et la régulation thermique du fœtus et du nouveau-né', 0, 1, 16, NULL, NULL),
(133, 'Q00-Q07', 'Malformations congénitales du système nerveux', 0, 1, 17, NULL, NULL),
(134, 'Q20-Q28', 'Malformations congénitales appareil circulatoire', 0, 1, 17, NULL, NULL),
(135, 'Q30-Q34', 'Malformations congénitales appareil respiratoire', 0, 1, 17, NULL, NULL),
(136, 'Q35-Q37', 'Fente labiale et fente palatine', 0, 1, 17, NULL, NULL),
(137, 'Q38-Q45', 'Autres malformations congénitales appareil digestif', 0, 1, 17, NULL, NULL),
(138, 'Q50-Q56', 'Autres malformations congénitales des organes génitaux', 0, 1, 17, NULL, NULL),
(139, 'Q60-Q64', 'Malformations congénitales appareil urinaire', 0, 1, 17, NULL, NULL),
(140, 'Q65-Q79', 'Malformations congénitales du système ostéo-articulaire et des muscles', 0, 1, 17, NULL, NULL),
(141, 'Q90-Q99', 'Anomalies chromosomiques, non classées ailleurs', 0, 1, 16, NULL, NULL),
(142, 'R00-R09', 'Symptômes et signes relatifs aux appareils circulatoire et respiratoire', 0, 1, 18, NULL, NULL),
(143, 'R10-R19', 'Symptômes et signes relatifs appareil digestif et abdomen', 0, 1, 18, NULL, NULL),
(144, 'R20-R23', 'Symptômes et signes relatifs à la peau et au tissu cellulaire sous-cutané', 0, 1, 18, NULL, NULL),
(145, 'R25-R29', 'Symptômes et signes relatifs aux systèmes nerveux et ostéo-musculaire', 0, 1, 18, NULL, NULL),
(146, 'R30-R39', 'Symptômes et signes relatifs appareil urinaire', 0, 1, 18, NULL, NULL),
(147, 'R70-R79', 'Résultats anormaux examen du sang, sans diagnostic', 0, 1, 18, NULL, NULL),
(148, 'R80-R82', 'Résultats anormaux examen des urines, sans diagnostic', 0, 1, 18, NULL, NULL),
(149, 'R83-R89', 'Résultats anormaux examen autres liquides, substances et tissus, sans diagnostic', 0, 1, 18, NULL, NULL),
(150, 'R95-R99', 'Causes de mortalité mal définies et inconnues', 0, 1, 18, NULL, NULL),
(151, 'R95-R99', 'Causes de mortalité mal définies et inconnues', 0, 1, 18, NULL, NULL),
(152, 'S00-S09', 'Lésions traumatiques de la tête', 0, 1, 19, NULL, NULL),
(153, 'S10-S19', 'Lésions traumatiques du cou', 0, 1, 19, NULL, NULL),
(154, 'S20-S29', 'Lésions traumatiques du thorax', 0, 1, 19, NULL, NULL),
(155, 'S30-S39', 'Lésions traumatiques abdomen, des lombes, du rachis lombaire et du bassin', 0, 1, 19, NULL, NULL),
(156, 'T20-T32', 'Brûlures et corrosions', 0, 1, 19, NULL, NULL),
(157, 'T33-T35', 'Gelures', 0, 1, 19, NULL, NULL),
(158, 'T36-T50', 'Intoxications par des médicaments et des substances biologiques', 0, 1, 19, NULL, NULL),
(159, 'T80-T88', 'Complications de soins chirurgicaux et médicaux, non classées ailleurs', 0, 1, 19, NULL, NULL),
(160, 'T90-T98', 'Séquelles de lésions traumatiques, empoisonnements et autres conséquences de causes externes', 0, 1, 19, NULL, NULL),
(161, 'V01-X59', 'Accidents', 0, 1, 20, NULL, NULL),
(162, 'X60-X84', 'Lésions auto-infligées', 0, 1, 20, NULL, NULL),
(163, 'Y10-Y34', 'Evénements dont intention nest pas déterminée', 0, 1, 20, NULL, NULL),
(164, 'Y40-Y84', 'Complications de soins médicaux et chirurgicaux', 0, 1, 20, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `affection_assurances`
--

CREATE TABLE `affection_assurances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assurance_id` bigint(20) UNSIGNED NOT NULL,
  `affection_id` bigint(20) UNSIGNED NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `agent_assurances`
--

CREATE TABLE `agent_assurances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matricule_ag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `n_ordre_medecin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sexe` enum('f','m') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'm',
  `date_nais` date NOT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assurance_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ville_id` bigint(20) UNSIGNED NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `agent_etablissements`
--

CREATE TABLE `agent_etablissements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `n_ordre_medecin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code_praticien` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sexe` enum('f','m') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'm',
  `date_nais` date NOT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `specialite_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ville_id` bigint(20) UNSIGNED NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `appareillages`
--

CREATE TABLE `appareillages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `appareillage_assurances`
--

CREATE TABLE `appareillage_assurances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tarif_conventionne` int(11) NOT NULL,
  `appareillage_id` bigint(20) UNSIGNED NOT NULL,
  `assurance_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `appareillage_etablissements`
--

CREATE TABLE `appareillage_etablissements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tarif_structure` int(11) NOT NULL,
  `etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `appareillage_id` bigint(20) UNSIGNED NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `assurances`
--

CREATE TABLE `assurances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom_assurance` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code_assurance` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `raison_sociale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `statut_juridique` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_web` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ville_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `assurances`
--

INSERT INTO `assurances` (`id`, `nom_assurance`, `code_assurance`, `raison_sociale`, `statut_juridique`, `site_web`, `tel`, `bp`, `logo`, `ville_id`, `created_at`, `updated_at`) VALUES
(1, 'Cnamgs', 'AA-001', 'Bd de l\"indépendance, Libreville', 'Etablissement public', 'www.cnamgs.ga', '011 77 59 65', '3999', '/images/assurance/cnamgs.png', 1, NULL, NULL),
(2, 'Assinco', 'AA-002', 'Bd de le Nation, Immeuble Odyssée Libreville', 'Sociéte Anonyme à Responsabilité Limité', 'www.assinco-sa.com', '011 72 19 25', '7812', '/images/assurance/assinco.png', 1, NULL, NULL),
(3, 'AXA Gabon', 'AA-003', 'Bord de mer, Bd de la Nation Libreville', 'Sociéte Anonyme', 'www.axa.ga', '011 79 80 80', '4047', '/images/assurance/axa.png', 1, NULL, NULL),
(4, 'Ascoma', 'AA-004', 'Immeuble Shell Gabon - 90 rue Ange M’Ba', 'Sociéte Anonyme', 'www.axa.ga', '011 74 32 90', '2138', '/images/assurance/ascoma.png', 1, NULL, NULL),
(5, 'Ogar', 'AA-005', 'Immeuble Deltassur, 1881 Bd de la Nation Libreville', 'Sociéte Anonyme', 'www.groupeogar.com', '011 76 15 96', '', '/images/assurance/ogar.jpg', 1, NULL, NULL),
(6, 'Nsia', 'AA-006', 'Immeuble NSIA, Glass Libreville', 'Sociéte Anonyme', 'www.groupensia.com', '011 72 13 90', '2221', '/images/assurance/nsia.png', 1, NULL, NULL),
(7, 'Sunu', 'AA-007', 'Avenue du Colonnel Parant, Libreville', 'Sociéte Anonyme', 'www.sunu-group.com', '011 74 36 92', '915', '/images/assurance/sunu.jpg', 1, NULL, NULL),
(8, 'Sanlam', 'AA-008', 'Rue Bretonnet, Immeuble Maima, Libreville', 'Sociéte Anonyme', 'www.ga.sanlam.com', '011 76 06 51', '6232', '/images/assurance/sanlam.jpg', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `assures`
--

CREATE TABLE `assures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `n_matricule` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `civilite` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `date_nais` date NOT NULL,
  `date_fin_con` date NOT NULL,
  `sexe` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Masculin',
  `n_dossier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type_assure_id` bigint(20) UNSIGNED NOT NULL,
  `assurance_id` bigint(20) UNSIGNED NOT NULL,
  `ville_id` bigint(20) UNSIGNED NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ayant_droits`
--

CREATE TABLE `ayant_droits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `civilite` enum('M','MME','MLE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  `matricule` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sexe` enum('F','M') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  `date_nais` date NOT NULL,
  `date_fin_con` date NOT NULL,
  `lien_parente` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assure_id` bigint(20) UNSIGNED NOT NULL,
  `ville_id` bigint(20) UNSIGNED NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dossier_medicals`
--

CREATE TABLE `dossier_medicals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission` enum('o','n') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'o',
  `administrateur_id` bigint(20) UNSIGNED NOT NULL,
  `agent_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `feuille_hospitalisation_id` bigint(20) UNSIGNED NOT NULL,
  `feuille_soin_id` bigint(20) UNSIGNED NOT NULL,
  `feuille_examen_id` bigint(20) UNSIGNED NOT NULL,
  `assure_id` bigint(20) UNSIGNED NOT NULL,
  `ayant_droit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `emploi_temps`
--

CREATE TABLE `emploi_temps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `annee` date NOT NULL,
  `mois` date NOT NULL,
  `jour` date NOT NULL,
  `heure_debut` date NOT NULL,
  `heure_fin` date NOT NULL,
  `est_Present` enum('P','A') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `agent_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etablissements`
--

CREATE TABLE `etablissements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom_etablissement` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code_etablissement` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `raison_sociale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `statut_juridique` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_web` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ville_id` bigint(20) UNSIGNED NOT NULL,
  `type_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `etablissements`
--

INSERT INTO `etablissements` (`id`, `nom_etablissement`, `code_etablissement`, `raison_sociale`, `statut_juridique`, `site_web`, `tel`, `bp`, `logo`, `ville_id`, `type_etablissement_id`, `seen`, `statut`, `created_at`, `updated_at`) VALUES
(1, 'Centre Hospitalier Universitaire de Libreville', 'LBV-01', '356 Rue Ndende, Libreville', 'Entreprise Public', '', '011 72 32 15', '', 'assets\\images\\etablissement\\hopital\\chul.jpg', 1, 1, 0, 1, NULL, NULL),
(2, 'Hôpital d’Instruction des Armées OBO', 'LBV-02', 'CG44+P3V, Libreville', 'Entreprise Public', '', '011 79 00 00', '', '\\assets\\images\\etablissement\\hopital\\hia.jpg', 1, 4, 0, 1, NULL, NULL),
(3, 'Centre Hospitalier Universitaire d’Angondjé', 'LBV-03', 'GC93+9QJ, Libreville', 'Entreprise Public', '', '011 79 00 00', '', '\\assets\\images\\etablissement\\hopital\\chua.jpg', 1, 1, 0, 1, NULL, NULL),
(4, 'Centre de Santé Egypto-Gabonais', 'LBV-04', 'Libreville', 'Entreprise Privé', '', '011 76 18 13', '', '\\assets\\images\\etablissement\\hopital\\hceg.jpg', 1, 1, 0, 1, NULL, NULL),
(5, 'Centre Hospitalier Universitaire Owendo', 'OWO-01', 'Libreville', 'Entreprise Privé', '', '062 52 03 80', '', '\\assets\\images\\etablissement\\hopital\\chuo.jpg', 1, 1, 0, 1, NULL, NULL),
(6, 'Centre Hospitalier Régional Amissa BONGO', 'FRA-01', 'Mpassa', 'Entreprise Publique', '', '011 67 72 82', '', '\\assets\\images\\etablissement\\hopital\\chra.jpg', 2, 2, 0, 1, NULL, NULL),
(7, 'Hôpital Albert SCHWEITZER', 'LAM-01', 'N1, Lambarene', 'Entreprise Publique', '', '', '', 'assets\\images\\etablissement\\hopital\\hasl.jpg', 3, 4, 0, 1, NULL, NULL),
(8, 'Centre Hospitalier Régional de Mouila', 'MOU-01', '2GW+V38, Mouila', 'Entreprise Publique', '', '', '', '\\assets\\images\\etablissement\\hopital\\chrm.jpg', 4, 2, 0, 1, NULL, NULL),
(9, 'Centre Hospitalier  Régional Benjamin NGOUBOU', 'TCH-01', 'Tchibanga', 'Entreprise Publique', '', '', '', '\\assets\\images\\etablissement\\hopital\\chrt.jpg', 5, 2, 0, 1, NULL, NULL),
(10, 'Centre Hospitalier Régional Paul MOUKAMBI', 'KOU-01', 'BP 03, Koulamoutou', 'Entreprise Publique', '', '077 01 67 00', '03', '\\assets\\images\\etablissement\\hopital\\chrk.jpg', 5, 2, 0, 1, NULL, NULL),
(11, 'Centre Hospitalier Régional de Tchengue', 'POR-01', 'Hôpital NTchengue, Boulevard, Port-Gentil', 'Entreprise Publique', '', '', '1232', '\\assets\\images\\etablissement\\hopital\\chrp.jpg', 8, 2, 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `examens`
--

CREATE TABLE `examens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cotation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `examen_assurances`
--

CREATE TABLE `examen_assurances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tarif_conventionne` int(11) NOT NULL,
  `examen_id` bigint(20) UNSIGNED NOT NULL,
  `assurance_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `examen_etablissements`
--

CREATE TABLE `examen_etablissements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heure_operation` date NOT NULL,
  `resultat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tarif_structure` int(11) NOT NULL,
  `montant_payer` int(11) NOT NULL,
  `examen_assurance_id` bigint(20) UNSIGNED NOT NULL,
  `etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `agent_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `ticket_moderateur_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `faire_examens`
--

CREATE TABLE `faire_examens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date_examen` date NOT NULL,
  `agent_centre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `effectue` enum('o','n') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `num_feuille` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `medicament_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `agent_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `medicament_id` bigint(20) UNSIGNED NOT NULL,
  `feuille_examen_id` bigint(20) UNSIGNED NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `feuille_examens`
--

CREATE TABLE `feuille_examens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `n_feuille` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `agent_assurance_id` bigint(20) UNSIGNED NOT NULL,
  `date_agentassurance` datetime NOT NULL,
  `profil_id` bigint(20) UNSIGNED NOT NULL,
  `date_caissier` datetime DEFAULT NULL,
  `date_medecin` datetime DEFAULT NULL,
  `agent_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `date_pharmacien` datetime DEFAULT NULL,
  `specialite_id` bigint(20) UNSIGNED DEFAULT NULL,
  `typeAssure` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom_prenomP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephoneP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_naisP` date NOT NULL,
  `n_matriculeP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `signatureP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom_prenomA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_matriculeA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_prenomPra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephonePra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `signaturePra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cachetPra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qualificationPra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `etablissement_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nomEtablissement` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `n_ordre_medecin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plein` tinyint(1) NOT NULL DEFAULT 0,
  `ald` tinyint(1) NOT NULL DEFAULT 0,
  `exonere` tinyint(1) NOT NULL DEFAULT 0,
  `accident` tinyint(1) NOT NULL DEFAULT 0,
  `grossesse` tinyint(1) NOT NULL DEFAULT 0,
  `date_accident` date DEFAULT NULL,
  `temps_grossesse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `examen_id` bigint(20) UNSIGNED NOT NULL,
  `ticket_moderateur_id` bigint(20) UNSIGNED NOT NULL,
  `examen_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `examen_assurance_id` bigint(20) UNSIGNED NOT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cotation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tarif_structureP` double DEFAULT NULL,
  `tarif_conventionneP` double DEFAULT NULL,
  `depassement` double DEFAULT NULL,
  `montant_assurance` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `type_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `codeEtablissement` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomPraticien` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_jour` datetime DEFAULT NULL,
  `assure_id` bigint(20) UNSIGNED NOT NULL,
  `ayant_droit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `prescription_medicale_id` bigint(20) UNSIGNED DEFAULT NULL,
  `feuille_soin_id` bigint(20) UNSIGNED NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `feuille_hospitalisations`
--

CREATE TABLE `feuille_hospitalisations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `n_feuille` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `agent_assurance_id` bigint(20) UNSIGNED NOT NULL,
  `date_agentassurance` datetime NOT NULL,
  `profil_id` bigint(20) UNSIGNED NOT NULL,
  `date_caissier` datetime DEFAULT NULL,
  `date_medecin` datetime DEFAULT NULL,
  `agent_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `date_pharmacien` datetime DEFAULT NULL,
  `specialite_id` bigint(20) UNSIGNED DEFAULT NULL,
  `typeAssure` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom_prenomP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephoneP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_naisP` date NOT NULL,
  `n_matriculeP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `signatureP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom_prenomA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_matriculeA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_prenomPra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephonePra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `signaturePra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cachetPra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qualificationPra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `etablissement_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nomEtablissement` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `n_ordre_medecin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plein` tinyint(1) NOT NULL DEFAULT 0,
  `ald` tinyint(1) NOT NULL DEFAULT 0,
  `exonere` tinyint(1) NOT NULL DEFAULT 0,
  `accident` tinyint(1) NOT NULL DEFAULT 0,
  `grossesse` tinyint(1) NOT NULL DEFAULT 0,
  `date_accident` date DEFAULT NULL,
  `temps_grossesse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ticket_moderateur_id` bigint(20) UNSIGNED NOT NULL,
  `prestation_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `prestation_assurance_id` bigint(20) UNSIGNED NOT NULL,
  `nature_prestation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cotation_acte` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tarif_structureP` double DEFAULT NULL,
  `tarif_conventionneP` double DEFAULT NULL,
  `depassement` double DEFAULT NULL,
  `montant_assurance` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `type_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `codeEtablissement` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomPraticien` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_jour` datetime DEFAULT NULL,
  `assure_id` bigint(20) UNSIGNED NOT NULL,
  `ayant_droit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `prescription_medicale_id` bigint(20) UNSIGNED DEFAULT NULL,
  `feuille_soin_id` bigint(20) UNSIGNED NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `feuille_soins`
--

CREATE TABLE `feuille_soins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `n_feuille` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `agent_assurance_id` bigint(20) UNSIGNED NOT NULL,
  `date_agentassurance` datetime NOT NULL,
  `profil_id` bigint(20) UNSIGNED NOT NULL,
  `date_caissier` datetime DEFAULT NULL,
  `date_medecin` datetime DEFAULT NULL,
  `agent_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `date_pharmacien` datetime DEFAULT NULL,
  `specialite_id` bigint(20) UNSIGNED DEFAULT NULL,
  `typeAssure` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom_prenomP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephoneP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_naisP` date NOT NULL,
  `n_matriculeP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `signatureP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom_prenomA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_matriculeA` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_prenomPra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephonePra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `signaturePra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cachetPra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qualificationPra` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `etablissement_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nomEtablissement` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `n_ordre_medecin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plein` tinyint(1) NOT NULL DEFAULT 0,
  `ald` tinyint(1) NOT NULL DEFAULT 0,
  `exonere` tinyint(1) NOT NULL DEFAULT 0,
  `accident` tinyint(1) NOT NULL DEFAULT 0,
  `grossesse` tinyint(1) NOT NULL DEFAULT 0,
  `date_accident` date DEFAULT NULL,
  `temps_grossesse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ticket_moderateur_id` bigint(20) UNSIGNED NOT NULL,
  `affection_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code_affection` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tauxP` double DEFAULT NULL,
  `tarif_structureP` double DEFAULT NULL,
  `tarif_conventionneP` double DEFAULT NULL,
  `ticket_moderateurP` double DEFAULT NULL,
  `depassement` double DEFAULT NULL,
  `montant_assurance` double DEFAULT NULL,
  `total_pharmacie` double DEFAULT NULL,
  `total_assurance` double DEFAULT NULL,
  `ticket_mPharmacie` double DEFAULT NULL,
  `type_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `nomPharmacie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `signaturePharmacie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cachetPharmacie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_livraison_m` datetime DEFAULT NULL,
  `assure_id` bigint(20) UNSIGNED NOT NULL,
  `ayant_droit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `prescription_medicale_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `medicaments`
--

CREATE TABLE `medicaments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom_commercial` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dci` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taux_rem` double NOT NULL,
  `posologie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `effet_indesir` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `indication` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contre_indi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grossesse_allait` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `medicaments`
--

INSERT INTO `medicaments` (`id`, `nom_commercial`, `dci`, `taux_rem`, `posologie`, `effet_indesir`, `indication`, `contre_indi`, `grossesse_allait`, `seen`, `statut`, `created_at`, `updated_at`) VALUES
(1, 'THERALENE', 'ALIMEMAZINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(2, 'CELESTAMINE', 'BETAMETHASONE + DEXCHLORPHENIRAMINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(3, 'TAREG', 'VALSARTAN', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(4, 'BILAXTEN', 'BILASTINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(5, 'CURTEC', 'CETIRIZINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(6, 'VIRLIX', 'CETIRIZINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(7, 'ZYRTEC', 'CETIRIZINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(8, 'AERIUS', 'DESLORATADINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(9, 'DESLOR', 'DESLORATADINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(10, 'POLARAMINE', 'DEXCHLORPHENIRAMINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(11, 'NAUTAMINE', 'DIPHENHYDRAMINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(12, 'XYZALL', 'LEVOCETIRIZINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(13, 'BILOR', 'LORATADINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(14, 'LORIX', 'LORATADINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(15, 'LORATOL', 'LORATADINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(16, 'TIRLOR', 'LORATADINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(17, 'ZIFAR', 'LORATADINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(18, 'CLARITYNE', 'LORATADINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(19, 'PRIMALAN', 'MEQUITAZINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(20, 'PHENERGAN', 'PROMETHAZINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(21, 'RINIALER', 'RUPATADINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(22, 'ASPEGIC', 'ACETYLSALICYLATE DE LYSINE', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(23, 'ASPIRINE PH 8', 'ACETYLSALICYLATE DE LYSINE', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(24, 'ANTIDOL', 'PARACETAMOL', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(25, 'DOLIPRANE', 'PARACETAMOL', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(26, 'DOLKO', 'PARACETAMOL', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(27, 'EFFERALGAN', 'PARACETAMOL', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(28, 'PANADOL', 'PARACETAMOL', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(29, 'PARACETAMOL EG', 'PARACETAMOL', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(30, 'PARACETAMOL MACOPHARMA', 'PARACETAMOL', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(31, 'PERFALGAN', 'PARACETAMOL', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(32, 'PAROL', 'PARACETAMOL', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(33, 'PARACETAMOL', 'PARACETAMOL', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(34, 'PARA DENK', 'PARACETAMOL', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(35, 'DOLVIRAN', 'ACIDE ACETYL SALICYLIQUE + CODEÏNE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(36, 'ANTARENE CODEINE', 'IBUPROFENE+ CODEÏNE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(37, 'ACUPAN', 'NEFOPAM', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(38, 'ALFENAC', 'PARACETAMOL + ACECLOFENAC', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(39, 'PANADOL FEMINA', 'PARACETAMOL + BUTHYLBROMURE DE HYOSCINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(40, 'ALGISEDAL', 'PARACETAMOL + CODEINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(41, 'CO-DOLIPRANE', 'PARACETAMOL + CODEINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(42, 'EFFERALGAN CODEINE', 'PARACETAMOL + CODEINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(43, 'EKLIPAL CODEINE', 'PARACETAMOL + CODEINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(44, 'PANADOL EXTRA', 'PARACETAMOL + CAFEINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(45, 'PANALGIC', 'PARACETAMOL + CAFEINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(46, 'THEINOL', 'PARACETAMOL + CAFEINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(47, 'MIGRALGINE', 'PARACETAMOL + CODEINE + CAFEINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(48, 'DYNAPAR', 'PARACETAMOL + DICLOFENAC', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(49, 'SOULADO PLUS', 'PARACETAMOL + DICLOFENAC + CHLORZOXAZONE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(50, 'BRUSTAN', 'PARACETAMOL + IBUPROFENE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(51, 'GENFORTE', 'PARACETAMOL + IBUPROFENE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(52, 'IBUMOL', 'PARACETAMOL + IBUPROFENE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(53, 'PROFENOL', 'PARACETAMOL + IBUPROFENE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(54, 'SOULADO', 'PARACETAMOL + IBUPROFENE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(55, 'TRIALGIC', 'PARACETAMOL + IBUPROFENE + CAFEINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(56, 'LAMALINE', 'PARACETAMOL + OPIUM', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(57, 'IXPRIM', 'PARACETAMOL + TRAMADOL', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(58, 'ZALDIAR', 'PARACETAMOL + TRAMADOL', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(59, 'TRABAR', 'TRAMADOL', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(60, 'TRAMADIS', 'TRAMADOL', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(61, 'CONTRAMAL', 'TRAMADOL', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(62, 'TOPALGIC', 'TRAMADOL', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(63, 'ZAMUDOL', 'TRAMADOL', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(64, 'RAPIFEN', 'ALFENTANYL', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(65, 'DUROGESIC', 'FENTANYL', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(66, 'FENTANYL JANSSEN', 'FENTANYL', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(67, 'ACTISKENAN', 'MORPHINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(68, 'MOSCONTIN', 'MORPHINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(69, 'ORAMORPH', 'MORPHINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(70, 'SUFENTA', 'SUFENTANYL', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(71, 'SUFENTANYL', 'SUFENTANYL', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(72, 'MORPHINE', 'SULFATE DE MORPHINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(73, 'SKENAN', 'SULFATE DE MORPHINE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(74, 'MARCAÏNE', 'BUPIVACAÏNE CHLORHYDRATE MONOHYDRAT', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(75, 'SCANDICAÏNE', 'CHLORHYDRATE DE MEPIVACAÏNE', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(76, 'EMLA', 'LIDOCAÏNE', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(77, 'XYLOCAÏNE', 'LIDOCAÏNE', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(78, 'XYLOCAÏNE ADRENALINE', 'LIDOCAÏNE + ADRENALINE', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(79, 'XYLOCAÏNE NAPHAZOLINE', 'XYLOCAÏNE + NAPHAZOLINE', 0.5, '', '', '', '', '', 0, 1, NULL, NULL),
(80, 'SPECIAFOLDINE', 'ACIDE FOLIQUE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(81, 'ACFOL', 'ACIDE FOLIQUE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(82, 'RANFERON', 'ACIDE FOLIQUE + FER', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(83, 'FERCEFOL', 'ACIDE FOLIQUE + FER', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(84, 'FOLIFER', 'ACIDE FOLIQUE + FER', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(85, 'FEROZYN', 'ACIDE FOLIQUE + FER + VIT B12', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(86, 'FER UCB', 'FER', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(87, 'VENOFER', 'FER', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(88, 'FERROSTRANE', 'FER', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(89, 'FUMAFER', 'FER', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(90, 'TARDYFERON', 'FER', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(91, 'HAEMUP', 'FER + ACIDE FOLIQUE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(92, 'TARDYFERON B9', 'FER + ACIDE FOLIQUE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(93, 'FEFOL', 'FER + ACIDE FOLIQUE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(94, 'AMIFER', 'FER + ACIDE FOLIQUE + VIT B12', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(95, 'BIOFER 12', 'FER + ACIDE FOLIQUE + VIT B12', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(96, 'BIOFERON', 'FER + ACIDE FOLIQUE + VIT B12', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(97, 'GYNOFER B12', 'FER + ACIDE FOLIQUE + VIT B12', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(98, 'FERRAVIT', 'FER + ACIDE FOLIQUE + VIT B12 + ZINC', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(99, 'IVEFERAN', 'FER SUCROSE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(100, 'ENCIFER', 'HYDROXYDE FERRIQUE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(101, 'ELVORINE', 'HLEVOFOLINATE DE CALCIUM', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(102, 'ACOFAN', 'ACECLOFENAC', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(103, 'AIRTAL', 'ACECLOFENAC', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(104, 'ZERODOL', 'ACECLOFENAC', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(105, 'ACTINAC PLUS', 'ACECLOFENAC + PARACETAMOL', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(106, 'PONSTYL', 'ACIDE MEFENAMIQUE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(107, 'NIFLUGEL', 'ACIDE NIFLUMIQUE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(108, 'NIFLUGEL', 'ACIDE NIFLUMIQUE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(109, 'NIFLURIL', 'ACIDE NIFLUMIQUE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(110, 'FLANID GE', 'ACIDE TIAPROFENIQUE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(111, 'SURGAM', 'ACIDE TIAPROFENIQUE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(112, 'TIAFEN', 'ACIDE TIAPROFENIQUE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(113, 'TIAPRIDAL', 'ATIAPRIDE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL),
(114, 'TIBERAL', 'ORNIDAZOLE', 0.8, '', '', '', '', '', 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `medicament_assurances`
--

CREATE TABLE `medicament_assurances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tarif_conventionne` int(11) NOT NULL,
  `medicament_id` bigint(20) UNSIGNED NOT NULL,
  `assurance_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `medicament_etablissements`
--

CREATE TABLE `medicament_etablissements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tarif_structure` int(11) NOT NULL,
  `medicament_id` bigint(20) UNSIGNED NOT NULL,
  `agent_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lecture` enum('Lu','Non lu') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Non lu',
  `envoi` enum('Envoye','Non envoye') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Envoye',
  `agent_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prescription_medicales`
--

CREATE TABLE `prescription_medicales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom_medicament` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_appareil` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `posologie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `date_ord` date NOT NULL,
  `agent_etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `medicament_id` bigint(20) UNSIGNED NOT NULL,
  `appareillage_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prestations`
--

CREATE TABLE `prestations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cotation_acte` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `acte_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prestation_assurances`
--

CREATE TABLE `prestation_assurances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tarif_conventionne` int(11) NOT NULL,
  `prestation_id` bigint(20) UNSIGNED NOT NULL,
  `assurance_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prestation_etablissements`
--

CREATE TABLE `prestation_etablissements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tarif_structure` int(11) NOT NULL,
  `depassement` int(11) NOT NULL,
  `montant_payer` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `prestation_assurance_id` bigint(20) UNSIGNED NOT NULL,
  `etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prise_charges`
--

CREATE TABLE `prise_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accident` tinyint(1) NOT NULL DEFAULT 0,
  `date_accident` date DEFAULT NULL,
  `soins_grossesse` tinyint(1) NOT NULL DEFAULT 0,
  `debut_grossesse` date DEFAULT NULL,
  `date_accouchement` date DEFAULT NULL,
  `type_assure_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `profils`
--

CREATE TABLE `profils` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `profils`
--

INSERT INTO `profils` (`id`, `libelle`, `created_at`, `updated_at`) VALUES
(1, 'SUPERADMIN', NULL, NULL),
(2, 'ADMIN ETABLISSEMENT', NULL, NULL),
(3, 'ADMIN ASSURANCE', NULL, NULL),
(4, 'MANAGER ETABLISSEMENT', NULL, NULL),
(5, 'ADMIN ASSURANCE', NULL, NULL),
(6, 'COMPTABLE ETABLISSEMENT', NULL, NULL),
(7, 'COMPTABLE ASSURANCE', NULL, NULL),
(8, 'SERVICE TIERS PAYANT', NULL, NULL),
(9, 'SERVICE ADMINISTRATIF', NULL, NULL),
(10, 'CAISSIER', NULL, NULL),
(11, 'PHARMACIEN', NULL, NULL),
(12, 'TECHNICIEN LABO', NULL, NULL),
(13, 'PRATICIEN', NULL, NULL),
(14, 'MEDECIN REFERENT', NULL, NULL),
(15, 'ASSURE', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `statut` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `provinces`
--

INSERT INTO `provinces` (`id`, `libelle`, `seen`, `statut`, `created_at`, `updated_at`) VALUES
(1, 'Estuaire', 0, 1, NULL, NULL),
(2, 'Haut-Ogooué', 0, 1, NULL, NULL),
(3, 'Moyen-Ogooué', 0, 1, NULL, NULL),
(4, 'Ngounié', 0, 1, NULL, NULL),
(5, 'Nyanga', 0, 1, NULL, NULL),
(6, 'Ogooué-Ivindo', 0, 1, NULL, NULL),
(7, 'Ogooué-Lolo', 0, 1, NULL, NULL),
(8, 'Ogooué-Maritime', 0, 1, NULL, NULL),
(9, 'Woleu-Ntem', 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SuperAdmin',
  `matricule` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poste` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `matricule`, `telephone`, `poste`, `adresse`, `ville`, `photo_url`, `api_token`, `code_secret`, `active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Yannick ABOH', 'yannickabohthierry@gmail.com', NULL, '$2y$10$sr6hrwrS2.qMG1jtlKgpoeC3KqMWZ.Qy/vKZeqX1C2bMCJBzDg8bi', 'SuperAdmin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-12 19:02:13', '2022-04-12 19:02:13');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
