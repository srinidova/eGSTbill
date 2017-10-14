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

insert  into `autoincrement`(`tableName`,`columnName`,`incrementId`) values ('billCart','billNo','258');

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

insert  into `billcart`(`billCartId`,`billNo`,`totalQuantity`,`totalAmount`,`totalDiscount`,`taxValue`,`totalCgst`,`totalSgst`,`totalIgst`,`grandTotal`,`totalBeforeTax`,`totalTax`,`totalAfterTax`,`billDate`,`orderBy`) values ('68bbfbc97ec049b8818afa4f96f3bffb','242','1.00','111.00','10.00','101.00','11.11','11.11',NULL,'123.22','101.00','22.22','123.22',NULL,NULL),('8601eac615bd4f91b3e0975f69d2bdc4','243','2.00','200.00','20.00','180.00','18.00','18.00',NULL,'216.00','180.00','36.00','216.00',NULL,NULL),('210e7ab9a8944a9ca7871050fb55cc9a','244','1.00','111.00','10.00','101.00','9.09','9.09',NULL,'119.18','101.00','18.18','119.18',NULL,NULL),('fd6e705b23024f0da49606372ae98531','245','1.00','111.00','10.00','101.00','9.09','9.09',NULL,'119.18','101.00','18.18','119.18',NULL,NULL),('3234850db6d74906b3a0473e22c21e3e','246','1.00','111.00','10.00','101.00','9.09','9.09',NULL,'119.18','101.00','18.18','119.18',NULL,NULL),('0784ba25d6764a39a2338521f870d87b','247','1.00','111.00','10.00','101.00','9.09','9.09',NULL,'119.18','101.00','18.18','119.18',NULL,NULL),('1d2b465a94e44d0583f5bc3d34bfb7ac','248','1.00','111.00','10.00','101.00','22.22','22.22',NULL,'145.44','101.00','44.44','145.44',NULL,NULL),('242884a095bd46dabbdf5ab6a9d5ddbc','249','1.00','111.00','10.00','101.00','9.09','9.09',NULL,'119.18','101.00','18.18','119.18',NULL,NULL),('2d913ef99ed3495a876cd37a05e4e0c6','250','1.00','1.00','10.00','-9.00','-0.81','-0.81',NULL,'-10.62','-9.00','-1.62','-10.62',NULL,NULL),('0e52545882d44a0c9e812cae372c473e','251','2.00','211.00','20.00','191.00','30.32','30.32',NULL,'251.64','191.00','60.64','251.64',NULL,NULL),('d66da91365864cabacca041e2b791c0f','252','12.00','1332.00','10.00','1322.00','145.42','145.42',NULL,'1612.84','1322.00','290.84','1612.84',NULL,NULL),('3cba4240208d4d5d857cbfd7cdb1128f','253','2.00','222.00','10.00','212.00','23.32','23.32',NULL,'258.64','212.00','46.64','258.64',NULL,NULL),('a0089602cdf04997819f5f219bf71960','254','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00',NULL,NULL),('a4d0bffecfef44e3a4f6443a7aa9c9a5','255','2.00','222.00','20.00','202.00','20.20','20.20',NULL,'242.40','202.00','40.40','242.40',NULL,NULL),('e2c732839474434dbd3f0d76b4d4a11e','256','1.00','111.00','10.00','101.00','9.09','9.09',NULL,'119.18','101.00','18.18','119.18',NULL,NULL),('dc5b23abbcdd4cd888f372e4826588a8','257','1.00','111.00','10.00','101.00','9.09','9.09',NULL,'119.18','101.00','18.18','119.18',NULL,NULL),('05eaa6b90be241bd80b7cf6799d69c3c','258','1.00','100.00','10.00','90.00','8.10','8.10',NULL,'106.20','90.00','16.20','106.20',NULL,NULL);

/*Table structure for table `billcart_billdetailscart` */

DROP TABLE IF EXISTS `billcart_billdetailscart`;

CREATE TABLE `billcart_billdetailscart` (
  `billDetailsCartId` varchar(50) DEFAULT NULL,
  `billCartId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billcart_billdetailscart` */

insert  into `billcart_billdetailscart`(`billDetailsCartId`,`billCartId`) values ('9161453a5c5b4231aa2a5b7b06662a45','68bbfbc97ec049b8818afa4f96f3bffb'),('0309b44a0c3b4f2eb8060e83c935e573','8601eac615bd4f91b3e0975f69d2bdc4'),('1809bbce79b94127beaed68ed4a3f156','8601eac615bd4f91b3e0975f69d2bdc4'),('97d0bff3532b4b4c860ad8c58f9dc578','210e7ab9a8944a9ca7871050fb55cc9a'),('db8b9fb2ce1842d5a1295619583f8e00','fd6e705b23024f0da49606372ae98531'),('b889667c10b0408a8b400c1e46e102d0','3234850db6d74906b3a0473e22c21e3e'),('2504aaef0f99444383528c10d1657f13','0784ba25d6764a39a2338521f870d87b'),('6f6eaf9154084c72bf918164eeea69cd','1d2b465a94e44d0583f5bc3d34bfb7ac'),('3e5cc11cd1f64c7ca9543c2f0ab57a89','242884a095bd46dabbdf5ab6a9d5ddbc'),('bb2c6630519b426f8aa7d59efbf813e7','2d913ef99ed3495a876cd37a05e4e0c6'),('f7a4f52b93924576ab1deb406ab4bab1','0e52545882d44a0c9e812cae372c473e'),('6305440671d8496aa94ef9f7fea9289c','0e52545882d44a0c9e812cae372c473e'),('320bbd5b0d9740adbfdd5f93da4ab8c7','d66da91365864cabacca041e2b791c0f'),('b02fbd46f72a4417bc0711bcd5f2de98','3cba4240208d4d5d857cbfd7cdb1128f'),('f9e6e7d31ad041eba9622d439635e983','a0089602cdf04997819f5f219bf71960'),('1458aa137e5a44c0a96e333f0e5cdeb5','a0089602cdf04997819f5f219bf71960'),('4a187d51046646d3803c907837f0ffbd','a4d0bffecfef44e3a4f6443a7aa9c9a5'),('1e82f9a64bf746b68a8b9338191779aa','a4d0bffecfef44e3a4f6443a7aa9c9a5'),('d0610ee6a978458997c1c81762db67eb','e2c732839474434dbd3f0d76b4d4a11e'),('383dae718c3b4306a222213f03b28a27','dc5b23abbcdd4cd888f372e4826588a8'),('fd41f3df46c643659bab1c08ac20949c','05eaa6b90be241bd80b7cf6799d69c3c');

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

insert  into `billdetailscart`(`billDetailsCartId`,`productId`,`productName`,`quantity`,`rate`,`amount`,`discount`,`taxableValue`,`cgstRate`,`cgstAmount`,`sgstRate`,`sgstAmount`,`igstRate`,`igstAmount`,`total`,`hsnCode`,`uom`) values ('9161453a5c5b4231aa2a5b7b06662a45','2ce7b53ef62c49a386f16d24ee5058c6','paragon','1','111','111.00','10','101.00','11','11.11','11','11.11',NULL,NULL,'123.22','11',''),('0309b44a0c3b4f2eb8060e83c935e573','57a2eb7828464d90aea2b868fbeee35b','pulover shirt','1','100','100.00','10','90.00','9','8.10','9','8.10',NULL,NULL,'106.20','1212',''),('1809bbce79b94127beaed68ed4a3f156','2ce7b53ef62c49a386f16d24ee5058c6','paragon','1','100','100.00','10','90.00','11','9.90','11','9.90',NULL,NULL,'109.80','11',''),('97d0bff3532b4b4c860ad8c58f9dc578','57a2eb7828464d90aea2b868fbeee35b','pulover shirt','1','111','111.00','10','101.00','9','9.09','9','9.09',NULL,NULL,'119.18','1212',''),('db8b9fb2ce1842d5a1295619583f8e00','57a2eb7828464d90aea2b868fbeee35b','pulover shirt','1','111','111.00','10','101.00','9','9.09','9','9.09',NULL,NULL,'119.18','1212',''),('b889667c10b0408a8b400c1e46e102d0','57a2eb7828464d90aea2b868fbeee35b','pulover shirt','1','111','111.00','10','101.00','9','9.09','9','9.09',NULL,NULL,'119.18','1212',''),('2504aaef0f99444383528c10d1657f13','57a2eb7828464d90aea2b868fbeee35b','pulover shirt','1','111','111.00','10','101.00','9','9.09','9','9.09',NULL,NULL,'119.18','1212',''),('6f6eaf9154084c72bf918164eeea69cd','5d6eae7dea2c4747b298314d8238b322','sparx','1','111','111.00','10','101.00','22','22.22','22','22.22',NULL,NULL,'145.44','22',''),('3e5cc11cd1f64c7ca9543c2f0ab57a89','57a2eb7828464d90aea2b868fbeee35b','pulover shirt','1','111','111.00','10','101.00','9','9.09','9','9.09',NULL,NULL,'119.18','1212',''),('bb2c6630519b426f8aa7d59efbf813e7','57a2eb7828464d90aea2b868fbeee35b','pulover shirt','1','1','1.00','10','-9.00','9','-0.81','9','-0.81',NULL,NULL,'-10.62','1212',''),('f7a4f52b93924576ab1deb406ab4bab1','57a2eb7828464d90aea2b868fbeee35b','pulover shirt','1','100','100.00','10','90.00','9','8.10','9','8.10',NULL,NULL,'106.20','1212',''),('6305440671d8496aa94ef9f7fea9289c','5d6eae7dea2c4747b298314d8238b322','sparx','1','111','111.00','10','101.00','22','22.22','22','22.22',NULL,NULL,'145.44','22',''),('320bbd5b0d9740adbfdd5f93da4ab8c7','2ce7b53ef62c49a386f16d24ee5058c6','paragon','12','111','1332.00','10','1322.00','11','145.42','11','145.42',NULL,NULL,'1612.84',NULL,NULL),('b02fbd46f72a4417bc0711bcd5f2de98','2ce7b53ef62c49a386f16d24ee5058c6','paragon','2','111','222.00','10','212.00','11','23.32','11','23.32',NULL,NULL,'258.64',NULL,NULL),('4a187d51046646d3803c907837f0ffbd','57a2eb7828464d90aea2b868fbeee35b','pulover shirt','1','111','111.00','10','101.00','9','9.09','9','9.09',NULL,NULL,'119.18','1212',''),('1e82f9a64bf746b68a8b9338191779aa','2ce7b53ef62c49a386f16d24ee5058c6','paragon','1','111','111.00','10','101.00','11','11.11','11','11.11',NULL,NULL,'123.22','11',''),('d0610ee6a978458997c1c81762db67eb','57a2eb7828464d90aea2b868fbeee35b','pulover shirt','1','111','111.00','10','101.00','9','9.09','9','9.09',NULL,NULL,'119.18','1212',''),('383dae718c3b4306a222213f03b28a27','57a2eb7828464d90aea2b868fbeee35b','pulover shirt','1','111','111.00','10','101.00','9','9.09','9','9.09',NULL,NULL,'119.18','1212',''),('fd41f3df46c643659bab1c08ac20949c','58be2caab7d341afa31d165b7fa11971','neckshirts','1','100','100.00','10','90.00','9','8.10','9','8.10',NULL,NULL,'106.20','12','89008');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `categoryId` varchar(50) DEFAULT NULL,
  `categoryName` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `updatedBy` varchar(50) DEFAULT NULL,
  `updatedOn` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`categoryId`,`categoryName`,`description`,`updatedBy`,`updatedOn`) values ('08534efd628a44ebb54a3106dec8baa8','category','description1','2017-10-03 18:12:41','2017-10-03 18:12:41'),('5f275bf9637e4015a10e3d77ba362890','category of product','description of category','2017-10-04 10:43:18','2017-10-04 10:43:18'),('4eb452c903bd4bcbb9904ba847831e05','newb ill category','new bill description ','2017-10-04 10:43:44','2017-10-04 10:43:44');

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

insert  into `client`(`clientId`,`companyName`,`pan`,`gstn`,`address`,`state`,`pin`,`contactPerson`,`mobile`,`email`,`updatedBy`,`updatedOn`,`logoPath`,`terms`,`accountNumber`,`bank`,`branch`,`ifsc`) values ('1a052eaed993473cb32c4e55e8ca38ff','company','bvx1212121','05bvx1212121212','tuiytug','05','123456','contact','456456565656','guygiuih@gmail.com','2017-09-22 17:45:30','2017-09-22 17:45:30',NULL,NULL,'345345456','ftcygvubcfgv','tyguvgyu','12343445'),('247baa0e00ab47c38190acee5fe85411','Grand','345679023','4579903','mahadevapura,kr puram taluka, bangalore-16','9fced080018847aba864eea9713bc3af','560016','narine','9986626618','narine@gmail.com','2017-08-31 12:58:57','2017-08-31 12:58:57',NULL,NULL,'23467901','sbi','kr puram','sbi7890'),('31c9e7c5a2b3473cb21056e057119607','kiran','34567890123','05bvx1212121212','akashnagar,kr puram taluka,bangalore-16','a6a7155f758e45fe84b0a0800efdf68b','560016','kiran','9986626618','kiran@gmail.com','2017-08-31 12:10:55','2017-08-31 12:10:55',NULL,NULL,'345679103','sbi','akashnagar','sbi3390'),('6321393ae1ba4ef18a61b46d0fd53cbe','copanyyyyyy','bvx1234567','05bvx1234567','fgtyyu','05','121212','ggg','4565465455','ghfghgh@gmail.com','2017-09-22 18:10:42','2017-09-22 18:10:42',NULL,NULL,'23434344','fgrtyrty','tttyty','ttyy'),('70da79fe66c84c2db5143a06f4a6da97','kolkata','bvx1212121','02bvx12121212121','door no:49,3rd main sampathnagar, akashnagar,bangalore','02','560020','kails','9986626618','medasani@gmail.com','2017-09-28 16:31:56','2017-09-28 16:31:56',NULL,NULL,'2345678901','SBI','Mahadevapura','SBI04789'),('7168bdd58a104f08ab2b8b705dfcc32d','bbbhb','1234567890','051234567890000','hhhjjjjj','05','121212','rttgg','1234567890','yuh8u@gmail.com','2017-09-22 18:02:57','2017-09-22 18:02:57',NULL,NULL,'1234534545','sdfert','sdfdrt','sdrfdt'),('93ff3a1c6db1469884b46b690aa30a7d','juka pants','12567890','1256743','mahadevapura,kr puram taluka,bangalore-16','415b2418c5da460494114e9709f5b1c6','560016','gowtham','9986626618','gowtham@gmail.com','2017-08-31 11:29:07','2017-08-31 11:29:07',NULL,NULL,'256789012345','sbi','mahadevapura','sbi56780'),('a2dfa426ff2347cc9972d17a7c6a76f2','jilk','bvx1212121','01bvx12121212121','ugfioerhigkr','01','121212','person of contact','123456789999','gfbfgb@gmail.com','2017-09-27 15:41:46','2017-09-27 15:41:46',NULL,NULL,'123456555','sbi','mahadevapura','sbi8878'),('f1e7c0a6fc0a48a0821054c50590e58e','nagarjuna','3467023','134768','hoskoate,kr puram taluka, bagalore-16','415b2418c5da460494114e9709f5b1c6','560016','chiantany','9986626614','chiantany@gmail.com','2017-09-01 17:36:43','2017-09-01 17:36:43',NULL,NULL,'45678901345','sbi','hoskoate','sbi78965');

/*Table structure for table `client_product` */

DROP TABLE IF EXISTS `client_product`;

CREATE TABLE `client_product` (
  `clientId` varchar(50) DEFAULT NULL,
  `productId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `client_product` */

insert  into `client_product`(`clientId`,`productId`) values ('93ff3a1c6db1469884b46b690aa30a7d','6f7bc19a57764677a9362ab47064da17'),('93ff3a1c6db1469884b46b690aa30a7d','fbef8e498218486a83dd4abf4c4deeae'),('31c9e7c5a2b3473cb21056e057119607','4b918cf9cc15460aa4c0d5f9a151cf3f'),('31c9e7c5a2b3473cb21056e057119607','5bbf0929a1e2472b9239adcf88e81dbd'),('247baa0e00ab47c38190acee5fe85411','d683aeaaac9748c6818f3cad41654917'),('247baa0e00ab47c38190acee5fe85411','86fdb7093d8c4e53af1fbca1856168d3'),('93ff3a1c6db1469884b46b690aa30a7d','361d4d6d0ae94594852f2cb0969ae1aa'),('f1e7c0a6fc0a48a0821054c50590e58e','e25872a006034a03a95a5ecdf28a0e54'),('f1e7c0a6fc0a48a0821054c50590e58e','b135f648d11249f9808023be5ff94274'),('f1e7c0a6fc0a48a0821054c50590e58e','8ec1e37b057b4c5d98bdc8c8b30d83a9'),('f1e7c0a6fc0a48a0821054c50590e58e','58be2caab7d341afa31d165b7fa11971'),('93ff3a1c6db1469884b46b690aa30a7d','b8b98af08f604e3b8f71408b16cf4559'),('93ff3a1c6db1469884b46b690aa30a7d','922cea413898443fa0e165d36cc3a3a9'),('70da79fe66c84c2db5143a06f4a6da97','57a2eb7828464d90aea2b868fbeee35b'),('93ff3a1c6db1469884b46b690aa30a7d','af00f93a525d4724b30cd7d22bba4b5c'),('93ff3a1c6db1469884b46b690aa30a7d','af280067ad684691a21d6c7d12ff58ab'),('93ff3a1c6db1469884b46b690aa30a7d','9cae913916494288863841b7366fdfc6'),('93ff3a1c6db1469884b46b690aa30a7d','06964242d34948c8bdc76ef4fbe2662b'),('93ff3a1c6db1469884b46b690aa30a7d','6cf77c480e70479e97d128da99a175ea'),('93ff3a1c6db1469884b46b690aa30a7d','13b4503da0544ee396481bb5a0e4a1a3'),('93ff3a1c6db1469884b46b690aa30a7d','50bc998b08e64e68ab47572b80c85efd'),('70da79fe66c84c2db5143a06f4a6da97','2ce7b53ef62c49a386f16d24ee5058c6'),('70da79fe66c84c2db5143a06f4a6da97','5d6eae7dea2c4747b298314d8238b322'),('70da79fe66c84c2db5143a06f4a6da97','8009a67f73a149bf87212af07ca5d446'),('93ff3a1c6db1469884b46b690aa30a7d','da26fa83b0a24f3daa814f1fcf4c6403');

/*Table structure for table `client_purchaser` */

DROP TABLE IF EXISTS `client_purchaser`;

CREATE TABLE `client_purchaser` (
  `purchaserId` varchar(50) DEFAULT NULL,
  `clientId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `client_purchaser` */

insert  into `client_purchaser`(`purchaserId`,`clientId`) values ('8127ff5810904ed395a1f713d5f3a680','93ff3a1c6db1469884b46b690aa30a7d'),('7a8733f0cb634197a3bdf4d4de0d7ce4','31c9e7c5a2b3473cb21056e057119607'),('79ed3c4f340146fbb449bbdbccd23841','93ff3a1c6db1469884b46b690aa30a7d'),('630aac7226394cf29a8b35866c9e9451','247baa0e00ab47c38190acee5fe85411'),('480613a34cde4ca797f232d0674ffc97','f1e7c0a6fc0a48a0821054c50590e58e'),('4435e927f11e45e6ad2fd44781ea6010','f1e7c0a6fc0a48a0821054c50590e58e'),('6545c76f8f7d400a8fb93fac88e5d10d','93ff3a1c6db1469884b46b690aa30a7d'),('b66c529ac0ea418abbff28d5a312b1df','93ff3a1c6db1469884b46b690aa30a7d'),('d866de6504dd492c968f2d3f82c97215','93ff3a1c6db1469884b46b690aa30a7d'),('8ce20476bb074f4aaff5217caad91c6d','31c9e7c5a2b3473cb21056e057119607'),('6f3bb765bda64432a23d683a74b47acf','31c9e7c5a2b3473cb21056e057119607'),('3d571851d005450795d373f74e0c2fac','247baa0e00ab47c38190acee5fe85411'),('b02fbe66ce024d4db2f6642697ad6566','31c9e7c5a2b3473cb21056e057119607'),('e4718945a64d40f3bf3a137082c3fc69','247baa0e00ab47c38190acee5fe85411'),('39f149cfab1745b08c03f10c1da24028','93ff3a1c6db1469884b46b690aa30a7d'),('05b762a9542e4b02a1312a1920fc0cdc','247baa0e00ab47c38190acee5fe85411'),('16700380ea554e76a41de24077076430','93ff3a1c6db1469884b46b690aa30a7d'),('fd5f801256974bbca57be042f5fbfc9b','247baa0e00ab47c38190acee5fe85411'),('5e12f20e9b024e1086fa022d3c628836','31c9e7c5a2b3473cb21056e057119607'),('d0a33f0f8c7a4768b155e4cd2db9bc85','31c9e7c5a2b3473cb21056e057119607'),('1551548650e749969e777b0ad82d85be','31c9e7c5a2b3473cb21056e057119607'),('13faa308819746c9a92d920cf7c7eb6e','f1e7c0a6fc0a48a0821054c50590e58e'),('b6e3e165f08b423fa1e319854d2b95a8','31c9e7c5a2b3473cb21056e057119607'),('350b57aa9c81483887a6fae6260817bb','93ff3a1c6db1469884b46b690aa30a7d'),('8fe3af75c0d14c83848dc156311a8201','247baa0e00ab47c38190acee5fe85411'),('c4183bc572d74552b0d76778b59e3d77','31c9e7c5a2b3473cb21056e057119607'),('0e563d9df98d4a30b91aa6dc49c0622c','247baa0e00ab47c38190acee5fe85411'),('18a6fecef2ce4b9aa0b18eaba623fd9a','247baa0e00ab47c38190acee5fe85411'),('340d83d4749942709c2f7c05fc890ede','31c9e7c5a2b3473cb21056e057119607'),('6db04fa4a1ac4bb6891605bd3157ac49','93ff3a1c6db1469884b46b690aa30a7d'),('cb9dd966e1ac4ccc827e88114c1b235c','247baa0e00ab47c38190acee5fe85411'),('6b39caf0e1314dcabe01a62487bbe8fc','93ff3a1c6db1469884b46b690aa30a7d'),('74da96de7d7847bab8b59eaf4c254889','247baa0e00ab47c38190acee5fe85411'),('e4d49a6d3f4d4e8e94d535bbb45f87cc','31c9e7c5a2b3473cb21056e057119607'),('e3fbb798ec49496381f43adefdc564b5','f1e7c0a6fc0a48a0821054c50590e58e'),('7c5d85b936594936bb9b949c5806b0bc','f1e7c0a6fc0a48a0821054c50590e58e'),('8829de0ded80488990ec5781422e09b5','f1e7c0a6fc0a48a0821054c50590e58e'),('7b2614d7afb244518ddcaad305e8f541','f1e7c0a6fc0a48a0821054c50590e58e'),('8565f798d52b4faaadb544ae46c9bd56','6321393ae1ba4ef18a61b46d0fd53cbe'),('940cfbdb51124a53ae944b6d740fe9fd','1a052eaed993473cb32c4e55e8ca38ff'),('5ee7a0fee533469696f5ba6121c4d1c9','93ff3a1c6db1469884b46b690aa30a7d'),('c5e6c77ccde94bbb9ff7763ada9a3d2d','93ff3a1c6db1469884b46b690aa30a7d'),('d08ff83852ca4e079fc532982a4c2c3a','1a052eaed993473cb32c4e55e8ca38ff'),('26993d56269e46b083a3db7765a5e428','70da79fe66c84c2db5143a06f4a6da97'),('0603adb93b674bbba9b2f033107e79c0','70da79fe66c84c2db5143a06f4a6da97'),('066b9928f4bb4cf3a0ac40c30c541ac1','f1e7c0a6fc0a48a0821054c50590e58e');

/*Table structure for table `client_user` */

DROP TABLE IF EXISTS `client_user`;

CREATE TABLE `client_user` (
  `clientId` varchar(50) DEFAULT NULL,
  `userId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `client_user` */

insert  into `client_user`(`clientId`,`userId`) values ('93ff3a1c6db1469884b46b690aa30a7d','441459ffcbc345eaae5eabd0fe53b635'),('31c9e7c5a2b3473cb21056e057119607','78091668dae74327869225fa44b7235a'),('247baa0e00ab47c38190acee5fe85411','a4806a98f7734ca2b0c4638a2fde6c9d'),('f1e7c0a6fc0a48a0821054c50590e58e','6fb4acdb462a4eb994e2ee4855536a7f'),('f1e7c0a6fc0a48a0821054c50590e58e','51d18fa8692848e0843f5b5c8582468c'),('f1e7c0a6fc0a48a0821054c50590e58e','131b02f663ef4bd993dad647870ed793'),('70da79fe66c84c2db5143a06f4a6da97','a53fd9b758364051879ff22a190a9532'),('70da79fe66c84c2db5143a06f4a6da97','9ca1ff6e854841c2b80db8eeab94d0d8'),('70da79fe66c84c2db5143a06f4a6da97','0449d7f55b8b4e81b27daf1a6a4dee46'),('f1e7c0a6fc0a48a0821054c50590e58e','9bae26a4f6e3405da015ed7d2456c228'),('f1e7c0a6fc0a48a0821054c50590e58e','b46c2b9890064794999ea4d000ab4744');

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

insert  into `product`(`productId`,`productName`,`hsnCode`,`uom`,`quantity`,`purchaserPrice`,`mrp`,`salePrice`,`discount`,`cGST`,`sGST`,`iGST`,`updatedBy`,`updatedDate`,`productType`) values ('06964242d34948c8bdc76ef4fbe2662b','lee','11',NULL,NULL,'100','100',NULL,'10','11','11','11','2017-10-04 12:28:42','2017-10-04 12:28:42','0'),('13b4503da0544ee396481bb5a0e4a1a3','wrangler','11',NULL,NULL,'100','100',NULL,'10','11','11','11','2017-10-04 12:29:21','2017-10-04 12:29:21','0'),('2ce7b53ef62c49a386f16d24ee5058c6','paragon','11',NULL,NULL,'100','100',NULL,'10','11','11','11','2017-10-05 10:44:24','2017-10-05 10:44:24','0'),('361d4d6d0ae94594852f2cb0969ae1aa','shorts','11','3457898','10','90','150','10','10','9','9','9','2017-08-31 18:25:49','2017-08-31 18:25:49','0'),('4b918cf9cc15460aa4c0d5f9a151cf3f','sarees','12','345','10','100','150','10','10','9','9','9','2017-08-31 12:46:34','2017-08-31 12:46:34','0'),('50bc998b08e64e68ab47572b80c85efd','reebook','11',NULL,NULL,'100','100',NULL,'10','11','11','11','2017-10-04 12:29:55','2017-10-04 12:29:55','0'),('57a2eb7828464d90aea2b868fbeee35b','pulover shirt','1212',NULL,NULL,'100','100',NULL,'10','9','9','9','2017-09-28 19:15:32','2017-09-28 19:15:32','0'),('58be2caab7d341afa31d165b7fa11971','neckshirts','12','89008','10','100','200','100','10','9','9','9','2017-09-01 18:16:02','2017-09-01 18:16:02','0'),('5bbf0929a1e2472b9239adcf88e81dbd','pulover','12','3456','10','100','500','100','20','9','9','9','2017-08-31 12:48:04','2017-08-31 12:48:04','0'),('5d6eae7dea2c4747b298314d8238b322','sparx','22',NULL,NULL,'200','200',NULL,'10','22','22','22','2017-10-05 10:44:48','2017-10-05 10:44:48','0'),('6cf77c480e70479e97d128da99a175ea','levies','11',NULL,NULL,'100','100',NULL,'10','11','11','11','2017-10-04 12:28:57','2017-10-04 12:28:57','0'),('6f7bc19a57764677a9362ab47064da17','shirt','2345','65656','10','50','150','90','10','10','10','10','2017-08-31 11:45:03','2017-08-31 11:45:03','0'),('8009a67f73a149bf87212af07ca5d446','nike','11',NULL,NULL,'1000','1000',NULL,'10','11','11','11','2017-10-05 10:45:09','2017-10-05 10:45:09','0'),('86fdb7093d8c4e53af1fbca1856168d3','tshirt','10','34567','10','90','150','75','10','9','9','9','2017-08-31 13:44:33','2017-08-31 13:44:33','0'),('8ec1e37b057b4c5d98bdc8c8b30d83a9','chain','12','1190','10','100','100','10','10','9','9','9','2017-09-01 18:09:27','2017-09-01 18:09:27','0'),('9cae913916494288863841b7366fdfc6','walets','11',NULL,NULL,'100','100',NULL,'10','11','11','11','2017-10-04 12:28:01','2017-10-04 12:28:01','0'),('af00f93a525d4724b30cd7d22bba4b5c','jack','111',NULL,NULL,'100','100',NULL,'10','11','11','11','2017-10-04 12:26:55','2017-10-04 12:26:55','0'),('af280067ad684691a21d6c7d12ff58ab','jones','11',NULL,NULL,'100','100',NULL,'10','11','11','11','2017-10-04 12:27:17','2017-10-04 12:27:17','0'),('b135f648d11249f9808023be5ff94274','gokual','12','1809','10','100','200','100','20','9','9','9','2017-09-01 17:55:17','2017-09-01 17:55:17','0'),('d683aeaaac9748c6818f3cad41654917','jeans','12','34578','10','100','300','120','10','9','9','9','2017-08-31 13:43:20','2017-08-31 13:43:20','0'),('da26fa83b0a24f3daa814f1fcf4c6403','gagra','12121',NULL,NULL,'100','90',NULL,'10','9','9','9','2017-10-11 16:32:46','2017-10-11 16:32:46','1'),('e25872a006034a03a95a5ecdf28a0e54','salvar','23','20','10','100','200','30','20','9','9','9','2017-09-01 17:42:33','2017-09-01 17:42:33','0'),('fbef8e498218486a83dd4abf4c4deeae','pants','123456','12345','10','90','160','75','10','9','9','9','2017-08-31 12:14:20','2017-08-31 12:14:20','0');

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

insert  into `purchaser`(`purchaserId`,`companyName`,`panNumber`,`gstNumber`,`address`,`state`,`pincode`,`contactName`,`mobileNo`,`emailID`,`updatedBy`,`updatedDate`) values ('0603adb93b674bbba9b2f033107e79c0','ganguly','bnbnbnbnbn','02bnbnbnbnbnqwq','uyfuygihzgsdgdfhb','02','560016','jguihjkm','9986626618','kbbv7tiutoy@gmail.com',NULL,'2017-10-11 16:26:36'),('066b9928f4bb4cf3a0ac40c30c541ac1','sadsadsa','bghbghbght','02bghbghbghtyhh','ewtwertreygtrh','02','569999','qwert','7645354434','fhdjfkg@gmail.com',NULL,'2017-10-11 16:46:44'),('13faa308819746c9a92d920cf7c7eb6e','hhhhhhh','222222222222222','fc1111111111111','uygyyguuvbuijhn','13','111111','yguyuygyuiguih','1111111111','buygguiy@gmail.com',NULL,'2017-09-21 17:01:20'),('18a6fecef2ce4b9aa0b18eaba623fd9a','grand','bvx1212121','02bvx1212121222','addressaddress','02','566534','contact person','5675676566','guihuohjnih@gmali.com',NULL,'2017-09-22 11:23:29'),('26993d56269e46b083a3db7765a5e428','gambir','bvx1212121','02bvx1212121112','door no:99,6th main main road , nager,kolkata','05','245679','mahish','9986626618','manish@gmail.com',NULL,'2017-09-28 17:01:15'),('340d83d4749942709c2f7c05fc890ede','kiran','bvx1212121','01bvx1212121222','addressaddress','05','111111','contact person','5676767876','uygihio@gmail.com',NULL,'2017-09-22 12:00:51'),('6b39caf0e1314dcabe01a62487bbe8fc','company of client','bvx1234567','03bvx1234567111','addressaddress','03','111111','contact person','2345677887','uuyihiuhiuhjiouhij@gmail.com',NULL,'2017-09-22 12:12:27'),('6db04fa4a1ac4bb6891605bd3157ac49','client','bvx1212121','01bvx1212121222','addressaddress','01','111111','contactperson','4567876567','ihuigefuygewuyu@gmail.com',NULL,'2017-09-22 12:04:23'),('74da96de7d7847bab8b59eaf4c254889','companygrand','bvx1212121','01bvx1212121222','addressaddress','01','111111','contactperson','6767667577','huihiouhouioho@gmail.com',NULL,'2017-09-22 12:22:02'),('7b2614d7afb244518ddcaad305e8f541','nagarjuna','45645675675676','05uhihuiuhjuihj','gtufygyfcytfugyuh','05','234544','tdyfugbvhjygbvhgv','2345345645','cytugihjbvghjygkj@gmail.com',NULL,'2017-09-22 15:41:30'),('8565f798d52b4faaadb544ae46c9bd56','comapnyyyyy','bvx1212121','02bvx1212121212','addressaddress','02','111111','conatct ','7878787878','bhvuibhj@gmail.com',NULL,'2017-09-23 12:43:03'),('940cfbdb51124a53ae944b6d740fe9fd','comapany','bvx1212121','02bvx1212121212','addressaddress','02','111111','conatct person','1111111111','hfvbgfbh@gmail.com',NULL,'2017-09-23 12:56:29'),('c5e6c77ccde94bbb9ff7763ada9a3d2d','clientssss','bvx1212121','01bvx1212121212','addresssss','01','121212','contactb person','1234567890','uiihjk@gmail.com',NULL,'2017-09-26 16:33:55'),('cb9dd966e1ac4ccc827e88114c1b235c','grand','bvx1212121','01bvx1212121222','addressaddress','01','111111','contactperson','7657658657','jgiohjk@gmail.com',NULL,'2017-09-22 12:10:56'),('e4d49a6d3f4d4e8e94d535bbb45f87cc','kiran','bvx1212121','01bvx1212121222','addressaddress','01','111111','contact person','2345654345','khjskldhjk@gmail.com',NULL,'2017-09-22 15:28:34');

/*Table structure for table `purchaser_shipping` */

DROP TABLE IF EXISTS `purchaser_shipping`;

CREATE TABLE `purchaser_shipping` (
  `purchaserId` varchar(50) DEFAULT NULL,
  `shippingId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `purchaser_shipping` */

insert  into `purchaser_shipping`(`purchaserId`,`shippingId`) values ('8127ff5810904ed395a1f713d5f3a680','3a4a273af08046e7b37393a3234b0624'),('630aac7226394cf29a8b35866c9e9451','b792ea1a02244adfa86687c50bb331b3'),('7a8733f0cb634197a3bdf4d4de0d7ce4','b3418071159748d5b166d7c81ea2e54f'),('480613a34cde4ca797f232d0674ffc97','d22add5c02e1438a988cd589b75b4498'),('4435e927f11e45e6ad2fd44781ea6010','57768c155ee04d31830f453a35299c68'),('6b39caf0e1314dcabe01a62487bbe8fc','033df238e0f14ac5bcc3667639295e41'),('6db04fa4a1ac4bb6891605bd3157ac49','55e7811d4d19456293fee3fb8c885449'),('6db04fa4a1ac4bb6891605bd3157ac49','041649dd957d4ae19577d4f58d468941'),('5ee7a0fee533469696f5ba6121c4d1c9','caaf0b732d764ab381244dcee8fe50b3'),('c5e6c77ccde94bbb9ff7763ada9a3d2d','ea9723e02ba74b40b54d5b5d84a256e0'),('26993d56269e46b083a3db7765a5e428','fd3394a20bd248188c44f55804ae64e1'),('7b2614d7afb244518ddcaad305e8f541','ae01988c254b48f5a11c5b0e214c6884'),('066b9928f4bb4cf3a0ac40c30c541ac1','27e3e671694c4c378f099c204452a1e8'),('340d83d4749942709c2f7c05fc890ede','c1ab94adce2d46eab2f3166e43312475');

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

insert  into `shipping`(`ShippingId`,`purchaserName`,`name`,`address`,`state`,`pin`) values ('033df238e0f14ac5bcc3667639295e41',NULL,'comapny of client','address','fcfd987212f6449caf7eac31abad634d','111111'),('041649dd957d4ae19577d4f58d468941',NULL,'clienettt','qefewrf','Jammu Kashmir','111112'),('27e3e671694c4c378f099c204452a1e8',NULL,'sadsdadas','wetrwrt','Himachal Pradesh','121212'),('3a4a273af08046e7b37393a3234b0624',NULL,'kiran','mahadevapura,kr puram taluka,bangalore-16','5ed96ccd20f04966a24a2e183fed4c86','560016'),('55e7811d4d19456293fee3fb8c885449',NULL,'client','qwfwef','f0084f47592146fb904fd437024a32c3','123565'),('57768c155ee04d31830f453a35299c68',NULL,'nagesh','hoskotae,kr puram taluka,bangalore-16','1cb0a3ab597c444cb1f44d53bb7f743d','560016'),('ae01988c254b48f5a11c5b0e214c6884',NULL,'nagarjuna','3rd main kiran street,bangalore','Karnataka','560019'),('b3418071159748d5b166d7c81ea2e54f',NULL,'raja','udip','5ed96ccd20f04966a24a2e183fed4c86','121212'),('b792ea1a02244adfa86687c50bb331b3',NULL,'mandhu','mahadevapura','a6a7155f758e45fe84b0a0800efdf68b','560016'),('c1ab94adce2d46eab2f3166e43312475',NULL,'kiran','jiuhjnioj','Himachal Pradesh','567878'),('d22add5c02e1438a988cd589b75b4498',NULL,'nagarjuna','hoskotae,kr puram taluka,bangalore-16','b0dc6ce7f22f426cad80183214af6e98','560016'),('ea9723e02ba74b40b54d5b5d84a256e0',NULL,'clientssss','addressss','Himachal Pradesh','121212'),('fd3394a20bd248188c44f55804ae64e1',NULL,'kails','4th main road jukk street,kolkata','Himachal Pradesh','345678');

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

insert  into `user`(`userId`,`role`,`userName`,`mobile`,`email`,`address`,`updatedBy`,`updatedOn`,`companyName`,`password`) values ('131b02f663ef4bd993dad647870ed793','Employee','akhil','9986626616','akhil@gmail.com','hoskotae,kr puram taluka,bangalore-16','2017-09-01 17:50:46','2017-09-01 17:50:46','','pass@123'),('441459ffcbc345eaae5eabd0fe53b635','Admin','gowtham','9986626611','goutham@gmail.com','mahadevapura,kr puram taluka,bangalore-16','2017-08-31 11:30:54','2017-08-31 11:30:54','','6162'),('51d18fa8692848e0843f5b5c8582468c','Manager','chitanaya','9986626615','chitanaya@gmail.com','hoskotae,kr puram taluka,bangalore-16','2017-09-01 17:47:09','2017-09-01 17:47:09','','pass@123'),('6fb4acdb462a4eb994e2ee4855536a7f','Admin','Nagarjuna','9986626614','nagarjuna@gmail.com','hoskotae','2017-09-01 17:37:47','2017-09-01 17:37:47','','pass@123'),('78091668dae74327869225fa44b7235a','Manager','kiran','9986626612','kiran@gmail.com','akashnagar,kr puram taluka,bangalore-16','2017-08-31 12:12:31','2017-08-31 12:12:31','','pass@123'),('7e69b571bf3e4df48e249898bd484ae8','MasterAdmin','name','9986626610','iugyugh@gmail.com','edtrfyguh','2017-08-30 14:01:09','2017-08-30 14:01:09','','pass@123'),('9bae26a4f6e3405da015ed7d2456c228','Manager','haria','7989615236','harik@gmail.com','cssdfdsfdsfdsfdsfsfdss','2017-10-11 16:39:36','2017-10-11 16:39:36','','pass@123'),('a4806a98f7734ca2b0c4638a2fde6c9d','Employee','Grand','9986626613','grand@gmail.com','grand layout,krpuram taluka,bangalore-16','2017-08-31 13:29:52','2017-08-31 13:29:52','','pass@123'),('a53fd9b758364051879ff22a190a9532','Admin','kails','9986626618','kails@gmail.com','kailss','2017-09-28 18:40:54','2017-09-28 18:40:54','','pass@123'),('b46c2b9890064794999ea4d000ab4744','Manager','haria','7989615236','harik@gmail.com','cssdfdsfdsfdsfdsfsfdss','2017-10-11 16:39:41','2017-10-11 16:39:41','','pass@123');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
