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

/*Table structure for table `billcart` */

DROP TABLE IF EXISTS `billcart`;

CREATE TABLE `billcart` (
  `billCartId` varchar(50) DEFAULT NULL,
  `billNo` varchar(50) DEFAULT NULL,
  `totalQuantity` varchar(50) DEFAULT NULL,
  `totalAmount` varchar(50) DEFAULT NULL,
  `totalDiscount` varchar(50) DEFAULT NULL,
  `taxValue` varchar(50) DEFAULT NULL,
  `totalCgst` varchar(50) DEFAULT NULL,
  `totalSgst` varchar(50) DEFAULT NULL,
  `totalIgst` varchar(50) DEFAULT NULL,
  `grandTotal` varchar(50) DEFAULT NULL,
  `totalBeforeTax` varchar(50) DEFAULT NULL,
  `totalTax` varchar(50) DEFAULT NULL,
  `totalAfterTax` varchar(50) DEFAULT NULL,
  `billDate` varchar(50) DEFAULT NULL,
  `orderBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billcart` */

insert  into `billcart`(`billCartId`,`billNo`,`totalQuantity`,`totalAmount`,`totalDiscount`,`taxValue`,`totalCgst`,`totalSgst`,`totalIgst`,`grandTotal`,`totalBeforeTax`,`totalTax`,`totalAfterTax`,`billDate`,`orderBy`) values ('42c69fdc1d9644118ead2ea2fa8ce2d1','1','16.00','1120.00','29.00','1091.00','122.05','123.07',NULL,'1336.12','1091.00','245.12','1336.12',NULL,NULL),('ef04a04d1348464aa77be6ea82e895d2','1','11.00','1089.00','77.00','1012.00','222.64','333.96',NULL,'1568.60','1012.00','556.60','1568.60',NULL,NULL);

/*Table structure for table `billcart_billdetailscart` */

DROP TABLE IF EXISTS `billcart_billdetailscart`;

CREATE TABLE `billcart_billdetailscart` (
  `billDetailsCartId` varchar(50) DEFAULT NULL,
  `billCartId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billcart_billdetailscart` */

insert  into `billcart_billdetailscart`(`billDetailsCartId`,`billCartId`) values ('a151c91fe93d417d8623d7c398801354','42c69fdc1d9644118ead2ea2fa8ce2d1'),('d695b7dc68e8455ebdf72eddad435981','42c69fdc1d9644118ead2ea2fa8ce2d1'),('a4c0618ca6b744d4885ea987879d419a','ef04a04d1348464aa77be6ea82e895d2');

/*Table structure for table `billdetailscart` */

DROP TABLE IF EXISTS `billdetailscart`;

CREATE TABLE `billdetailscart` (
  `billDetailsCartId` varchar(50) DEFAULT NULL,
  `productId` varchar(50) DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `rate` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `taxableValue` varchar(50) DEFAULT NULL,
  `cgstRate` varchar(50) DEFAULT NULL,
  `cgstAmount` varchar(50) DEFAULT NULL,
  `sgstRate` varchar(50) DEFAULT NULL,
  `sgstAmount` varchar(50) DEFAULT NULL,
  `igstRate` varchar(50) DEFAULT NULL,
  `igstAmount` varchar(50) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `hsnCode` varbinary(50) DEFAULT NULL,
  `uom` varbinary(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billdetailscart` */

insert  into `billdetailscart`(`billDetailsCartId`,`productId`,`productName`,`quantity`,`rate`,`amount`,`discount`,`taxableValue`,`cgstRate`,`cgstAmount`,`sgstRate`,`sgstAmount`,`igstRate`,`igstAmount`,`total`,`hsnCode`,`uom`) values ('a151c91fe93d417d8623d7c398801354','0d11660d9c014984a8d642a5bdc0a69a','bcbc','10','100','1000.00','11','989.00','11','108.79','11','108.79',NULL,NULL,'1206.58',NULL,NULL),('d695b7dc68e8455ebdf72eddad435981','21d9a374734b4b8696afeb312226c93a','bbb','6','20','120.00','18','102.00','13','13.26','14','14.28',NULL,NULL,'129.54',NULL,NULL),('a4c0618ca6b744d4885ea987879d419a','12640523a76742cb90531ddf2b29ea9c','productxx','11','99','1089.00','77','1012.00','22','222.64','33','333.96',NULL,NULL,'1568.60','11','100');

/*Table structure for table `client` */

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `clientId` varchar(50) NOT NULL,
  `companyName` varchar(50) NOT NULL,
  `pan` varchar(50) NOT NULL,
  `gstn` varchar(50) NOT NULL,
  `address` varchar(250) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pin` varchar(50) DEFAULT NULL,
  `contactPerson` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `updatedBy` varchar(50) DEFAULT NULL,
  `updatedOn` varchar(50) NOT NULL,
  `logoPath` varchar(50) DEFAULT NULL,
  `terms` varchar(250) DEFAULT NULL,
  `accountNumber` varchar(50) DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `ifsc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `client` */

insert  into `client`(`clientId`,`companyName`,`pan`,`gstn`,`address`,`state`,`pin`,`contactPerson`,`mobile`,`email`,`updatedBy`,`updatedOn`,`logoPath`,`terms`,`accountNumber`,`bank`,`branch`,`ifsc`) values ('3e40ef7ef460417f9dd47356d688c3a8','4444','4444','4444','4444','1cb0a3ab597c444cb1f44d53bb7f743d','4444','4444','4444','4444','2017-08-25 21:07:59','2017-08-25 21:07:59',NULL,'4444','4444','4444','4444','4444');

/*Table structure for table `client_purchaser` */

DROP TABLE IF EXISTS `client_purchaser`;

CREATE TABLE `client_purchaser` (
  `purchaserId` varchar(50) DEFAULT NULL,
  `clientId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `client_purchaser` */

insert  into `client_purchaser`(`purchaserId`,`clientId`) values ('653efa598a3a4d738db1e6f3c7b158c2','51e42459eb704799a9d9a40a8ea124ea'),('ef84afea26174007954dee2cc1668339',''),('d07eb6da3e9c4db489fcf838f689bb10','0e297b9bbacd4e9491846869c607fddc');

/*Table structure for table `client_user` */

DROP TABLE IF EXISTS `client_user`;

CREATE TABLE `client_user` (
  `clientId` varchar(50) DEFAULT NULL,
  `userId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `client_user` */

insert  into `client_user`(`clientId`,`userId`) values ('2d64f5cde6e84efd85406dd4dc18ab6d','2d64f5cde6e84efd85406dd4dc18ab6d'),('46ec4598bb7d40729afd6d8387b6ff65','88e5b13ccc9141a88bb51b7c69809ca2'),('51e42459eb704799a9d9a40a8ea124ea','e57260c685a94d1c98556c862de17312');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `productId` varchar(50) NOT NULL,
  `productName` varchar(50) NOT NULL,
  `hsnCode` varchar(50) NOT NULL,
  `uom` varchar(50) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `purchaserPrice` varchar(50) DEFAULT NULL,
  `mrp` varchar(50) DEFAULT NULL,
  `salePrice` varchar(50) DEFAULT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `cGST` varchar(50) NOT NULL,
  `sGST` varchar(50) NOT NULL,
  `iGST` varchar(50) DEFAULT NULL,
  `updatedBy` varchar(50) DEFAULT NULL,
  `updatedDate` varchar(50) DEFAULT NULL,
  `productType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`productId`,`productName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`productId`,`productName`,`hsnCode`,`uom`,`quantity`,`purchaserPrice`,`mrp`,`salePrice`,`discount`,`cGST`,`sGST`,`iGST`,`updatedBy`,`updatedDate`,`productType`) values ('0d11660d9c014984a8d642a5bdc0a69a','bcbc','11','11','11','11','11','11','11','11','11','11','2017-08-09 18:19:16','2017-08-09 18:19:16','0'),('12640523a76742cb90531ddf2b29ea9c','productxx','11','100','88','55','66','99','77','22','33','44','2017-08-10 10:53:43','2017-08-10 10:53:43','1'),('21d9a374734b4b8696afeb312226c93a','bbb','12','21','19','161','171','20','18','13','14','15','2017-08-09 16:48:45','2017-08-09 16:48:45','0'),('86c89fc2caea464ead683a990c642646','cccc','227','22','22','222','221','22','22','223','225','226','2017-08-09 17:04:03','2017-08-09 17:04:03','0'),('ca8e333dda5c4f5ba64a40961a2fc62f','bhjxx','101','199','177','144','155','187','166','112','120','133','2017-08-10 10:52:39','2017-08-10 10:52:39','1'),('de2268a1a5d44bb09d52a89c2e81efd4','aaaa','12','11','11','11','111','11','11','11','11','11','2017-08-19 19:19:21','2017-08-19 19:19:21','0'),('f59485645b0c4971adb43959d973f5ee','dddd','11','111','1111','11','11','11','11','11','11','11','2017-08-19 19:20:31','2017-08-19 19:20:31','0');

/*Table structure for table `purchaser` */

DROP TABLE IF EXISTS `purchaser`;

CREATE TABLE `purchaser` (
  `purchaserId` varchar(50) NOT NULL,
  `companyName` varchar(50) NOT NULL,
  `panNumber` varchar(50) NOT NULL,
  `gstNumber` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pincode` varchar(50) DEFAULT NULL,
  `contactName` varchar(50) NOT NULL,
  `mobileNo` varchar(50) NOT NULL,
  `emailID` varchar(50) DEFAULT NULL,
  `updatedBy` varchar(50) DEFAULT NULL,
  `updatedDate` varchar(50) NOT NULL,
  PRIMARY KEY (`purchaserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `purchaser` */

insert  into `purchaser`(`purchaserId`,`companyName`,`panNumber`,`gstNumber`,`address`,`state`,`pincode`,`contactName`,`mobileNo`,`emailID`,`updatedBy`,`updatedDate`) values ('201420e02e8e4db29e9871e4e2789d5d','dasdasdas','32423423','4324324324','marathalli ','10','545454','gfgfgsdsd','2222222222','gs@gmail.com',NULL,'2017-08-17 16:25:54'),('653efa598a3a4d738db1e6f3c7b158c2','company name','121212','123456','address, no ','12','121212','contact person','9999999999','jujukiuk@gmail.com',NULL,'2017-08-17 16:33:55'),('d07eb6da3e9c4db489fcf838f689bb10','company Name','11','11',' kbheufgvgueivf','37','121212','contact person','9999999999','jbuvyduvu@gmail.com',NULL,'2017-08-22 11:15:05'),('ef84afea26174007954dee2cc1668339','gowtham','121212','121212','door no: 90,hindu street, ','12','123456','kumar','9999999999','goutham@gmaail.com',NULL,'2017-08-17 16:53:57');

/*Table structure for table `purchaser_shipping` */

DROP TABLE IF EXISTS `purchaser_shipping`;

CREATE TABLE `purchaser_shipping` (
  `purchaserId` varchar(50) DEFAULT NULL,
  `shippingId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `purchaser_shipping` */

insert  into `purchaser_shipping`(`purchaserId`,`shippingId`) values ('201420e02e8e4db29e9871e4e2789d5d','32af430754d34971b8cf4d755a9da8e8'),('201420e02e8e4db29e9871e4e2789d5d','641a004baac8442683e1339102d71cd0'),('539391e93263450589aa5d8f2faa70be','4b6dd5b9252641968ef81b0a2816dd36'),('eb3261e3e30e4cd683d543e5ce4f17a3','55475aec4b0243e4b5cd049ee01ba561');

/*Table structure for table `shipping` */

DROP TABLE IF EXISTS `shipping`;

CREATE TABLE `shipping` (
  `ShippingId` varchar(50) NOT NULL,
  `purchaserName` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `pin` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`ShippingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shipping` */

insert  into `shipping`(`ShippingId`,`purchaserName`,`name`,`address`,`state`,`pin`) values ('32af430754d34971b8cf4d755a9da8e8',NULL,'hyu','hyu','Kerala','121212'),('49f3d576e4f84062b5f692e61a9c940b',NULL,'bbbb','bbbbb','Andra Pradesh','121212'),('4b6dd5b9252641968ef81b0a2816dd36',NULL,'name','addresss','Andra Pradesh','121212'),('55475aec4b0243e4b5cd049ee01ba561',NULL,'kkkk','kkkk','Andra Pradesh','121212'),('641a004baac8442683e1339102d71cd0',NULL,'qwe','csddsv','Andra Pradesh','111111');

/*Table structure for table `state` */

DROP TABLE IF EXISTS `state`;

CREATE TABLE `state` (
  `stateId` varchar(50) DEFAULT NULL,
  `gstnCode` varchar(50) DEFAULT NULL,
  `stateCode` varchar(50) DEFAULT NULL,
  `stateName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `state` */

insert  into `state`(`stateId`,`gstnCode`,`stateCode`,`stateName`) values ('fcfd987212f6449caf7eac31abad634d','01','JK','Jammu Kashmir'),('f0084f47592146fb904fd437024a32c3','02','HP','Himachal Pradesh'),('6d5d46e3450f431587ae734e7ce0a206','03','PB','Punjab'),('627093c633644281a173ada69cba6503','05','UT','Uttarakhand'),('f902b17a24054bdd9e348f0cda363f7c','06','HR ','Haryana'),('42f4ef0d713c48639bca3b77fb8426f1','08','RJ ','Rajasthan'),('1cb0a3ab597c444cb1f44d53bb7f743d','09','UT ','Uttar Pradesh'),('22b5e9abf8ec47b3adec571181609016','10','BH ','Bihar'),('5ed96ccd20f04966a24a2e183fed4c86','11','SK ','Sikkim'),('a6a7155f758e45fe84b0a0800efdf68b','12','AR ','Arunachal Pradesh'),('3f64cd6d5861439b9e9a73bf27c00c03','13','NL ','Nagaland'),('9fced080018847aba864eea9713bc3af','14','MN ','Manipur'),('9d8d2373b48548c49c8c465fef82a49f','15','MI ','Migoram'),('1cbbd1156377433db489919960d0c396','16','TR ','Tripura'),('9f8b12f082e04aa0b43ac2cd62aa9813','17','ME','Meghalaya'),('415b2418c5da460494114e9709f5b1c6','18','AS ','Assam'),('b0dc6ce7f22f426cad80183214af6e98','19','WB ','Westbengal'),('ebfca6baeb8c41a8ba350626f84a3c94','20','JH ','Jharkhand'),('ed286d1ce8c747a69de6a74211030a01','21','OR ','Odisha'),('2aef67cdf4c94fae8d9afe1f710f5ece','22','CT ','Chattisgarh'),('2f506f703c0348e19d0246d5559e412f','23','MP ','Madya Pradesh'),('bf16b5a4136947c681e2dad7dca803f1','24','GJ ','Gujarat'),('42e8f7dad3254dc6a762d5a595606a4a','27','MH ','Maharashtra'),('1569877be3d74a91b37e46646bca56c6','29','KA ','Karnataka'),('0522a838a36c453d80ac5911dbe9991f','30','GA ','Goa'),('0243c44817b94e108c12b4544941f366','32','KL ','Kerala'),('90174dce7c99472bbf9b9db698615a4d','33','TN ','Tamilnadu'),('379195ccf42a4ad88bf30594a7344933','36','TS ','Telangana'),('41ffbcc76d094d20b0a5fe4b3975e8f4','37','AP ','Andhra Pradesh');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` varchar(50) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `updatedBy` varchar(50) DEFAULT NULL,
  `updatedOn` varchar(50) DEFAULT NULL,
  `companyName` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`userId`,`role`,`userName`,`mobile`,`email`,`address`,`updatedBy`,`updatedOn`,`companyName`,`password`) values ('5a2a71bc12ff495bac9b72aeb04e896a','Admin','qqqq','9090909090','qqqq@gmail.com','qqqq','2017-08-14 11:43:53','2017-08-14 11:43:53','',NULL),('88e5b13ccc9141a88bb51b7c69809ca2','Manager','qwe','9999999999','qwe@gmail.com','qwe','2017-08-14 11:46:41','2017-08-14 11:46:41','',NULL),('e57260c685a94d1c98556c862de17312','Admin','gowtham','9986626618','goutham@gmail.com','address','2017-08-18 12:37:56','2017-08-18 12:37:56','','4156');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
