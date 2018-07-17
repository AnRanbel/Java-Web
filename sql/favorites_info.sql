use users;
create table favorites_info(
	id int primary key auto_increment,
    user_id int not null,
    product_id int not null,
    constraint `FK_ID_FP` foreign key (`product_id`) references `product_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    constraint `FK_ID_FU` foreign key (`user_id`) references `userinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    unique key `USER_PRO2` (`user_id`,`product_id`)	#创建多列唯一约束
);

