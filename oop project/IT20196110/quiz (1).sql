-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.34 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for quiz
DROP DATABASE IF EXISTS `quiz`;
CREATE DATABASE IF NOT EXISTS `quiz` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `quiz`;

-- Dumping structure for table quiz.questions
DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `answer1` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `answer2` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `answer3` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `answer4` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `correct` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table quiz.questions: ~5 rows (approximately)
REPLACE INTO `questions` (`id`, `question`, `answer1`, `answer2`, `answer3`, `answer4`, `correct`) VALUES
	(1, 'What is the result of ', ' 8', ' 10', ' 6', ' 12', 3),
	(2, 'Solve the equation: ', ' 3', '2', '5', '4', 3),
	(3, 'What is the area of a rectangle with length 8 units and width 5 units?', '13', '40', '26', '35', 2),
	(4, 'If a circle has a radius of 6 units, what is its circumference?', '12π', '18π', '36π', '24π', 3),
	(5, 'If a car travels at a speed of 60 miles per hour, how far will it travel in 3 hours?', '120 miles', '180 miles', '240 miles', '200 miles', 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
