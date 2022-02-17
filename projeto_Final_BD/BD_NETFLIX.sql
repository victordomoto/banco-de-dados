-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: NETFLIX
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Ator`
--

DROP TABLE IF EXISTS `Ator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ator` (
  `codAtor` int NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `sobrenome` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codAtor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ator`
--

LOCK TABLES `Ator` WRITE;
/*!40000 ALTER TABLE `Ator` DISABLE KEYS */;
INSERT INTO `Ator` VALUES (1,'Tom','Hanks'),(2,'Will','Smith'),(3,'Meryl','Streep'),(4,'Tom','Crise'),(5,'Camila','Queiroz'),(6,'Henry','Cavill'),(7,'Cillian','Murphy'),(8,'Ella','Purnell'),(9,'Bryan','Cranston'),(10,'Gabriel','Macht');
/*!40000 ALTER TABLE `Ator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartaoCreditoDebito`
--

DROP TABLE IF EXISTS `CartaoCreditoDebito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CartaoCreditoDebito` (
  `codFormPag` int DEFAULT NULL,
  `codCartaoCredDebito` int NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `sobrenome` varchar(20) DEFAULT NULL,
  `numCartao` varchar(20) DEFAULT NULL,
  `dataValidade` date DEFAULT NULL,
  `codigoCVV` int DEFAULT NULL,
  PRIMARY KEY (`codCartaoCredDebito`),
  KEY `codFormPag` (`codFormPag`),
  CONSTRAINT `CartaoCreditoDebito_ibfk_1` FOREIGN KEY (`codFormPag`) REFERENCES `formaPagamento` (`codFormPag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartaoCreditoDebito`
--

LOCK TABLES `CartaoCreditoDebito` WRITE;
/*!40000 ALTER TABLE `CartaoCreditoDebito` DISABLE KEYS */;
INSERT INTO `CartaoCreditoDebito` VALUES (1,1,'Yuri','Araujo','0000 1111 2222 3333','2026-02-09',199),(1,2,'Victor','Domoto','1111 1111 2222 3333','2026-03-10',299),(1,3,'Henrique','Andrade','2222 1111 2222 3333','2026-04-11',399),(1,4,'Ana','Santos','3333 1111 4444 7777','2025-07-12',156),(1,5,'Maria','Silva','4444 7896 1254 6532','2022-11-12',986),(2,6,'João','Pedro','5555 6589 8759 9832','2029-10-02',986);
/*!40000 ALTER TABLE `CartaoCreditoDebito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartaoPrePago`
--

DROP TABLE IF EXISTS `CartaoPrePago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CartaoPrePago` (
  `codFormPag` int DEFAULT NULL,
  `codCartaoPrePago` int NOT NULL,
  `PIN` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codCartaoPrePago`),
  KEY `codFormPag` (`codFormPag`),
  CONSTRAINT `CartaoPrePago_ibfk_1` FOREIGN KEY (`codFormPag`) REFERENCES `formaPagamento` (`codFormPag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartaoPrePago`
--

LOCK TABLES `CartaoPrePago` WRITE;
/*!40000 ALTER TABLE `CartaoPrePago` DISABLE KEYS */;
INSERT INTO `CartaoPrePago` VALUES (2,1,'a123bc'),(2,2,'5a6s5e'),(2,3,'9a8e7r'),(2,4,'2a5w62'),(2,5,'85a2e1');
/*!40000 ALTER TABLE `CartaoPrePago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Conteudo`
--

DROP TABLE IF EXISTS `Conteudo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Conteudo` (
  `codConteudo` int NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `criacao` date DEFAULT NULL,
  `classEtaria` int DEFAULT NULL,
  `relevancia` int DEFAULT NULL,
  PRIMARY KEY (`codConteudo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conteudo`
--

LOCK TABLES `Conteudo` WRITE;
/*!40000 ALTER TABLE `Conteudo` DISABLE KEYS */;
INSERT INTO `Conteudo` VALUES (1,'The Witcher','2019-12-20',18,99),(2,'Peaky Blinders','2013-09-12',18,94),(3,'Arcane','2021-09-06',14,100),(4,'Breaking Bad','2008-01-20',18,98),(5,'Suits','2011-07-23',14,98),(6,'Ilha do Medo','2010-05-16',16,92),(7,'El Camino','2019-08-13',16,90),(8,'Arcane','2021-09-06',14,100),(9,'Scarface','1983-02-23',18,89),(10,'Fuja','2021-04-07',16,91);
/*!40000 ALTER TABLE `Conteudo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Filme`
--

DROP TABLE IF EXISTS `Filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Filme` (
  `codConteudo` int NOT NULL,
  `tempoDuracao` time DEFAULT NULL,
  PRIMARY KEY (`codConteudo`),
  CONSTRAINT `Filme_ibfk_1` FOREIGN KEY (`codConteudo`) REFERENCES `Conteudo` (`codConteudo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Filme`
--

LOCK TABLES `Filme` WRITE;
/*!40000 ALTER TABLE `Filme` DISABLE KEYS */;
INSERT INTO `Filme` VALUES (6,'02:56:00'),(7,'01:40:50'),(8,'00:59:45'),(9,'03:01:52'),(10,'01:25:48');
/*!40000 ALTER TABLE `Filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genero`
--

DROP TABLE IF EXISTS `Genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genero` (
  `codGenero` int NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genero`
--

LOCK TABLES `Genero` WRITE;
/*!40000 ALTER TABLE `Genero` DISABLE KEYS */;
INSERT INTO `Genero` VALUES (1,'Anime','contém animação'),(2,'Ação','contém ação'),(3,'Drama','contém drama'),(4,'Comédia','contém comédia'),(5,'Aventura','contém aventura');
/*!40000 ALTER TABLE `Genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Perfil`
--

DROP TABLE IF EXISTS `Perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Perfil` (
  `codPerfil` int NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `classEtaria` int DEFAULT NULL,
  `iniEpAuto` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codPerfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Perfil`
--

LOCK TABLES `Perfil` WRITE;
/*!40000 ALTER TABLE `Perfil` DISABLE KEYS */;
INSERT INTO `Perfil` VALUES (1,'Yuri',18,0),(2,'Victor',18,0),(3,'Julio',14,1),(4,'Ana',16,0),(5,'Maria',10,1);
/*!40000 ALTER TABLE `Perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Personagem`
--

DROP TABLE IF EXISTS `Personagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Personagem` (
  `codPersonagem` int NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `sobrenome` varchar(20) DEFAULT NULL,
  `codConteudo` int DEFAULT NULL,
  `codAtor` int DEFAULT NULL,
  PRIMARY KEY (`codPersonagem`),
  KEY `codConteudo` (`codConteudo`),
  KEY `codAtor` (`codAtor`),
  CONSTRAINT `Personagem_ibfk_1` FOREIGN KEY (`codConteudo`) REFERENCES `Conteudo` (`codConteudo`),
  CONSTRAINT `Personagem_ibfk_2` FOREIGN KEY (`codAtor`) REFERENCES `Ator` (`codAtor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personagem`
--

LOCK TABLES `Personagem` WRITE;
/*!40000 ALTER TABLE `Personagem` DISABLE KEYS */;
INSERT INTO `Personagem` VALUES (1,'Geralt','Rivia',1,6),(2,'Tommy','Shelby',2,7),(3,'Jinx','Powder',3,8),(4,'Walter','White',4,9),(5,'Harvey','Specter',5,10);
/*!40000 ALTER TABLE `Personagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plano`
--

DROP TABLE IF EXISTS `Plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plano` (
  `codPlano` int NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `qualidade` varchar(20) DEFAULT NULL,
  `resolucao` varchar(20) DEFAULT NULL,
  `disponibilidade` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codPlano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plano`
--

LOCK TABLES `Plano` WRITE;
/*!40000 ALTER TABLE `Plano` DISABLE KEYS */;
INSERT INTO `Plano` VALUES (1,'Básico',25.9,'Boa','480p',1),(2,'Padrão',39.9,'Melhor','1080p',1),(3,'Premium',55.9,'Superior ','4K+HDR',1);
/*!40000 ALTER TABLE `Plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlanoPagto`
--

DROP TABLE IF EXISTS `PlanoPagto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PlanoPagto` (
  `codPlano` int NOT NULL,
  `codFormPag` int NOT NULL,
  PRIMARY KEY (`codPlano`,`codFormPag`),
  KEY `codFormPag` (`codFormPag`),
  CONSTRAINT `PlanoPagto_ibfk_1` FOREIGN KEY (`codPlano`) REFERENCES `Plano` (`codPlano`),
  CONSTRAINT `PlanoPagto_ibfk_2` FOREIGN KEY (`codFormPag`) REFERENCES `formaPagamento` (`codFormPag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlanoPagto`
--

LOCK TABLES `PlanoPagto` WRITE;
/*!40000 ALTER TABLE `PlanoPagto` DISABLE KEYS */;
INSERT INTO `PlanoPagto` VALUES (1,1),(2,1),(3,1),(2,2),(3,2);
/*!40000 ALTER TABLE `PlanoPagto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Serie`
--

DROP TABLE IF EXISTS `Serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Serie` (
  `codConteudo` int NOT NULL,
  `quantTemporadas` int DEFAULT NULL,
  PRIMARY KEY (`codConteudo`),
  CONSTRAINT `Serie_ibfk_1` FOREIGN KEY (`codConteudo`) REFERENCES `Conteudo` (`codConteudo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Serie`
--

LOCK TABLES `Serie` WRITE;
/*!40000 ALTER TABLE `Serie` DISABLE KEYS */;
INSERT INTO `Serie` VALUES (1,2),(2,4),(3,1),(4,5),(5,5);
/*!40000 ALTER TABLE `Serie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `codUsuario` int NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `sobrenome` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `senha` varchar(30) DEFAULT NULL,
  `codPlano` int DEFAULT NULL,
  PRIMARY KEY (`codUsuario`),
  KEY `codPlano` (`codPlano`),
  CONSTRAINT `Usuario_ibfk_1` FOREIGN KEY (`codPlano`) REFERENCES `Plano` (`codPlano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'Yuri','Araujo','yuri.araujo@unifesp.br','1234',3),(2,'Victor','Akio','victor.domoto@unifesp.br','4321',2),(3,'Henrique','Andrade','Henrique.Andrade@unifesp.br','2424',1),(4,'Ana','Santos','ana.santos@unifesp.br','5469',2),(5,'Maria','Silva','maria.silva@unifesp.br','7896',3);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cenasMomentos`
--

DROP TABLE IF EXISTS `cenasMomentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cenasMomentos` (
  `codCenasMomentos` int NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codCenasMomentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cenasMomentos`
--

LOCK TABLES `cenasMomentos` WRITE;
/*!40000 ALTER TABLE `cenasMomentos` DISABLE KEYS */;
INSERT INTO `cenasMomentos` VALUES (1,'Violencia','Contem cenas com violencia'),(2,'Empolgantes','Contem cenas empolgantes'),(3,'Irreverentes','Contem cenas irreverentes'),(4,'Suspense no ar','Contem cenas com suspense'),(5,'Humor seco','Contem cenas com humor seco');
/*!40000 ALTER TABLE `cenasMomentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conteudoGeneroCenasMomentos`
--

DROP TABLE IF EXISTS `conteudoGeneroCenasMomentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conteudoGeneroCenasMomentos` (
  `codConteudo` int NOT NULL,
  `codGenero` int NOT NULL,
  `codCenasMomentos` int NOT NULL,
  PRIMARY KEY (`codConteudo`,`codGenero`,`codCenasMomentos`),
  KEY `codGenero` (`codGenero`),
  KEY `codCenasMomentos` (`codCenasMomentos`),
  CONSTRAINT `conteudoGeneroCenasMomentos_ibfk_1` FOREIGN KEY (`codConteudo`) REFERENCES `Conteudo` (`codConteudo`),
  CONSTRAINT `conteudoGeneroCenasMomentos_ibfk_2` FOREIGN KEY (`codGenero`) REFERENCES `Genero` (`codGenero`),
  CONSTRAINT `conteudoGeneroCenasMomentos_ibfk_3` FOREIGN KEY (`codCenasMomentos`) REFERENCES `cenasMomentos` (`codCenasMomentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conteudoGeneroCenasMomentos`
--

LOCK TABLES `conteudoGeneroCenasMomentos` WRITE;
/*!40000 ALTER TABLE `conteudoGeneroCenasMomentos` DISABLE KEYS */;
INSERT INTO `conteudoGeneroCenasMomentos` VALUES (5,1,4),(4,2,2),(2,3,1),(3,4,3),(1,5,2);
/*!40000 ALTER TABLE `conteudoGeneroCenasMomentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formaPagamento`
--

DROP TABLE IF EXISTS `formaPagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formaPagamento` (
  `codFormPag` int NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codFormPag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formaPagamento`
--

LOCK TABLES `formaPagamento` WRITE;
/*!40000 ALTER TABLE `formaPagamento` DISABLE KEYS */;
INSERT INTO `formaPagamento` VALUES (1,'CartaoCreditoDebito'),(2,'CartaoPrePago');
/*!40000 ALTER TABLE `formaPagamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-16 22:01:46
