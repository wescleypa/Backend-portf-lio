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

-- Copiando dados para a tabela portfolio.changelog: ~8 rows (aproximadamente)
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
  `icon` varchar(150) DEFAULT NULL,
  `description` varchar(150) NOT NULL DEFAULT 'Portfólio do melhor desenvolvedor do planeta' COMMENT 'Descrição site',
  `name` varchar(150) NOT NULL DEFAULT 'Wescley Andrade' COMMENT 'Nome portfólio',
  `label` varchar(150) NOT NULL DEFAULT 'Expert em análise e desenvolvimento de sistemas' COMMENT 'Cargo',
  `presentation` varchar(150) DEFAULT NULL COMMENT 'Conteúdo em destaque',
  `about` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
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
INSERT INTO `config` (`id`, `title`, `icon`, `description`, `name`, `label`, `presentation`, `about`, `contact`, `github`, `youtube`, `linkedin`, `deepseek`, `iaName`, `theme`) VALUES
	(1, 'Wescley Andrade', 'logo.png', 'desc test', 'Wescley', 'Desenvolvedor analista de Sistemas', NULL, '<p>Olá, meu nome é <strong>Wescley</strong>, como já deve saber, rs!</p>\r\n                    <p>Sou uma pessoa apaixonada por desafios e movida pela curiosidade. Acredito que a tecnologia tem o poder de transformar o mundo, não apenas no campo científico, mas também impactando a vida das pessoas de maneiras profundas e significativas. Seja criando oportunidades, conectando pessoas ou até mesmo salvando vidas, a tecnologia é a ferramenta que nos permite transformar sonhos em realidade.</p>\r\n                    <blockquote>\r\n                      <em>"Posso não fazer aquilo que gosto, mas sempre vou gostar daquilo que faço."</em>\r\n                    </blockquote>\r\n                    <p>Essa mentalidade me motiva a dar o meu melhor em tudo o que me proponho a realizar, enfrentando cada desafio com dedicação, resiliência e otimismo.</p>\r\n                    <p>Sou organizado, criativo e um eterno aprendiz, sempre em busca de novos conhecimentos e experiências para compartilhar. Acredito que a colaboração e a troca de ideias são essenciais para construir soluções que realmente façam a diferença.</p>\r\n                    <p>Vamos juntos criar algo incrível?</p>', '19995922053', NULL, NULL, NULL, NULL, 'Camila', NULL);

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
  `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `image` varchar(150) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Seção história';

-- Copiando dados para a tabela portfolio.history: ~6 rows (aproximadamente)
INSERT INTO `history` (`id`, `title`, `description`, `image`) VALUES
	(1, '🚀 Como comecei na Tecnologia', 'Minha jornada na tecnologia começou por pura curiosidade. Sempre gostei de entender como as coisas funcionam, desmontar objetos e tentar remontá-los. A primeira vez que sentei em frente a um computador foi um misto de fascínio e desafio. Não demorou muito para que eu percebesse que queria mais do que ser apenas um usuário; eu queria criar, construir e transformar. O primeiro \'Olá, Mundo!\' que escrevi foi mágico, e desde então não parei mais.', 'https://souwescley.com/static/media/1.45f402745dec971fa65cad2a6d14f28c.svg'),
	(2, '💡 Minhas motivações', 'O que me motiva todos os dias é a possibilidade de fazer a diferença. A tecnologia não é apenas código ou máquinas; é uma ponte para melhorar vidas, resolver problemas e criar conexões. Cada desafio que enfrento me motiva ainda mais, porque sei que, ao superá-lo, estarei mais perto de construir algo significativo. Além disso, ver pessoas utilizando soluções que eu criei me dá uma sensação incrível de realização.', 'https://souwescley.com/static/media/2.754142c120e9b52a7b2031a7f3f1c162.svg'),
	(3, '🌟 Minha inspiração', 'Minha maior inspiração na tecnologia é Elon Musk. O que mais admiro nele é a maneira como utiliza a tecnologia para resolver problemas reais, como a Starlink, que oferece internet para pessoas em áreas remotas, longe das grandes cidades, permitindo acesso à conectividade onde antes era impossível. Além disso, ele criou o incrível foguete reutilizável, que é capaz de pousar sozinho, quebrando a frase possívelmente mais famosa da história (Foguete não tem ré), agora tem rs. revolucionando a exploração espacial e tornando o impossível acessível. Sua visão prática e ousada de como a tecnologia pode impactar a vida das pessoas me inspira a buscar soluções inovadoras e transformar desafios em oportunidades.', 'https://souwescley.com/static/media/3.e31e2e8a435e577c0f25629260d62691.svg'),
	(4, '🔥 Desafios e lições', 'Minha trajetória não foi isenta de desafios, e sou grato por isso. Tive momentos em que me senti sobrecarregado, projetos que não deram certo e até dúvidas sobre minha capacidade. Mas cada obstáculo me ensinou algo valioso: a importância de persistir, de aprender com os erros e de valorizar cada pequeno progresso. Hoje, vejo os desafios como oportunidades para crescer, tanto profissionalmente quanto pessoalmente.', 'https://souwescley.com/static/media/4.7f0bcb69107a7a9eba30c0dcd9705940.svg'),
	(5, '🌍 Visão de futuro', 'Minha visão de futuro não gira apenas em torno da tecnologia; também quero crescer como pessoa, me aperfeiçoando e me tornando alguém melhor a cada dia. Quero construir um futuro onde a tecnologia seja um meio poderoso de transformação, não apenas para facilitar a vida das pessoas, mas para literalmente mudá-la. Sonho em usar a tecnologia para melhorar o acesso a serviços essenciais, como hospitais, clínicas e iniciativas voltadas para quem mais precisa, seja pela falta de recursos ou de oportunidades. Minha missão é fazer com que a tecnologia não seja só uma ferramenta, mas um caminho de esperança e renovação para aqueles que, muitas vezes, não têm voz.', 'https://souwescley.com/static/media/5.93b7b296a643e0f730b95fb4fe9c6aed.svg'),
	(6, '🌴 Vida fora daqui', 'Apesar de amar o que faço, acredito no equilíbrio. Fora da tecnologia, gosto de aproveitar momentos simples, como estar com amigos, família ou simplesmente relaxar. Tenho hobbies que me ajudam a desconectar, como assistir séries de ficção ou sentar na calçada e olhar as estrelas, e sempre busco um tempo para recarregar as energias. Acredito que nossas paixões fora do trabalho também refletem em quem somos como profissionais, e tento trazer esse equilíbrio para tudo o que faço.', 'https://souwescley.com/static/media/6.49333ec6de799318f0a016540697830c.svg');

-- Copiando estrutura para tabela portfolio.images_projects
CREATE TABLE IF NOT EXISTS `images_projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project` int NOT NULL,
  `image` varchar(150) NOT NULL DEFAULT '',
  `description` varchar(300) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `project` (`project`),
  CONSTRAINT `project_images` FOREIGN KEY (`project`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela portfolio.images_projects: ~3 rows (aproximadamente)
INSERT INTO `images_projects` (`id`, `project`, `image`, `description`) VALUES
	(9, 3, 'img1', ''),
	(10, 3, 'blabla5', ''),
	(11, 3, 'oie', '');

-- Copiando estrutura para tabela portfolio.metrics
CREATE TABLE IF NOT EXISTS `metrics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(150) DEFAULT NULL,
  `value` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Métricas do portfólio, sub-seção about';

-- Copiando dados para a tabela portfolio.metrics: ~6 rows (aproximadamente)
INSERT INTO `metrics` (`id`, `icon`, `value`, `name`) VALUES
	(1, '👨‍💻', '10', 'anos programando'),
	(2, '📝', '1', 'milhão em linhas de código escritas'),
	(3, '🚀', '100', 'projetos trabalhados'),
	(4, '⏱️', '10.000', 'horas programando'),
	(5, '🎥', '40', 'vídeos no Youtube'),
	(6, '⭐', '25.000', 'visualizações no Youtube');

-- Copiando estrutura para tabela portfolio.projects
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `description` varchar(500) NOT NULL,
  `image` varchar(150) NOT NULL,
  `action` varchar(50) NOT NULL DEFAULT 'view' COMMENT 'Ação: view - normal, path - testar tempo real',
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela portfolio.projects: ~3 rows (aproximadamente)
INSERT INTO `projects` (`id`, `title`, `description`, `image`, `action`, `path`) VALUES
	(1, 'Title4', 'teste desc', 'image test', 'view', NULL),
	(2, 'Title4', 'teste desc', 'image test', 'view', NULL),
	(3, 'Title4', 'teste desc', 'image test', 'view', NULL);

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
