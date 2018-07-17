#create database users;
use users;
CREATE TABLE `userinfo` (
  id int primary key auto_increment,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `sex` varchar(7),
  `telephone` varchar(20) NOT NULL,
  `email` varchar(32) NOT NULL,
  `address` varchar(32)
);

INSERT INTO `userinfo`(`username`,`password`,`sex`,`telephone`,`email`,`address`) VALUES ('AA', '654321', 'Female', '13628380761', 'wy_chongq@qq.com','南极洲');
INSERT INTO `userinfo`(`username`,`password`,`sex`,`telephone`,`email`,`address`) VALUES ('BB', '554267', 'Male', '13996541247', '1458236641@qq.com','河南石家庄');
INSERT INTO `userinfo`(`username`,`password`,`sex`,`telephone`,`email`,`address`) VALUES ('CC', '982655', 'Male', '18996547422', 'lisi_works@gmail.com','新疆乌如木齐');
INSERT INTO `userinfo`(`username`,`password`,`sex`,`telephone`,`email`,`address`) VALUES ('DD', '000000', 'Female', '18545632457', '2541498852@qq.com','西藏拉萨');
INSERT INTO `userinfo`(`username`,`password`,`sex`,`telephone`,`email`,`address`) VALUES ('EE', 'xxxxxx', 'Female', '17965412544', 'xxxxxxx@163.com','成都四川');
INSERT INTO `userinfo`(`username`,`password`,`sex`,`telephone`,`email`,`address`) VALUES ('who', '123456', 'Male', '19874526663', 'who_you_are@sina.com','江苏南京');

alter table userinfo add realname varchar(32);
alter table userinfo add deliveryaddress varchar(50);
alter table userinfo add birthday varchar(20);
alter table userinfo add constellation varchar(15);