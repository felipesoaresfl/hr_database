CREATE DATABASE  IF NOT EXISTS `sistema_rh` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `sistema_rh`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sistema_rh
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cargo` varchar(45) NOT NULL,
  `nivel_hierarquico` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Auxiliar Operacional','Operacional'),(2,'Analista de Sistemas','Pleno'),(3,'Supervisor de Logística','Especialista'),(4,'Gerente de RH','Gerencial'),(5,'Diretor Comercial','Diretoria'),(6,'Analista de Marketing','Pleno'),(7,'Designer Gráfico','Junior'),(8,'Programador Junior','Junior'),(9,'Programador Pleno','Pleno'),(10,'Programador Senior','Senior'),(11,'Engenheiro de DevOps','Especialista'),(12,'Engenheiro de Dados','Especialista'),(13,'Advogado Corporativo','Pleno'),(14,'Analista de Atendimento','Junior'),(15,'Supervisor de Atendimento','Especialista'),(16,'Engenheiro de Qualidade','Pleno'),(17,'Assistente Operacional','Operacional'),(18,'Gerente de TI','Gerencial'),(19,'Analista de RH','Pleno'),(20,'Recrutador','Junior');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `nome_departamento` varchar(45) NOT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Recursos Humanos'),(2,'Tecnologia da Informação'),(3,'Operações e Logística'),(4,'Comercial e Vendas'),(5,'Financeiro'),(6,'Marketing e Comunicação'),(7,'Assuntos Jurídicos e Compliance'),(8,'Engenharia e Infraestrutura'),(9,'Suporte e Atendimento'),(10,'Garantia de Qualidade');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ferias`
--

DROP TABLE IF EXISTS `ferias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ferias` (
  `id_ferias` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` date NOT NULL,
  `fim` date NOT NULL,
  `status_ferias` varchar(45) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  PRIMARY KEY (`id_ferias`),
  KEY `fk_ferias_func` (`id_funcionario`),
  CONSTRAINT `fk_ferias_func` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ferias`
--

LOCK TABLES `ferias` WRITE;
/*!40000 ALTER TABLE `ferias` DISABLE KEYS */;
INSERT INTO `ferias` VALUES (1,'2026-06-15','2026-07-14','Agendada',2),(2,'2026-07-01','2026-07-15','Agendada',3),(3,'2026-12-20','2027-01-18','Agendada',4),(4,'2025-01-05','2025-02-03','Finalizada',1),(5,'2026-01-10','2026-01-20','Cancelada',5),(101,'2026-06-15','2026-06-30','Agendada',6),(102,'2026-06-28','2026-07-13','Agendada',10),(103,'2026-07-05','2026-07-20','Agendada',11),(104,'2026-07-15','2026-08-04','Agendada',16),(105,'2026-08-01','2026-08-20','Agendada',17),(106,'2026-11-10','2026-11-25','Agendada',19),(107,'2026-12-20','2027-01-10','Agendada',20),(108,'2026-12-28','2027-01-12','Agendada',21),(109,'2027-01-15','2027-02-14','Agendada',24),(110,'2027-03-01','2027-03-30','Agendada',25),(111,'2022-03-01','2022-03-30','Finalizada',6),(112,'2023-04-10','2023-05-10','Finalizada',6),(113,'2024-05-15','2024-06-14','Finalizada',6),(114,'2025-06-20','2025-07-20','Finalizada',6),(115,'2022-04-15','2022-05-15','Finalizada',7),(116,'2023-05-20','2023-06-19','Finalizada',7),(117,'2024-06-25','2024-07-25','Finalizada',7),(118,'2025-07-30','2025-08-29','Finalizada',7),(119,'2022-07-01','2022-07-15','Finalizada',10),(120,'2023-08-10','2023-09-09','Finalizada',10),(121,'2024-09-15','2024-10-15','Finalizada',10),(122,'2025-10-20','2025-11-19','Finalizada',10),(123,'2022-08-01','2022-08-30','Finalizada',11),(124,'2023-09-05','2023-10-05','Finalizada',11),(125,'2024-10-10','2024-11-09','Finalizada',11),(126,'2025-11-15','2025-12-14','Finalizada',11),(127,'2022-11-15','2022-12-15','Finalizada',15),(128,'2023-01-10','2023-01-25','Finalizada',16),(129,'2024-02-15','2024-03-16','Finalizada',16),(130,'2025-03-20','2025-04-19','Finalizada',16),(131,'2023-02-01','2023-03-02','Finalizada',17),(132,'2024-03-05','2024-04-04','Finalizada',17),(133,'2025-04-10','2025-05-10','Finalizada',17),(134,'2023-02-10','2023-03-12','Finalizada',19),(135,'2024-03-15','2024-04-14','Finalizada',19),(136,'2025-04-20','2025-05-20','Finalizada',19),(137,'2023-03-01','2023-03-30','Finalizada',20),(138,'2024-04-05','2024-05-05','Finalizada',20),(139,'2025-05-10','2025-06-09','Finalizada',20),(140,'2023-03-15','2023-04-14','Finalizada',21),(141,'2024-04-20','2024-05-20','Finalizada',21),(142,'2025-05-25','2025-06-24','Finalizada',21),(143,'2023-05-01','2023-05-30','Finalizada',24),(144,'2024-06-05','2024-07-05','Finalizada',24),(145,'2025-07-10','2025-08-09','Finalizada',24),(146,'2023-06-10','2023-07-10','Finalizada',25),(147,'2024-07-15','2024-08-14','Finalizada',25),(148,'2025-08-20','2025-09-19','Finalizada',25),(149,'2023-10-01','2023-10-30','Finalizada',29),(150,'2023-10-15','2023-11-14','Finalizada',30),(151,'2024-11-20','2024-12-20','Finalizada',30),(152,'2023-11-20','2023-12-20','Finalizada',31),(153,'2024-12-25','2025-01-24','Finalizada',31),(154,'2024-01-05','2024-02-04','Finalizada',33),(155,'2025-02-10','2025-03-12','Finalizada',33),(156,'2024-01-20','2024-02-19','Finalizada',34),(157,'2025-02-25','2025-03-27','Finalizada',34),(158,'2024-02-01','2024-03-02','Finalizada',35),(159,'2025-03-05','2025-04-04','Finalizada',35),(160,'2024-02-10','2024-03-12','Finalizada',38),(161,'2025-03-15','2025-04-14','Finalizada',38),(162,'2024-02-15','2024-03-16','Finalizada',39),(163,'2025-03-20','2025-04-19','Finalizada',39),(164,'2024-05-01','2024-05-30','Finalizada',44),(165,'2025-06-05','2025-07-05','Finalizada',44),(166,'2024-06-10','2024-07-10','Finalizada',45),(167,'2025-07-15','2025-08-14','Finalizada',45),(168,'2024-08-01','2024-08-30','Finalizada',47),(169,'2025-09-05','2025-10-05','Finalizada',47),(170,'2024-08-20','2024-09-19','Finalizada',48),(171,'2025-09-25','2025-10-25','Finalizada',48),(172,'2024-09-05','2024-10-05','Finalizada',49),(173,'2025-10-10','2025-11-09','Finalizada',49),(174,'2024-11-01','2024-11-30','Finalizada',52),(175,'2025-12-05','2026-01-04','Finalizada',52),(176,'2024-11-25','2024-12-25','Finalizada',53),(177,'2025-12-30','2026-01-29','Finalizada',53),(178,'2024-12-28','2025-01-27','Finalizada',57),(179,'2024-12-29','2025-01-28','Finalizada',58),(180,'2025-12-30','2026-01-29','Finalizada',58),(181,'2024-12-30','2025-01-29','Finalizada',59),(182,'2025-12-30','2026-01-29','Finalizada',59),(183,'2025-03-01','2025-03-30','Finalizada',61),(184,'2025-04-15','2025-05-14','Finalizada',62),(185,'2025-05-20','2025-06-18','Finalizada',63),(186,'2025-07-15','2025-08-14','Finalizada',66),(187,'2025-08-01','2025-08-30','Finalizada',67),(188,'2025-10-10','2025-11-09','Finalizada',71),(189,'2025-10-25','2025-11-24','Finalizada',72),(190,'2025-11-12','2025-12-12','Finalizada',73),(191,'2025-12-15','2026-01-14','Finalizada',75),(192,'2025-12-20','2026-01-19','Finalizada',76),(193,'2025-12-28','2026-01-27','Finalizada',77),(194,'2023-07-15','2023-08-14','Cancelada',6),(195,'2024-05-10','2024-06-09','Cancelada',16),(196,'2025-02-15','2025-03-16','Cancelada',17),(197,'2025-11-20','2025-12-20','Cancelada',30),(198,'2024-12-25','2025-01-24','Cancelada',31),(199,'2026-01-20','2026-02-19','Cancelada',58),(200,'2026-03-15','2026-04-14','Cancelada',63);
/*!40000 ALTER TABLE `ferias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folha_de_ponto`
--

DROP TABLE IF EXISTS `folha_de_ponto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folha_de_ponto` (
  `id_ponto` int(11) NOT NULL AUTO_INCREMENT,
  `data_referencia` date NOT NULL,
  `data_entrada` date DEFAULT NULL,
  `data_saida` date DEFAULT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_saida` time DEFAULT NULL,
  `tipo_ocorrencia` varchar(45) NOT NULL,
  `justificado` char(1) NOT NULL,
  `motivo_ajuste` varchar(45) DEFAULT NULL,
  `id_funcionario` int(11) NOT NULL,
  PRIMARY KEY (`id_ponto`),
  KEY `fk_ponto_func` (`id_funcionario`),
  CONSTRAINT `fk_ponto_func` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folha_de_ponto`
--

LOCK TABLES `folha_de_ponto` WRITE;
/*!40000 ALTER TABLE `folha_de_ponto` DISABLE KEYS */;
INSERT INTO `folha_de_ponto` VALUES (1,'2026-06-01','2026-06-01','2026-06-01','08:00:00','17:00:00','Normal','N',NULL,3),(2,'2024-02-12',NULL,NULL,NULL,NULL,'Falta','N',NULL,1),(3,'2025-03-03',NULL,NULL,NULL,NULL,'Falta','N',NULL,2),(4,'2026-02-16',NULL,NULL,NULL,NULL,'Falta','N',NULL,1),(5,'2026-02-17','2026-02-17','2026-02-17','11:15:00','17:00:00','Atraso','N',NULL,3),(101,'2024-02-12',NULL,NULL,NULL,NULL,'Falta','N',NULL,6),(102,'2024-02-12',NULL,NULL,NULL,NULL,'Falta','N',NULL,11),(103,'2024-02-13','2024-02-13','2024-02-13','10:15:00','17:00:00','Atraso','N',NULL,18),(104,'2024-02-13','2024-02-13','2024-02-13','11:30:00','17:00:00','Atraso','N',NULL,21),(105,'2025-03-03',NULL,NULL,NULL,NULL,'Falta','N',NULL,30),(106,'2025-03-03',NULL,NULL,NULL,NULL,'Falta','N',NULL,40),(107,'2025-03-04','2025-03-04','2025-03-04','09:45:00','17:00:00','Atraso','N',NULL,48),(108,'2026-02-16',NULL,NULL,NULL,NULL,'Falta','N',NULL,53),(109,'2026-02-16',NULL,NULL,NULL,NULL,'Falta','N',NULL,62),(110,'2026-02-17','2026-02-17','2026-02-17','10:45:00','17:00:00','Atraso','N',NULL,77),(111,'2026-05-11','2026-05-11','2026-05-11','05:54:12','14:02:40','Normal','S',NULL,6),(112,'2026-05-11','2026-05-11','2026-05-11','05:58:30','14:05:15','Normal','S',NULL,8),(113,'2026-05-11','2026-05-11','2026-05-11','06:01:05','14:00:00','Normal','S',NULL,10),(114,'2026-05-11','2026-05-11','2026-05-11','05:52:45','14:03:10','Normal','S',NULL,11),(115,'2026-05-12','2026-05-12','2026-05-12','05:55:18','14:01:05','Normal','S',NULL,6),(116,'2026-05-12','2026-05-12','2026-05-12','05:57:44','14:00:00','Normal','S',NULL,8),(117,'2026-05-12','2026-05-12','2026-05-12','06:02:15','14:05:40','Normal','S',NULL,10),(118,'2026-05-13','2026-05-13','2026-05-13','06:18:22','14:01:00','Atraso','S','Problemas com autocarro público',6),(119,'2026-05-13','2026-05-13','2026-05-13','05:58:00','15:30:15','Hora Extra','S','Inventário mensal pendente',8),(120,'2026-05-13','2026-05-13','2026-05-13','05:53:10','15:15:00','Hora Extra','S','Fechamento de chamados críticos',11),(121,'2026-05-14',NULL,NULL,NULL,NULL,'Falta','S','Atestado Médico - Dentista',10),(122,'2026-05-14',NULL,NULL,NULL,NULL,'Falta','N',NULL,6),(123,'2026-05-14','2026-05-14','2026-05-14','05:59:00','14:01:00','Normal','S',NULL,8),(124,'2026-05-14','2026-05-14','2026-05-14','05:55:00','14:02:00','Normal','S',NULL,11),(125,'2026-05-11','2026-05-11','2026-05-11','13:54:15','22:01:30','Normal','S',NULL,7),(126,'2026-05-11','2026-05-11','2026-05-11','13:58:40','22:05:00','Normal','S',NULL,9),(127,'2026-05-11','2026-05-11','2026-05-11','13:55:20','22:03:12','Normal','S',NULL,17),(128,'2026-05-11','2026-05-11','2026-05-11','14:00:10','22:01:00','Normal','S',NULL,19),(129,'2026-05-12','2026-05-12','2026-05-12','13:52:11','22:00:00','Normal','S',NULL,7),(130,'2026-05-12','2026-05-12','2026-05-12','13:59:05','22:04:15','Normal','S',NULL,9),(131,'2026-05-12','2026-05-12','2026-05-12','13:58:30','22:02:10','Normal','S',NULL,17),(132,'2026-05-13','2026-05-13','2026-05-13','14:22:45','22:01:00','Atraso','S','Consulta médica de rotina',7),(133,'2026-05-13','2026-05-13','2026-05-13','13:54:12','23:45:00','Hora Extra','S','Manutenção corretiva urgente de servidores',9),(134,'2026-05-13','2026-05-13','2026-05-13','13:55:00','23:30:00','Hora Extra','S','Reunião de alinhamento com equipa global',17),(135,'2026-05-14',NULL,NULL,NULL,NULL,'Falta','S','Atestado de acompanhamento do filho',19),(136,'2026-05-14',NULL,NULL,NULL,NULL,'Falta','N',NULL,7),(137,'2026-05-14','2026-05-14','2026-05-14','13:58:00','22:03:00','Normal','S',NULL,9),(138,'2026-05-11','2026-05-11','2026-05-12','21:55:40','06:01:20','Normal','S',NULL,12),(139,'2026-05-11','2026-05-11','2026-05-12','21:58:15','06:04:30','Normal','S',NULL,13),(140,'2026-05-11','2026-05-11','2026-05-12','21:52:50','06:02:11','Normal','S',NULL,14),(141,'2026-05-11','2026-05-11','2026-05-12','21:59:10','06:00:00','Normal','S',NULL,26),(142,'2026-05-12','2026-05-12','2026-05-13','21:56:05','06:03:00','Normal','S',NULL,12),(143,'2026-05-12','2026-05-12','2026-05-13','21:57:33','06:01:15','Normal','S',NULL,13),(144,'2026-05-12','2026-05-12','2026-05-13','21:54:20','06:02:50','Normal','S',NULL,14),(145,'2026-05-13','2026-05-13','2026-05-14','22:45:00','06:01:00','Atraso','N',NULL,12),(146,'2026-05-13','2026-05-13','2026-05-14','21:51:00','07:30:00','Hora Extra','S','Transição de turno e apoio operacional',13),(147,'2026-05-13','2026-05-13','2026-05-14','21:53:00','07:45:00','Hora Extra','S','Ajuste de cargas no armazém',14),(148,'2026-05-14',NULL,NULL,NULL,NULL,'Falta','S','Atestado de Acidente de Trabalho',26),(149,'2026-05-14',NULL,NULL,NULL,NULL,'Falta','N',NULL,12),(150,'2026-05-14','2026-05-14','2026-05-15','21:58:00','06:02:00','Normal','S',NULL,13),(151,'2026-05-18','2026-05-18','2026-05-18','05:54:20','14:01:00','Normal','S',NULL,20),(152,'2026-05-18','2026-05-18','2026-05-18','05:58:11','14:03:40','Normal','S',NULL,21),(153,'2026-05-18','2026-05-18','2026-05-18','13:55:00','22:04:15','Normal','S',NULL,22),(154,'2026-05-18','2026-05-18','2026-05-18','13:59:12','22:01:10','Normal','S',NULL,23),(155,'2026-05-19','2026-05-19','2026-05-19','21:56:45','06:02:00','Normal','S',NULL,27),(156,'2026-05-19','2026-05-19','2026-05-19','21:58:12','06:03:50','Normal','S',NULL,28),(157,'2026-05-19',NULL,NULL,NULL,NULL,'Falta','S','Doação de Sangue',30),(158,'2026-05-19','2026-05-19','2026-05-19','05:59:30','14:02:40','Normal','S',NULL,31),(159,'2026-05-20','2026-05-20','2026-05-20','13:53:00','22:05:10','Normal','S',NULL,32),(160,'2026-05-20','2026-05-20','2026-05-20','05:55:40','14:00:00','Normal','S',NULL,33),(161,'2026-05-20','2026-05-20','2026-05-20','05:58:12','14:01:50','Normal','S',NULL,34),(162,'2026-05-21','2026-05-21','2026-05-21','13:56:18','22:03:40','Normal','S',NULL,35),(163,'2026-05-21','2026-05-21','2026-05-21','21:54:30','06:02:15','Normal','S',NULL,36),(164,'2026-05-21','2026-05-21','2026-05-21','21:57:11','06:01:55','Normal','S',NULL,37),(165,'2026-05-22','2026-05-22','2026-05-22','05:58:05','14:04:10','Normal','S',NULL,38),(166,'2026-05-22','2026-05-22','2026-05-22','06:08:44','14:00:00','Atraso','N',NULL,39),(167,'2026-05-22',NULL,NULL,NULL,NULL,'Falta','N',NULL,40),(168,'2026-05-25','2026-05-25','2026-05-25','05:55:12','14:02:18','Normal','S',NULL,41),(169,'2026-05-25','2026-05-25','2026-05-25','05:57:40','14:01:10','Normal','S',NULL,42),(170,'2026-05-25','2026-05-25','2026-05-25','13:56:05','22:04:50','Normal','S',NULL,44),(171,'2026-05-26','2026-05-26','2026-05-26','05:58:30','14:03:00','Normal','S',NULL,45),(172,'2026-05-26','2026-05-26','2026-05-26','05:53:15','14:02:40','Normal','S',NULL,46),(173,'2026-05-26','2026-05-26','2026-05-26','13:59:10','22:01:05','Normal','S',NULL,47),(174,'2026-05-27','2026-05-27','2026-05-27','21:55:40','06:04:15','Normal','S',NULL,48),(175,'2026-05-27','2026-05-27','2026-05-27','05:58:00','14:02:00','Normal','S',NULL,49),(176,'2026-05-27','2026-05-27','2026-05-27','13:56:11','22:05:00','Normal','S',NULL,50),(177,'2026-05-28','2026-05-28','2026-05-28','21:54:10','06:01:00','Normal','S',NULL,51),(178,'2026-05-28','2026-05-28','2026-05-28','21:58:30','06:03:50','Normal','S',NULL,52),(179,'2026-05-28','2026-05-28','2026-05-28','05:59:12','14:02:40','Normal','S',NULL,53),(180,'2026-05-29','2026-05-29','2026-05-29','13:58:00','22:01:10','Normal','S',NULL,55),(181,'2026-05-29','2026-05-29','2026-05-29','05:54:30','14:06:18','Normal','S',NULL,56),(182,'2026-05-29','2026-05-29','2026-05-29','13:57:44','22:02:50','Normal','S',NULL,58),(183,'2026-06-01','2026-06-01','2026-06-01','05:58:05','14:01:10','Normal','S',NULL,59),(184,'2026-06-01','2026-06-01','2026-06-01','05:55:12','14:05:40','Normal','S',NULL,61),(185,'2026-06-01','2026-06-01','2026-06-01','13:59:00','22:01:05','Normal','S',NULL,62),(186,'2026-06-02','2026-06-02','2026-06-02','05:58:30','14:03:00','Normal','S',NULL,63),(187,'2026-06-02','2026-06-02','2026-06-02','21:55:40','06:04:15','Normal','S',NULL,64),(188,'2026-06-02','2026-06-02','2026-06-02','13:56:11','22:05:00','Normal','S',NULL,65),(189,'2026-06-03','2026-06-03','2026-06-03','21:54:10','06:01:00','Normal','S',NULL,66),(190,'2026-06-03','2026-06-03','2026-06-03','21:58:30','06:03:50','Normal','S',NULL,67),(191,'2026-06-03','2026-06-03','2026-06-03','05:59:12','14:02:40','Normal','S',NULL,68),(192,'2026-06-04','2026-06-04','2026-06-04','13:58:00','22:01:10','Normal','S',NULL,69),(193,'2026-06-04','2026-06-04','2026-06-04','05:54:30','14:06:18','Normal','S',NULL,70),(194,'2026-06-04','2026-06-04','2026-06-04','13:57:44','22:02:50','Normal','S',NULL,72),(195,'2026-06-05','2026-06-05','2026-06-05','05:58:05','14:01:10','Normal','S',NULL,73),(196,'2026-06-05','2026-06-05','2026-06-05','05:55:12','14:05:40','Normal','S',NULL,74),(197,'2026-06-05','2026-06-05','2026-06-05','13:59:00','22:01:05','Normal','S',NULL,75),(198,'2026-06-08','2026-06-08','2026-06-08','05:58:30','14:03:00','Normal','S',NULL,76),(199,'2026-06-08','2026-06-08','2026-06-08','21:55:40','06:04:15','Normal','S',NULL,78),(200,'2026-06-08','2026-06-08','2026-06-08','13:56:11','22:05:00','Normal','S',NULL,79);
/*!40000 ALTER TABLE `folha_de_ponto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome_funcionario` varchar(45) NOT NULL,
  `cpf` char(11) NOT NULL,
  `telefone` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `status` char(1) NOT NULL,
  `aposentado` char(1) NOT NULL,
  `id_turno` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_setor` int(11) NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `fk_func_turno` (`id_turno`),
  KEY `fk_func_cargo` (`id_cargo`),
  KEY `fk_func_setor` (`id_setor`),
  CONSTRAINT `fk_func_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`),
  CONSTRAINT `fk_func_setor` FOREIGN KEY (`id_setor`) REFERENCES `setor` (`id_setor`),
  CONSTRAINT `fk_func_turno` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Carlos Augusto Silva','12345678901',11991234123,'carlos.silva@empresa.com','1958-03-12','A','S',3,1,3),(2,'Mariana Costa Oliveira','98765432100',21981234567,'mariana.costa@empresa.com','1988-08-25','A','N',3,2,2),(3,'Roberto Almeida Santos','45612378902',31971112233,'roberto.santos@empresa.com','1975-11-02','A','N',2,3,3),(4,'Fernanda Souza Lima','78945612305',71992223344,'fernanda.lima@empresa.com','1982-05-14','A','N',2,4,1),(5,'Ricardo Pereira Melo','32165409877',81987654321,'ricardo.melo@empresa.com','1995-01-30','I','N',1,1,3),(6,'Gabriel Santos Menezes','50182736401',11982736401,'gabriel.menezes@empresa.com','1990-04-15','A','N',1,8,9),(7,'Beatriz Rocha Vieira','50182736402',11982736402,'beatriz.vieira@empresa.com','1985-09-22','A','N',2,7,7),(8,'Lucas Cardoso Lima','50182736403',11982736403,'lucas.cardoso@empresa.com','1993-11-05','A','N',1,10,11),(9,'Juliana Barbosa Silva','50182736404',11982736404,'juliana.silva@empresa.com','1987-03-30','A','N',2,11,11),(10,'Felipe Teixeira Souza','50182736405',11982736405,'felipe.souza@empresa.com','1992-07-18','A','N',1,9,11),(11,'Larissa Mendes Araujo','50182736406',11982736406,'larissa.araujo@empresa.com','1995-12-12','A','N',1,14,14),(12,'Thiago Fernandes Costa','50182736407',11982736407,'thiago.costa@empresa.com','1989-01-25','A','N',3,1,3),(13,'Aline Ribeiro Carvalho','50182736408',11982736408,'aline.carvalho@empresa.com','1991-08-14','A','N',3,1,3),(14,'Bruno Oliveira Santos','50182736409',11982736409,'bruno.santos@empresa.com','1983-05-02','A','N',3,1,8),(15,'Camila Martins Lima','50182736410',11982736410,'camila.lima@empresa.com','1996-10-10','A','N',1,15,15),(16,'Daniel Rodrigues Alves','50182736411',11982736411,'daniel.alves@empresa.com','1986-02-28','I','N',1,2,2),(17,'Amanda Cunha Dias','50182736412',11982736412,'amanda.dias@empresa.com','1994-06-15','A','N',2,6,6),(18,'Gustavo Pinto Correa','50182736413',11982736413,'gustavo.correa@empresa.com','1988-04-20','A','N',1,18,13),(19,'Letícia Castro Cunha','50182736414',11982736414,'leticia.cunha@empresa.com','1991-03-11','A','N',2,19,14),(20,'Mateus Correia Ribeiro','50182736415',11982736415,'mateus.ribeiro@empresa.com','1997-07-25','A','N',1,8,9),(21,'Carolina Santos Reis','50182736416',11982736416,'carolina.reis@empresa.com','1990-11-30','A','N',2,7,7),(22,'Vinícius Souza Pinto','50182736417',11982736417,'vinicius.pinto@empresa.com','1985-05-18','A','N',1,10,11),(23,'Isabela Lima Almeida','50182736418',11982736418,'isabela.almeida@empresa.com','1993-02-14','A','N',2,11,11),(24,'Rodrigo Alves Neto','50182736419',11982736419,'rodrigo.neto@empresa.com','1989-09-09','A','N',1,9,11),(25,'Mariana Rocha Costa','50182736420',11982736420,'mariana.costa2@empresa.com','1994-01-05','A','N',1,14,14),(26,'Arthur Pereira Dias','50182736421',11982736421,'arthur.dias@empresa.com','1992-06-22','A','N',3,1,3),(27,'Larissa Santos Silva','50182736422',11982736422,'larissa.silva2@empresa.com','1995-10-18','A','N',3,1,3),(28,'Guilherme Melo Souza','50182736423',11982736423,'guilherme.souza@empresa.com','1987-12-04','A','N',3,1,8),(29,'Sofia Mendes Barbosa','50182736424',11982736424,'sofia.barbosa@empresa.com','1996-04-01','A','N',1,15,15),(30,'Eduardo Carvalho Reis','50182736425',11982736425,'eduardo.reis@empresa.com','1984-08-15','I','N',1,2,2),(31,'Helena Ramos Dias','50182736426',11982736426,'helena.dias@empresa.com','1993-03-24','A','N',2,6,6),(32,'Nicholas Costa Pinto','50182736427',11982736427,'nicholas.pinto@empresa.com','1989-07-29','A','N',1,18,13),(33,'Manuela Almeida Castro','50182736428',11982736428,'manuela.castro@empresa.com','1991-11-12','A','N',2,19,14),(34,'Heitor Oliveira Souza','50182736429',11982736429,'heitor.souza@empresa.com','1995-05-05','A','N',1,8,9),(35,'Alice Ferreira Silva','50182736430',11982736430,'alice.silva@empresa.com','1992-09-17','A','N',2,7,7),(36,'Bernardo Rodrigues Lima','50182736431',11982736431,'bernardo.lima@empresa.com','1990-01-20','A','N',1,10,11),(37,'Valentina Araujo Alves','50182736432',11982736432,'valentina.alves@empresa.com','1988-10-31','A','N',2,11,11),(38,'Enzo Santos Cardoso','50182736433',11982736433,'enzo.cardoso@empresa.com','1994-04-14','A','N',1,9,11),(39,'Lorena Costa Barbosa','50182736434',11982736434,'lorena.barbosa@empresa.com','1996-07-07','A','N',1,14,14),(40,'Matheus Dias Oliveira','50182736435',11982736435,'matheus.oliveira@empresa.com','1986-12-25','A','N',3,1,3),(41,'Isadora Santos Ramos','50182736436',11982736436,'isadora.ramos@empresa.com','1991-05-19','A','N',3,1,3),(42,'Samuel Ferreira Costa','50182736437',11982736437,'samuel.costa@empresa.com','1983-09-02','A','N',3,1,8),(43,'Giovanna Lima Rodrigues','50182736438',11982736438,'giovanna.rodrigues@empresa.com','1995-02-11','A','S',1,15,15),(44,'Felipe Mendes Araujo','50182736439',11982736439,'felipe.araujo@empresa.com','1987-08-23','I','N',1,2,2),(45,'Beatriz Costa Barbosa','50182736440',11982736440,'beatriz.barbosa@empresa.com','1992-03-15','A','N',2,6,6),(46,'Daniel Santos Silva','50182736441',11982736441,'daniel.silva2@empresa.com','1990-06-29','A','N',1,18,13),(47,'Lara Oliveira Souza','50182736442',11982736442,'lara.souza@empresa.com','1994-11-12','A','N',2,19,14),(48,'Leonardo Cardoso Lima','50182736443',11982736443,'leonardo.lima@empresa.com','1996-01-05','A','N',1,8,9),(49,'Maria Ferreira Ramos','50182736444',11982736444,'maria.ramos@empresa.com','1989-05-18','A','N',2,7,7),(50,'Pedro Rodrigues Alves','50182736445',11982736445,'pedro.alves@empresa.com','1991-09-09','A','N',1,10,11),(51,'Ana Santos Barbosa','50182736446',11982736446,'ana.barbosa@empresa.com','1995-12-25','A','N',2,11,11),(52,'Lucas Oliveira Costa','50182736447',11982736447,'lucas.costa@empresa.com','1993-04-14','A','N',1,9,11),(53,'Beatriz Mendes Souza','50182736448',11982736448,'beatriz.souza@empresa.com','1996-07-07','A','N',1,14,14),(54,'Gustavo Silva Ramos','50182736449',11982736449,'gustavo.ramos@empresa.com','1987-12-25','A','N',3,1,3),(55,'Mariana Lima Araujo','50182736450',11982736450,'mariana.araujo@empresa.com','1991-05-19','A','N',3,1,3),(56,'Rodrigo Ferreira Barbosa','50182736451',11982736451,'rodrigo.barbosa@empresa.com','1983-09-02','A','N',3,1,8),(57,'Larissa Santos Costa','50182736452',11982736452,'larissa.costa3@empresa.com','1995-02-11','A','S',1,15,15),(58,'Felipe Rodrigues Alves','50182736453',11982736453,'felipe.alves2@empresa.com','1987-08-23','I','N',1,2,2),(59,'Amanda Mendes Souza','50182736454',11982736454,'amanda.souza@empresa.com','1992-03-15','A','N',2,6,6),(60,'Gustavo Araujo Silva','50182736455',11982736455,'gustavo.silva@empresa.com','1990-06-29','A','N',1,18,13),(61,'Letícia Lima Rodrigues','50182736456',11982736456,'leticia.rodrigues@empresa.com','1994-11-12','A','N',2,19,14),(62,'Mateus Santos Costa','50182736457',11982736457,'mateus.costa2@empresa.com','1996-01-05','A','N',1,8,9),(63,'Carolina Araujo Alves','50182736458',11982736458,'carolina.alves@empresa.com','1989-05-18','A','N',2,7,7),(64,'Vinícius Mendes Souza','50182736459',11982736459,'vinicius.souza@empresa.com','1991-09-09','A','N',1,10,11),(65,'Isabela Silva Ramos','50182736460',11982736460,'isabela.ramos2@empresa.com','1995-12-25','A','N',2,11,11),(66,'Rodrigo Lima Araujo','50182736461',11982736461,'rodrigo.araujo@empresa.com','1993-04-14','A','N',1,9,11),(67,'Mariana Santos Barbosa','50182736462',11982736462,'mariana.barbosa2@empresa.com','1996-07-07','A','N',1,14,14),(68,'Arthur Araujo Alves','50182736463',11982736463,'arthur.alves@empresa.com','1987-12-25','A','N',3,1,3),(69,'Larissa Mendes Souza','50182736464',11982736464,'larissa.souza2@empresa.com','1991-05-19','A','N',3,1,3),(70,'Guilherme Silva Ramos','50182736465',11982736465,'guilherme.ramos2@empresa.com','1983-09-02','A','N',3,1,8),(71,'Sofia Lima Rodrigues','50182736466',11982736466,'sofia.rodrigues2@empresa.com','1995-02-11','A','S',1,15,15),(72,'Eduardo Santos Costa','50182736467',11982736467,'eduardo.costa2@empresa.com','1987-08-23','I','N',1,2,2),(73,'Helena Araujo Silva','50182736468',11982736468,'helena.silva2@empresa.com','1992-03-15','A','N',2,6,6),(74,'Nicholas Mendes Souza','50182736469',11982736469,'nicholas.souza@empresa.com','1990-06-29','A','N',1,18,13),(75,'Manuela Silva Ramos','50182736470',11982736470,'manuela.ramos@empresa.com','1994-11-12','A','N',2,19,14),(76,'Heitor Lima Araujo','50182736471',11982736471,'heitor.araujo@empresa.com','1996-01-05','A','N',1,8,9),(77,'Alice Santos Barbosa','50182736472',11982736472,'alice.barbosa2@empresa.com','1989-05-18','A','N',2,7,7),(78,'Bernardo Araujo Alves','50182736473',11982736473,'bernardo.alves@empresa.com','1991-09-09','A','N',1,10,11),(79,'Valentina Mendes Souza','50182736474',11982736474,'valentina.souza@empresa.com','1995-12-25','A','N',2,11,11),(80,'Enzo Silva Ramos','50182736475',11982736475,'enzo.ramos@empresa.com','1993-04-14','A','N',1,9,11),(81,'Lorena Lima Araujo','50182736476',11982736476,'lorena.araujo2@empresa.com','1996-07-07','A','N',1,14,14),(82,'Matheus Santos Barbosa','50182736477',11982736477,'matheus.barbosa@empresa.com','1987-12-25','A','N',3,1,3),(83,'Isadora Araujo Alves','50182736478',11982736478,'isadora.alves@empresa.com','1991-05-19','A','N',3,1,3),(84,'Samuel Mendes Souza','50182736479',11982736479,'samuel.souza@empresa.com','1983-09-02','A','N',3,1,8),(85,'Giovanna Silva Ramos','50182736480',11982736480,'giovanna.ramos2@empresa.com','1995-02-11','A','S',1,15,15),(86,'Felipe Lima Araujo','50182736481',11982736481,'felipe.araujo2@empresa.com','1987-08-23','I','N',1,2,2),(87,'Beatriz Santos Costa','50182736482',11982736482,'beatriz.costa3@empresa.com','1992-03-15','A','N',2,6,6),(88,'Daniel Araujo Alves','50182736483',11982736483,'daniel.alves3@empresa.com','1990-06-29','A','N',1,18,13),(89,'Lara Mendes Souza','50182736484',11982736484,'lara.souza2@empresa.com','1994-11-12','A','N',2,19,14),(90,'Leonardo Silva Ramos','50182736485',11982736485,'leonardo.ramos@empresa.com','1996-01-05','A','N',1,8,9),(91,'Maria Lima Araujo','50182736486',11982736486,'maria.araujo2@empresa.com','1989-05-18','A','N',2,7,7),(92,'Pedro Santos Barbosa','50182736487',11982736487,'pedro.barbosa@empresa.com','1991-09-09','A','N',1,10,11),(93,'Ana Araujo Alves','50182736488',11982736488,'ana.alves@empresa.com','1995-12-25','A','N',2,11,11),(94,'Lucas Mendes Souza','50182736489',11982736489,'lucas.souza3@empresa.com','1993-04-14','A','N',1,9,11),(95,'Beatriz Silva Ramos','50182736490',11982736490,'beatriz.ramos2@empresa.com','1996-07-07','A','N',1,14,14),(96,'Gustavo Lima Araujo','50182736491',11982736491,'gustavo.araujo@empresa.com','1987-12-25','A','N',3,1,3),(97,'Mariana Santos Costa','50182736492',11982736492,'mariana.costa3@empresa.com','1991-05-19','A','N',3,1,3),(98,'Rodrigo Araujo Alves','50182736493',11982736493,'rodrigo.alves2@empresa.com','1983-09-02','A','N',3,1,8),(99,'Larissa Mendes Souza2','50182736494',11982736494,'larissa.souza3@empresa.com','1995-02-11','A','S',1,15,15),(100,'Felipe Silva Ramos','50182736495',11982736495,'felipe.ramos3@empresa.com','1987-08-23','I','N',1,2,2),(101,'Amanda Lima Araujo','50182736496',11982736496,'amanda.araujo@empresa.com','1992-03-15','A','N',2,6,6),(102,'Gustavo Santos Costa','50182736497',11982736497,'gustavo.costa3@empresa.com','1990-06-29','A','N',1,18,13),(103,'Letícia Araujo Alves','50182736498',11982736498,'leticia.alves2@empresa.com','1994-11-12','A','N',2,19,14),(104,'Mateus Mendes Souza','50182736499',11982736499,'mateus.souza2@empresa.com','1996-01-05','A','N',1,8,9),(105,'Carolina Silva Ramos','50182736500',11982736500,'carolina.ramos2@empresa.com','1989-05-18','A','N',2,7,7);
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_salarial`
--

DROP TABLE IF EXISTS `historico_salarial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_salarial` (
  `id_historico_salarial` int(11) NOT NULL AUTO_INCREMENT,
  `data_referencia` date NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  PRIMARY KEY (`id_historico_salarial`),
  KEY `fk_salario_func` (`id_funcionario`),
  CONSTRAINT `fk_salario_func` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_salarial`
--

LOCK TABLES `historico_salarial` WRITE;
/*!40000 ALTER TABLE `historico_salarial` DISABLE KEYS */;
INSERT INTO `historico_salarial` VALUES (1,'2024-06-01',3500.00,1),(2,'2020-05-01',5000.00,2),(3,'2023-01-01',6200.00,2),(4,'2018-02-15',7500.00,3),(5,'2021-10-01',12000.00,4),(6,'2022-03-01',3000.00,5),(7,'2021-01-15',3820.50,6),(8,'2021-02-10',3910.00,7),(9,'2021-03-22',12350.00,8),(10,'2021-04-05',9200.00,9),(11,'2021-05-12',4150.00,10),(12,'2021-06-18',4300.00,11),(13,'2021-07-25',2150.00,12),(14,'2021-08-14',2180.00,13),(15,'2021-09-02',2210.00,14),(16,'2021-10-10',4400.00,15),(17,'2021-11-05',4450.00,16),(18,'2021-12-20',4600.00,17),(19,'2021-12-28',16500.00,18),(20,'2021-12-30',4650.00,19),(21,'2022-01-10',4700.00,20),(22,'2022-01-25',4780.00,21),(23,'2022-02-14',12450.00,22),(24,'2022-03-01',9350.00,23),(25,'2022-03-15',4850.00,24),(26,'2022-04-12',4920.00,25),(27,'2022-05-02',2250.00,26),(28,'2022-06-10',2280.00,27),(29,'2022-07-18',2300.00,28),(30,'2022-08-25',5100.00,29),(31,'2022-09-05',5150.00,30),(32,'2022-10-15',5200.00,31),(33,'2022-11-12',16800.00,32),(34,'2022-12-01',5320.00,33),(35,'2022-12-15',5400.00,34),(36,'2022-12-20',5450.00,35),(37,'2022-12-22',12600.00,36),(38,'2022-12-28',9500.00,37),(39,'2022-12-29',5510.00,38),(40,'2022-12-30',5580.00,39),(41,'2023-01-10',2320.00,40),(42,'2023-01-20',2340.00,41),(43,'2023-02-15',2360.00,42),(44,'2023-03-05',1450.00,43),(45,'2023-03-25',5620.00,44),(46,'2023-04-12',5700.00,45),(47,'2023-05-18',17200.00,46),(48,'2023-06-01',5800.00,47),(49,'2023-06-22',5850.00,48),(50,'2023-07-15',5900.00,49),(51,'2023-08-08',12850.00,50),(52,'2023-09-12',9680.00,51),(53,'2023-10-01',6050.00,52),(54,'2023-10-25',6100.00,53),(55,'2023-11-15',2420.00,54),(56,'2023-12-05',2450.00,55),(57,'2023-12-20',2480.00,56),(58,'2023-12-28',6250.00,57),(59,'2023-12-29',6300.00,58),(60,'2023-12-30',6350.00,59),(61,'2024-01-10',17900.00,60),(62,'2024-01-25',6420.00,61),(63,'2024-02-14',6480.00,62),(64,'2024-03-01',6550.00,63),(65,'2024-03-18',13100.00,64),(66,'2024-04-05',9950.00,65),(67,'2024-05-10',6620.00,66),(68,'2024-06-01',6700.00,67),(69,'2024-06-15',2510.00,68),(70,'2024-07-12',2530.00,69),(71,'2024-08-01',2550.00,70),(72,'2024-08-20',6820.00,71),(73,'2024-09-05',6890.00,72),(74,'2024-10-10',6950.00,73),(75,'2024-10-25',18400.00,74),(76,'2024-11-12',7100.00,75),(77,'2024-12-01',7150.00,76),(78,'2024-12-15',7200.00,77),(79,'2024-12-20',13400.00,78),(80,'2024-12-28',10250.00,79),(81,'2025-01-10',7320.00,80),(82,'2025-01-20',7400.00,81),(83,'2025-02-15',2600.00,82),(84,'2025-03-01',2620.00,83),(85,'2025-03-18',2650.00,84),(86,'2025-04-12',1580.00,85),(87,'2025-05-05',7480.00,86),(88,'2025-06-01',7520.00,87),(89,'2025-06-20',19100.00,88),(90,'2025-07-10',7600.00,89),(91,'2025-08-01',7650.00,90),(92,'2025-08-25',7720.00,91),(93,'2025-09-05',13800.00,92),(94,'2025-10-15',10600.00,93),(95,'2025-11-12',7850.00,94),(96,'2025-01-15',7300.00,95),(97,'2026-01-10',2700.00,96),(98,'2026-01-25',2720.00,97),(99,'2026-02-14',2750.00,98),(100,'2026-03-01',1620.00,99),(101,'2026-03-15',1650.00,100),(102,'2026-04-05',7950.00,101),(103,'2026-04-20',8020.00,102),(104,'2026-05-01',8100.00,103),(105,'2026-05-15',8150.00,104),(106,'2026-06-01',8200.00,105);
/*!40000 ALTER TABLE `historico_salarial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_vinculos`
--

DROP TABLE IF EXISTS `historico_vinculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_vinculos` (
  `id_historico_vinculos` int(11) NOT NULL AUTO_INCREMENT,
  `data_inicio` date NOT NULL,
  `data_saida` date DEFAULT NULL,
  `tipo_contrato` varchar(45) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  PRIMARY KEY (`id_historico_vinculos`),
  KEY `fk_vinculos_func` (`id_funcionario`),
  CONSTRAINT `fk_vinculos_func` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_vinculos`
--

LOCK TABLES `historico_vinculos` WRITE;
/*!40000 ALTER TABLE `historico_vinculos` DISABLE KEYS */;
INSERT INTO `historico_vinculos` VALUES (1,'2015-01-10','2024-03-01','Efetivo',1),(2,'2024-06-01',NULL,'PJ',1),(3,'2020-05-01',NULL,'Efetivo',2),(4,'2018-02-15',NULL,'Efetivo',3),(5,'2021-10-01',NULL,'Efetivo',4),(6,'2022-03-01','2025-11-30','Efetivo',5),(7,'2021-01-15',NULL,'Efetivo',6),(8,'2021-02-10',NULL,'Efetivo',7),(9,'2021-03-22',NULL,'PJ',8),(10,'2021-04-05',NULL,'PJ',9),(11,'2021-05-12',NULL,'Efetivo',10),(12,'2021-06-18',NULL,'Efetivo',11),(13,'2021-07-25',NULL,'Temporário',12),(14,'2021-08-14',NULL,'Temporário',13),(15,'2021-09-02',NULL,'Temporário',14),(16,'2021-10-10','2023-10-15','Efetivo',15),(17,'2021-11-05',NULL,'Efetivo',16),(18,'2021-12-20',NULL,'Efetivo',17),(19,'2021-12-28',NULL,'PJ',18),(20,'2021-12-30',NULL,'Efetivo',19),(21,'2022-01-10',NULL,'Efetivo',20),(22,'2022-01-25',NULL,'Efetivo',21),(23,'2022-02-14',NULL,'PJ',22),(24,'2022-03-01',NULL,'PJ',23),(25,'2022-03-15',NULL,'Efetivo',24),(26,'2022-04-12',NULL,'Efetivo',25),(27,'2022-05-02',NULL,'Temporário',26),(28,'2022-06-10',NULL,'Temporário',27),(29,'2022-07-18',NULL,'Temporário',28),(30,'2022-08-25','2024-05-20','Efetivo',29),(31,'2022-09-05',NULL,'Efetivo',30),(32,'2022-10-15',NULL,'Efetivo',31),(33,'2022-11-12',NULL,'PJ',32),(34,'2022-12-01',NULL,'Efetivo',33),(35,'2022-12-15',NULL,'Efetivo',34),(36,'2022-12-20',NULL,'Efetivo',35),(37,'2022-12-22',NULL,'PJ',36),(38,'2022-12-28',NULL,'PJ',37),(39,'2022-12-29',NULL,'Efetivo',38),(40,'2022-12-30',NULL,'Efetivo',39),(41,'2023-01-10',NULL,'Temporário',40),(42,'2023-01-20',NULL,'Temporário',41),(43,'2023-02-15',NULL,'Temporário',42),(44,'2023-03-05','2025-08-10','Estágio',43),(45,'2023-03-25',NULL,'Efetivo',44),(46,'2023-04-12',NULL,'Efetivo',45),(47,'2023-05-18',NULL,'PJ',46),(48,'2023-06-01',NULL,'Efetivo',47),(49,'2023-06-22',NULL,'Efetivo',48),(50,'2023-07-15',NULL,'Efetivo',49),(51,'2023-08-08',NULL,'PJ',50),(52,'2023-09-12',NULL,'PJ',51),(53,'2023-10-01',NULL,'Efetivo',52),(54,'2023-10-25',NULL,'Efetivo',53),(55,'2023-11-15',NULL,'Temporário',54),(56,'2023-12-05',NULL,'Temporário',55),(57,'2023-12-20',NULL,'Temporário',56),(58,'2023-12-28','2025-12-30','Efetivo',57),(59,'2023-12-29',NULL,'Efetivo',58),(60,'2023-12-30',NULL,'Efetivo',59),(61,'2024-01-10',NULL,'PJ',60),(62,'2024-01-25',NULL,'Efetivo',61),(63,'2024-02-14',NULL,'Efetivo',62),(64,'2024-03-01',NULL,'Efetivo',63),(65,'2024-03-18',NULL,'PJ',64),(66,'2024-04-05',NULL,'PJ',65),(67,'2024-05-10',NULL,'Efetivo',66),(68,'2024-06-01',NULL,'Efetivo',67),(69,'2024-06-15',NULL,'Temporário',68),(70,'2024-07-12',NULL,'Temporário',69),(71,'2024-08-01',NULL,'Temporário',70),(72,'2024-08-20','2026-03-01','Efetivo',71),(73,'2024-09-05',NULL,'Efetivo',72),(74,'2024-10-10',NULL,'Efetivo',73),(75,'2024-10-25',NULL,'PJ',74),(76,'2024-11-12',NULL,'Efetivo',75),(77,'2024-12-01',NULL,'Efetivo',76),(78,'2024-12-15',NULL,'Efetivo',77),(79,'2024-12-20',NULL,'PJ',78),(80,'2024-12-28',NULL,'PJ',79),(81,'2025-01-10',NULL,'Efetivo',80),(82,'2025-01-20',NULL,'Efetivo',81),(83,'2025-02-15',NULL,'Temporário',82),(84,'2025-03-01',NULL,'Temporário',83),(85,'2025-03-18',NULL,'Temporário',84),(86,'2025-04-12','2026-06-01','Estágio',85),(87,'2025-05-05',NULL,'Efetivo',86),(88,'2025-06-01',NULL,'Efetivo',87),(89,'2025-06-20',NULL,'PJ',88),(90,'2025-07-10',NULL,'Efetivo',89),(91,'2025-08-01',NULL,'Efetivo',90),(92,'2025-08-25',NULL,'Efetivo',91),(93,'2025-09-05',NULL,'PJ',92),(94,'2025-10-15',NULL,'PJ',93),(95,'2025-11-12',NULL,'Efetivo',94),(96,'2025-12-01','2025-11-30','Efetivo',95),(97,'2026-01-10',NULL,'Temporário',96),(98,'2026-01-25',NULL,'Temporário',97),(99,'2026-02-14',NULL,'Temporário',98),(100,'2026-03-01',NULL,'Estágio',99),(101,'2026-03-15',NULL,'Estágio',100),(102,'2026-04-05',NULL,'Efetivo',101),(103,'2026-04-20',NULL,'Efetivo',102),(104,'2026-05-01',NULL,'Efetivo',103),(105,'2026-05-15',NULL,'Efetivo',104),(106,'2026-06-01',NULL,'Efetivo',105);
/*!40000 ALTER TABLE `historico_vinculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inter_funcionario_treinamento`
--

DROP TABLE IF EXISTS `inter_funcionario_treinamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inter_funcionario_treinamento` (
  `id_inter_funcionario_treinamento` int(11) NOT NULL AUTO_INCREMENT,
  `id_funcionario` int(11) NOT NULL,
  `id_treinamento` int(11) NOT NULL,
  PRIMARY KEY (`id_inter_funcionario_treinamento`),
  KEY `fk_inter_func` (`id_funcionario`),
  KEY `fk_inter_treino` (`id_treinamento`),
  CONSTRAINT `fk_inter_func` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`),
  CONSTRAINT `fk_inter_treino` FOREIGN KEY (`id_treinamento`) REFERENCES `treinamento` (`id_treinamento`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inter_funcionario_treinamento`
--

LOCK TABLES `inter_funcionario_treinamento` WRITE;
/*!40000 ALTER TABLE `inter_funcionario_treinamento` DISABLE KEYS */;
INSERT INTO `inter_funcionario_treinamento` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,1,2),(6,3,2),(7,2,3),(8,4,3),(9,4,4),(10,2,5),(11,6,1),(12,7,1),(13,8,1),(14,9,1),(15,10,1),(16,11,1),(17,12,1),(18,13,1),(19,14,1),(20,15,1),(21,16,1),(22,17,1),(23,18,1),(24,19,1),(25,20,1),(26,21,1),(27,22,1),(28,23,1),(29,24,1),(30,25,1),(31,26,1),(32,27,1),(33,28,1),(34,29,1),(35,30,1),(36,31,1),(37,32,1),(38,33,1),(39,34,1),(40,35,1),(41,36,1),(42,37,1),(43,38,1),(44,39,1),(45,40,1),(46,41,1),(47,42,1),(48,43,1),(49,44,1),(50,45,1),(51,46,1),(52,47,1),(53,48,1),(54,49,1),(55,50,1),(56,12,2),(57,13,2),(58,14,2),(59,26,2),(60,27,2),(61,28,2),(62,40,2),(63,41,2),(64,42,2),(65,54,2),(66,55,2),(67,56,2),(68,68,2),(69,69,2),(70,70,2),(71,10,3),(72,11,3),(73,15,3),(74,16,3),(75,17,3),(76,18,3),(77,19,3),(78,25,3),(79,30,3),(80,31,3),(81,32,3),(82,33,3),(83,18,4),(84,32,4),(85,46,4),(86,60,4),(87,74,4),(88,88,4),(89,6,4),(90,20,4),(91,36,4),(92,50,4),(93,7,5),(94,21,5),(95,35,5),(96,49,5),(97,63,5),(98,77,5),(99,91,5),(100,105,5),(101,8,6),(102,9,6),(103,22,6),(104,23,6),(105,37,6),(106,51,6),(107,65,6),(108,79,6),(109,9,7),(110,23,7),(111,37,7),(112,51,7),(113,65,7),(114,11,8),(115,25,8),(116,39,8),(117,8,9),(118,22,9),(119,36,9),(120,18,10);
/*!40000 ALTER TABLE `inter_funcionario_treinamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacao_carreira`
--

DROP TABLE IF EXISTS `movimentacao_carreira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacao_carreira` (
  `id_mov_carreira` int(11) NOT NULL AUTO_INCREMENT,
  `data_movimentacao` date NOT NULL,
  `tipo_movimentacao` varchar(45) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  PRIMARY KEY (`id_mov_carreira`),
  KEY `fk_mov_func` (`id_funcionario`),
  KEY `fk_mov_cargo` (`id_cargo`),
  CONSTRAINT `fk_mov_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`),
  CONSTRAINT `fk_mov_func` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacao_carreira`
--

LOCK TABLES `movimentacao_carreira` WRITE;
/*!40000 ALTER TABLE `movimentacao_carreira` DISABLE KEYS */;
INSERT INTO `movimentacao_carreira` VALUES (1,'2015-01-10','Admissão',1,1),(2,'2026-02-01','Aumento Salarial',1,1),(3,'2020-05-01','Admissão',2,1),(4,'2025-08-10','Promoção',2,2),(5,'2018-02-15','Admissão',3,3),(6,'2023-05-12','Transferência',3,3),(7,'2021-10-01','Admissão',4,4),(8,'2022-03-01','Admissão',5,1),(9,'2021-04-05','Admissão',9,11),(10,'2021-05-12','Admissão',10,9),(11,'2021-06-18','Admissão',11,14),(12,'2021-07-25','Admissão',12,1),(13,'2021-08-14','Admissão',13,1),(14,'2021-09-02','Admissão',14,1),(15,'2021-10-10','Admissão',15,2),(16,'2021-11-05','Admissão',16,6),(17,'2021-12-20','Admissão',17,18),(18,'2021-12-28','Admissão',18,19),(19,'2021-12-30','Admissão',19,10),(20,'2022-01-10','Admissão',20,8),(21,'2022-01-25','Admissão',21,7),(22,'2022-02-14','Admissão',22,10),(23,'2022-03-01','Admissão',23,11),(24,'2022-03-15','Admissão',24,9),(25,'2022-04-12','Admissão',25,14),(26,'2022-05-02','Admissão',26,1),(27,'2022-06-10','Admissão',27,1),(28,'2022-07-18','Admissão',28,1),(29,'2022-08-25','Admissão',29,2),(30,'2022-09-05','Admissão',30,6),(31,'2022-10-15','Admissão',31,18),(32,'2022-11-12','Admissão',32,19),(33,'2022-12-01','Admissão',33,10),(34,'2022-12-15','Admissão',34,8),(35,'2022-12-20','Admissão',35,7),(36,'2022-12-22','Admissão',36,10),(37,'2022-12-28','Admissão',37,11),(38,'2022-12-29','Admissão',38,9),(39,'2022-12-30','Admissão',39,14),(40,'2023-01-10','Admissão',40,1),(41,'2023-01-20','Admissão',41,1),(42,'2023-02-15','Admissão',42,1),(43,'2023-03-05','Admissão',43,15),(44,'2023-03-25','Admissão',44,2),(45,'2023-04-12','Admissão',45,6),(46,'2023-05-18','Admissão',46,18),(47,'2023-06-01','Admissão',47,19),(48,'2023-06-22','Admissão',48,10),(49,'2023-07-15','Admissão',49,8),(50,'2023-08-08','Admissão',50,7),(51,'2023-09-12','Admissão',51,10),(52,'2023-10-01','Admissão',52,11),(53,'2023-10-25','Admissão',53,9),(54,'2023-11-15','Admissão',54,14),(55,'2023-12-05','Admissão',55,1),(56,'2023-12-20','Admissão',56,1),(57,'2023-12-28','Admissão',57,1),(58,'2023-12-29','Admissão',58,15),(59,'2023-12-30','Admissão',59,2),(60,'2024-01-10','Admissão',60,6),(61,'2024-01-25','Admissão',61,18),(62,'2024-02-14','Admissão',62,19),(63,'2024-03-01','Admissão',63,10),(64,'2024-03-18','Admissão',64,8),(65,'2024-04-05','Admissão',65,7),(66,'2024-05-10','Admissão',66,10),(67,'2024-06-01','Admissão',67,11),(68,'2024-06-15','Admissão',68,9),(69,'2024-07-12','Admissão',69,14),(70,'2024-08-01','Admissão',70,1),(71,'2024-08-20','Admissão',71,1),(72,'2024-09-05','Admissão',72,1),(73,'2024-10-10','Admissão',73,15),(74,'2024-10-25','Admissão',74,2),(75,'2024-11-12','Admissão',75,6),(76,'2024-12-01','Admissão',76,18),(77,'2024-12-15','Admissão',77,19),(78,'2024-12-20','Admissão',78,10),(79,'2024-12-28','Admissão',79,8),(80,'2025-01-10','Admissão',80,7),(81,'2025-01-20','Admissão',81,10),(82,'2025-02-15','Admissão',82,11),(83,'2025-03-01','Admissão',83,9),(84,'2025-03-18','Admissão',84,14),(85,'2025-04-12','Admissão',85,1),(86,'2025-05-05','Admissão',86,1),(87,'2025-06-01','Admissão',87,1),(88,'2025-06-20','Admissão',88,15),(89,'2025-07-10','Admissão',89,2),(90,'2025-08-01','Admissão',90,6),(91,'2025-08-25','Admissão',91,18),(92,'2025-09-05','Admissão',92,19),(93,'2025-10-15','Admissão',93,10),(94,'2025-11-12','Admissão',94,8),(95,'2025-01-15','Admissão',95,7),(96,'2026-01-10','Admissão',96,10),(97,'2026-01-25','Admissão',97,11),(98,'2026-02-14','Admissão',98,9),(99,'2026-03-01','Admissão',99,14),(100,'2026-03-15','Admissão',100,1),(101,'2026-04-05','Admissão',101,1),(102,'2026-04-20','Admissão',102,1),(103,'2026-05-01','Admissão',103,15),(104,'2026-05-15','Admissão',104,2),(105,'2026-06-01','Admissão',105,6),(106,'2025-07-22','Promoção',6,10),(107,'2025-09-18','Mudança de cargo',12,10),(108,'2025-11-05','Promoção',18,11),(109,'2026-01-20','Mudança de cargo',24,18),(110,'2026-03-11','Promoção',30,10),(111,'2026-05-25','Mudança de cargo',42,19),(112,'2023-01-15','Aumento Salarial',6,8),(113,'2023-06-10','Transferência',7,7),(114,'2023-11-10','Promoção',10,11),(115,'2022-12-01','Aumento Salarial',11,14),(116,'2024-11-05','Transferência',20,8),(117,'2025-06-15','Aumento Salarial',34,8),(118,'2025-10-18','Promoção',48,10),(119,'2023-10-15','Desligamento',15,2),(120,'2024-05-20','Desligamento',29,2),(121,'2025-08-10','Desligamento',43,15),(122,'2025-12-30','Desligamento',57,1),(123,'2026-03-01','Desligamento',71,1),(124,'2026-06-01','Desligamento',85,1),(125,'2025-11-30','Desligamento',95,7);
/*!40000 ALTER TABLE `movimentacao_carreira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processo_seletivo`
--

DROP TABLE IF EXISTS `processo_seletivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processo_seletivo` (
  `id_processo_seletivo` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` date NOT NULL,
  `fim` date DEFAULT NULL,
  `nome_processo_seletivo` varchar(45) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  PRIMARY KEY (`id_processo_seletivo`),
  KEY `fk_processo_departamento` (`id_departamento`),
  CONSTRAINT `fk_processo_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processo_seletivo`
--

LOCK TABLES `processo_seletivo` WRITE;
/*!40000 ALTER TABLE `processo_seletivo` DISABLE KEYS */;
INSERT INTO `processo_seletivo` VALUES (1,'2026-01-10','2026-02-15','Talentos Tech 2026',2),(2,'2026-05-01',NULL,'Expansão Comercial Nordeste',4),(3,'2025-11-01','2025-12-20','Estágio em Finanças',5),(4,'2026-05-20',NULL,'Líder de Atendimento',1),(5,'2024-06-01','2024-07-01','Operadores de Logística',3),(6,'2021-01-10','2021-02-15','Seleção Operadores Logística 2021',3),(7,'2021-02-15','2021-03-20','Contratação TI 2021',2),(8,'2021-03-01','2021-04-05','Estágio em RH 2021',1),(9,'2021-04-10','2021-05-15','Agentes de Vendas 2021',4),(10,'2021-05-20','2021-06-25','Analistas Financeiros 2021',5),(11,'2021-06-01','2021-07-05','Suporte Técnico I 2021',9),(12,'2021-07-15','2021-08-20','Auxiliares de Armazém 2021',3),(13,'2021-08-01','2021-09-05','Desenvolvedores Junior 2021',2),(14,'2021-09-10','2021-10-15','Jurídico Compliance 2021',7),(15,'2021-10-01','2021-11-05','Marketing Digital 2021',6),(16,'2021-10-15','2021-11-20','Analistas de Atendimento 2021',9),(17,'2021-11-01','2021-12-05','Engenharia de DevOps 2021',8),(18,'2021-11-15','2021-12-20','Qualidade Assegurada 2021',10),(19,'2021-12-01','2022-01-05','Assistentes Comerciais 2021',4),(20,'2021-12-15','2022-01-20','Contabilidade Interna 2021',5),(21,'2022-01-15','2022-02-20','Recrutamento Geral Operações 2022',3),(22,'2022-02-10','2022-03-15','Desenvolvedores Plenos 2022',2),(23,'2022-03-01','2022-04-05','BP de Recursos Humanos 2022',1),(24,'2022-04-15','2022-05-20','Expansão de Vendas Sul 2022',4),(25,'2022-05-10','2022-06-15','Expansão Operacional 2022',3),(26,'2022-06-01','2022-07-05','Analistas de FP&A 2022',5),(27,'2022-07-15','2022-08-20','Suporte Nível 2 2022',9),(28,'2022-08-01','2022-09-05','Qualidade de Software 2022',10),(29,'2022-08-15','2022-09-20','Design e Identidade Visual 2022',6),(30,'2022-09-10','2022-10-15','Segurança da Informação 2022',8),(31,'2022-10-01','2022-11-05','Advogados Plenos 2022',7),(32,'2022-10-15','2022-11-20','Atendimento Helpdesk 2022',9),(33,'2022-11-01','2022-12-05','Supervisores de Estoque 2022',3),(34,'2022-11-15','2022-12-20','Engenharia de Redes 2022',8),(35,'2022-12-01','2023-01-05','Faturamento e Cobrança 2022',5),(36,'2023-01-15','2023-02-28','Estágio Comercial 2023',4),(37,'2023-02-01','2023-03-10','SRE e Cloud Computing 2023',8),(38,'2023-02-15','2023-03-20','Recrutadores Internos 2023',1),(39,'2023-03-01','2023-04-05','Operadores de Empilhadeira 2023',3),(40,'2023-03-15','2023-04-20','Front-End Pleno 2023',2),(41,'2023-04-10','2023-05-15','Back-End Senior 2023',2),(42,'2023-05-01','2023-06-05','Auditoria Fiscal 2023',5),(43,'2023-05-15','2023-06-20','Analistas de Customer Success 2023',9),(44,'2023-06-01','2023-07-05','Analistas de QA Sênior 2023',10),(45,'2023-06-15','2023-07-20','Redatores Criativos 2023',6),(46,'2023-07-01','2023-08-05','Analistas de BI 2023',8),(47,'2023-07-15','2023-08-20','Advogados Trabalhistas 2023',7),(48,'2023-08-01','2023-09-05','Assistentes de DP 2023',1),(49,'2023-08-15','2023-09-20','Supervisores Logísticos Nordeste 2023',3),(50,'2023-09-01','2023-10-05','Consultores SAP 2023',2),(51,'2023-09-15','2023-10-20','Tesouraria Pleno 2023',5),(52,'2023-10-01','2023-11-05','Suporte Técnico N3 2023',9),(53,'2023-10-15','2023-11-20','Product Managers 2023',2),(54,'2023-11-01','2023-12-05','Analistas de SEO e Tráfego 2023',6),(55,'2023-11-15','2023-12-20','Analistas de Contratos 2023',7),(56,'2024-01-10','2024-02-15','Analistas de Atração de Talentos 2024',1),(57,'2024-01-25','2024-03-01','Desenvolvedores iOS 2024',2),(58,'2024-02-10','2024-03-15','Auxiliares de Expedição 2024',3),(59,'2024-03-01','2024-04-15','Líderes de Qualidade 2024',10),(60,'2024-03-15','2024-04-20','Executivos de Contas Key Account 2024',4),(61,'2024-04-01','2024-05-05','Analistas de Controladoria 2024',5),(62,'2024-04-15','2024-05-20','Engenharia de Dados Pleno 2024',8),(63,'2024-05-01','2024-06-05','Suporte Bilíngue 2024',9),(64,'2024-05-15','2024-06-20','Designers de Produto UX 2024',6),(65,'2024-06-01','2024-07-05','Segurança Corporativa 2024',7),(66,'2024-06-15','2024-07-20','Desenvolvedores Android 2024',2),(67,'2024-07-01','2024-08-05','Analistas de Treinamento e DHO 2024',1),(68,'2024-07-15','2024-08-20','Conferentes Operacionais 2024',3),(69,'2024-08-01','2024-09-05','Supervisores de Contas 2024',4),(70,'2024-08-15','2024-09-20','Analistas de Fusões e Aquisições 2024',5),(71,'2024-09-01','2024-10-05','Engenharia de Plataformas 2024',8),(72,'2024-09-15','2024-10-20','Analistas de CRM 2024',6),(73,'2024-10-01','2024-11-05','Advogados Tributários 2024',7),(74,'2024-10-15','2024-11-20','Supervisores de Customer Success 2024',9),(75,'2024-11-01','2024-12-05','Analistas de Segurança de Software 2024',10),(76,'2025-01-10','2025-02-15','Tech Leads 2025',2),(77,'2025-02-01','2025-03-10','Business Partners Especialistas 2025',1),(78,'2025-03-15','2025-04-20','Líderes de Armazenagem 2025',3),(79,'2025-04-01','2025-05-05','Inside Sales SDR 2025',4),(80,'2025-05-15','2025-06-20','Analistas Financeiros Master 2025',5),(81,'2025-06-01','2025-07-05','Product Owners 2025',2),(82,'2025-07-15','2025-08-20','Coordenadores de Suporte 2025',9),(83,'2025-08-01','2025-09-05','Analistas de Mídias Pagas 2025',6),(84,'2025-09-01','2025-10-15','Jurídico Corporativo 2025',7),(85,'2025-09-15','2025-10-20','Engenharia Cloud Senior 2025',8),(86,'2025-10-01','2025-11-05','Coordenadores de Garantia de Qualidade 2025',10),(87,'2025-10-15','2025-11-20','Desenvolvedores Full Stack 2025',2),(88,'2025-11-01','2025-12-05','Analistas de Remuneração e Benefícios 2025',1),(89,'2025-11-15','2025-12-20','Analistas de Planejamento Logístico 2025',3),(90,'2025-12-01','2026-01-05','Gerência de Contas Comercias 2025',4),(91,'2026-01-15','2026-02-20','Analistas Jurídicos Societário 2026',7),(92,'2026-02-01','2026-03-05','Cientistas de Dados 2026',8),(93,'2026-02-15','2026-03-20','Analistas de Trade Marketing 2026',6),(94,'2026-03-01','2026-04-05','Supervisores de Tesouraria 2026',5),(95,'2026-03-15','2026-04-20','Analistas de Service Desk 2026',9),(96,'2026-04-01','2026-05-05','Coordenadores de Recrutamento 2026',1),(97,'2026-04-15','2026-05-20','Supervisores de Produção Logística 2026',3),(98,'2026-05-01','2026-06-05','Engenheiros de QA Automatizado 2026',10),(99,'2026-05-01',NULL,'Expansão Comercial Nordeste',4),(100,'2026-05-20',NULL,'Líder de Atendimento',1),(101,'2026-06-01',NULL,'Expansão Engenharia Cloud',8),(102,'2026-06-05',NULL,'Talentos de Marketing 2026',6),(103,'2026-06-08',NULL,'Especialistas de Dados',8),(104,'2026-06-09',NULL,'Advogados de Contratos Sênior 2026',7),(105,'2026-06-10',NULL,'Analistas de Auditoria Financeira 2026',5);
/*!40000 ALTER TABLE `processo_seletivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setor`
--

DROP TABLE IF EXISTS `setor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setor` (
  `id_setor` int(11) NOT NULL AUTO_INCREMENT,
  `nome_setor` varchar(45) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  PRIMARY KEY (`id_setor`),
  KEY `fk_setor_departamento` (`id_departamento`),
  CONSTRAINT `fk_setor_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setor`
--

LOCK TABLES `setor` WRITE;
/*!40000 ALTER TABLE `setor` DISABLE KEYS */;
INSERT INTO `setor` VALUES (1,'Recrutamento e Seleção',1),(2,'Desenvolvimento de Software',2),(3,'Armazenagem e Estoque',3),(4,'Vendas Internas',4),(5,'Contas a Pagar',5),(6,'Branding e Redes Sociais',6),(7,'Design Criativo',6),(8,'Compliance e LGPD',7),(9,'Infraestrutura Cloud',8),(10,'Arquitetura de Dados',8),(11,'Atendimento ao Cliente',9),(12,'Helpdesk Interno',9),(13,'Controlo de Qualidade Operacional',10),(14,'Tesouraria e Caixa',5),(15,'Planeamento Financeiro (FP&A)',5);
/*!40000 ALTER TABLE `setor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treinamento`
--

DROP TABLE IF EXISTS `treinamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treinamento` (
  `id_treinamento` int(11) NOT NULL AUTO_INCREMENT,
  `nome_treinamento` varchar(45) NOT NULL,
  `duracao` time NOT NULL,
  PRIMARY KEY (`id_treinamento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treinamento`
--

LOCK TABLES `treinamento` WRITE;
/*!40000 ALTER TABLE `treinamento` DISABLE KEYS */;
INSERT INTO `treinamento` VALUES (1,'Integração de Novos Colaboradores','04:00:00'),(2,'Segurança do Trabalho e CIPA','08:00:00'),(3,'LGPD no Ambiente Corporativo','02:00:00'),(4,'Liderança e Gestão de Conflitos','16:00:00'),(5,'Excel Avançado e Dashboards','20:00:00'),(6,'Metodologias Ágeis e Scrum','12:00:00'),(7,'DevOps Essencial e CI/CD','16:00:00'),(8,'Comunicação Não-Violenta no Trabalho','06:00:00'),(9,'SQL Avançado e Modelação de Dados','24:00:00'),(10,'Segurança de Dados e LGPD Aplicada','04:00:00');
/*!40000 ALTER TABLE `treinamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turno` (
  `id_turno` int(11) NOT NULL AUTO_INCREMENT,
  `turno` varchar(7) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  PRIMARY KEY (`id_turno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno`
--

LOCK TABLES `turno` WRITE;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
INSERT INTO `turno` VALUES (1,'1º T','06:00:00','14:00:00'),(2,'2º T','14:00:00','22:00:00'),(3,'3º T','22:00:00','06:00:00');
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vagas`
--

DROP TABLE IF EXISTS `vagas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vagas` (
  `id_vaga` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cargo` varchar(45) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `id_processo_seletivo` int(11) NOT NULL,
  PRIMARY KEY (`id_vaga`),
  KEY `fk_vagas_processo` (`id_processo_seletivo`),
  CONSTRAINT `fk_vagas_processo` FOREIGN KEY (`id_processo_seletivo`) REFERENCES `processo_seletivo` (`id_processo_seletivo`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vagas`
--

LOCK TABLES `vagas` WRITE;
/*!40000 ALTER TABLE `vagas` DISABLE KEYS */;
INSERT INTO `vagas` VALUES (1,'Analista de Sistemas','Desenvolvimento Java e MySQL',1),(2,'Consultor de Vendas','Prospecção de novos clientes PJ',2),(3,'Estagiário Financeiro','Suporte em rotinas de conciliação',3),(4,'Business Partner','Atuação generalista de RH',4),(5,'Auxiliar Operacional','Separação e conferência de carga',5),(6,'Auxiliar Operacional','Suporte geral nas docas de carga e descarga',6),(7,'Analista de Sistemas','Desenvolvimento de APIs RESTful e manutenção ',7),(8,'Analista de RH','Triagem de currículos e suporte em processos ',8),(9,'Consultor de Vendas','Atendimento e vendas consultivas B2B',9),(10,'Estagiário Financeiro','Conciliação bancária diária e auxílio no cont',10),(11,'Analista de Atendimento','Atendimento de chamados nível 1 via chat e te',11),(12,'Assistente Operacional','Suporte no inventário do estoque físico',12),(13,'Programador Junior','Desenvolvimento front-end básico usando React',13),(14,'Advogado Corporativo','Análise de cláusulas padrão de prestação de s',14),(15,'Analista de Marketing','Gestão operacional de publicações em redes so',15),(16,'Analista de Atendimento','Suporte ao cliente e ouvidoria nível básico',16),(17,'Engenheiro de DevOps','Automação de builds e manutenção de pipelines',17),(18,'Engenheiro de Qualidade','Testes manuais funcionais e de regressão de s',18),(19,'Consultor de Vendas','Prospecção ativa de clientes via cold call',19),(20,'Estagiário Financeiro','Lançamento de notas fiscais no sistema ERP',20),(21,'Auxiliar Operacional','Auxílio na armazenagem em prateleiras elevada',21),(22,'Programador Pleno','Manutenção corretiva e evolutiva em backend J',22),(23,'Business Partner','Atuação generalista em suporte a gerências de',23),(24,'Consultor de Vendas','Prospecção externa na região metropolitana su',24),(25,'Auxiliar Operacional','Movimentação interna de paletes',25),(26,'Analista de Sistemas','Estudos de viabilidade e arquitetura funciona',26),(27,'Analista de Atendimento','Acompanhamento pós-venda e suporte técnico es',27),(28,'Engenheiro de Qualidade','Planejamento e modelagem de cenários de teste',28),(29,'Designer Gráfico','Produção de peças gráficas para campanhas int',29),(30,'Programador Senior','Liderança técnica e revisão de código em Pyth',30),(31,'Advogado Corporativo','Contencioso cível administrativo e peças de d',31),(32,'Analista de Atendimento','Atendimento especializado pós-vendas (helpdes',32),(33,'Supervisor de Logística','Coordenação operacional do turno da noite',33),(34,'Engenheiro de DevOps','Gerenciamento de infraestrutura em nuvem na A',34),(35,'Estagiário Financeiro','Suporte no envio de faturas e relatórios sema',35),(36,'Estagiário Financeiro','Suporte em rotinas de fluxo de caixa',36),(37,'Engenheiro de DevOps','Configuração de Kubernetes e Service Mesh',37),(38,'Recrutador','Condução de entrevistas técnicas e dinâmicas ',38),(39,'Auxiliar Operacional','Operação básica de empilhadeiras elétricas',39),(40,'Programador Pleno','Desenvolvimento de telas e usabilidade com Re',40),(41,'Programador Senior','Arquitetura de microsserviços tolerantes a fa',41),(42,'Estagiário Financeiro','Auditoria operacional preventiva em contas a ',42),(43,'Analista de Atendimento','Suporte avançado para retenção e satisfação d',43),(44,'Engenheiro de Qualidade','Automatização completa de testes de regressão',44),(45,'Designer Gráfico','Roteirização e edição de mídias de vídeo corp',45),(46,'Analista de Sistemas','Criação de relatórios analíticos de inteligên',46),(47,'Advogado Corporativo','Análise de passivos trabalhistas e negociaçõe',47),(48,'Analista de RH','Administração de admissões, demissões e benef',48),(49,'Supervisor de Logística','Supervisão de armazém de distribuição regiona',49),(50,'Analista de Sistemas','Implementação de módulos ERP customizados em ',50),(51,'Estagiário Financeiro','Auxílio na gestão e fluxo de contas correntes',51),(52,'Analista de Atendimento','Atendimento de alta prioridade corporativa ní',52),(53,'Analista de Sistemas','Desenho de portfólio de produto e gestão de r',53),(54,'Analista de Marketing','Otimização de campanhas pagas de busca e SEO ',54),(55,'Advogado Corporativo','Redação e validação de contratos comerciais c',55),(56,'Analista de RH','Alinhamento de perfil de novas vagas com gere',56),(57,'Programador Pleno','Criação de aplicativos nativos inovadores par',57),(58,'Auxiliar Operacional','Etiquetagem e pesagem de mercadorias para exp',58),(59,'Engenheiro de Qualidade','Liderança e auditoria de processos de qualida',59),(60,'Consultor de Vendas','Gerenciamento de contas chave e grandes distr',60),(61,'Estagiário Financeiro','Relatórios consolidados de receitas e despesa',61),(62,'Engenheiro de Dados','Construção de pipelines ETL integrados com Ap',62),(63,'Analista de Atendimento','Suporte técnico bilíngue (Português/Inglês)',63),(64,'Designer Gráfico','Estudos de usabilidade e prototipagem de tela',64),(65,'Advogado Corporativo','Auditoria geral de segurança física e contrat',65),(66,'Programador Pleno','Desenvolvimento nativo de apps mobile em Kotl',66),(67,'Analista de RH','Gestão de programas corporativos de treinamen',67),(68,'Auxiliar Operacional','Conferência detalhada e controle de entrada d',68),(69,'Consultor de Vendas','Acompanhamento regional de carteira de repres',69),(70,'Estagiário Financeiro','Modelagem estatística para fusões e aquisiçõe',70),(71,'Engenheiro de DevOps','Criação de ferramentas para suporte a desenvo',71),(72,'Analista de Marketing','Gestão operacional de ferramenta de CRM e dis',72),(73,'Advogado Corporativo','Análise de obrigações tributárias municipais ',73),(74,'Supervisor de Atendimento','Supervisão técnica de times de helpdesk e sup',74),(75,'Engenheiro de Qualidade','Auditoria de padrões de segurança e criptogra',75),(76,'Programador Senior','Liderança técnica em equipes ágeis multidisci',76),(77,'Business Partner','Planejamento estratégico de pessoal com foco ',77),(78,'Supervisor de Logística','Supervisão operacional de fluxo interno de su',78),(79,'Consultor de Vendas','Atendimento de leads pré-qualificados de pros',79),(80,'Estagiário Financeiro','Geração de projeções de cenários orçamentário',80),(81,'Programador Senior','Definição de roadmaps de entrega técnica em t',81),(82,'Supervisor de Atendimento','Supervisão do atendimento a reclamações de al',82),(83,'Analista de Marketing','Planejamento tático de campanhas pagas em can',83),(84,'Advogado Corporativo','Auditoria de governança corporativa e complia',84),(85,'Programador Senior','Arquitetura e modelagem de alta escalabilidad',85),(86,'Engenheiro de Qualidade','Liderança de times de garantia de qualidade (',86),(87,'Programador Pleno','Desenvolvimento ágil usando stack completa Ja',87),(88,'Analista de RH','Análise estruturada de pacotes de remuneração',88),(89,'Supervisor de Logística','Auditoria e otimização de rotas de transporte',89),(90,'Consultor de Vendas','Atendimento comercial a clientes premium e co',90),(91,'Advogado Corporativo','Assessoria e estruturação de atos societários',91),(92,'Engenheiro de Dados','Modelagem estatística preditiva de machine le',92),(93,'Analista de Marketing','Promoção e estratégias de merchandising em po',93),(94,'Supervisor de Logística','Análise de fluxo financeiro e contas a pagar ',94),(95,'Analista de Atendimento','Triagem de incidentes de helpdesk e documenta',95),(96,'Recrutador','Planejamento geral de campanhas de contrataçã',96),(97,'Supervisor de Logística','Coordenação do recebimento e estocagem de mat',97),(98,'Engenheiro de Qualidade','Desenvolvimento de testes de interface gráfic',98),(99,'Consultor de Vendas','Prospecção de novos clientes PJ',99),(100,'Business Partner','Atuação generalista de RH',100),(101,'Engenheiro de DevOps','Implementação de pipelines de CI/CD e monitor',101),(102,'Analista de Marketing','Gestão de campanhas pagas e branding instituc',102),(103,'Designer Gráfico','Criação de criativos digitais para redes soci',102),(104,'Engenheiro de Dados','Desenvolvimento de pipelines ETL estruturados',103),(105,'Advogado Corporativo','Análise e elaboração de minutas contratuais c',104),(106,'Estagiário Financeiro','Auditoria de transações bancárias e conciliaç',105);
/*!40000 ALTER TABLE `vagas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_aposentados_ativos`
--

DROP TABLE IF EXISTS `vw_aposentados_ativos`;
/*!50001 DROP VIEW IF EXISTS `vw_aposentados_ativos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_aposentados_ativos` AS SELECT 
 1 AS `total_aposentados_ativos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_departamentos_3turno`
--

DROP TABLE IF EXISTS `vw_departamentos_3turno`;
/*!50001 DROP VIEW IF EXISTS `vw_departamentos_3turno`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_departamentos_3turno` AS SELECT 
 1 AS `nome_departamento`,
 1 AS `total_colaboradores`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_detalhes_vagas_abertas`
--

DROP TABLE IF EXISTS `vw_detalhes_vagas_abertas`;
/*!50001 DROP VIEW IF EXISTS `vw_detalhes_vagas_abertas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_detalhes_vagas_abertas` AS SELECT 
 1 AS `nome_vaga`,
 1 AS `nome_processo_seletivo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ferias_proximos_60_dias`
--

DROP TABLE IF EXISTS `vw_ferias_proximos_60_dias`;
/*!50001 DROP VIEW IF EXISTS `vw_ferias_proximos_60_dias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ferias_proximos_60_dias` AS SELECT 
 1 AS `nome_funcionario`,
 1 AS `inicio`,
 1 AS `fim`,
 1 AS `status_ferias`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_indicadores_turnover`
--

DROP TABLE IF EXISTS `vw_indicadores_turnover`;
/*!50001 DROP VIEW IF EXISTS `vw_indicadores_turnover`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_indicadores_turnover` AS SELECT 
 1 AS `ano`,
 1 AS `total_admissoes`,
 1 AS `total_desligamentos`,
 1 AS `taxa_turnover`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_media_salarial_detalhada`
--

DROP TABLE IF EXISTS `vw_media_salarial_detalhada`;
/*!50001 DROP VIEW IF EXISTS `vw_media_salarial_detalhada`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_media_salarial_detalhada` AS SELECT 
 1 AS `nome_cargo`,
 1 AS `nome_setor`,
 1 AS `turno`,
 1 AS `media_salarial`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_movimentacao_anual`
--

DROP TABLE IF EXISTS `vw_movimentacao_anual`;
/*!50001 DROP VIEW IF EXISTS `vw_movimentacao_anual`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_movimentacao_anual` AS SELECT 
 1 AS `ano`,
 1 AS `total_admissoes`,
 1 AS `total_desligamentos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ocorrencias_carnaval`
--

DROP TABLE IF EXISTS `vw_ocorrencias_carnaval`;
/*!50001 DROP VIEW IF EXISTS `vw_ocorrencias_carnaval`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ocorrencias_carnaval` AS SELECT 
 1 AS `id_funcionario`,
 1 AS `nome_funcionario`,
 1 AS `data_referencia`,
 1 AS `tipo_ocorrencia`,
 1 AS `justificado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_participacao_treinamentos`
--

DROP TABLE IF EXISTS `vw_participacao_treinamentos`;
/*!50001 DROP VIEW IF EXISTS `vw_participacao_treinamentos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_participacao_treinamentos` AS SELECT 
 1 AS `id_treinamento`,
 1 AS `nome_treinamento`,
 1 AS `total_participantes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_processos_seletivos_vagas`
--

DROP TABLE IF EXISTS `vw_processos_seletivos_vagas`;
/*!50001 DROP VIEW IF EXISTS `vw_processos_seletivos_vagas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_processos_seletivos_vagas` AS SELECT 
 1 AS `nome_processo_seletivo`,
 1 AS `total_vagas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_promocoes_recentes`
--

DROP TABLE IF EXISTS `vw_promocoes_recentes`;
/*!50001 DROP VIEW IF EXISTS `vw_promocoes_recentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_promocoes_recentes` AS SELECT 
 1 AS `id_funcionario`,
 1 AS `nome_funcionario`,
 1 AS `novo_cargo`,
 1 AS `data_promocao`,
 1 AS `tipo_movimentacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_top10_tempo_empresa`
--

DROP TABLE IF EXISTS `vw_top10_tempo_empresa`;
/*!50001 DROP VIEW IF EXISTS `vw_top10_tempo_empresa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_top10_tempo_empresa` AS SELECT 
 1 AS `id_funcionario`,
 1 AS `nome_funcionario`,
 1 AS `total_dias_empresa`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ultimo_salario_funcionario`
--

DROP TABLE IF EXISTS `vw_ultimo_salario_funcionario`;
/*!50001 DROP VIEW IF EXISTS `vw_ultimo_salario_funcionario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ultimo_salario_funcionario` AS SELECT 
 1 AS `id_funcionario`,
 1 AS `salario`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'sistema_rh'
--

--
-- Dumping routines for database 'sistema_rh'
--

--
-- Final view structure for view `vw_aposentados_ativos`
--

/*!50001 DROP VIEW IF EXISTS `vw_aposentados_ativos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_aposentados_ativos` AS select count(0) AS `total_aposentados_ativos` from `funcionarios` where `funcionarios`.`aposentado` = 'S' and `funcionarios`.`status` = 'A' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_departamentos_3turno`
--

/*!50001 DROP VIEW IF EXISTS `vw_departamentos_3turno`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_departamentos_3turno` AS select `d`.`nome_departamento` AS `nome_departamento`,count(`f`.`id_funcionario`) AS `total_colaboradores` from (((`funcionarios` `f` join `setor` `s` on(`f`.`id_setor` = `s`.`id_setor`)) join `departamento` `d` on(`s`.`id_departamento` = `d`.`id_departamento`)) join `turno` `t` on(`f`.`id_turno` = `t`.`id_turno`)) where `t`.`turno` = '3º T' group by `d`.`id_departamento`,`d`.`nome_departamento` order by count(`f`.`id_funcionario`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_detalhes_vagas_abertas`
--

/*!50001 DROP VIEW IF EXISTS `vw_detalhes_vagas_abertas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_detalhes_vagas_abertas` AS select `v`.`nome_cargo` AS `nome_vaga`,`ps`.`nome_processo_seletivo` AS `nome_processo_seletivo` from (`vagas` `v` join `processo_seletivo` `ps` on(`v`.`id_processo_seletivo` = `ps`.`id_processo_seletivo`)) where `ps`.`fim` is null or `ps`.`fim` >= curdate() */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ferias_proximos_60_dias`
--

/*!50001 DROP VIEW IF EXISTS `vw_ferias_proximos_60_dias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ferias_proximos_60_dias` AS select `f`.`nome_funcionario` AS `nome_funcionario`,`fe`.`inicio` AS `inicio`,`fe`.`fim` AS `fim`,`fe`.`status_ferias` AS `status_ferias` from (`ferias` `fe` join `funcionarios` `f` on(`fe`.`id_funcionario` = `f`.`id_funcionario`)) where `fe`.`status_ferias` = 'Agendada' and `fe`.`inicio` between curdate() and curdate() + interval 60 day */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_indicadores_turnover`
--

/*!50001 DROP VIEW IF EXISTS `vw_indicadores_turnover`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_indicadores_turnover` AS select `vw_movimentacao_anual`.`ano` AS `ano`,`vw_movimentacao_anual`.`total_admissoes` AS `total_admissoes`,`vw_movimentacao_anual`.`total_desligamentos` AS `total_desligamentos`,round((`vw_movimentacao_anual`.`total_admissoes` + `vw_movimentacao_anual`.`total_desligamentos`) / 2 / (`vw_movimentacao_anual`.`total_admissoes` - `vw_movimentacao_anual`.`total_desligamentos` + 1) * 100,2) AS `taxa_turnover` from `vw_movimentacao_anual` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_media_salarial_detalhada`
--

/*!50001 DROP VIEW IF EXISTS `vw_media_salarial_detalhada`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_media_salarial_detalhada` AS select `c`.`nome_cargo` AS `nome_cargo`,`s`.`nome_setor` AS `nome_setor`,`t`.`turno` AS `turno`,round(avg(`us`.`salario`),2) AS `media_salarial` from ((((`funcionarios` `f` join `cargo` `c` on(`f`.`id_cargo` = `c`.`id_cargo`)) join `setor` `s` on(`f`.`id_setor` = `s`.`id_setor`)) join `turno` `t` on(`f`.`id_turno` = `t`.`id_turno`)) join `vw_ultimo_salario_funcionario` `us` on(`f`.`id_funcionario` = `us`.`id_funcionario`)) group by `c`.`nome_cargo`,`s`.`nome_setor`,`t`.`turno` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_movimentacao_anual`
--

/*!50001 DROP VIEW IF EXISTS `vw_movimentacao_anual`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_movimentacao_anual` AS select year(`historico_vinculos`.`data_inicio`) AS `ano`,count(0) AS `total_admissoes`,count(`historico_vinculos`.`data_saida`) AS `total_desligamentos` from `historico_vinculos` group by year(`historico_vinculos`.`data_inicio`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ocorrencias_carnaval`
--

/*!50001 DROP VIEW IF EXISTS `vw_ocorrencias_carnaval`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ocorrencias_carnaval` AS select `f`.`id_funcionario` AS `id_funcionario`,`f`.`nome_funcionario` AS `nome_funcionario`,`p`.`data_referencia` AS `data_referencia`,`p`.`tipo_ocorrencia` AS `tipo_ocorrencia`,`p`.`justificado` AS `justificado` from (`folha_de_ponto` `p` join `funcionarios` `f` on(`p`.`id_funcionario` = `f`.`id_funcionario`)) where `p`.`tipo_ocorrencia` in ('Falta','Atraso') and `p`.`justificado` = 'N' and (`p`.`data_referencia` between '2024-02-10' and '2024-02-14' or `p`.`data_referencia` between '2025-02-28' and '2025-03-05' or `p`.`data_referencia` between '2026-02-13' and '2026-02-18') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_participacao_treinamentos`
--

/*!50001 DROP VIEW IF EXISTS `vw_participacao_treinamentos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_participacao_treinamentos` AS select `t`.`id_treinamento` AS `id_treinamento`,`t`.`nome_treinamento` AS `nome_treinamento`,count(`ift`.`id_funcionario`) AS `total_participantes` from (`treinamento` `t` left join `inter_funcionario_treinamento` `ift` on(`t`.`id_treinamento` = `ift`.`id_treinamento`)) group by `t`.`id_treinamento`,`t`.`nome_treinamento` order by count(`ift`.`id_funcionario`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_processos_seletivos_vagas`
--

/*!50001 DROP VIEW IF EXISTS `vw_processos_seletivos_vagas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_processos_seletivos_vagas` AS select `ps`.`nome_processo_seletivo` AS `nome_processo_seletivo`,count(`v`.`id_vaga`) AS `total_vagas` from (`processo_seletivo` `ps` left join `vagas` `v` on(`ps`.`id_processo_seletivo` = `v`.`id_processo_seletivo`)) where `ps`.`fim` is null or `ps`.`fim` >= curdate() group by `ps`.`id_processo_seletivo`,`ps`.`nome_processo_seletivo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_promocoes_recentes`
--

/*!50001 DROP VIEW IF EXISTS `vw_promocoes_recentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_promocoes_recentes` AS select `f`.`id_funcionario` AS `id_funcionario`,`f`.`nome_funcionario` AS `nome_funcionario`,`c`.`nome_cargo` AS `novo_cargo`,`mc`.`data_movimentacao` AS `data_promocao`,`mc`.`tipo_movimentacao` AS `tipo_movimentacao` from ((`movimentacao_carreira` `mc` join `funcionarios` `f` on(`mc`.`id_funcionario` = `f`.`id_funcionario`)) join `cargo` `c` on(`mc`.`id_cargo` = `c`.`id_cargo`)) where `mc`.`tipo_movimentacao` in ('Promoção','Mudança de cargo') and `mc`.`data_movimentacao` >= curdate() - interval 12 month */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_top10_tempo_empresa`
--

/*!50001 DROP VIEW IF EXISTS `vw_top10_tempo_empresa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_top10_tempo_empresa` AS select `f`.`id_funcionario` AS `id_funcionario`,`f`.`nome_funcionario` AS `nome_funcionario`,sum(to_days(coalesce(`v`.`data_saida`,curdate())) - to_days(`v`.`data_inicio`)) AS `total_dias_empresa` from (`funcionarios` `f` join `historico_vinculos` `v` on(`f`.`id_funcionario` = `v`.`id_funcionario`)) group by `f`.`id_funcionario`,`f`.`nome_funcionario` order by sum(to_days(coalesce(`v`.`data_saida`,curdate())) - to_days(`v`.`data_inicio`)) desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ultimo_salario_funcionario`
--

/*!50001 DROP VIEW IF EXISTS `vw_ultimo_salario_funcionario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ultimo_salario_funcionario` AS select `hs`.`id_funcionario` AS `id_funcionario`,`hs`.`salario` AS `salario` from `historico_salarial` `hs` where `hs`.`id_historico_salarial` = (select max(`historico_salarial`.`id_historico_salarial`) from `historico_salarial` where `historico_salarial`.`id_funcionario` = `hs`.`id_funcionario`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-10 19:45:36
