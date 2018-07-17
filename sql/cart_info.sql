use users;
create table cart_info(
	id int primary key auto_increment,
    user_id int not null,
    product_id int not null,
    number varchar(10) not null,
    batch_no varchar(30) not null,
    constraint `FK_ID_CP` foreign key (`product_id`) references `product_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    constraint `FK_ID_CU` foreign key (`user_id`) references `userinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    unique key `USER_PRO` (`user_id`,`product_id`)	#创建多列唯一约束
);


#select a.sp_img,a.sp_info,a.old_price,a.new_price,b.number,c.username from
#sp_info a,cart_info b,userinfo c where b.product_id=a.id and b.user_id=c.id and b.user_id='4';

select b.id cart_id,a.id product_id,a.product_img,a.product_info,a.old_price,a.new_price,b.number,c.username from 
product_info a,cart_info b,userinfo c where b.product_id=a.id and b.user_id=c.id and b.user_id='4';