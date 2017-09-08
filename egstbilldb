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

/*Table structure for table `autoincrement` */

DROP TABLE IF EXISTS `autoincrement`;

CREATE TABLE `autoincrement` (
  `tableName` varchar(50) DEFAULT NULL,
  `columnName` varchar(50) DEFAULT NULL,
  `incrementId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `autoincrement` */

insert  into `autoincrement`(`tableName`,`columnName`,`incrementId`) values ('billCart','billNo','13');

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

insert  into `billcart`(`billCartId`,`billNo`,`totalQuantity`,`totalAmount`,`totalDiscount`,`taxValue`,`totalCgst`,`totalSgst`,`totalIgst`,`grandTotal`,`totalBeforeTax`,`totalTax`,`totalAfterTax`,`billDate`,`orderBy`) values ('f214fc475e814302ac95a56bbf1bc5fd','1','1.00','75.00','10.00','65.00','5.85','5.85',NULL,'76.70','65.00','11.70','76.70','25/06/2017',NULL),('18f7fa49cca84ebcbbf5fa294f605455','2','1.00','90.00','10.00','80.00','8.00','8.00',NULL,'96.00','80.00','16.00','96.00','1',NULL);

/*Table structure for table `billcart_billdetailscart` */

DROP TABLE IF EXISTS `billcart_billdetailscart`;

CREATE TABLE `billcart_billdetailscart` (
  `billDetailsCartId` varchar(50) DEFAULT NULL,
  `billCartId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billcart_billdetailscart` */

insert  into `billcart_billdetailscart`(`billDetailsCartId`,`billCartId`) values ('a151c91fe93d417d8623d7c398801354','42c69fdc1d9644118ead2ea2fa8ce2d1'),('d695b7dc68e8455ebdf72eddad435981','42c69fdc1d9644118ead2ea2fa8ce2d1'),('a4c0618ca6b744d4885ea987879d419a','ef04a04d1348464aa77be6ea82e895d2'),('d6ce002c782848bb91e9a1763f43c680','752d31d8e96044208290543c35254d09'),('3e97fbcf6cd64d4ba2191e8eb4da4a75','752d31d8e96044208290543c35254d09'),('85d821559211468d91ffeadd66adf6d3','fc8648d02e0940918cb2bab2c0213b5d'),('5edc004de3d74bc9bfa2bcf619a64488','704998a31e0a42d9880b0bfc4456d13e'),('f4bdcce5fa2a48409d79a733a22398c9','35947900087a4900a7cc6b697dcaa21e'),('9a07c5e13d4140f49cedc650c12f3594','830233b4c92a48709920e1ca01c7666f'),('4d11284aa3a94e8aa2e3f9f06ddbc8fd','0bc145dd7e62414e81ae712f4f0011ad'),('58564c2b3d1046e0918d0f9d552842dd','d863cc25f58b4dcbacca4c4247307614'),('6286f51e710343b39f3bcb3b55d42876','ec1a02cace0943488afa2aa9aadbc36e'),('cdd78d67e5814812841b0a6d181415a7','f80deb1ada3a402f8524526a55065705'),('fbb1533d4c554b5f98fbbfe8ebff942e','ae591855b2b44cfe9a4e7895c033ec87'),('e5915848c4c042458da677655fdfb1ae','801dc1d5bcb64060b4c3641ffa7b1b8f'),('5150dbb3564a40a98d09c97962703105','e9e741e0ebd646f3823233a7cf071a46'),('956b65c29c454741bd314de062fc93f9','18e90f9e98814ecf83de7b1e76148512'),('4d2ba13a35954ea2a45dc1e13996f1af','402d2cf1bb6d4fa89f3285c58d0ab19f'),('6703998f683f428ba6a81ae8e2795e5d','f014628433494b569ff5950c4ea3ec9e'),('70829885186549bb80b51fa245aeeecc','36ac013d43ac49b19861712cbe4b5eaf'),('ae57179719b7429d9d5e18c2fb513a93','b624a233242f48ac9d9ab8815384a866'),('67322a02c27c4a0b9cf6c83195141cbf','e90fb696a42d448a93839a6f46aacf17'),('f225722bfd214483b48ec553450c9be0','cec68d05011d4431bbc9f8b285f42383'),('eb016aa856364fe691ddb12bbc2be9c6','d7c33cc7769a4dd49dfab9a82fbdbe8b'),('349823df26314561941f0a0eef2dd254','ceedcf642b0a4299b0377e14601298c3'),('582575b1c00849d2b90c1565cc9c9e21','72db4d5921294906a3066067f065217a'),('8aa68d1b54cd4bb38d505fb8cf54f2fb','72db4d5921294906a3066067f065217a'),('3c3aeeb7a755465c840367336661432b','91d973a87eaa41cb817f872ffa58c043'),('cc0a98037ff34cc99f16ebce58eab0e4','91d973a87eaa41cb817f872ffa58c043'),('fdc33d48b8734c4cad6419e994b795a7','43e426e71f154c7b9c8c08fe1d898798'),('83ebdd0b9bad4984bcdc11af51dceb25','3d49bdc657a74cc2acc2215929e3b937'),('1073a8ef16094e28a704e173885f2220','4ace9b1d8fa141da817e3b266f542aa4'),('d1f3046ecc744a50be711144fe443bb8','4ace9b1d8fa141da817e3b266f542aa4'),('4a35565f6ca440fb86e8de533b901904','562a54d18c5a4f03a01d204f00b1d1b0'),('f087a4a3774d43a8b7cef8a5b0cce740','d4b8a52375f340d2a5de21de7033cf56'),('c5125396a5684d2fb2a56786927ee0d7','d4b8a52375f340d2a5de21de7033cf56'),('daa01feec030467595a60f65a69408f8','7d4cee672ade464595831076aeed0f1d'),('b7eee9d3596d44379adc30c84435e266','7d4cee672ade464595831076aeed0f1d'),('e0396c1aca834806931daae05e4c0df1','cb4bcadc140d42dd8cf57f7793ec4c0e'),('d1f78126891c491488e36143e2288766','cb4bcadc140d42dd8cf57f7793ec4c0e'),('33e27cc1d97f441c9be8c09aa224d98e','005911a7c9454e1ca17b19f6d5e78f55'),('9d2a5fd7a0ae430a8960bdbbca41ecec','7e2a4201817842bc891d2feb7bae1acb'),('5d4a289209a44b1297f4b850976ceed4','44d1be0c285e47c5839a980b6d0e5d72'),('1e481b50caf44f278a54187c5d8deaa9','f214fc475e814302ac95a56bbf1bc5fd'),('c6d18130e3874c2b9aa382a7021c4fe3','18f7fa49cca84ebcbbf5fa294f605455');

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

insert  into `billdetailscart`(`billDetailsCartId`,`productId`,`productName`,`quantity`,`rate`,`amount`,`discount`,`taxableValue`,`cgstRate`,`cgstAmount`,`sgstRate`,`sgstAmount`,`igstRate`,`igstAmount`,`total`,`hsnCode`,`uom`) values ('a151c91fe93d417d8623d7c398801354','0d11660d9c014984a8d642a5bdc0a69a','bcbc','10','100','1000.00','11','989.00','11','108.79','11','108.79',NULL,NULL,'1206.58',NULL,NULL),('d695b7dc68e8455ebdf72eddad435981','21d9a374734b4b8696afeb312226c93a','bbb','6','20','120.00','18','102.00','13','13.26','14','14.28',NULL,NULL,'129.54',NULL,NULL),('a4c0618ca6b744d4885ea987879d419a','12640523a76742cb90531ddf2b29ea9c','productxx','11','99','1089.00','77','1012.00','22','222.64','33','333.96',NULL,NULL,'1568.60','11','100'),('1e481b50caf44f278a54187c5d8deaa9','fbef8e498218486a83dd4abf4c4deeae','pants','1','75','75.00','10','65.00','9','5.85','9','5.85',NULL,NULL,'76.70','123456','12345'),('c6d18130e3874c2b9aa382a7021c4fe3','6f7bc19a57764677a9362ab47064da17','shirt','1','90','90.00','10','80.00','10','8.00','10','8.00',NULL,NULL,'96.00','2345','65656');

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

insert  into `client`(`clientId`,`companyName`,`pan`,`gstn`,`address`,`state`,`pin`,`contactPerson`,`mobile`,`email`,`updatedBy`,`updatedOn`,`logoPath`,`terms`,`accountNumber`,`bank`,`branch`,`ifsc`) values ('247baa0e00ab47c38190acee5fe85411','Grand','345679023','4579903','mahadevapura,kr puram taluka, bangalore-16','9fced080018847aba864eea9713bc3af','560016','narine','9986626618','narine@gmail.com','2017-08-31 12:58:57','2017-08-31 12:58:57',NULL,NULL,'23467901','sbi','kr puram','sbi7890'),('31c9e7c5a2b3473cb21056e057119607','kiran','34567890123','12','akashnagar,kr puram taluka,bangalore-16','a6a7155f758e45fe84b0a0800efdf68b','560016','kiran','9986626618','kiran@gmail.com','2017-08-31 12:10:55','2017-08-31 12:10:55',NULL,NULL,'345679103','sbi','akashnagar','sbi3390'),('93ff3a1c6db1469884b46b690aa30a7d','Client company','12567890','1256743','mahadevapura,kr puram taluka,bangalore-16','415b2418c5da460494114e9709f5b1c6','560016','gowtham','9986626618','gowtham@gmail.com','2017-08-31 11:29:07','2017-08-31 11:29:07',NULL,NULL,'256789012345','sbi','mahadevapura','sbi56780'),('f1e7c0a6fc0a48a0821054c50590e58e','nagarjuna','3467023','134768','hoskoate,kr puram taluka, bagalore-16','415b2418c5da460494114e9709f5b1c6','560016','chiantany','9986626614','chiantany@gmail.com','2017-09-01 17:36:43','2017-09-01 17:36:43',NULL,NULL,'45678901345','sbi','hoskoate','sbi78965');

/*Table structure for table `client_product` */

DROP TABLE IF EXISTS `client_product`;

CREATE TABLE `client_product` (
  `clientId` varchar(50) DEFAULT NULL,
  `productId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `client_product` */

insert  into `client_product`(`clientId`,`productId`) values ('93ff3a1c6db1469884b46b690aa30a7d','6f7bc19a57764677a9362ab47064da17'),('93ff3a1c6db1469884b46b690aa30a7d','fbef8e498218486a83dd4abf4c4deeae'),('31c9e7c5a2b3473cb21056e057119607','4b918cf9cc15460aa4c0d5f9a151cf3f'),('31c9e7c5a2b3473cb21056e057119607','5bbf0929a1e2472b9239adcf88e81dbd'),('247baa0e00ab47c38190acee5fe85411','d683aeaaac9748c6818f3cad41654917'),('247baa0e00ab47c38190acee5fe85411','86fdb7093d8c4e53af1fbca1856168d3'),('93ff3a1c6db1469884b46b690aa30a7d','361d4d6d0ae94594852f2cb0969ae1aa'),('f1e7c0a6fc0a48a0821054c50590e58e','e25872a006034a03a95a5ecdf28a0e54'),('f1e7c0a6fc0a48a0821054c50590e58e','b135f648d11249f9808023be5ff94274'),('f1e7c0a6fc0a48a0821054c50590e58e','8ec1e37b057b4c5d98bdc8c8b30d83a9'),('f1e7c0a6fc0a48a0821054c50590e58e','58be2caab7d341afa31d165b7fa11971');

/*Table structure for table `client_purchaser` */

DROP TABLE IF EXISTS `client_purchaser`;

CREATE TABLE `client_purchaser` (
  `purchaserId` varchar(50) DEFAULT NULL,
  `clientId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `client_purchaser` */

insert  into `client_purchaser`(`purchaserId`,`clientId`) values ('8127ff5810904ed395a1f713d5f3a680','93ff3a1c6db1469884b46b690aa30a7d'),('7a8733f0cb634197a3bdf4d4de0d7ce4','31c9e7c5a2b3473cb21056e057119607'),('79ed3c4f340146fbb449bbdbccd23841','93ff3a1c6db1469884b46b690aa30a7d'),('630aac7226394cf29a8b35866c9e9451','247baa0e00ab47c38190acee5fe85411'),('480613a34cde4ca797f232d0674ffc97','f1e7c0a6fc0a48a0821054c50590e58e'),('4435e927f11e45e6ad2fd44781ea6010','f1e7c0a6fc0a48a0821054c50590e58e');

/*Table structure for table `client_user` */

DROP TABLE IF EXISTS `client_user`;

CREATE TABLE `client_user` (
  `clientId` varchar(50) DEFAULT NULL,
  `userId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `client_user` */

insert  into `client_user`(`clientId`,`userId`) values ('93ff3a1c6db1469884b46b690aa30a7d','441459ffcbc345eaae5eabd0fe53b635'),('31c9e7c5a2b3473cb21056e057119607','78091668dae74327869225fa44b7235a'),('247baa0e00ab47c38190acee5fe85411','a4806a98f7734ca2b0c4638a2fde6c9d'),('f1e7c0a6fc0a48a0821054c50590e58e','6fb4acdb462a4eb994e2ee4855536a7f'),('f1e7c0a6fc0a48a0821054c50590e58e','51d18fa8692848e0843f5b5c8582468c'),('f1e7c0a6fc0a48a0821054c50590e58e','131b02f663ef4bd993dad647870ed793');

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

insert  into `product`(`productId`,`productName`,`hsnCode`,`uom`,`quantity`,`purchaserPrice`,`mrp`,`salePrice`,`discount`,`cGST`,`sGST`,`iGST`,`updatedBy`,`updatedDate`,`productType`) values ('361d4d6d0ae94594852f2cb0969ae1aa','shorts','11','3457898','10','90','150','10','10','9','9','9','2017-08-31 18:25:49','2017-08-31 18:25:49','0'),('4b918cf9cc15460aa4c0d5f9a151cf3f','sarees','12','345','10','100','150','10','10','9','9','9','2017-08-31 12:46:34','2017-08-31 12:46:34','0'),('58be2caab7d341afa31d165b7fa11971','neckshirts','12','89008','10','100','200','100','10','9','9','9','2017-09-01 18:16:02','2017-09-01 18:16:02','0'),('5bbf0929a1e2472b9239adcf88e81dbd','pulover','12','3456','10','100','500','100','20','9','9','9','2017-08-31 12:48:04','2017-08-31 12:48:04','0'),('6f7bc19a57764677a9362ab47064da17','shirt','2345','65656','10','50','150','90','10','10','10','10','2017-08-31 11:45:03','2017-08-31 11:45:03','0'),('86fdb7093d8c4e53af1fbca1856168d3','tshirt','10','34567','10','90','150','75','10','9','9','9','2017-08-31 13:44:33','2017-08-31 13:44:33','0'),('8ec1e37b057b4c5d98bdc8c8b30d83a9','chain','12','1190','10','100','100','10','10','9','9','9','2017-09-01 18:09:27','2017-09-01 18:09:27','0'),('b135f648d11249f9808023be5ff94274','gokual','12','1809','10','100','200','100','20','9','9','9','2017-09-01 17:55:17','2017-09-01 17:55:17','0'),('d683aeaaac9748c6818f3cad41654917','jeans','12','34578','10','100','300','120','10','9','9','9','2017-08-31 13:43:20','2017-08-31 13:43:20','0'),('e25872a006034a03a95a5ecdf28a0e54','salvar','23','20','10','100','200','30','20','9','9','9','2017-09-01 17:42:33','2017-09-01 17:42:33','0'),('fbef8e498218486a83dd4abf4c4deeae','pants','123456','12345','10','90','160','75','10','9','9','9','2017-08-31 12:14:20','2017-08-31 12:14:20','0');

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

insert  into `purchaser`(`purchaserId`,`companyName`,`panNumber`,`gstNumber`,`address`,`state`,`pincode`,`contactName`,`mobileNo`,`emailID`,`updatedBy`,`updatedDate`) values ('4435e927f11e45e6ad2fd44781ea6010','nageshwerrao','890989','1232','hoskotae,kr puram taluka,bangalore-16','3f64cd6d5861439b9e9a73bf27c00c03','560016','nagesh','9986626615','nagesh@gmail.com',NULL,'2017-09-01 18:11:59'),('480613a34cde4ca797f232d0674ffc97','nagarjuna','12478690','23456','hoskotae,kr puram taluka,bangalore-16','9d8d2373b48548c49c8c465fef82a49f','560016','nagarjuna','9986626614','nagarjuna@gmail.com',NULL,'2017-09-01 17:44:49'),('630aac7226394cf29a8b35866c9e9451','madhu','3456890542','134579','mahadevapura','5ed96ccd20f04966a24a2e183fed4c86','560016','mandhu','9986626618','mandhu@gmail.com',NULL,'2017-08-31 13:58:56'),('79ed3c4f340146fbb449bbdbccd23841','kalanekatan','345690876','1234578','mahadevapura','9fced080018847aba864eea9713bc3af','560016','mandhu','9986626618','mandhu@gmail.com',NULL,'2017-08-31 13:55:50'),('7a8733f0cb634197a3bdf4d4de0d7ce4','cherams','34567899012','123456','pwd road,argrahru,kr puram taluka,bangalore-16','1cbbd1156377433db489919960d0c396','560016','madhu','9986626618','madhu@gmail.com',NULL,'2017-08-31 12:50:50'),('8127ff5810904ed395a1f713d5f3a680','kalamandir','4567890123','1234567890','mahadevapura,kr puram taluka,bangalore-16','1cbbd1156377433db489919960d0c396','560016','kiran','9986626618','kiran@gmail.com',NULL,'2017-08-31 11:47:01');

/*Table structure for table `purchaser_shipping` */

DROP TABLE IF EXISTS `purchaser_shipping`;

CREATE TABLE `purchaser_shipping` (
  `purchaserId` varchar(50) DEFAULT NULL,
  `shippingId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `purchaser_shipping` */

insert  into `purchaser_shipping`(`purchaserId`,`shippingId`) values ('8127ff5810904ed395a1f713d5f3a680','3a4a273af08046e7b37393a3234b0624'),('630aac7226394cf29a8b35866c9e9451','b792ea1a02244adfa86687c50bb331b3'),('7a8733f0cb634197a3bdf4d4de0d7ce4','b3418071159748d5b166d7c81ea2e54f'),('480613a34cde4ca797f232d0674ffc97','d22add5c02e1438a988cd589b75b4498'),('4435e927f11e45e6ad2fd44781ea6010','57768c155ee04d31830f453a35299c68');

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

insert  into `shipping`(`ShippingId`,`purchaserName`,`name`,`address`,`state`,`pin`) values ('3a4a273af08046e7b37393a3234b0624',NULL,'kiran','mahadevapura,kr puram taluka,bangalore-16','5ed96ccd20f04966a24a2e183fed4c86','560016'),('57768c155ee04d31830f453a35299c68',NULL,'nagesh','hoskotae,kr puram taluka,bangalore-16','1cb0a3ab597c444cb1f44d53bb7f743d','560016'),('b3418071159748d5b166d7c81ea2e54f',NULL,'raja','udip','5ed96ccd20f04966a24a2e183fed4c86','121212'),('b792ea1a02244adfa86687c50bb331b3',NULL,'mandhu','mahadevapura','a6a7155f758e45fe84b0a0800efdf68b','560016'),('d22add5c02e1438a988cd589b75b4498',NULL,'nagarjuna','hoskotae,kr puram taluka,bangalore-16','b0dc6ce7f22f426cad80183214af6e98','560016');

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

insert  into `user`(`userId`,`role`,`userName`,`mobile`,`email`,`address`,`updatedBy`,`updatedOn`,`companyName`,`password`) values ('131b02f663ef4bd993dad647870ed793','Employee','akhil','9986626616','akhil@gmail.com','hoskotae,kr puram taluka,bangalore-16','2017-09-01 17:50:46','2017-09-01 17:50:46','','pass@123'),('441459ffcbc345eaae5eabd0fe53b635','Admin','gowtham','9986626611','goutham@gmail.com','mahadevapura,kr puram taluka,bangalore-16','2017-08-31 11:30:54','2017-08-31 11:30:54','','pass@123'),('51d18fa8692848e0843f5b5c8582468c','Manager','chitanaya','9986626615','chitanaya@gmail.com','hoskotae,kr puram taluka,bangalore-16','2017-09-01 17:47:09','2017-09-01 17:47:09','','pass@123'),('6fb4acdb462a4eb994e2ee4855536a7f','Admin','Nagarjuna','9986626614','nagarjuna@gmail.com','hoskotae','2017-09-01 17:37:47','2017-09-01 17:37:47','','pass@123'),('78091668dae74327869225fa44b7235a','Manager','kiran','9986626612','kiran@gmail.com','akashnagar,kr puram taluka,bangalore-16','2017-08-31 12:12:31','2017-08-31 12:12:31','','pass@123'),('7e69b571bf3e4df48e249898bd484ae8','MasterAdmin','name','9986626610','iugyugh@gmail.com','edtrfyguh','2017-08-30 14:01:09','2017-08-30 14:01:09','','pass@123'),('a4806a98f7734ca2b0c4638a2fde6c9d','Employee','Grand','9986626613','grand@gmail.com','grand layout,krpuram taluka,bangalore-16','2017-08-31 13:29:52','2017-08-31 13:29:52','','pass@123');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
