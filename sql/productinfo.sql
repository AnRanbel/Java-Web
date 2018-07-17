use users;
create table product_type (id int primary key auto_increment, type_name varchar(15) not null);
insert into product_type(type_name)values('排球');
insert into product_type(type_name)values('排球护具');
insert into product_type(type_name)values('球鞋');
insert into product_type(type_name)values('运动服');
insert into product_type(type_name)values('其他');

create table product_brand(
id int primary key auto_increment,
brand_name varchar(20) not null
);
insert into product_brand(brand_name)values('Mikasa');	#米卡萨
insert into product_brand(brand_name)values('ASICS');	#阿斯克斯
insert into product_brand(brand_name)values('NIKE');	#耐克
insert into product_brand(brand_name)values('Adidas');	#阿迪达斯
insert into product_brand(brand_name)values('Li-Ning');		#李宁
insert into product_brand(brand_name)values('ANTA');	#安踏
insert into product_brand(brand_name)values('XTEP');	#特步
insert into product_brand(brand_name)values('Other');	#其他

create table product_info(
id int primary key auto_increment,
product_type int not null,
product_brand int not null,
product_name varchar(25) not null,
old_price varchar(10) not null,
new_price varchar(10) not null,
product_info varchar(50) not null,
product_img varchar(100) not null,
CONSTRAINT `FK_ID_P` FOREIGN KEY (`product_type`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,  #实现联级删除与更新
CONSTRAINT `FK_ID_B` FOREIGN KEY (`product_brand`) REFERENCES `product_brand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('1','1','训练吊球','550.00','493.00','Mikasa(米卡萨) 排球 训练吊球 MVA300ATTR','volleyball1.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('1','1','沙滩排球','470.00','410.00','Mikasa(米卡萨) 排球沙滩排球 VLS300 比赛用球','volleyball2.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('1','1','二传专用训练排球','350.00','276.00','Mikasa(米卡萨) 排球 MVT370 二传专用训练排球 5号球','volleyball3.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('1','1','排球','500.00','460.00','Mikasa(米卡萨) 排球 MVA200 国际排联FIVB比赛用球','volleyball4.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('1','1','室内训练用球','200.00','126.00','Mikasa(米卡萨) 排球 MVA380K 室内训练用球','volleyball5.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('1','1','学生比赛用球','260.00','210.00','Mikasa(米卡萨) 排球 MVA330 学生比赛用球 5号球','volleyball6.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('1','1','排球','300.00','240.00','Mikasa(米卡萨) 排球 MVA310 国际排联FIVB标准用球','volleyball7.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('1','1','室内训练排球','99.00','74.00','Mikasa(米卡萨) 排球 MVA460 室内训练排球 4号球','volleyball8.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('1','1','中学生比赛训练用排球','170.00','163.00','Mikasa(米卡萨) 排球 MV1500 中学生比赛训练用排球 5号硬排球','volleyball9.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('1','1','中学生比赛训练用标准排球','150.00','126.00','Mikasa(米卡萨) 排球 MV1000 中学生比赛训练用标准排球','volleyball10.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('1','1','学生训练用排球','89.00','66.00','Mikasa(米卡萨) 排球 VST560 学生训练用排球','volleyball11.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('1','1','室内训练排球','89.00','74.00','Mikasa(米卡萨) 排球 MVA360 室内训练排球 5号球','volleyball12.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('1','5','比赛训练专用排球','139.00','99.00','李宁排球5号中考儿童大学生比赛训练专用不伤手充气软式排球正品','volleyball13.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('1','8','超软比赛排球','145.00','140.00','兰华排球中考授权正品上海兰华排球金五星超软比赛排球SLU300','volleyball14.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('1','8','中考专用硬排','65.00','55.00','长和排球 PQ2000超细纤维PU5号 中考专用硬排中学生锦标赛','volleyball15.jpg');

insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('3','2','男排室内运动鞋','500.00','443.00','Asics阿斯克斯减震室内运动鞋男排球鞋B704Y-0123','Sport_Shoes1.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('3','2','女排室内训练鞋','500.00','443.00','ASICS阿斯克斯GEL-TASK室内训练鞋女排球鞋B754Y-3090','Sport_Shoes2.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('3','2','男排球鞋','700.00','668.00','ASICS阿斯克斯VOLLEY ELITE FF CLUSTER男排球鞋 TVR721-1001','Sport_Shoes3.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('3','2','男排球鞋','680.00','638.00','ASICS阿斯克斯GEL-NETBURNER BALLISTIC耐磨透气男排球鞋B507Y-5801','Sport_Shoes4.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('3','2','排球教练裁判官员鞋','2500.00','1600.00','Asics 阿斯克斯 特殊鞋款 排球教练裁判官员鞋 TVR506-5050','Sport_Shoes5.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('3','2','排球鞋男女款','550.00','518.00','ASICS阿斯克斯2017春夏专业耐磨透气排球鞋男女款TVR713-0190','Sport_Shoes6.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('3','2','室内综合女排球鞋','480.00','443.00','ASICS阿斯克斯GEL-TACTIC室内综合鞋女排球鞋B554N-3301','Sport_Shoes7.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('3','2','男跑鞋','999.00','968.00','ASICS阿斯克斯GEL-NETBURNER BALLISTIC稳定跑鞋男跑鞋T700N-9023','Sport_Shoes8.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('3','2','女跑步鞋','1500.00','1043.00','ASICS阿斯克斯GEL-KAYANO 23稳定支撑运动鞋女跑步鞋T696N-4393','Sport_Shoes9.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('4','2','女款排球服','455.00','420.00','Asics阿斯克斯 女款排球服 黑色比赛服','Sport_Suit1.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('4','2','女款排球服','466.00','420.00','Asics阿斯克斯 女款排球服 蓝色比赛服','Sport_Suit2.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('4','2','女款排球服','470.00','420.00','Asics阿斯克斯 女款排球服 红色比赛服','Sport_Suit3.jpg');

insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('2','3','排球健身手腕套','69.00','59.00','耐克nike夏季透气时尚运动护腕男篮球排球健身手腕套吸汗防扭伤女','Volleyball_Court1.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('2','4','排球扭伤女时尚手腕套','49.00','48.00','adidas阿迪达斯护腕男运动吸汗篮球排球网球扭伤女时尚手腕套薄款','Volleyball_Court2.png');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('2','8','排球护腕纯棉','16.90','16.20','排球护腕纯棉运动正品加长毛巾护腕护手腕羽毛球加厚保暖男女护臂','Volleyball_Court3.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('2','3','排球nike护手腕','99.00','79.00','耐克护腕男女健身运动扭伤关节加压网球排球nike篮球羽毛球护手腕','Volleyball_Court4.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('2','8','排球护膝','124.00','68.00','Star排球护膝运动 男女加厚专业世达排球护具护膝户外保暖正品','Volleyball_Court5.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('2','3','专业排球护膝','59.00','49.00','正品NIKE/耐克:专业排球护膝 防摔 专业排球加厚 运动 单车 护膝','Volleyball_Court6.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('2','2','专业排球护膝','100.00','86.00','专柜正品 日本阿斯克斯/asics 专业排球护膝 ZD020 专柜真空包装','Volleyball_Court7.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('2','8','排球运动自粘绷带','104.00','67.00','LP轻型弹性贴布排球篮球运动比赛护指护腕护踝自粘性贴布自粘绷带','Volleyball_Court8.jpg');

insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('5','1','排球裁判用品','99.00','89.00','Mikasa(米卡萨) 排球裁判用品 VK红黄牌','Other1.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('5','1','数字气压表气压计','350.00','336.00','Mikasa(米卡萨) 数字气压表气压计 AG500','Other2.jpg');
insert into product_info(product_type,product_brand,product_name,old_price,new_price,product_info,product_img)values('5','8','排球网架','550.00','499.00','便携式羽毛球网架移动气排球网架标准简易可升降羽毛球架拦网羽架','Other3.jpg');



