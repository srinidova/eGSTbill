/*
SQLyog Enterprise Trial - MySQL GUI v7.11 
MySQL - 5.7.17-log : Database - dovasoft_egstbill
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`dovasoft_egstbill` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dovasoft_egstbill`;

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `productId` varchar(50) DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `hsnCode` varchar(50) DEFAULT NULL,
  `uom` varchar(50) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `purchaserPrice` varchar(50) DEFAULT NULL,
  `mrp` varchar(50) DEFAULT NULL,
  `salePrice` varchar(50) DEFAULT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `cGST` varchar(50) DEFAULT NULL,
  `sGST` varchar(50) DEFAULT NULL,
  `iGST` varchar(50) DEFAULT NULL,
  `updatedBy` varchar(50) DEFAULT NULL,
  `updatedDate` varchar(50) DEFAULT NULL,
  `productType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`productId`,`productName`,`hsnCode`,`uom`,`quantity`,`purchaserPrice`,`mrp`,`salePrice`,`discount`,`cGST`,`sGST`,`iGST`,`updatedBy`,`updatedDate`,`productType`) values ('6fa75ca6d25f4fefa315b2b6f3adc1ca','productNamess','21','21','21','21','21','21','21','21','21','21','2017-07-31 20:38:44','2017-07-31 20:38:44','21'),('3ee75ac12bfd4faab1f690d16576a948','aaaaa','11','11','11','11','11','11','11','11','11','11','2017-08-02 11:32:45','2017-08-02 11:32:45','11'),('2c071a9a72214d3094ce9cc542e12b11','qqqq','11','11','11','11','11','11','11','12','12','12','2017-08-03 10:11:41','2017-08-03 10:11:41','12'),('c01b7438c1444c909a741c8389ddc045','bbb','12','12','12','12','12','12','12','12','12','12','2017-08-03 12:59:34','2017-08-03 12:59:34','12'),('2da2531653ba4cdf9289c0d27aaf55e8','bbbb','12','12','12','12','12','12','12','12','12','12','2017-08-03 17:43:07','2017-08-03 17:43:07','12');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
