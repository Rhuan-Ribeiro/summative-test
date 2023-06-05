-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hogwarts_environment
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `checkin`
--

DROP TABLE IF EXISTS `checkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `eventoFk` bigint NOT NULL,
  `usuarioFk` bigint NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `eventoFk` (`eventoFk`),
  KEY `usuarioFk` (`usuarioFk`),
  CONSTRAINT `checkIn_ibfk_1` FOREIGN KEY (`eventoFk`) REFERENCES `eventos` (`id`),
  CONSTRAINT `checkIn_ibfk_2` FOREIGN KEY (`usuarioFk`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin`
--

LOCK TABLES `checkin` WRITE;
/*!40000 ALTER TABLE `checkin` DISABLE KEYS */;
INSERT INTO `checkin` VALUES (1,1,1,'2023-05-23 00:21:13'),(2,1,2,'2023-05-23 00:21:13'),(3,1,5,'2023-05-23 00:21:13'),(4,2,2,'2023-05-23 00:21:13'),(5,2,4,'2023-05-23 00:21:13'),(6,2,5,'2023-05-23 00:21:13'),(7,2,6,'2023-05-23 00:21:13'),(8,3,1,'2023-05-23 00:21:13'),(9,3,6,'2023-05-23 00:21:13'),(10,4,3,'2023-05-23 00:21:13'),(11,4,4,'2023-05-23 00:21:13'),(12,4,5,'2023-05-23 00:21:13'),(13,1,5,'2023-05-23 01:40:58'),(14,1,6,'2023-05-23 01:40:58');
/*!40000 ALTER TABLE `checkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist`
--

DROP TABLE IF EXISTS `checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checklist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `localFk` bigint NOT NULL,
  `itemFk` bigint NOT NULL,
  `qtd` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `localFk` (`localFk`),
  KEY `itemFk` (`itemFk`),
  CONSTRAINT `checkList_ibfk_1` FOREIGN KEY (`localFk`) REFERENCES `locais` (`id`),
  CONSTRAINT `checkList_ibfk_2` FOREIGN KEY (`itemFk`) REFERENCES `item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist`
--

LOCK TABLES `checklist` WRITE;
/*!40000 ALTER TABLE `checklist` DISABLE KEYS */;
INSERT INTO `checklist` VALUES (1,1,1,1),(2,1,2,1),(3,1,5,1),(4,2,1,1),(5,2,5,1),(6,3,3,1),(7,3,2,1),(8,4,1,1),(9,4,2,1),(10,4,3,1),(11,4,5,1);
/*!40000 ALTER TABLE `checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `localFk` bigint NOT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime NOT NULL,
  `inicioCheckIn` datetime NOT NULL,
  `fimCheckIn` datetime NOT NULL,
  `vagas` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `localFk` (`localFk`),
  CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`localFk`) REFERENCES `locais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'Workshop Cloud Básico',5,'2023-07-07 18:45:00','2023-07-07 23:10:00','2023-06-07 18:45:00','2023-07-07 18:45:00',32),(2,'Desenho Técnico SolidWorks',5,'2023-08-01 18:45:00','2023-08-02 23:10:00','2023-06-08 18:45:00','2023-08-01 18:45:00',32),(3,'Ensaios Mecânicos Avançados',4,'2023-12-01 18:45:00','2023-12-02 23:10:00','2023-12-08 18:45:00','2023-12-01 18:45:00',30),(4,'Conquistando o primeiro milhão',2,'2023-12-12 18:45:00','2023-12-12 23:10:00','2023-12-12 18:45:00','2023-12-12 18:45:00',100),(5,'Como fazer ovo de pascoa',1,'2023-01-01 18:45:00','2023-01-01 23:10:00','2023-01-01 18:45:00','2023-01-01 18:45:00',16);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Projetor'),(2,'Ar condicionado'),(3,'Lousa digital'),(4,'Home Theater'),(5,'Ipad'),(6,'Ferro de Solda');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locais`
--

DROP TABLE IF EXISTS `locais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locais` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `bloco` enum('A','B','C','D') NOT NULL,
  `lotacao` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locais`
--

LOCK TABLES `locais` WRITE;
/*!40000 ALTER TABLE `locais` DISABLE KEYS */;
INSERT INTO `locais` VALUES (1,'Laboratório Eletrônica 01','A',16),(2,'Auditório','C',100),(3,'Laboratório Eletrônica 02','B',16),(4,'Laboratório Mecânica 01','A',30),(5,'Laboratório Informática 01','D',32);
/*!40000 ALTER TABLE `locais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivelacesso`
--

DROP TABLE IF EXISTS `nivelacesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivelacesso` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nivel` varchar(100) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivelacesso`
--

LOCK TABLES `nivelacesso` WRITE;
/*!40000 ALTER TABLE `nivelacesso` DISABLE KEYS */;
INSERT INTO `nivelacesso` VALUES (1,'Admin','blablá'),(2,'Gestor','blablá'),(3,'Usuário','blablá'),(4,'Visitante','blablá');
/*!40000 ALTER TABLE `nivelacesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocupacao`
--

DROP TABLE IF EXISTS `ocupacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocupacao` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `nivelAcessoFk` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nivelAcessoFk` (`nivelAcessoFk`),
  CONSTRAINT `ocupacao_ibfk_1` FOREIGN KEY (`nivelAcessoFk`) REFERENCES `nivelacesso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupacao`
--

LOCK TABLES `ocupacao` WRITE;
/*!40000 ALTER TABLE `ocupacao` DISABLE KEYS */;
INSERT INTO `ocupacao` VALUES (1,'Professor',3),(2,'Secretaria',3),(3,'Coordenador',2),(4,'Orientador',2),(5,'Aluno',4),(6,'TI',1);
/*!40000 ALTER TABLE `ocupacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos_in_status`
--

DROP TABLE IF EXISTS `photos_in_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos_in_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status_fk` bigint NOT NULL,
  `hreaf` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_fk` (`status_fk`),
  CONSTRAINT `photos_in_status_ibfk_1` FOREIGN KEY (`status_fk`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos_in_status`
--

LOCK TABLES `photos_in_status` WRITE;
/*!40000 ALTER TABLE `photos_in_status` DISABLE KEYS */;
INSERT INTO `photos_in_status` VALUES (1,1,'foto_banana.png'),(2,2,'equipe reunida.jpg'),(3,3,'sala limpinha.png'),(4,4,'relatorio.pdf'),(5,5,'gaveta_ferramentas.jpg'),(6,6,'recibo.pdf'),(7,7,'workstation.jpg'),(8,8,'nota_fiscal_tecnico'),(9,11,'equipamentos.jpg'),(10,13,'equipamentos_funcionando.jpg');
/*!40000 ALTER TABLE `photos_in_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requester_responsibles`
--

DROP TABLE IF EXISTS `requester_responsibles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requester_responsibles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `task_fk` bigint NOT NULL,
  `requester_fk` bigint NOT NULL,
  `responsible_fk` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task_fk` (`task_fk`),
  KEY `requester_fk` (`requester_fk`),
  KEY `responsible_fk` (`responsible_fk`),
  CONSTRAINT `requester_responsibles_ibfk_1` FOREIGN KEY (`task_fk`) REFERENCES `tasks` (`id`),
  CONSTRAINT `requester_responsibles_ibfk_2` FOREIGN KEY (`requester_fk`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `requester_responsibles_ibfk_3` FOREIGN KEY (`responsible_fk`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requester_responsibles`
--

LOCK TABLES `requester_responsibles` WRITE;
/*!40000 ALTER TABLE `requester_responsibles` DISABLE KEYS */;
INSERT INTO `requester_responsibles` VALUES (1,1,4,2),(2,1,4,5),(3,2,1,4),(4,3,4,2),(5,4,1,4),(6,5,1,4),(8,10,1,4),(9,10,1,4);
/*!40000 ALTER TABLE `requester_responsibles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `task_fk` bigint NOT NULL,
  `progress` enum('open','in progress','done','finish') DEFAULT NULL,
  `moment` datetime DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task_fk` (`task_fk`),
  CONSTRAINT `status_ibfk_1` FOREIGN KEY (`task_fk`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,1,'open','2023-06-03 17:17:54','Foi encontrado muitas cascas de banana no laboratório de Eletrônica 01, favor entrar em contato com a equipe de manutenção.'),(2,1,'in progress','2023-06-12 07:00:00','A Equipe de limpeza já está sendo encaminhada'),(3,1,'done','2023-06-12 07:20:00','Sala completamente limpa e higienizada'),(4,1,'finish','2023-06-12 08:00:00','Gerente da equipe de limpeza acaba de confirmar a limpeza de todos os laboratorios, tarefa finalizada.'),(5,2,'open','2023-06-13 12:00:30','durante a ultima aula de eletronica, um aluno constou a falta de uma ferramenta no laboratorio, o professor confirmou a falta. Por favor fazer a reposição.'),(6,2,'in progress','2023-06-14 13:00:00','A compra do equipamento já foi realizada, o produto já está nos correios, aguardamos a chegada.'),(7,3,'open','2023-06-10 20:00:00','Os computadores e demais equipamentos começaram a apresentar falhas, devido ao acumulo de sujeira. Favor realizar a limpeza dos equipamentos.'),(8,3,'in progress','2023-06-11 14:00:00','O técnico de manutenção já está fazendo a limpeza e manutenção dos equipamentos.'),(9,3,'done','2023-06-13 16:40:00','O técnico chamou a equipe de estágiarios para agilizar o processo e eles terminaram em tempo recorde!'),(10,3,'finish','2023-06-13 17:20:00','O Roberto já confirmou que os equipamentos estão nos conformes, tarefa finalizada.'),(11,4,'open','2023-06-15 12:00:00','5 capacitores estão queimados, serão necessários para a aula da semana que vem.'),(12,4,'in progress','2023-06-15 13:00:00','O técnico confirmou  que o equipamento está danificado, mas não é devido a curto, ele está realizando a manutenção.'),(13,4,'done','2023-06-15 20:00:00','Manutenção já foi finalizada.'),(14,4,'finish','2023-06-15 12:00:00','tarefa finalizada.'),(15,5,'open','2023-06-03 18:33:50','Vou precisar do projeto na sala de informática, poderiam instalar lá antes da aula?');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `ambient` bigint NOT NULL,
  `term` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ambient` (`ambient`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`ambient`) REFERENCES `locais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'CASCA DE BANANA LABETC1!!!','Foi encontrado muitas cascas de banana no laboratório de Eletrônica 01, favor entrar em contato com a equipe de manutenção.',1,'2023-06-05 09:00:00'),(2,'Furto de Ferramentas no LABETC1','durante a ultima aula de eletronica, um aluno constou a falta de uma ferramenta no laboratorio, o professor confirmou a falta. Por favor fazer a reposição.',1,NULL),(3,'Sujeiro no Workstation','Os computadores e demais equipamentos começaram a apresentar falhas, devido ao acumulo de sujeira. Favor realizar a limpeza dos equipamentos.',5,NULL),(4,'Equipamento queimado no LABEETC2','5 capacitores estão queimados, serão necessários para a aulan da semana que vem.',3,NULL),(5,'Projetor na sala de informatica','Vou precisar do projeto na sala de informática, poderiam instalar lá antes da aula?',5,'2023-06-29 19:00:00'),(10,'Novos cabos de vídeo no LabINF','Os cabos de vídeo dos computadores no laboratório de informática é antigo, eles precisam ser atualizados para a mudança de monitores que vai ocorrer no próximo semestre',5,'2023-08-01 19:00:00');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `dataNascimento` date NOT NULL,
  `senha` varchar(30) NOT NULL,
  `dataCadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ocupacaoFk` bigint NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `href` mediumtext,
  `phoneNumber` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ocupacaoFk` (`ocupacaoFk`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ocupacaoFk`) REFERENCES `ocupacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'João','joao@gmail.com','2000-01-01','55s888ff','2023-05-22 23:56:10',1,1,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fgatinhobranco.com%2Fas-incriveis-fotos-de-gatinhos-no-ar-de-set-casteel%2F&psig=AOvVaw1vQNDBQksFIpeqitZKgRtC&ust=1685487774000000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCLiM2IPSm_8CFQAAAAAdAAAAABAD',19923579999),(2,'Mara','mara@gmail.com','1986-01-03','554333','2023-05-22 23:56:10',2,1,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fimg.freepik.com%2Ffotos-gratis%2Fbela-foto-de-um-gatinho-branco-de-pelo-curto-britanico_181624-57681.jpg&tbnid=1vtGxkLrjqZdcM&vet=12ahUKEwix64P40Zv_AhX5N7kGHXaUDM4QMygSegUIARCAAg..i&imgrefurl=https%3A%2F%2Fbr.freepik.com%2Ffotos%2Fgatinhos-fofos&docid=VzQNp0fbekdmDM&w=626&h=417&q=gatinhos&ved=2ahUKEwix64P40Zv_AhX5N7kGHXaUDM4QMygSegUIARCAAg',19969737013),(3,'Clarice','clarice@gmail.com','1999-03-01','54455s888ff','2023-05-22 23:56:10',3,1,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.portaltemponovo.com.br%2Fwp-content%2Fuploads%2F2015%2F11%2F12234979_1134166789928584_6344288969896541909_n.jpg&tbnid=sGG12rjlzwtzVM&vet=12ahUKEwix64P40Zv_AhX5N7kGHXaUDM4QMygZegUIARCVAg..i&imgrefurl=https%3A%2F%2Fwww.portaltemponovo.com.br%2Fgatinhos-preto-para-adocao%2F&docid=ZdaOGFd1jukzUM&w=960&h=960&q=gatinhos&ved=2ahUKEwix64P40Zv_AhX5N7kGHXaUDM4QMygZegUIARCVAg',19989086561),(4,'Roberto','roberto@gmail.com','2001-01-21','6666444','2023-05-22 23:56:10',4,1,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.loucadosgatos.com%2Fwp-content%2Fuploads%2F2015%2F09%2FPersa-BJ-1-melhor-gato-2014-676x368.jpg&tbnid=IHJLIOfzkVAc8M&vet=12ahUKEwix64P40Zv_AhX5N7kGHXaUDM4QMygqegUIARC5Ag..i&imgrefurl=https%3A%2F%2Fwww.loucadosgatos.com%2Fgatinhos-fofos-por-todas-as-partes%2F&docid=Y_w2wX1R__nWlM&w=676&h=368&q=gatinhos&ved=2ahUKEwix64P40Zv_AhX5N7kGHXaUDM4QMygqegUIARC5Ag',199348490592),(5,'Miguel','miguel@gmail.com','1995-03-03','3354','2023-05-22 23:56:10',1,1,'https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.loucadosgatos.com%2Fwp-content%2Fuploads%2F2015%2F09%2FPersa-BJ-1-melhor-gato-2014-676x368.jpg&tbnid=IHJLIOfzkVAc8M&vet=12ahUKEwix64P40Zv_AhX5N7kGHXaUDM4QMygqegUIARC5Ag..i&imgrefurl=https%3A%2F%2Fwww.loucadosgatos.com%2Fgatinhos-fofos-por-todas-as-partes%2F&docid=Y_w2wX1R__nWlM&w=676&h=368&q=gatinhos&ved=2ahUKEwix64P40Zv_AhX5N7kGHXaUDM4QMygqegUIARC5Ag',19955336733),(6,'Lúcia','lucia@gmail.com','1970-05-25','abbbcdd','2023-05-22 23:56:10',2,1,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fblog.casadoprodutor.com.br%2Fcomo-cuidar-de-um-gatinho-filhote%2F&psig=AOvVaw0Q9pr1EnFxVAVGasCr_6Vv&ust=1685487921682000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCLjY5tzVm_8CFQAAAAAdAAAAABAD',19955336733);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-04 20:38:34
