-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.41 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para portfolio
CREATE DATABASE IF NOT EXISTS `portfolio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `portfolio`;

-- Copiando estrutura para tabela portfolio.changelog
CREATE TABLE IF NOT EXISTS `changelog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '',
  `description` varchar(150) NOT NULL DEFAULT '',
  `date` timestamp NOT NULL DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela portfolio.changelog: ~0 rows (aproximadamente)
INSERT INTO `changelog` (`id`, `title`, `description`, `date`) VALUES
	(1, 'teste', 'desc test', '2025-03-25 13:53:14'),
	(2, 'teste', 'desc test', '2025-03-25 13:53:40'),
	(3, 'teste', 'desc test', '2025-03-25 13:54:44'),
	(4, 'teste', 'desc test', '2025-03-25 13:54:59'),
	(5, 'teste', 'desc test', '2025-03-25 13:55:25'),
	(6, 'teste', 'desc test', '2025-03-25 13:55:38'),
	(7, 'teste', 'desc test', '2025-03-25 14:02:14'),
	(8, 'teste', 'desc test', '2025-03-25 14:02:48');

-- Copiando estrutura para tabela portfolio.config
CREATE TABLE IF NOT EXISTS `config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT 'Wescley Andrade' COMMENT 'Título site',
  `description` varchar(150) NOT NULL DEFAULT 'Portfólio do melhor desenvolvedor do planeta' COMMENT 'Descrição site',
  `name` varchar(150) NOT NULL DEFAULT 'Wescley Andrade' COMMENT 'Nome portfólio',
  `label` varchar(150) NOT NULL DEFAULT 'Expert em análise e desenvolvimento de sistemas' COMMENT 'Cargo',
  `presentation` varchar(150) DEFAULT NULL COMMENT 'Conteúdo em destaque',
  `about` varchar(500) DEFAULT NULL,
  `contact` varchar(50) NOT NULL COMMENT 'E-mail ou WhatsApp',
  `github` varchar(150) DEFAULT NULL,
  `youtube` varchar(150) DEFAULT NULL,
  `linkedin` varchar(150) DEFAULT NULL,
  `deepseek` varchar(150) DEFAULT NULL COMMENT 'API KEY DEEPSEEK',
  `iaName` varchar(50) DEFAULT NULL COMMENT 'Nome IA',
  `theme` int DEFAULT '0' COMMENT 'Tema padrão, 0=dark, 1=light',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Configurações principais';

-- Copiando dados para a tabela portfolio.config: ~1 rows (aproximadamente)
INSERT INTO `config` (`id`, `title`, `description`, `name`, `label`, `presentation`, `about`, `contact`, `github`, `youtube`, `linkedin`, `deepseek`, `iaName`, `theme`) VALUES
	(1, 'teste', 'desc test', 'name ok', 'label ok', NULL, NULL, 'contact ok 2', NULL, NULL, NULL, NULL, NULL, NULL);

-- Copiando estrutura para tabela portfolio.hardskills
CREATE TABLE IF NOT EXISTS `hardskills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `description` varchar(300) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `display_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela portfolio.hardskills: ~1 rows (aproximadamente)
INSERT INTO `hardskills` (`id`, `title`, `description`, `icon`, `category`, `display_order`) VALUES
	(1, 'teste2', 'desc test 222', 'contact ok 2', '', 0);

-- Copiando estrutura para tabela portfolio.history
CREATE TABLE IF NOT EXISTS `history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '0',
  `description` varchar(500) NOT NULL DEFAULT '0',
  `image` varchar(150) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Seção história';

-- Copiando dados para a tabela portfolio.history: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela portfolio.images_projects
CREATE TABLE IF NOT EXISTS `images_projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project` int NOT NULL,
  `image` varchar(150) NOT NULL DEFAULT '',
  `description` varchar(300) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `project` (`project`),
  CONSTRAINT `project_images` FOREIGN KEY (`project`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela portfolio.images_projects: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela portfolio.metrics
CREATE TABLE IF NOT EXISTS `metrics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` int NOT NULL,
  `name` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Métricas do portfólio, sub-seção about';

-- Copiando dados para a tabela portfolio.metrics: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela portfolio.projects
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `description` varchar(500) NOT NULL,
  `image` varchar(150) NOT NULL,
  `action` varchar(50) NOT NULL DEFAULT 'view' COMMENT 'Ação: view - normal, path - testar tempo real',
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela portfolio.projects: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela portfolio.softskills
CREATE TABLE IF NOT EXISTS `softskills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela portfolio.softskills: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela portfolio.videos
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '0',
  `link` varchar(150) NOT NULL DEFAULT '0',
  `description` varchar(500) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela portfolio.videos: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela portfolio.works
CREATE TABLE IF NOT EXISTS `works` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `time` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela portfolio.works: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
