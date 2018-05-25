/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - bookstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bookstore` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bookstore`;

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `order_id` varchar(100) NOT NULL DEFAULT '',
  `product_id` varchar(100) NOT NULL DEFAULT '',
  `buynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`order_id`,`product_id`,`buynum`) values ('2ad9ba29-4913-4a50-a1c0-30d250e87664','1',1),('2ad9ba29-4913-4a50-a1c0-30d250e87664','12',2),('2fd35a5f-474d-4211-a242-7777703c83c7','13',1),('375114be-1236-46de-a5d7-21a04c1c23bc','11',1),('62d1409c-6e89-462b-9fb8-ae11c5f0c84b','12',2),('62d1409c-6e89-462b-9fb8-ae11c5f0c84b','13',1),('62d1409c-6e89-462b-9fb8-ae11c5f0c84b','14',1),('6a9bc65f-8c1b-49c6-8dd1-8d2e0f364004','11',1),('a1970b8a-1e1e-4d06-858c-c11cf6f01ad4','15',1),('c6e56b8a-21c0-4bfb-bbe6-17574855c3d7','11',2);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `money` double DEFAULT NULL,
  `receiverAddress` varchar(255) DEFAULT NULL,
  `receiverName` varchar(20) DEFAULT NULL,
  `receiverPhone` varchar(20) DEFAULT NULL,
  `paystate` int(11) DEFAULT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`money`,`receiverAddress`,`receiverName`,`receiverPhone`,`paystate`,`ordertime`,`user_id`) values ('2ad9ba29-4913-4a50-a1c0-30d250e87664',186.64,'xxx','xxx','xxx',1,'2019-10-30 11:08:49',1),('2fd35a5f-474d-4211-a242-7777703c83c7',8.88,'xxx','xxx','xxx',1,'2019-10-30 11:08:51',1),('375114be-1236-46de-a5d7-21a04c1c23bc',88,'xxx','xxx','xxx',1,'2019-10-30 11:08:53',1),('62d1409c-6e89-462b-9fb8-ae11c5f0c84b',35.52,'xxx','xxx','xxx',0,'2019-10-29 10:37:30',1),('6a9bc65f-8c1b-49c6-8dd1-8d2e0f364004',88,'xxx','xxx','xxx',0,'2019-10-30 09:55:08',1),('a1970b8a-1e1e-4d06-858c-c11cf6f01ad4',88,'xxx','xxx','xxx',0,'2019-10-29 17:07:05',1),('c6e56b8a-21c0-4bfb-bbe6-17574855c3d7',176,'xxx','xxx','xxx',1,'2019-10-30 11:10:11',1);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `pnum` int(11) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `products` */

insert  into `products`(`id`,`name`,`price`,`category`,`pnum`,`imgurl`,`description`) values ('1','Java Brief-GYF',168.88,'Computer',10,'bookcover/1.JPG','good book'),('11','Othello',88,'Literature',9,'/bookcover/2.JPG','good book'),('12','The old man and ocean',8.88,'Art',10,'bookcover/3.JPG','good book'),('13','Mise',8.88,'Literature',9,'bookcover/4.JPG','good book'),('14','Pickwick Papes',8.88,'Children',10,'bookcover/5.JPG','good book'),('15','Hypocrite',88,'Literature',10,'bookcover/6.JPG','good book'),('16','The red and black',88,'Literature',10,'bookcover/7.JPG','good book'),('17','Father Goriot',88,'Test',10,'bookcover/8.JPG','good book'),('18','Count of Monte Cristo',16,'Literature',10,'bookcover/9.JPG','good book'),('19','CEO’ s wife',16,'Literature',10,'bookcover/10.JPG','good book'),('2','HTMLIntroduction-GYF',168.88,'Computer',10,'bookcover/11.JPG','good book'),('21','Reach the top 2',88,'Literature',10,'bookcover/12.JPG','good book'),('22','Medicine 2',8.88,'Lifestyle',10,'bookcover/13.JPG','good book'),('23','The Number One 2',8.88,'Origin',10,'bookcover/14.JPG','good book'),('24','Good Wife 2',8.88,'Literature',10,'bookcover/15.JPG','good book'),('25','Happy everday2',88,'Science',10,'bookcover/16.JPG','good book'),('26','Princess 2',88,'Literature',10,'bookcover/17.JPG','good book'),('27','Find the Ocean 2',88,'Literature',10,'bookcover/18.JPG','good book'),('28','Baby the best 2',16,'Language',10,'bookcover/19.JPG','good book'),('29','CEO’s wife 2',16,'Literature',10,'bookcover/20.JPG','good book'),('3','JSIntroduction-GYF',168.88,'Computer',10,'bookcover/21.JPG','good book'),('4','PHPIntroduction-GYF',168.88,'Management',10,'bookcover/22.JPG','good book'),('5','AndroidIntroduction-GYF',168.88,'Computer',10,'bookcover/23.JPG','good book'),('6','iOSIntroduction-GYF',168.88,'Society',10,'bookcover/24.JPG','good book'),('7','MySQLIntroduction-GYF',168.88,'Computer',10,'bookcover/25.JPG','good book'),('8','OracleIntroduction-GYF',168.88,'Computer',10,'bookcover/26.JPG','good book'),('9','VMWareIntroduction-GYF',168.88,'Computer',10,'bookcover/27.JPG','good book');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `introduce` varchar(100) DEFAULT NULL,
  `activeCode` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `role` varchar(10) DEFAULT '普通用户',
  `registTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`PASSWORD`,`gender`,`email`,`telephone`,`introduce`,`activeCode`,`state`,`role`,`registTime`) values (1,'tom','123','男','shuleisanshi@163.com','18611111111','123','2fa73eeb-04db-4b34-871d-28dcef988262',1,'管理员','2019-10-30 11:08:35'),(2,'zhangsan','123','男','wangwu@163.com','18611111111','123','f54ccb4b-e3fe-4799-9460-1e228ad34378',1,'管理员','2019-10-28 15:19:09'),(3,'tom12','123','Man','fox@itcast.cn','18611111111','123','917473a8-a4a4-463f-a550-d57863ffbf1e',0,'普通用户','2019-10-30 09:44:11'),(4,'fox','123','Man','lisi@163.com','18611111111','123','a1dfef68-9dee-43f2-9bb4-172a9cca4832',0,'普通用户','2019-10-30 11:04:50'),(5,'jack','123','Man','shuleisanshi@163.com','18611111111','123','62969d71-96c2-42a8-b489-416accd01fed',1,'普通用户','2019-10-30 11:06:52');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
