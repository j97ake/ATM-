/*
SQLyog - Free MySQL GUI v5.17
Host - 5.6.17 : Database - atmdb
*********************************************************************
Server version : 5.6.17
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `atmdb`;

USE `atmdb`;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `accountdetail` */

DROP TABLE IF EXISTS `accountdetail`;

CREATE TABLE `accountdetail` (
  `atmno` int(20) NOT NULL COMMENT 'atm card no',
  `accno` int(20) NOT NULL COMMENT 'accont no of atm card holder',
  `pinno` int(10) NOT NULL COMMENT 'pin no of atm card holder',
  `acctype` varchar(50) NOT NULL COMMENT 'account type',
  `name` varchar(100) NOT NULL COMMENT 'name of the atm card holder',
  `balance` float NOT NULL COMMENT 'available balance of atm card holder',
  `atmexpirydate` date NOT NULL COMMENT 'atm expiry date',
  PRIMARY KEY (`atmno`),
  UNIQUE KEY `accno` (`accno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `accountdetail` */

insert into `accountdetail` (`atmno`,`accno`,`pinno`,`acctype`,`name`,`balance`,`atmexpirydate`) values (1000,10001,1111,'saving','Shivani Sharma',77300,'2026-03-30');
insert into `accountdetail` (`atmno`,`accno`,`pinno`,`acctype`,`name`,`balance`,`atmexpirydate`) values (2000,20002,2222,'saving','Rajvir Kaur',5000,'2025-04-03');
insert into `accountdetail` (`atmno`,`accno`,`pinno`,`acctype`,`name`,`balance`,`atmexpirydate`) values (4000,40001,4444,'saving','Akash Mane',22700,'2020-03-02');
insert into `accountdetail` (`atmno`,`accno`,`pinno`,`acctype`,`name`,`balance`,`atmexpirydate`) values (5000,50001,5555,'current','Kiran Marne',5000,'2021-03-31');
insert into `accountdetail` (`atmno`,`accno`,`pinno`,`acctype`,`name`,`balance`,`atmexpirydate`) values (100011,100011,1000,'current','Mayur Kulkarni',100000,'2014-03-17');

/*Table structure for table `transaction` */

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `trid` int(10) NOT NULL AUTO_INCREMENT,
  `atmno` int(20) DEFAULT NULL,
  `accno` int(20) DEFAULT NULL,
  `depositamt` float DEFAULT NULL COMMENT 'deposit amount',
  `withamt` float DEFAULT NULL,
  `avbalance` float NOT NULL COMMENT 'available balance',
  `tdate` date DEFAULT NULL,
  PRIMARY KEY (`trid`),
  KEY `atmno` (`atmno`),
  KEY `accno` (`accno`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`atmno`) REFERENCES `accountdetail` (`atmno`),
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`accno`) REFERENCES `accountdetail` (`accno`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

/*Data for the table `transaction` */

insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (38,1000,10001,0,0,61500,'2014-04-02');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (39,1000,10001,1000,0,62500,'2014-04-02');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (40,1000,10001,0,100,62400,'2014-04-02');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (41,1000,10001,10000,0,72400,'2014-04-02');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (42,1000,10001,0,1000,71400,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (43,1000,10001,0,1000,70400,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (44,1000,10001,10000,0,80400,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (45,1000,10001,1000,0,81400,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (46,1000,10001,2000,0,83400,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (47,1000,10001,0,100,83300,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (48,1000,10001,200,0,83500,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (49,1000,10001,0,100,83400,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (50,1000,10001,1000,0,84400,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (51,1000,10001,1000,0,85400,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (52,1000,10001,0,100,85300,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (57,2000,20002,0,4000,1000,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (59,5000,50001,0,10000,45000,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (60,5000,50001,0,1000,44000,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (61,5000,50001,0,9000,35000,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (62,5000,50001,0,10000,25000,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (63,5000,50001,0,10000,15000,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (64,5000,50001,0,10000,5000,'2014-04-03');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (65,1000,10001,0,10000,75300,'2019-03-17');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (66,1000,10001,2000,0,77300,'2019-03-17');
insert into `transaction` (`trid`,`atmno`,`accno`,`depositamt`,`withamt`,`avbalance`,`tdate`) values (67,2000,20002,4000,0,5000,'2019-04-25');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
