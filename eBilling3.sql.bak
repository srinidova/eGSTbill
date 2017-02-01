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

insert  into `billingdetails`(`billDetailsId`,`billId`,`productId`,`quantity`,`rate`,`amount`,`mrp`) values ('b36bb70a819545b5b75d568665830381','7e58353cc20048a481edac0260567ebb','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','7e58353cc20048a481edac0260567ebb','fd950800ede74a0498eed34baeec842d','10','20','200','20');

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

insert  into `billingdetailscart`(`billDetailsId`,`billId`,`productId`,`quantity`,`rate`,`amount`,`mrp`) values ('2e68f62c58d94844a57ebc5ae47db5f3','0a0648e6e5d547d3b828c63ce11f446c','fd950800ede74a0498eed34baeec842d','1','20','20','20'),('89ad7a4dd1e44f808f3ec0b6db712b78','0a0648e6e5d547d3b828c63ce11f446c','47f10031d3f8405bb05955543f664ca3','1','10','10','10'),('b36bb70a819545b5b75d568665830381','389888e5b2604b6ab7cbe765b32a3c77','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','389888e5b2604b6ab7cbe765b32a3c77','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','9cf0e06ac31d436887a7555327e3e214','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','9cf0e06ac31d436887a7555327e3e214','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','bb4fd4c77fe64c6088731de168509fb8','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','bb4fd4c77fe64c6088731de168509fb8','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','6fa774c9415e47fc9df4b94abe75c4c1','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','6fa774c9415e47fc9df4b94abe75c4c1','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','51ebeee5bb784487ac524a7720ce3eea','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','51ebeee5bb784487ac524a7720ce3eea','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','5b37ad1526674920a4c86cc518a8bab7','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','5b37ad1526674920a4c86cc518a8bab7','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('87cda093964b41c7bc9aea9c77eacf0d','1be29902466f40d3b757f7dfd033395f','fd950800ede74a0498eed34baeec842d','2','20','40','20'),('b36bb70a819545b5b75d568665830381','3e48c22e2838418fba64e8aaf00ac812','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','3e48c22e2838418fba64e8aaf00ac812','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','e3a6c26b713a43b8ae9a66cd0dfbb3df','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','e3a6c26b713a43b8ae9a66cd0dfbb3df','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','831f0fe4b5094a22b8ef7ae28cc409d8','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','831f0fe4b5094a22b8ef7ae28cc409d8','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','d251d745bd7c4375ae1b8cd0934dc77c','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','d251d745bd7c4375ae1b8cd0934dc77c','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','e692984eae3d4b16b07c22c980a2fb51','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','e692984eae3d4b16b07c22c980a2fb51','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','4ccfc0a1d9c844538f89be3a13637151','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','4ccfc0a1d9c844538f89be3a13637151','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','cbf9a609d4a94c6e88add2ab8318e600','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','cbf9a609d4a94c6e88add2ab8318e600','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','0d251c5a6db740aa860ac8394accc11a','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','0d251c5a6db740aa860ac8394accc11a','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','975202c1b5b74a31b60e905900def034','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','975202c1b5b74a31b60e905900def034','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','235778b534e34bee9a682c2066ee3bf0','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','235778b534e34bee9a682c2066ee3bf0','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('46fbe41a358f4667b894c5edf0e90178','b26e3310d3bd4633a343cbb0e79645d4','fd950800ede74a0498eed34baeec842d','2','20','40','20'),('b36bb70a819545b5b75d568665830381','c89ad132ae98415095ffac682fb058a0','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','c89ad132ae98415095ffac682fb058a0','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','31b0e427e9b843dbae9d9833ca092252','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','31b0e427e9b843dbae9d9833ca092252','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','fe9432d698fe46e38c17ebcdaa5618e3','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','fe9432d698fe46e38c17ebcdaa5618e3','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','51b0b0d3fc414b4faf786cafd7abb319','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','51b0b0d3fc414b4faf786cafd7abb319','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','c84cc5e8654440df86d3e144ed03f7d3','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','c84cc5e8654440df86d3e144ed03f7d3','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','9dcb94a9261f4fcbb0e7a5761613428c','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','9dcb94a9261f4fcbb0e7a5761613428c','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','398c7b9914a44448af5151e29e3340d4','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','398c7b9914a44448af5151e29e3340d4','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','0419cb5c5e734d588ae3f83b3c6477c5','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','0419cb5c5e734d588ae3f83b3c6477c5','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','cffe870841d247dcaa0040e333a6ebee','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','cffe870841d247dcaa0040e333a6ebee','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','5b637ea40c8c405a99139dc2c3e16bc0','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','5b637ea40c8c405a99139dc2c3e16bc0','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','d1ded26649254a55b9f021c16e34b3f4','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','d1ded26649254a55b9f021c16e34b3f4','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('7dc34cf263264914ba1f7b4f196ca91e','0892e57d603a4bd39f6bd990b011c8db','fd950800ede74a0498eed34baeec842d','12','20','240','20'),('849b6d7ce8aa44349542237285710da0','0892e57d603a4bd39f6bd990b011c8db','47f10031d3f8405bb05955543f664ca3','2','10','20','10'),('280b6177cb6242968b90d33dd4906aaf','1cd043ea9481428fba7206e5391af355','fd950800ede74a0498eed34baeec842d','2','20','40','20'),('b36bb70a819545b5b75d568665830381','d848ddb5be9841d480611591435ec06e','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','d848ddb5be9841d480611591435ec06e','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','7bcadb9d6bbe4c15ae81036a96c722f9','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','7bcadb9d6bbe4c15ae81036a96c722f9','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','cbf16fa492e4475fae22728c0d59b89d','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','cbf16fa492e4475fae22728c0d59b89d','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('b36bb70a819545b5b75d568665830381','39d4a54ddf9e4be2aaed6cfef6b9ab5d','47f10031d3f8405bb05955543f664ca3','13','10','130','10'),('67ec9c031b3c4d77bc7aa6b50e080fdb','39d4a54ddf9e4be2aaed6cfef6b9ab5d','fd950800ede74a0498eed34baeec842d','10','20','200','20'),('f3744a4a3d4b4c2fbd47106a0af9334b','bc8ad9a9a7454900be6007d7c0c0afeb','fd950800ede74a0498eed34baeec842d','123','20','2460','20');

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

insert  into `billinginfo`(`billId`,`billNo`,`billDate`,`lrNo`,`lrDate`,`orderNo`,`orderDate`,`dispatchedBy`,`dispatchedDate`,`noOfPacks`,`termOfPayment`,`terms`,`name`,`phone`,`address`,`tinNo`,`totalAmount`,`discount`,`totalMrp`,`totalQuantity`,`totalRate`,`orderBy`,`payment`,`packSlipNo`) values ('7e58353cc20048a481edac0260567ebb','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345');

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

insert  into `billinginfocart`(`billId`,`billNo`,`billDate`,`lrNo`,`lrDate`,`orderNo`,`orderDate`,`dispatchedBy`,`dispatchedDate`,`noOfPacks`,`termOfPayment`,`terms`,`name`,`phone`,`address`,`tinNo`,`totalAmount`,`discount`,`totalMrp`,`totalQuantity`,`totalRate`,`orderBy`,`payment`,`packSlipNo`) values ('0a0648e6e5d547d3b828c63ce11f446c','11221','2017-01-10 15:09:54','11221','2017-01-02','11221','2017-01-10','','2017-01-21','11221','11221','11221','pavan','9491121535','nvm','11221','30','11221','30','2','30',NULL,NULL,NULL),('220248a5b978487291eec4e96138d7bf','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('389888e5b2604b6ab7cbe765b32a3c77','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('9cf0e06ac31d436887a7555327e3e214','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('bb4fd4c77fe64c6088731de168509fb8','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('6fa774c9415e47fc9df4b94abe75c4c1','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('51ebeee5bb784487ac524a7720ce3eea','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('5b37ad1526674920a4c86cc518a8bab7','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('1be29902466f40d3b757f7dfd033395f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'40',NULL,'20','2','20',NULL,NULL,NULL),('3e48c22e2838418fba64e8aaf00ac812','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('e3a6c26b713a43b8ae9a66cd0dfbb3df','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('831f0fe4b5094a22b8ef7ae28cc409d8','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('d251d745bd7c4375ae1b8cd0934dc77c','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('e692984eae3d4b16b07c22c980a2fb51','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('4ccfc0a1d9c844538f89be3a13637151','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('cbf9a609d4a94c6e88add2ab8318e600','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('0d251c5a6db740aa860ac8394accc11a','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('975202c1b5b74a31b60e905900def034','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('235778b534e34bee9a682c2066ee3bf0','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('b26e3310d3bd4633a343cbb0e79645d4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'40',NULL,'20','2','20',NULL,NULL,NULL),('c89ad132ae98415095ffac682fb058a0','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('31b0e427e9b843dbae9d9833ca092252','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('fe9432d698fe46e38c17ebcdaa5618e3','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('51b0b0d3fc414b4faf786cafd7abb319','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('c84cc5e8654440df86d3e144ed03f7d3','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('9dcb94a9261f4fcbb0e7a5761613428c','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('70db9f7a57834d3b8474404f9ee5786e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('398c7b9914a44448af5151e29e3340d4','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('0419cb5c5e734d588ae3f83b3c6477c5','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('cffe870841d247dcaa0040e333a6ebee','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('5b637ea40c8c405a99139dc2c3e16bc0','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('d1ded26649254a55b9f021c16e34b3f4','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('0892e57d603a4bd39f6bd990b011c8db',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'260',NULL,'30','14','30',NULL,NULL,NULL),('1cd043ea9481428fba7206e5391af355',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'40',NULL,'20','2','20',NULL,NULL,NULL),('d848ddb5be9841d480611591435ec06e','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('7bcadb9d6bbe4c15ae81036a96c722f9','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('cbf16fa492e4475fae22728c0d59b89d','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('39d4a54ddf9e4be2aaed6cfef6b9ab5d','12345','2017-01-10 14:13:45','12345','2017-01-25','12345','2017-01-23','','2017-01-23','12345','12345','terms','pavan','9491121535','nvm','12345','330','12345','30','23','30','12345','Card','12345'),('bc8ad9a9a7454900be6007d7c0c0afeb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2460',NULL,'20','123','20',NULL,NULL,NULL);

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

insert  into `product`(`productId`,`productName`,`productType`,`mrp`,`updatedBy`,`updatedDate`) values ('ef44d4ae32b740c2a3b9483cd492642a','aa','0','100','2017-01-12 10:38:59','2017-01-12 10:38:59'),('907634715f9c49679a481c75e974f61c','bb','0','122','2017-01-12 10:39:08','2017-01-12 10:39:08');

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

insert  into `productstock`(`productId`,`stock`,`oldStock`,`newStock`,`updateOn`,`updateBy`,`stockId`) values ('28db17e551614ba8bc333eb5b0f00807','100','100','100','2017-01-12 10:37:51','2017-01-12 10:37:51','2e014d7e6c2b490b90c080f51db9fdda'),('faa1185462c6458ba726572aff9a3ec5','12','12','121','2017-01-12 10:38:04','2017-01-12 10:38:04','d9eddb38ff0245c5b42a461f63d7399e'),('907634715f9c49679a481c75e974f61c','4','5','6','2017-01-12 10:40:43','2017-01-12 10:40:43','8d9fade64ec644b6bd5687b1ccc79040');

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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
