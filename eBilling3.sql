/*
SQLyog Enterprise Trial - MySQL GUI v7.11 
MySQL - 5.7.17-log : Database - ebilling
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`ebilling` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ebilling`;

/*Table structure for table `billingdetails` */

DROP TABLE IF EXISTS `billingdetails`;

CREATE TABLE `billingdetails` (
  `billDetailsId` varchar(50) DEFAULT NULL,
  `billId` varchar(50) DEFAULT NULL,
  `productId` varchar(50) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `rate` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `mrp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billingdetails` */

insert  into `billingdetails`(`billDetailsId`,`billId`,`productId`,`quantity`,`rate`,`amount`,`mrp`) values ('9b1328f8880f4b7dabcfc4b5ac55ea83','d31d98da0684403e94b77b09a48f3fd7','c39a7d9f427b4bcf8a10a088bcb40170','2','200','400','200');

/*Table structure for table `billingdetailscart` */

DROP TABLE IF EXISTS `billingdetailscart`;

CREATE TABLE `billingdetailscart` (
  `billDetailsId` varchar(50) DEFAULT NULL,
  `billId` varchar(50) DEFAULT NULL,
  `productId` varchar(50) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `rate` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `mrp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billingdetailscart` */

insert  into `billingdetailscart`(`billDetailsId`,`billId`,`productId`,`quantity`,`rate`,`amount`,`mrp`) values ('0e09af112760429e9c0f2372b6a6f6f7','a3de9feeb69949ce96a34bbf4ce7b316','c39a7d9f427b4bcf8a10a088bcb40170','20','200','4000','200'),('b895f6e2b369431d91e05a3d20ee5d62','a3de9feeb69949ce96a34bbf4ce7b316','799c71a2cbe245aeb201037495a9c190','1','5','5','5'),('22e2aad829c1450ba0a3f38625cc3752','fe9f15ac8d8b464d9b6fe22996629974','c39a7d9f427b4bcf8a10a088bcb40170','2','200','400','200'),('9223894de81c434182aefac318672ccd','f0aa6a07f6394529a587237b77d89512','c39a7d9f427b4bcf8a10a088bcb40170','1','200','200','200'),('bfff26c3ddfa47fb81f4d865a7fcbab5','ff15b5917d7d476fb63dff20e83a05cf','799c71a2cbe245aeb201037495a9c190','2','5','10','5'),('86143da51f4a41a5b043002103428f4f','c8b48c515ec542ba8432cf284e423bfc','c39a7d9f427b4bcf8a10a088bcb40170','2','200','400','200'),('9b1328f8880f4b7dabcfc4b5ac55ea83','2f3f31d63fdc4d33a3a16be361a61b6b','c39a7d9f427b4bcf8a10a088bcb40170','2','200','400','200');

/*Table structure for table `billinginfo` */

DROP TABLE IF EXISTS `billinginfo`;

CREATE TABLE `billinginfo` (
  `billId` varchar(50) DEFAULT NULL,
  `billNo` varchar(50) DEFAULT NULL,
  `billDate` varchar(50) DEFAULT NULL,
  `lrNo` varchar(50) DEFAULT NULL,
  `lrDate` varchar(50) DEFAULT NULL,
  `orderNo` varchar(50) DEFAULT NULL,
  `orderDate` varchar(50) DEFAULT NULL,
  `dispatchedBy` varchar(50) DEFAULT NULL,
  `dispatchedDate` varchar(50) DEFAULT NULL,
  `noOfPacks` varchar(50) DEFAULT NULL,
  `termOfPayment` varchar(50) DEFAULT NULL,
  `terms` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `tinNo` varchar(50) DEFAULT NULL,
  `totalAmount` varchar(50) DEFAULT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `totalMrp` varchar(50) DEFAULT NULL,
  `totalQuantity` varchar(50) DEFAULT NULL,
  `totalRate` varchar(50) DEFAULT NULL,
  `orderBy` varchar(50) DEFAULT NULL,
  `payment` varchar(50) DEFAULT NULL,
  `packSlipNo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billinginfo` */

insert  into `billinginfo`(`billId`,`billNo`,`billDate`,`lrNo`,`lrDate`,`orderNo`,`orderDate`,`dispatchedBy`,`dispatchedDate`,`noOfPacks`,`termOfPayment`,`terms`,`name`,`phone`,`address`,`tinNo`,`totalAmount`,`discount`,`totalMrp`,`totalQuantity`,`totalRate`,`orderBy`,`payment`,`packSlipNo`) values ('d31d98da0684403e94b77b09a48f3fd7','100','2017-01-25 16:11:52','100','2017-01-02','100','2017-01-11','100','2017-01-10','100','100','100','kumar','7411184869','vnk','100','400','100','200','2','200','100','Cash','100');

/*Table structure for table `billinginfocart` */

DROP TABLE IF EXISTS `billinginfocart`;

CREATE TABLE `billinginfocart` (
  `billId` varchar(50) DEFAULT NULL,
  `billNo` varchar(50) DEFAULT NULL,
  `billDate` varchar(50) DEFAULT NULL,
  `lrNo` varchar(50) DEFAULT NULL,
  `lrDate` varchar(50) DEFAULT NULL,
  `orderNo` varchar(50) DEFAULT NULL,
  `orderDate` varchar(50) DEFAULT NULL,
  `dispatchedBy` varchar(50) DEFAULT NULL,
  `dispatchedDate` varchar(50) DEFAULT NULL,
  `noOfPacks` varchar(50) DEFAULT NULL,
  `termOfPayment` varchar(50) DEFAULT NULL,
  `terms` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `tinNo` varchar(50) DEFAULT NULL,
  `totalAmount` varchar(50) DEFAULT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `totalMrp` varchar(50) DEFAULT NULL,
  `totalQuantity` varchar(50) DEFAULT NULL,
  `totalRate` varchar(50) DEFAULT NULL,
  `orderBy` varchar(50) DEFAULT NULL,
  `payment` varchar(50) DEFAULT NULL,
  `packSlipNo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billinginfocart` */

insert  into `billinginfocart`(`billId`,`billNo`,`billDate`,`lrNo`,`lrDate`,`orderNo`,`orderDate`,`dispatchedBy`,`dispatchedDate`,`noOfPacks`,`termOfPayment`,`terms`,`name`,`phone`,`address`,`tinNo`,`totalAmount`,`discount`,`totalMrp`,`totalQuantity`,`totalRate`,`orderBy`,`payment`,`packSlipNo`) values ('a3de9feeb69949ce96a34bbf4ce7b316','101','2017-01-25 16:15:27','101','2017-01-03','101','2017-01-03','101','2017-01-03','101','101','101','pavan','9491121535','nvm','101','4005','101','205','21','205',NULL,NULL,NULL),('fe9f15ac8d8b464d9b6fe22996629974',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'400',NULL,'200','2','200',NULL,NULL,NULL),('f0aa6a07f6394529a587237b77d89512',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'200',NULL,'200','1','200',NULL,NULL,NULL),('ff15b5917d7d476fb63dff20e83a05cf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10',NULL,'5','2','5',NULL,NULL,NULL),('c8b48c515ec542ba8432cf284e423bfc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'400',NULL,'200','2','200',NULL,NULL,NULL),('2f3f31d63fdc4d33a3a16be361a61b6b','100','2017-01-25 16:11:52','100','2017-01-02','100','2017-01-11','100','2017-01-10','100','100','100','kumar','7411184869','vnk','100','400','100','200','2','200','100','Cash','100');

/*Table structure for table `clientinfo` */

DROP TABLE IF EXISTS `clientinfo`;

CREATE TABLE `clientinfo` (
  `clientId` varchar(50) DEFAULT NULL,
  `companyName` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `clientEmail` varchar(50) DEFAULT NULL,
  `contactPerson` varchar(50) DEFAULT NULL,
  `contactNo` varchar(50) DEFAULT NULL,
  `tinNo` varchar(50) DEFAULT NULL,
  `uploadLogo` varchar(250) DEFAULT NULL,
  `smsSuport` varchar(50) DEFAULT NULL,
  `emailSupport` varchar(50) DEFAULT NULL,
  `createdDate` varchar(50) DEFAULT NULL,
  `smsUrl` varchar(50) DEFAULT NULL,
  `smsUserName` varchar(50) DEFAULT NULL,
  `smsPassword` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clientinfo` */

insert  into `clientinfo`(`clientId`,`companyName`,`address`,`clientEmail`,`contactPerson`,`contactNo`,`tinNo`,`uploadLogo`,`smsSuport`,`emailSupport`,`createdDate`,`smsUrl`,`smsUserName`,`smsPassword`) values ('6783b158444e421cad46cc368b5631d5','dovaSoft','MIG-183,1STFLOOR,BHARAT NAGAR COLONY,MOOSAPET,HYDERABAD-500018','p@gmail.com','9491121535','9246885990','','C:\\fakepath\\desk.png','on','on','2017-01-05 11:48:57',NULL,NULL,NULL),('015db8477a4641198377854534644772','ibm','address','tammineni.pavan@gmail.com','pavan','9491121535','869','E:\\eBilling\\tmpFiles\\93649741e6c94d78b7f3e893c8b9e7a0','on','on','2017-01-08 12:02:12','smsurl','smsusername','smsPassword');

/*Table structure for table `damage` */

DROP TABLE IF EXISTS `damage`;

CREATE TABLE `damage` (
  `damageId` varchar(50) DEFAULT NULL,
  `productId` varchar(50) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `updatedOn` varchar(50) DEFAULT NULL,
  `updatedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `damage` */

insert  into `damage`(`damageId`,`productId`,`quantity`,`description`,`updatedOn`,`updatedBy`) values ('45ca7135a87a46d6b0f22c1e2a98f5b7','c39a7d9f427b4bcf8a10a088bcb40170','20','as','2017-01-24 19:15:11','2017-01-24 19:15:11'),('863b503980ef4b6fb84d8ba9e676b051','e41b44b60cdf452888dc52138b84a583','10','sedfa','2017-01-24 19:16:57','2017-01-24 19:16:57');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `loginId` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`loginId`,`name`,`password`) values ('cb5d8c28191d45b6aef82f9d3a4c3b8a','1234','1234');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `productId` varchar(50) DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `productType` varchar(50) DEFAULT NULL,
  `mrp` varchar(50) DEFAULT NULL,
  `updatedBy` varchar(200) DEFAULT NULL,
  `updatedDate` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`productId`,`productName`,`productType`,`mrp`,`updatedBy`,`updatedDate`) values ('e41b44b60cdf452888dc52138b84a583','saree','1','100','2017-01-18 12:07:38','2017-01-18 12:07:38'),('c39a7d9f427b4bcf8a10a088bcb40170','pants','1','200','2017-01-18 12:07:51','2017-01-18 12:07:51'),('799c71a2cbe245aeb201037495a9c190','blowser','0','5','2017-01-19 18:43:25','2017-01-19 18:43:25'),('60614a36448549b2a12270cda9ff1f0f','tshirt','0','50','2017-01-19 19:09:50','2017-01-19 19:09:50'),('d27ea5a7aeb648e4857920fa50ee02fc','shirts','0','10','2017-01-24 11:31:37','2017-01-24 11:31:37'),('a4df4010cb524072bfd9e02479663cb5','towels','0','10','2017-01-24 18:39:43','2017-01-24 18:39:43');

/*Table structure for table `productstock` */

DROP TABLE IF EXISTS `productstock`;

CREATE TABLE `productstock` (
  `productId` varchar(50) DEFAULT NULL,
  `stock` varchar(50) DEFAULT NULL,
  `oldStock` varchar(50) DEFAULT NULL,
  `newStock` varchar(50) DEFAULT NULL,
  `updateOn` varchar(50) DEFAULT NULL,
  `updateBy` varchar(50) DEFAULT NULL,
  `stockId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `productstock` */

insert  into `productstock`(`productId`,`stock`,`oldStock`,`newStock`,`updateOn`,`updateBy`,`stockId`) values ('c39a7d9f427b4bcf8a10a088bcb40170','875','1062','20','2017-01-25 16:15:33','2017-01-25 16:15:33','99a2419c31514186ab61262bd4b7df8d'),('799c71a2cbe245aeb201037495a9c190','982','20','4','2017-01-25 16:15:33','2017-01-25 16:15:33','5668f4ca4eb9426492fe9d85b21c39a0'),('e41b44b60cdf452888dc52138b84a583','15','5','20','2017-01-24 19:16:57','2017-01-24 19:16:57','e123990e5d3d48fdbdd87b662189e7bf'),('a4df4010cb524072bfd9e02479663cb5','0','5','8','2017-01-25 14:55:06','2017-01-25 14:55:06','595fa5a0f0b44d9199358ea22b2fcc2a'),('d27ea5a7aeb648e4857920fa50ee02fc','6','0','20','2017-01-25 14:57:31','2017-01-25 14:57:31','8f94f4b68da54468b801f63ed6fe2312');

/*Table structure for table `purchaseinfo` */

DROP TABLE IF EXISTS `purchaseinfo`;

CREATE TABLE `purchaseinfo` (
  `purchaseId` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `mobileNo` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `eMail` varchar(50) DEFAULT NULL,
  `updatedBy` varchar(50) DEFAULT NULL,
  `updatedDate` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `purchaseinfo` */

insert  into `purchaseinfo`(`purchaseId`,`name`,`mobileNo`,`address`,`eMail`,`updatedBy`,`updatedDate`) values ('2a16fe9ffb604abe8a941b673e425ca2','pavan','9491121535','nvm','pavan@gmail.com','2017-01-06 18:05:45','2017-01-06 18:05:45'),('8d5e83ae731f40f287bb8105b36f32c4','kumar','7411184869','vnk','tammineni.pavan@gmail.com','2017-01-06 18:06:04','2017-01-06 18:06:05');

/*Table structure for table `register` */

DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `regId` varchar(50) DEFAULT NULL,
  `regName` varchar(50) DEFAULT NULL,
  `mobileNo` varchar(15) NOT NULL,
  `password` varchar(20) DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `regType` varchar(50) DEFAULT NULL,
  `emailCode` varchar(50) NOT NULL,
  PRIMARY KEY (`mobileNo`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `register` */

insert  into `register`(`regId`,`regName`,`mobileNo`,`password`,`email`,`regType`,`emailCode`) values ('a4fe1487114448758a4f353abab48480','kumar','7411184869','123','pavan.five@gmail.com','Admin','7776'),('d687695956c94f37b131baaf9c6c6b7c','pavan','7411184869','1234','tammineni.pavan@gmail.com','Admin','9770'),('45d362297d8c48ab9daef89401a8e209','pandu','9491121535','1234','medasanipurushotham@gmail.com','Admin','5774');

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `statusId` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `statusPriority` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `status` */

insert  into `status`(`statusId`,`status`,`description`,`statusPriority`) values ('f718124e12dc4295a1c4a9e7530095ae','confirm','shirt','1');

/*Table structure for table `stockdetails` */

DROP TABLE IF EXISTS `stockdetails`;

CREATE TABLE `stockdetails` (
  `stockDetailsId` varchar(50) DEFAULT NULL,
  `productId` varchar(50) DEFAULT NULL,
  `transactionType` varchar(50) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `transactionId` varchar(50) DEFAULT NULL,
  `transactionDate` varchar(50) DEFAULT NULL,
  `updatedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stockdetails` */

insert  into `stockdetails`(`stockDetailsId`,`productId`,`transactionType`,`quantity`,`transactionId`,`transactionDate`,`updatedBy`) values ('974e78f8ae4a4e0eaa36a81af236f305','d27ea5a7aeb648e4857920fa50ee02fc','Sale','1','12','2017-01-25 13:22:00','2017-01-25 13:22:00'),('6492be63244e41eaa402ea38436a4563','c39a7d9f427b4bcf8a10a088bcb40170','Sale','1','766','2017-01-25 14:55:21','2017-01-25 14:55:58'),('7c39e0cc5d1d4571aa430cc4457198e4','799c71a2cbe245aeb201037495a9c190','Sale','1','766','2017-01-25 14:55:58','2017-01-25 14:55:58'),('4f284d5540ac4ce18c1fb0a2d2624acd','a4df4010cb524072bfd9e02479663cb5','Sale','1','766','2017-01-25 14:55:58','2017-01-25 14:55:58'),('a4c3abd964c545aaa01b1bce142fa87a','c39a7d9f427b4bcf8a10a088bcb40170','Sale','4','767','2017-01-25 14:57:34','2017-01-25 14:57:34'),('0c5ec3632ad44743ad7dddad6dc20e2e','799c71a2cbe245aeb201037495a9c190','Sale','3','767','2017-01-25 14:57:34','2017-01-25 14:57:34'),('0ac99462c22e47ba9dcd7f3e0d8571a6','d27ea5a7aeb648e4857920fa50ee02fc','Sale','1','767','2017-01-25 14:57:34','2017-01-25 14:57:34'),('ca666b3bec724529868da3031a92c8db','c39a7d9f427b4bcf8a10a088bcb40170','Sale','2','100','2017-01-25 16:11:57','2017-01-25 16:11:57'),('ac00b89556be4a6c861a9ca71db0b6d3','c39a7d9f427b4bcf8a10a088bcb40170','Sale','20','101','2017-01-25 16:15:44','2017-01-25 16:15:44'),('b3006cd5b6e5482498a648204a29f8a6','799c71a2cbe245aeb201037495a9c190','Sale','1','101','2017-01-25 16:15:44','2017-01-25 16:15:44');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
