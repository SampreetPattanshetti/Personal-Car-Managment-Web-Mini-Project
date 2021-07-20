-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema car_manage
--

CREATE DATABASE IF NOT EXISTS car_manage;
USE car_manage;

--
-- Definition of table `car`
--

DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `reg_no` varchar(30) NOT NULL,
  `car_name` varchar(30) default NULL,
  `car_model` varchar(30) default NULL,
  `car_color` varchar(30) default NULL,
  PRIMARY KEY  (`reg_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` (`reg_no`,`car_name`,`car_model`,`car_color`) VALUES 
 ('2166','SAFARI','Z+','RED'),
 ('6980','HARRIER','XZ','RED');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;


--
-- Definition of table `car_owner`
--

DROP TABLE IF EXISTS `car_owner`;
CREATE TABLE `car_owner` (
  `owner_dl` varchar(30) NOT NULL,
  `owner_name` varchar(30) default NULL,
  `owner_address` varchar(30) default NULL,
  `reg_no` varchar(30) default NULL,
  PRIMARY KEY  (`owner_dl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_owner`
--

/*!40000 ALTER TABLE `car_owner` DISABLE KEYS */;
INSERT INTO `car_owner` (`owner_dl`,`owner_name`,`owner_address`,`reg_no`) VALUES 
 ('156423','SAMPREET','GOKAK','6980');
/*!40000 ALTER TABLE `car_owner` ENABLE KEYS */;


--
-- Definition of table `car_service`
--

DROP TABLE IF EXISTS `car_service`;
CREATE TABLE `car_service` (
  `service_id` varchar(30) NOT NULL,
  `reg_no` varchar(30) default NULL,
  `job_card_status` varchar(30) default NULL,
  `cost_estimation` varchar(30) default NULL,
  PRIMARY KEY  (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_service`
--

/*!40000 ALTER TABLE `car_service` DISABLE KEYS */;
INSERT INTO `car_service` (`service_id`,`reg_no`,`job_card_status`,`cost_estimation`) VALUES 
 ('12','6980','DONE','12000');
/*!40000 ALTER TABLE `car_service` ENABLE KEYS */;


--
-- Definition of table `minor_checks`
--

DROP TABLE IF EXISTS `minor_checks`;
CREATE TABLE `minor_checks` (
  `running` varchar(30) default NULL,
  `milage` varchar(30) default NULL,
  `fills` varchar(30) default NULL,
  `reg_no` varchar(30) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `minor_checks`
--

/*!40000 ALTER TABLE `minor_checks` DISABLE KEYS */;
INSERT INTO `minor_checks` (`running`,`milage`,`fills`,`reg_no`) VALUES 
 ('10000','17','35psi','6980');
/*!40000 ALTER TABLE `minor_checks` ENABLE KEYS */;


--
-- Definition of table `rc_card`
--

DROP TABLE IF EXISTS `rc_card`;
CREATE TABLE `rc_card` (
  `reg_no` varchar(30) default NULL,
  `chassis_no` varchar(30) default NULL,
  `engine_no` varchar(30) default NULL,
  `owner_name` varchar(30) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rc_card`
--

/*!40000 ALTER TABLE `rc_card` DISABLE KEYS */;
INSERT INTO `rc_card` (`reg_no`,`chassis_no`,`engine_no`,`owner_name`) VALUES 
 ('6980','345275378','777835657','SAMPREET');
/*!40000 ALTER TABLE `rc_card` ENABLE KEYS */;


--
-- Definition of procedure `allview`
--

DROP PROCEDURE IF EXISTS `allview`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `allview`()
BEGIN

  select  C.reg_no,C.car_name,C.car_model,C.car_color,O.owner_dl,O.owner_name,S.service_id,S.job_card_status,M.running,M.milage,R.chassis_no
  from    car As C, car_owner As O,car_service As S ,  minor_checks as M,rc_card as R
  where    C.reg_no=O.reg_no AND  C.reg_no=S.reg_no AND C.reg_no=M.reg_no AND C.reg_no=R.reg_no;
END $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
