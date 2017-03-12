# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.21-MariaDB)
# Database: ciaXYZ
# Generation Time: 2017-03-12 23:50:43 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ciudades
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `departamentos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ciudades_departamentos1_idx` (`departamentos_id`),
  CONSTRAINT `fk_ciudades_departamentos1` FOREIGN KEY (`departamentos_id`) REFERENCES `departamentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;

INSERT INTO `ciudades` (`id`, `nombre`, `departamentos_id`)
VALUES
	(1,'Medellin',1),
	(2,'Envigado',1),
	(3,'Bogota',2);

/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table departamentos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `departamentos`;

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;

INSERT INTO `departamentos` (`id`, `nombre`)
VALUES
	(1,'Antioquia'),
	(2,'Cundinamarca');

/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table empleados
# ------------------------------------------------------------

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `ciudade_id_nace` int(11) DEFAULT NULL,
  `ciudade_id_vive` int(11) NOT NULL,
  `profesion_id` int(11) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `nmestrato` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empleados_empleados1_idx` (`empleado_id`),
  KEY `fk_empleados_ciudades1_idx` (`ciudade_id_nace`),
  KEY `fk_empleados_ciudades2_idx` (`ciudade_id_vive`),
  KEY `fk_empleados_profesiones1_idx` (`profesion_id`),
  CONSTRAINT `fk_empleados_ciudades1` FOREIGN KEY (`ciudade_id_nace`) REFERENCES `ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleados_ciudades2` FOREIGN KEY (`ciudade_id_vive`) REFERENCES `ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleados_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleados_profesiones1` FOREIGN KEY (`profesion_id`) REFERENCES `profesiones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;

INSERT INTO `empleados` (`id`, `nombre`, `direccion`, `telefono`, `cargo`, `salario`, `empleado_id`, `ciudade_id_nace`, `ciudade_id_vive`, `profesion_id`, `sexo`, `apellido`, `nmestrato`)
VALUES
	(1,'Nestor','calle siempre viva 123','4449988','Presidente',15000000.00,NULL,1,1,2,'M','Lopez',3),
	(2,'Liliana','cara 123','4449987','Jefe Carrera',7000000.00,1,NULL,1,2,'F','Duque',4),
	(3,'Sergio','el retiro','4449986','Prof de Catedra',1200000.00,2,NULL,3,3,'M','Diaz',5),
	(4,'Ana','LA casa','3242343','dsfadsf',7000000.00,3,NULL,1,3,'F','Restrepo',3),
	(5,'Natalia','sdfasdf','3423432','dfadsfa',7000000.00,4,NULL,3,1,'F','Martinez',5);

/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table estudios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `estudios`;

CREATE TABLE `estudios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `estudios` WRITE;
/*!40000 ALTER TABLE `estudios` DISABLE KEYS */;

INSERT INTO `estudios` (`id`, `nombre`)
VALUES
	(1,'Administracion de Empresas'),
	(2,'Ing Sistemas'),
	(3,'MBA'),
	(4,'Esp Desarrollo Software'),
	(5,'Bachiller');

/*!40000 ALTER TABLE `estudios` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table estudios_empleados
# ------------------------------------------------------------

DROP TABLE IF EXISTS `estudios_empleados`;

CREATE TABLE `estudios_empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estudio_id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estudios_empleados_estudios_idx` (`estudio_id`),
  KEY `fk_estudios_empleados_empleados1_idx` (`empleado_id`),
  CONSTRAINT `fk_estudios_empleados_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estudios_empleados_estudios` FOREIGN KEY (`estudio_id`) REFERENCES `estudios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `estudios_empleados` WRITE;
/*!40000 ALTER TABLE `estudios_empleados` DISABLE KEYS */;

INSERT INTO `estudios_empleados` (`id`, `estudio_id`, `empleado_id`)
VALUES
	(1,1,5),
	(2,3,1),
	(3,2,2),
	(4,4,2),
	(5,5,1);

/*!40000 ALTER TABLE `estudios_empleados` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table profesiones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profesiones`;

CREATE TABLE `profesiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `profesiones` WRITE;
/*!40000 ALTER TABLE `profesiones` DISABLE KEYS */;

INSERT INTO `profesiones` (`id`, `nombre`)
VALUES
	(1,'Ama de Casa'),
	(2,'Profesor'),
	(3,'Desarrollador');

/*!40000 ALTER TABLE `profesiones` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rangos_salarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rangos_salarios`;

CREATE TABLE `rangos_salarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limite_inferior` decimal(10,2) NOT NULL,
  `limite_superior` decimal(10,2) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `rangos_salarios` WRITE;
/*!40000 ALTER TABLE `rangos_salarios` DISABLE KEYS */;

INSERT INTO `rangos_salarios` (`id`, `limite_inferior`, `limite_superior`, `nombre`)
VALUES
	(1,1.00,2000000.00,'A'),
	(2,2000001.00,5000000.00,'B'),
	(3,5000001.00,99999999.99,'C');

/*!40000 ALTER TABLE `rangos_salarios` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
