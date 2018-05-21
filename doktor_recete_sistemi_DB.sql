-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 14 May 2018, 20:43:36
-- Sunucu sürümü: 5.7.19
-- PHP Sürümü: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `doktor_recete_sistemi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cinsiyet`
--

DROP TABLE IF EXISTS `cinsiyet`;
CREATE TABLE IF NOT EXISTS `cinsiyet` (
  `cinsiyet_id` int(2) NOT NULL,
  `cinsiyet_adi` varchar(5) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`cinsiyet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `cinsiyet`
--

INSERT INTO `cinsiyet` (`cinsiyet_id`, `cinsiyet_adi`) VALUES
(1, 'Kadın'),
(2, 'Erkek');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hastalar`
--

DROP TABLE IF EXISTS `hastalar`;
CREATE TABLE IF NOT EXISTS `hastalar` (
  `hasta_no` int(11) NOT NULL,
  `hasta_adi` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `hasta_soyadi` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `cinsiyet_id` int(2) NOT NULL,
  `boy` int(3) NOT NULL,
  `kilo` int(3) NOT NULL,
  `kan_grubu_id` int(2) NOT NULL,
  `dogum_tarihi` date NOT NULL,
  `ilce_id` int(2) NOT NULL,
  `telefon` bigint(20) NOT NULL,
  `adres` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kayit_tarihi` date NOT NULL,
  PRIMARY KEY (`hasta_no`),
  KEY `kan_grubu_id` (`kan_grubu_id`),
  KEY `cinsiyet_id` (`cinsiyet_id`),
  KEY `ilce_id` (`ilce_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `hastalar`
--

INSERT INTO `hastalar` (`hasta_no`, `hasta_adi`, `hasta_soyadi`, `cinsiyet_id`, `boy`, `kilo`, `kan_grubu_id`, `dogum_tarihi`, `ilce_id`, `telefon`, `adres`, `kayit_tarihi`) VALUES
(101, 'Ömer Kürşad', 'Türkmen', 2, 195, 91, 1, '1997-02-13', 7, 5413655629, '910 Sokak. No 32/a Deniz Apt. Atatürk Mahallesi', '2018-01-08'),
(102, 'Ali', 'Demirel', 2, 180, 75, 7, '1965-05-22', 8, 5553512332, '235 sokak. no:13 Kiraz Apt Daire 5', '2017-12-12'),
(103, 'Abdullah', 'Özçalışan', 2, 187, 70, 7, '1985-05-31', 8, 5353534545, '147 Sokak. Lale Apt. no:15 daire 4 Şirinyer', '2018-04-03'),
(104, 'İpek', 'Erensoy', 1, 165, 50, 6, '1990-07-20', 8, 5536535335, '255 Sokak. Demir Apt. no:21 Daire 11', '2017-09-18'),
(105, 'Murtaza', 'Yıldız', 2, 190, 85, 4, '1977-05-02', 17, 5459919191, '858 Sokak. Yonca Apt. No:13 Daire 3', '2017-02-15'),
(106, 'Rukiye', 'Kılıç', 1, 168, 52, 5, '1996-01-12', 9, 5347575775, '36 Sokak. Özdemir Apt. No:2 Daire 3', '2018-01-08'),
(107, 'Evren', 'Durmaz', 2, 181, 71, 3, '1997-11-07', 13, 5416512111, '595 Sokak. Doktorlar Apt. No:9 Daire 2', '2016-12-14'),
(108, 'Elif', 'Dönmez', 1, 170, 66, 2, '1997-06-12', 4, 5352441424, 'Sakarya Caddesi. Özgür Apt. No:2 Daire 17', '2018-01-15'),
(109, 'Duygu', 'Sevim', 1, 169, 58, 6, '1972-09-26', 2, 5056553535, '211 Sokak. Menekşe Apt. No:7 Daire 4', '2017-09-11'),
(110, 'Kemal', 'Oktay', 2, 185, 115, 3, '1994-04-04', 22, 5054556575, '199 Sokak. Şener Apt. No:22 Daire 1', '2016-05-06'),
(111, 'Mustafa', 'Türkmen', 2, 180, 91, 1, '1968-04-25', 7, 5356459565, '991 Sokak. No:21 Toprak Apt. Daire 9', '2014-12-11');

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `hastarecete_gor`
-- (Asıl görünüm için aşağıya bakın)
--
DROP VIEW IF EXISTS `hastarecete_gor`;
CREATE TABLE IF NOT EXISTS `hastarecete_gor` (
`hasta_gecmis_id` bigint(11)
,`kolesterol` int(3)
,`ldl` int(3)
,`sigara` enum('var','yok')
,`alkol` enum('var','yok','sosyal içici')
,`kan_sekeri` int(3)
,`trigliserid` int(3)
,`hipertansiyon` enum('var','yok')
,`penisilin_alerjisi` enum('var','yok')
,`hasta_no` int(11)
,`recete_id` int(11)
);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hasta_gecmis`
--

DROP TABLE IF EXISTS `hasta_gecmis`;
CREATE TABLE IF NOT EXISTS `hasta_gecmis` (
  `hasta_gecmis_id` bigint(11) NOT NULL,
  `kolesterol` int(3) NOT NULL,
  `ldl` int(3) NOT NULL,
  `sigara` enum('var','yok') COLLATE utf8_turkish_ci NOT NULL,
  `alkol` enum('var','yok','sosyal içici') COLLATE utf8_turkish_ci NOT NULL,
  `kan_sekeri` int(3) NOT NULL,
  `trigliserid` int(3) NOT NULL,
  `hipertansiyon` enum('var','yok') COLLATE utf8_turkish_ci NOT NULL,
  `penisilin_alerjisi` enum('var','yok') COLLATE utf8_turkish_ci NOT NULL,
  `hasta_no` int(11) NOT NULL,
  PRIMARY KEY (`hasta_gecmis_id`),
  KEY `hasta_no` (`hasta_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `hasta_gecmis`
--

INSERT INTO `hasta_gecmis` (`hasta_gecmis_id`, `kolesterol`, `ldl`, `sigara`, `alkol`, `kan_sekeri`, `trigliserid`, `hipertansiyon`, `penisilin_alerjisi`, `hasta_no`) VALUES
(201, 155, 112, 'yok', 'yok', 99, 131, 'yok', 'yok', 101),
(202, 199, 105, 'var', 'sosyal içici', 120, 151, 'yok', 'yok', 102),
(203, 200, 129, 'yok', 'sosyal içici', 91, 133, 'var', 'yok', 103),
(204, 165, 79, 'var', 'sosyal içici', 101, 144, 'yok', 'var', 104),
(205, 222, 100, 'var', 'yok', 103, 150, 'var', 'yok', 105),
(206, 178, 110, 'var', 'sosyal içici', 102, 155, 'yok', 'var', 106),
(207, 166, 120, 'var', 'var', 101, 163, 'yok', 'yok', 107),
(208, 211, 166, 'var', 'var', 90, 133, 'var', 'yok', 108),
(209, 168, 158, 'yok', 'var', 85, 131, 'yok', 'yok', 109),
(210, 251, 165, 'yok', 'yok', 130, 205, 'var', 'var', 110),
(211, 195, 94, 'var', 'yok', 99, 147, 'var', 'yok', 111);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ilaclar`
--

DROP TABLE IF EXISTS `ilaclar`;
CREATE TABLE IF NOT EXISTS `ilaclar` (
  `ilac_no` int(11) NOT NULL,
  `ilac_adi` varchar(75) COLLATE utf8_turkish_ci NOT NULL,
  `fiyat` float NOT NULL,
  `ilac_etkilesim` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`ilac_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ilaclar`
--

INSERT INTO `ilaclar` (`ilac_no`, `ilac_adi`, `fiyat`, `ilac_etkilesim`) VALUES
(1, 'AUGMENTIN BID 1000 mg TABLET', 13.31, 'Probenesid ile birlikte kullanım önerilmemektedir. Probenesid amoksisilinin renal tübüler sekresyonunu azaltır. Probenesidin birlikte kullanım amoksisilinin kan seviyelerinde artmaya ve uzamaya neden olabilir, klavulanik asidi ise etkilemez.'),
(2, 'LAROXYL 25 MG 40 DRAJE', 14.11, 'Adrejenik ilaçlarla birlikte kullanıldığında hipertansiyon oluşturabilir'),
(3, 'ESRAM 10 MG FİLM TABLET', 18.14, '	\r\nİnsulin kullanan hastalara MAO inhibitörleri verilmesi hipoglisemi belirtilerini arttırır.'),
(4, 'ANTABUSE 500 MG 25 TABLET', 13.68, '	\r\nİsoniasid ve disülfiram birlikte kullanıldığında koordinasyon ve davranışbozuklukları görülebilir.'),
(5, 'I.N.H 100 MG 100 TABLET', 8.4, 'Isoniazid ve rifampisinin birlikte kullanımı, hepatotoksisite insidansını artırabilir. Sikloserin veya disülfiram ile birlikte kullanımı, santral sinir sistemi yan etkilerini şiddetlendirebilir.'),
(6, 'VASOXEN 5 MG 28 TABLET', 12.61, 'Merkezi etkili antihipertansif ilaçların eşzamanlı kullanımı, merkezi sempatik tonusta meydana gelecek bir azalma ile kalp yetersizliğini şiddetlendirebilir.'),
(7, 'BELOC ZOK 50 MG 20 TABLET', 8.51, 'Metoprolol bir CYP2D6 substratıdır. CYP2D6’ yı inhibe eden ilaçlar (örn. kinidin, terbinafin, paroksetin, fluvoksetin, sertralin, selekoksib, propafenon ve difenhidramin) metaprololün plazma konsantrasyonlarını etkileyebilirler.'),
(8, 'CORASPIN 100 MG 30 TABLET', 2.11, 'Diyabetli hastalarda kullanıldığında, insulin veya oral antidiyabetiklerin dozunun ayarlanması gerekebilir.\r\nFurosemid, spironolakton benzeri diüretiklerin ve ürikozürik ilaçların etkilerini azaltır.'),
(9, 'MAJEZİK 100 MG 15 FİLM TABLET', 7.28, 'Flurbiprofen tedavisi ile seyrek olarak görülen yan etkiler hafif şiddette, doza bağlı ve geçicidirler: Dispepsi, mide bulantısı, kusma, diyare, baş dönmesi, sinirlilik, kulak çınlaması, bulanık görme, ödem, baş ağrısı, insomnia, vertigo.'),
(10, 'ACCUZIDE 20 MG 30 FİLM TABLET', 20.75, 'Alkolün etkisinde güçlenme görülür.\r\nAccuzide\'in antihipertansif etkisinde olası azalma. Özellikle hipovolemili hastalarda akut böbrek yetmezliği ortaya çıkabilir.'),
(11, 'ALDACTONE 100 MG 16 TABLET', 10.18, 'Diğer diüretik ve antihipertansifler ile birlikte kullanıldığında, Aldactone onların etkisini potansiyalize eder. Bu yüzden, bu gibi ilaçların dozu Aldactone ile birlikte reçete edildiğinde en azından %50 azaltılmalıdır.'),
(12, 'BETANORM 80 MG 100 TABLET', 12.52, 'Antibakteriyel sülfonamidler, fenilbutazon, salisilatlar, probenecid, dikumarol, MAO inhibitörleri ve propranolol gibi kardio-selektif olmayan betablokerlerle birlikte kullanımında BETANORM\'un hipoglisemik etkisi artacağından böyle durumlarda doz ayarlaması yapılmalıdır.'),
(13, 'GLIFOR 1000 MG 100 TABLET', 13.86, 'Antikoagülanlarla birlikte kullanılması halinde antikoagülan dozunun iyi ayarlanması gereklidir'),
(14, 'CLIACIL 1,2 MEGA 20 TABLET', 17.84, 'Penisilinler, bakteriyostatik kemoterapötikler veya antibiyotiklerle (ör. tetrasiklinler, kloramfenikol) kombine edilirlerse aktiviteleri azalabilir veya kaybolabilir. '),
(15, 'ALVASTIN 10 MG 30 TABLET', 11.75, 'Herhangi bir etkileşim bildirilmemiştir. Ancak, benzer etkideki diğer ilaçlarla birlikte kullanıldığında dikkatli olunmalıdır.'),
(16, 'AMLOKARD 10 MG 30 TABLET', 13.25, 'Digoksin ile kombine kullanımlarda dikkatli olunmalıdır.'),
(17, 'DIGOXIN 0.25 MG 50 TABLET', 3.79, 'Yüksek kalsiyum dozları, lityum ve sempatomimetikler dahil psikotrop ilaçlar, dijitalize edilmiş\r\nhastalarda, kalp aritmi riskini artırabileceklerinden dolayı ihtiyatla verilmelidir.'),
(18, 'ACNOR 100 MG TABLET', 9.45, '• Şeker hastalığı tedavisinde kullanılan sülfonilüre, metformİn, insülİn gibi ilaçlar,\r\n• Kalp hastalıklarında kullanılan digoksin,\r\n• Mide asidini azaltmak için kullanılan antasitler,\r\n• Kolesterolü düşürmek İçin kullanılan kolestiramin,\r\n• Bağırsaklarda emilimi arttırıcı ilaçlar,\r\n• Sindirimi kolaylaştıran enzimler'),
(19, 'CHAMPIX 1 MG 56 FİLM KAPLI TABLET', 297.98, 'Şiddetli böbrek yetmezliği olan hastalarda simetidin (mide asidine karşı kullanılan bir ilaç) ve CHAMPIX\'in eş zamanlı kullanımından kaçınılmalıdır.'),
(20, 'ETHYLEX 50 MG FİLM TABLET', 90.23, 'Etkileşim çalışmaları mevcut değildir.');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ilac_etkilesim`
--

DROP TABLE IF EXISTS `ilac_etkilesim`;
CREATE TABLE IF NOT EXISTS `ilac_etkilesim` (
  `ilac_no` int(11) NOT NULL,
  `checkilac_no` int(11) NOT NULL,
  `etkilesim` varchar(300) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`ilac_no`),
  KEY `checkilac` (`checkilac_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ilac_etkilesim`
--

INSERT INTO `ilac_etkilesim` (`ilac_no`, `checkilac_no`, `etkilesim`) VALUES
(2, 6, 'Adrejenik ilaçlarla birlikte kullanıldığında hipertansiyon oluşturabilir.'),
(3, 8, '	\r\nİnsulin kullanan hastalara MAO inhibitörleri verilmesi hipoglisemi belirtilerini arttırır.'),
(4, 5, 'İsoniasid ve disülfiram birlikte kullanıldığında koordinasyon ve davranış bozuklukları görülebilir.'),
(5, 4, 'İsoniasid ve disülfiram birlikte kullanıldığında koordinasyon ve davranış bozuklukları görülebilir.'),
(6, 2, 'Adrejenik ilaçlarla birlikte kullanıldığında hipertansiyon oluşturabilir.'),
(8, 3, 'Diyabetli hastalarda kullanıldığında, insulin veya oral antidiyabetiklerin dozunun ayarlanması gerekebilir.\r\nFurosemid, spironolakton benzeri diüretiklerin ve ürikozürik ilaçların etkilerini azaltır.'),
(10, 11, 'Alkolün etkisinde güçlenme görülür.\r\nAccuzide\'in antihipertansif etkisinde olası azalma. Özellikle hipovolemili hastalarda akut böbrek yetmezliği ortaya çıkabilir.'),
(11, 10, 'Diğer diüretik ve antihipertansifler ile birlikte kullanıldığında, Aldactone onların etkisini potansiyalize eder. Bu yüzden, bu gibi ilaçların ve özellikle de gangliyon blokerlerinin dozu Aldactone ile birlikte reçete edildiğinde en azından %50 azaltılmalıdır.'),
(14, 1, 'Penisilinler, bakteriyostatik kemoterapötikler veya antibiyotiklerle kombine edilirlerse aktiviteleri kaybolur. \r\n'),
(16, 17, 'digoksin ile kombine kullanımlarda dikkatli olunmalıdır.'),
(17, 18, 'Yüksek kalsiyum dozları, lityum ve sempatomimetikler dahil psikotrop ilaçlar, dijitalize edilmiş\r\nhastalarda, kalp aritmi riskini artırabileceklerinden dolayı ihtiyatla verilmelidir.'),
(18, 17, 'Digoxin ile etkileşim halinde olduğu için etkisi azalır.');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ilceler`
--

DROP TABLE IF EXISTS `ilceler`;
CREATE TABLE IF NOT EXISTS `ilceler` (
  `ilce_id` int(2) NOT NULL,
  `ilce_adi` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`ilce_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ilceler`
--

INSERT INTO `ilceler` (`ilce_id`, `ilce_adi`) VALUES
(1, 'Aliağa'),
(2, 'Balçova'),
(3, 'Bayındır'),
(4, 'Bayraklı'),
(5, 'Bergama'),
(6, 'Beydağ'),
(7, 'Bornova'),
(8, 'Buca'),
(9, 'Çeşme'),
(10, 'Çiğli'),
(11, 'Dikili'),
(12, 'Foça'),
(13, 'Gaziemir'),
(14, 'Güzelbahçe'),
(15, 'Karabağlar'),
(16, 'Karaburun'),
(17, 'Karşıyaka'),
(18, 'Kemalpaşa'),
(19, 'Kınık'),
(20, 'Kiraz'),
(21, 'Konak'),
(22, 'Menderes'),
(23, 'Menemen'),
(24, 'Narlıdere'),
(25, 'Ödemiş'),
(26, 'Seferihisar'),
(27, 'Selçuk'),
(28, 'Tire'),
(29, 'Torbalı'),
(30, 'Urla');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kan_gruplari`
--

DROP TABLE IF EXISTS `kan_gruplari`;
CREATE TABLE IF NOT EXISTS `kan_gruplari` (
  `kan_grubu_id` int(2) NOT NULL,
  `kan_grubu_adi` varchar(10) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`kan_grubu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kan_gruplari`
--

INSERT INTO `kan_gruplari` (`kan_grubu_id`, `kan_grubu_adi`) VALUES
(1, '0 Rh +'),
(2, '0 Rh -'),
(3, 'AB Rh +'),
(4, 'AB Rh -'),
(5, 'B Rh +'),
(6, 'B Rh -'),
(7, 'A Rh +'),
(8, 'A Rh -');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `recete`
--

DROP TABLE IF EXISTS `recete`;
CREATE TABLE IF NOT EXISTS `recete` (
  `recete_id` int(11) NOT NULL,
  `hasta_gecmis_id` bigint(11) NOT NULL,
  `tarih` date NOT NULL,
  PRIMARY KEY (`recete_id`),
  KEY `hasta_gecmis_id` (`hasta_gecmis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `recete`
--

INSERT INTO `recete` (`recete_id`, `hasta_gecmis_id`, `tarih`) VALUES
(1, 201, '2018-05-02'),
(2, 202, '2018-05-01'),
(3, 203, '2018-05-05'),
(4, 204, '2018-03-20'),
(5, 205, '2018-04-30'),
(6, 206, '2018-05-11'),
(7, 207, '2018-03-24'),
(8, 208, '2018-04-09'),
(9, 209, '2018-05-08'),
(10, 210, '2018-01-23'),
(11, 211, '2018-02-13');

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `receteilac_gor`
-- (Asıl görünüm için aşağıya bakın)
--
DROP VIEW IF EXISTS `receteilac_gor`;
CREATE TABLE IF NOT EXISTS `receteilac_gor` (
`hasta_gecmis_id` bigint(11)
,`recete_id` int(11)
,`ilac_adi` varchar(75)
,`fiyat` float
,`ilac_etkilesim` varchar(500)
,`ilac_no` int(11)
,`tarih` date
,`tarihi` timestamp
);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `recete_ilac`
--

DROP TABLE IF EXISTS `recete_ilac`;
CREATE TABLE IF NOT EXISTS `recete_ilac` (
  `ilac_no` int(11) NOT NULL,
  `recete_id` int(11) NOT NULL,
  `tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `ilac_no` (`ilac_no`),
  KEY `recete_id` (`recete_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `recete_ilac`
--

INSERT INTO `recete_ilac` (`ilac_no`, `recete_id`, `tarihi`) VALUES
(16, 3, '2018-05-14 19:43:19'),
(1, 3, '2018-05-14 19:43:47'),
(9, 1, '2018-05-14 19:44:20'),
(10, 2, '2018-05-14 20:04:41'),
(18, 1, '2018-05-14 20:19:55'),
(14, 1, '2018-05-14 20:20:19'),
(16, 1, '2018-05-14 20:22:09'),
(15, 1, '2018-05-14 20:22:42'),
(4, 1, '2018-05-14 20:22:51');

-- --------------------------------------------------------

--
-- Görünüm yapısı `hastarecete_gor`
--
DROP TABLE IF EXISTS `hastarecete_gor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hastarecete_gor`  AS  select `hasta_gecmis`.`hasta_gecmis_id` AS `hasta_gecmis_id`,`hasta_gecmis`.`kolesterol` AS `kolesterol`,`hasta_gecmis`.`ldl` AS `ldl`,`hasta_gecmis`.`sigara` AS `sigara`,`hasta_gecmis`.`alkol` AS `alkol`,`hasta_gecmis`.`kan_sekeri` AS `kan_sekeri`,`hasta_gecmis`.`trigliserid` AS `trigliserid`,`hasta_gecmis`.`hipertansiyon` AS `hipertansiyon`,`hasta_gecmis`.`penisilin_alerjisi` AS `penisilin_alerjisi`,`hasta_gecmis`.`hasta_no` AS `hasta_no`,`recete`.`recete_id` AS `recete_id` from (`hasta_gecmis` join `recete`) where (`hasta_gecmis`.`hasta_gecmis_id` = `recete`.`hasta_gecmis_id`) ;

-- --------------------------------------------------------

--
-- Görünüm yapısı `receteilac_gor`
--
DROP TABLE IF EXISTS `receteilac_gor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `receteilac_gor`  AS  select `recete`.`hasta_gecmis_id` AS `hasta_gecmis_id`,`recete`.`recete_id` AS `recete_id`,`ilaclar`.`ilac_adi` AS `ilac_adi`,`ilaclar`.`fiyat` AS `fiyat`,`ilaclar`.`ilac_etkilesim` AS `ilac_etkilesim`,`ilaclar`.`ilac_no` AS `ilac_no`,`recete`.`tarih` AS `tarih`,`recete_ilac`.`tarihi` AS `tarihi` from ((`recete_ilac` join `recete`) join `ilaclar`) where ((`recete`.`recete_id` = `recete_ilac`.`recete_id`) and (`ilaclar`.`ilac_no` = `recete_ilac`.`ilac_no`)) ;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `hastalar`
--
ALTER TABLE `hastalar`
  ADD CONSTRAINT `hastalar_ibfk_1` FOREIGN KEY (`kan_grubu_id`) REFERENCES `kan_gruplari` (`kan_grubu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hastalar_ibfk_2` FOREIGN KEY (`cinsiyet_id`) REFERENCES `cinsiyet` (`cinsiyet_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hastalar_ibfk_3` FOREIGN KEY (`ilce_id`) REFERENCES `ilceler` (`ilce_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `hasta_gecmis`
--
ALTER TABLE `hasta_gecmis`
  ADD CONSTRAINT `hasta_gecmis_ibfk_1` FOREIGN KEY (`hasta_no`) REFERENCES `hastalar` (`hasta_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `ilac_etkilesim`
--
ALTER TABLE `ilac_etkilesim`
  ADD CONSTRAINT `checkilac` FOREIGN KEY (`checkilac_no`) REFERENCES `ilaclar` (`ilac_no`),
  ADD CONSTRAINT `ilac_etkilesim_ibfk_1` FOREIGN KEY (`ilac_no`) REFERENCES `ilaclar` (`ilac_no`);

--
-- Tablo kısıtlamaları `recete`
--
ALTER TABLE `recete`
  ADD CONSTRAINT `recete_ibfk_1` FOREIGN KEY (`hasta_gecmis_id`) REFERENCES `hasta_gecmis` (`hasta_gecmis_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `recete_ilac`
--
ALTER TABLE `recete_ilac`
  ADD CONSTRAINT `recete_ilac_ibfk_1` FOREIGN KEY (`ilac_no`) REFERENCES `ilaclar` (`ilac_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recete_ilac_ibfk_2` FOREIGN KEY (`recete_id`) REFERENCES `recete` (`recete_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
