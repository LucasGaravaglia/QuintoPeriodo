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
  `idEndereco` int(10) unsigned DEFAULT NULL,
  `nomeAluno` varchar(255) NOT NULL,
  `cpfAluno` varchar(12) NOT NULL,
  `foneAluno` varchar(255) NOT NULL,
  `anoLetivo` int(11) DEFAULT NULL,
  `emailAluno` varchar(255) NOT NULL,
  `nascimentoAluno` date NOT NULL,
  `sexoAluno` char(1) NOT NULL,
  PRIMARY KEY (`idAluno`),
  KEY `idEndereco` (`idEndereco`),
  CONSTRAINT `Alunos_ibfk_1` FOREIGN KEY (`idEndereco`) REFERENCES `Enderecos` (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alunos`
--

LOCK TABLES `Alunos` WRITE;
/*!40000 ALTER TABLE `Alunos` DISABLE KEYS */;
INSERT INTO `Alunos` VALUES (1,1,'Levi Arcanjo','15090188999','45985641547',2020,'arcanjolevi@gmail.com','1990-12-12','M'),(2,2,'Caio Cezar Nevando','1245524185','45999999999',2020,'caioslppuo@gmail.com','1999-12-03','M'),(3,3,'Lucas Gravata','18771669756','45888157584',2020,'lucasgrafimar@gmail.com','2000-02-28','M');
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
  `idCurso` int(10) unsigned NOT NULL,
  KEY `idCurso` (`idCurso`),
  KEY `idDisciplina` (`idDisciplina`),
  CONSTRAINT `DisciplinasCursos_ibfk_1` FOREIGN KEY (`idCurso`) REFERENCES `Cursos` (`idCurso`),
  CONSTRAINT `DisciplinasCursos_ibfk_2` FOREIGN KEY (`idDisciplina`) REFERENCES `Disciplinas` (`idDisciplina`)
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
-- Table structure for table `Enderecos`
--

DROP TABLE IF EXISTS `Enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Enderecos` (
  `idEndereco` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rua` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `cep` varchar(255) NOT NULL,
  PRIMARY KEY (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enderecos`
--

LOCK TABLES `Enderecos` WRITE;
/*!40000 ALTER TABLE `Enderecos` DISABLE KEYS */;
INSERT INTO `Enderecos` VALUES (1,'Av. Tancrevo Neves','Cascavel','Sao Paulo','858585-458'),(2,'Av. Brasil','Foz do Iguacu','Parana','85855-500'),(3,'Rua Caio Nevando das Cachueiras','Foz do Iguacu','Parana','77777-777'),(4,'Av. Pablo Vitar','Foz do Iguacu','Parana','11111-111'),(5,'Av. Padre Fabio de Melo','Foz do Iguacu','Parana','66666-666');
/*!40000 ALTER TABLE `Enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MatriculasCursos`
--

DROP TABLE IF EXISTS `MatriculasCursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MatriculasCursos` (
  `numeroMatriculaCurso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idAluno` int(10) unsigned DEFAULT NULL,
  `idCurso` int(10) unsigned DEFAULT NULL,
  `dataMatriculaCurso` date NOT NULL,
  `situacaoCurso` varchar(255) NOT NULL,
  PRIMARY KEY (`numeroMatriculaCurso`),
  KEY `idAluno` (`idAluno`),
  KEY `idCurso` (`idCurso`),
  CONSTRAINT `MatriculasCursos_ibfk_1` FOREIGN KEY (`idAluno`) REFERENCES `Alunos` (`idAluno`),
  CONSTRAINT `MatriculasCursos_ibfk_2` FOREIGN KEY (`idCurso`) REFERENCES `Cursos` (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MatriculasCursos`
--

LOCK TABLES `MatriculasCursos` WRITE;
/*!40000 ALTER TABLE `MatriculasCursos` DISABLE KEYS */;
INSERT INTO `MatriculasCursos` VALUES (4,1,1,'2018-11-27','Cursando'),(5,2,1,'2013-01-01','Cursando'),(6,3,1,'2020-01-23','Cursando');
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
  `idDisciplina` int(10) unsigned DEFAULT NULL,
  `idAluno` int(10) unsigned DEFAULT NULL,
  `dataMatriculaDisciplina` date NOT NULL,
  PRIMARY KEY (`nrmMatriculaDisciplina`),
  KEY `idDisciplina` (`idDisciplina`),
  KEY `idAluno` (`idAluno`),
  CONSTRAINT `MatriculasDisciplinas_ibfk_1` FOREIGN KEY (`idDisciplina`) REFERENCES `Disciplinas` (`idDisciplina`),
  CONSTRAINT `MatriculasDisciplinas_ibfk_2` FOREIGN KEY (`idAluno`) REFERENCES `Alunos` (`idAluno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MatriculasDisciplinas`
--

LOCK TABLES `MatriculasDisciplinas` WRITE;
/*!40000 ALTER TABLE `MatriculasDisciplinas` DISABLE KEYS */;
INSERT INTO `MatriculasDisciplinas` VALUES (1,1,1,'2021-02-12'),(2,2,3,'2020-02-12'),(3,3,2,'2020-02-12'),(4,4,2,'2021-02-12'),(5,5,3,'2019-02-12'),(6,6,1,'2020-02-12'),(7,7,3,'2021-02-12'),(8,1,2,'2019-02-12'),(9,5,1,'2019-02-12');
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
  `idEndereco` int(10) unsigned DEFAULT NULL,
  `nomeProfessor` varchar(255) NOT NULL,
  `cpfProfessor` varchar(12) NOT NULL,
  `foneProfessor` varchar(255) NOT NULL,
  `emailProfessor` varchar(255) NOT NULL,
  `nascimentoProfessor` date NOT NULL,
  `sexoProfessor` char(1) NOT NULL,
  PRIMARY KEY (`idProfessor`),
  KEY `idEndereco` (`idEndereco`),
  CONSTRAINT `Professores_ibfk_1` FOREIGN KEY (`idEndereco`) REFERENCES `Enderecos` (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professores`
--

LOCK TABLES `Professores` WRITE;
/*!40000 ALTER TABLE `Professores` DISABLE KEYS */;
INSERT INTO `Professores` VALUES (1,5,'Roberto Gil Brasil','16492598759','45986578432','robertogbrasil@gmail.com','1975-01-01','M'),(2,4,'Marcos Antonis Hashicuca','16457598759','45986574587','shiro@gmail.com','1959-01-01','M');
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
  `idProfessor` int(10) unsigned NOT NULL,
  `dataInicio` date NOT NULL,
  `dataFim` date NOT NULL,
  KEY `idDisciplina` (`idDisciplina`),
  KEY `idProfessor` (`idProfessor`),
  CONSTRAINT `ProfessoresDisciplinas_ibfk_1` FOREIGN KEY (`idDisciplina`) REFERENCES `Disciplinas` (`idDisciplina`),
  CONSTRAINT `ProfessoresDisciplinas_ibfk_2` FOREIGN KEY (`idProfessor`) REFERENCES `Professores` (`idProfessor`)
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

-- Dump completed on 2021-01-30 19:11:05
