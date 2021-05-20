-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: universidade
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB-1:10.5.8+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Alunos`
--

DROP TABLE IF EXISTS `Alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alunos` (
  `idAluno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomeAluno` varchar(255) NOT NULL,
  `cpfAluno` varchar(12) NOT NULL,
  `foneAluno` varchar(255) NOT NULL,
  `enderecoAluno` varchar(255) NOT NULL,
  `anoLetivo` int(11) NOT NULL,
  `emailAluno` varchar(255) NOT NULL,
  `nascimentoAluno` varchar(255) NOT NULL,
  `sexoAluno` varchar(3) NOT NULL,
  PRIMARY KEY (`idAluno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alunos`
--

LOCK TABLES `Alunos` WRITE;
/*!40000 ALTER TABLE `Alunos` DISABLE KEYS */;
INSERT INTO `Alunos` VALUES (1,'Levi','15090188999','45985641547','Rua Caio Cezar da Neves n666',2021,'arcanjolevi@gmail.com','29/02/1998','Mas'),(3,'Lucas','18771669756','45888157584','Rua Levi Cero Arcanjo n424, Foz do Iguacu - PR',2021,'lucasgrafimar@gmail.com','28/02/2000','mas'),(4,'Caio','1245524185','45999999999','Rua Jabariquatinga n666',2021,'caioslppuo@gmail.com','03/02/1999','Mas');
/*!40000 ALTER TABLE `Alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cursos`
--

DROP TABLE IF EXISTS `Cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cursos` (
  `idCurso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomeCurso` varchar(255) NOT NULL,
  `duracaoCurso` varchar(255) NOT NULL,
  `campusCurso` varchar(255) NOT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cursos`
--

LOCK TABLES `Cursos` WRITE;
/*!40000 ALTER TABLE `Cursos` DISABLE KEYS */;
INSERT INTO `Cursos` VALUES (1,'Ciencia da computacao','4 Anos','Foz do Iguacu'),(2,'Engenharia Mecanica','5 Anos','Foz do Iguacu'),(3,'Engenharia Eletrica','5 Anos','Foz do Iguacu');
/*!40000 ALTER TABLE `Cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disciplinas`
--

DROP TABLE IF EXISTS `Disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Disciplinas` (
  `idDisciplina` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomeDisciplina` varchar(255) NOT NULL,
  `cargaHoraria` int(10) unsigned NOT NULL,
  `serie` int(10) unsigned NOT NULL,
  `periodo` varchar(255) NOT NULL,
  PRIMARY KEY (`idDisciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disciplinas`
--

LOCK TABLES `Disciplinas` WRITE;
/*!40000 ALTER TABLE `Disciplinas` DISABLE KEYS */;
INSERT INTO `Disciplinas` VALUES (1,'Banco de dados',102,3,'Semestral'),(2,'Formacao Empreendedora',136,3,'Anual'),(3,'Organizacao e Arquitetura de Computadores',102,3,'Semestral'),(4,'Redes de Computadores',68,3,'Semestral'),(5,'Compiladores',68,3,'Semestral'),(6,'Engenharia de Software I',136,3,'Semestral'),(7,'Projeto e Analise de Algoritmos',102,3,'Semestral');
/*!40000 ALTER TABLE `Disciplinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DisciplinasCursos`
--

DROP TABLE IF EXISTS `DisciplinasCursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DisciplinasCursos` (
  `idDisciplina` int(10) unsigned NOT NULL,
  `idCurso` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DisciplinasCursos`
--

LOCK TABLES `DisciplinasCursos` WRITE;
/*!40000 ALTER TABLE `DisciplinasCursos` DISABLE KEYS */;
INSERT INTO `DisciplinasCursos` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1);
/*!40000 ALTER TABLE `DisciplinasCursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MatriculasCursos`
--

DROP TABLE IF EXISTS `MatriculasCursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MatriculasCursos` (
  `idAluno` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `dataMatriculaCurso` varchar(255) NOT NULL,
  `situacaoCurso` varchar(255) NOT NULL,
  `numeroMatriculaCurso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`numeroMatriculaCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MatriculasCursos`
--

LOCK TABLES `MatriculasCursos` WRITE;
/*!40000 ALTER TABLE `MatriculasCursos` DISABLE KEYS */;
INSERT INTO `MatriculasCursos` VALUES (1,1,'27/11/2018','Cursando',1),(3,1,'01/01/2013','Cursando',2),(4,1,'23/01/2020','Cursando',3);
/*!40000 ALTER TABLE `MatriculasCursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MatriculasDisciplinas`
--

DROP TABLE IF EXISTS `MatriculasDisciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MatriculasDisciplinas` (
  `nrmMatriculaDisciplina` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idDisciplina` int(10) unsigned NOT NULL,
  `dataMatriculaDisciplina` varchar(255) NOT NULL,
  `idAluno` int(10) unsigned NOT NULL,
  PRIMARY KEY (`nrmMatriculaDisciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MatriculasDisciplinas`
--

LOCK TABLES `MatriculasDisciplinas` WRITE;
/*!40000 ALTER TABLE `MatriculasDisciplinas` DISABLE KEYS */;
INSERT INTO `MatriculasDisciplinas` VALUES (9,1,'12/02/21',1),(10,2,'12/02/20',3),(11,3,'12/02/20',4),(12,4,'12/02/21',4),(13,5,'12/02/19',3),(14,6,'12/02/20',1),(15,7,'12/02/21',3),(16,1,'12/02/19',4),(17,5,'12/02/19',1);
/*!40000 ALTER TABLE `MatriculasDisciplinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professores`
--

DROP TABLE IF EXISTS `Professores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Professores` (
  `idProfessor` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomeProfessor` varchar(255) NOT NULL,
  `cpfProfessor` varchar(12) NOT NULL,
  `foneProfessor` varchar(255) NOT NULL,
  `enderecoProfessor` varchar(255) NOT NULL,
  `anoProfessoro` int(11) NOT NULL,
  `emailProfessor` varchar(255) NOT NULL,
  `nascimentoProfessor` varchar(255) NOT NULL,
  `sexoProfessor` varchar(3) NOT NULL,
  PRIMARY KEY (`idProfessor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professores`
--

LOCK TABLES `Professores` WRITE;
/*!40000 ALTER TABLE `Professores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Professores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProfessoresDisciplinas`
--

DROP TABLE IF EXISTS `ProfessoresDisciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProfessoresDisciplinas` (
  `idDisciplina` int(10) unsigned NOT NULL,
  `idProfessor` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProfessoresDisciplinas`
--

LOCK TABLES `ProfessoresDisciplinas` WRITE;
/*!40000 ALTER TABLE `ProfessoresDisciplinas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProfessoresDisciplinas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-29 17:22:03
