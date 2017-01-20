/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.0.22-community-nt : Database - etravels
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`etravels` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `etravels`;

/*Table structure for table `billingdetails` */

DROP TABLE IF EXISTS `billingdetails`;

CREATE TABLE `billingdetails` (
  `billDetailsId` varchar(50) default NULL,
  `billId` varchar(50) default NULL,
  `productId` varchar(50) default NULL,
  `quantity` varchar(50) default NULL,
  `rate` varchar(50) default NULL,
  `amount` varchar(50) default NULL,
  `mrp` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billingdetails` */

/*Table structure for table `billingdetailscart` */

DROP TABLE IF EXISTS `billingdetailscart`;

CREATE TABLE `billingdetailscart` (
  `billDetailsId` varchar(50) default NULL,
  `billId` varchar(50) default NULL,
  `productId` varchar(50) default NULL,
  `quantity` varchar(50) default NULL,
  `rate` varchar(50) default NULL,
  `amount` varchar(50) default NULL,
  `mrp` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billingdetailscart` */

/*Table structure for table `billinginfo` */

DROP TABLE IF EXISTS `billinginfo`;

CREATE TABLE `billinginfo` (
  `billId` varchar(50) default NULL,
  `billNo` varchar(50) default NULL,
  `billDate` varchar(50) default NULL,
  `lrNo` varchar(50) default NULL,
  `lrDate` varchar(50) default NULL,
  `orderNo` varchar(50) default NULL,
  `orderDate` varchar(50) default NULL,
  `dispatchedBy` varchar(50) default NULL,
  `dispatchedDate` varchar(50) default NULL,
  `noOfPacks` varchar(50) default NULL,
  `termOfPayment` varchar(50) default NULL,
  `terms` varchar(50) default NULL,
  `name` varchar(50) default NULL,
  `phone` varchar(50) default NULL,
  `address` varchar(150) default NULL,
  `tinNo` varchar(50) default NULL,
  `totalAmount` varchar(50) default NULL,
  `discount` varchar(50) default NULL,
  `billEndDate` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billinginfo` */

insert  into `billinginfo`(`billId`,`billNo`,`billDate`,`lrNo`,`lrDate`,`orderNo`,`orderDate`,`dispatchedBy`,`dispatchedDate`,`noOfPacks`,`termOfPayment`,`terms`,`name`,`phone`,`address`,`tinNo`,`totalAmount`,`discount`,`billEndDate`) values ('dfgh','ghj','hjhjk','jk','hjk','hj','hjk','hjkh','hj','hj','hj','hjk','hj','hj','jk','hjk','hjk','hjk',NULL),('mrdkg','jkhiy','h;jkb','dnvjnfj','jnj;kh\'','jkknkj','jn;kj','nkjnk','nkjn.jk','njnkj','njknkj','k..kb.kjjb','jkbkjbkj','kjbkjb','jbkbk','jkbkljb','bkjbkj','bjbj',NULL);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `productId` varchar(50) default NULL,
  `productName` varchar(50) default NULL,
  `productType` varchar(50) default NULL,
  `mrp` varchar(50) default NULL,
  `updatedBy` varchar(200) default NULL,
  `updatedDate` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`productId`,`productName`,`productType`,`mrp`,`updatedBy`,`updatedDate`) values ('0a2ad020be0d43c5a711a57e73a95e35','aaa','1','124',NULL,'2016-12-01 23:23:02'),('579f5208eee24bbaa25374898d5e513d','maiana','0','121212',NULL,'2016-12-01 23:27:11'),('1eac7cd97eea4112aa9a17adf4bc8889','aaaqq','0','12458',NULL,'2016-12-02 08:14:09'),('f58cea2fc7f44bdcbe5aad4163676abc','12456','1','123',NULL,'2016-12-02 13:27:47'),('336a92f42f674e678887f29e691c788d','123456','1','124546',NULL,'2016-12-02 13:27:11');

/*Table structure for table `register` */

DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `regName` varchar(50) default NULL,
  `mobileNo` varchar(15) default NULL,
  `userType` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `register` */

insert  into `register`(`regName`,`mobileNo`,`userType`) values (NULL,'0',NULL),(NULL,'0',NULL),(NULL,'0',NULL),(NULL,'0',NULL),(NULL,'0',NULL),(NULL,'0',NULL),('pavan','12345687','2'),('pawan','456245','1'),('dovasoft','1234','2'),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),(NULL,NULL,NULL),('pavannnnn','pavannnnn','1'),('pavannnnn','pavannnnn','1'),('pavannnnn','7411184869','1'),('pavannnnn','75648','2');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
