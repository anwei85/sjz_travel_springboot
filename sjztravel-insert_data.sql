-- 之所以先truncate 是因为主键自增长，防止主键不是从1开始自增
truncate table tastyfood;
truncate table scenic;
truncate table ticket;
truncate table `order`;-- 关键字，需要加引号
truncate table `user`;-- 关键字，需要加引号
truncate table manager;

INSERT INTO sjztravel.`user` (userid,username,password,name,email,telephone,birthday,sex,state,code) VALUES
('1','neutrino','202cb962ac59075b964b07152d234b70','neutrino',NULL,NULL,'2022-09-07','female',1,NULL);

INSERT INTO sjztravel.`order` (tid,uid,paid,num,`no`,code,state) VALUES
(1,'1',1.0,1,'ef628cd7-e007-4452-a0ae-2e23662b7d94','515583d4-923b-497c-ba5d-6aa178e5fdcd',2);

INSERT INTO sjztravel.ticket (fid,name,`explain`,dprice,mprice) VALUES
(1,'水外洞天公园','成人需购买门票，12岁以下儿童免门票。',100.0,99.0),
(2,'景秀动物园','成人需购买门票，12岁以下儿童免门票。',58.0,28.0),
(3,'野生动物园','成人需购买门票，12岁以下儿童免门票。',199.0,98.0),
(4,'野三坡白洋淀','成人需购买门票，12岁以下儿童免门票。',588.0,88.0);

INSERT INTO sjztravel.tastyfood (name,`describe`,commend,pic) VALUES
('石家庄安徽牛肉板面','石家庄安徽牛肉板面，其中汤料是一绝，精选31味中药炸成香料油，再与上等的红太阳辣椒炒制而成，麻辣鲜香。这里的板面区别于传统宽面，经创新改良，以细面为主，整个制作过程采用最传统的方法，选料、配料、熬汤、煮面，最后搭配上卤煮、豆排、丸子、火腿肠等，是来石家庄的舌尖美食','贵面族·板面(石家庄总店)；','/image/foodpic/bm.jpg'),
('缸炉烧饼','用火炉烧缸制作的烧饼，因此叫缸炉烧饼。缸炉烧饼是京津冀地区特色小吃之一，主要流行在河北地区，其中以唐山和石家庄周边地区的缸炉烧饼为代表。','苍岩山缸炉烧饼；','/image/foodpic/sb.jpg'),
('驴肉火烧','河北特色小吃，外皮酥脆，驴肉鲜嫩多汁，常配驴杂汤食用，风味独特。','味多好家常菜；','/image/foodpic/lr.jpg'),
('无极饸饹','牛肉罩饼，色香味美，口感鲜嫩，透味不粘腻，香味浓郁。','牛肉罩饼裕华店；','/image/foodpic/wj.jpg');

INSERT INTO sjztravel.scenic (name,theme,addr,feature,pic,sales) VALUES
('水外洞天公园','湖光山色','景秀区海琴湾总站','真的非常非常美，绝对不枉此行！','/image/scenic/pic/byd.png',0),
('景秀动物园 ','湖光山色','景秀区海琴湾总站','真的非常非常美，绝对不枉此行！','/image/scenic/pic/bys.png',0),
('野生动物园 ','田园度假','景秀区海琴湾总站','真的非常非常美，绝对不枉此行！','/image/scenic/pic/ds.png',0),
('野三坡白洋淀  ','登山徒步','景秀区海琴湾总站','真的非常非常美，绝对不枉此行！','/image/scenic/pic/dxg.png',0);

INSERT INTO sjztravel.manager (managerid,name,password,flag) VALUES
('1','admin','123',0);