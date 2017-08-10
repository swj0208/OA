create database oa;
drop database oa;
drop table plan
--任务表： 任务编号、任务名、内容、开始时间、时间限制、完成时间、状态、
create table plan(
	pid int primary key auto_increment,
	pname VARCHAR(50),
	content VARCHAR(200),
	timestart DATETIME,
	timelimit DATETIME,
	timeend DATETIME,
	pstatus VARCHAR(50),
	temp1 VARCHAR(200),
	temp2 VARCHAR(200)
	
)

drop table users
--用户表:编号、姓名、密码、性别、照片路径、入职时间、电话、email、QQ、生日、住址、部门、状态、小组编号
create table users(
	uid int primary key auto_increment,
	uname VARCHAR(30),
	upwd VARCHAR(50),
	sex VARCHAR(10),
	photo VARCHAR(100),
	entrytime date,
	tel VARCHAR(50),
	email VARCHAR(50),
	qq VARCHAR(50),
	birthday date,
	address VARCHAR(100),
	did int,
	ustatus VARCHAR(50),
	gid int,
	temp1 VARCHAR(200),
	temp2 VARCHAR(200)
)
select * from users;
drop table users;

drop table groups
--部门
create table department(
	did int primary key auto_increment,
	department varchar(50),
	temp1 VARCHAR(200),
	temp2 VARCHAR(200)
)
drop table department;
insert into department(department,temp1,temp2) values("设计部",null,null);
insert into department(department,temp1,temp2) values("研发部",null,null);
select * from department;

--小组编号：编号、小组名、任务编号
create table groups(
	gid int primary key auto_increment,
	gname VARCHAR(50),
	did int,
	temp1 VARCHAR(200),
	temp2 VARCHAR(200)
	
)
drop table groups;
select * from groups;
insert into groups(gname,did,temp1,temp2) values('A组',1,null,null);
insert into groups(gname,did,temp1,temp2) values('B组',1,null,null);
insert into groups(gname,did,temp1,temp2) values('C组',2,null,null);
insert into groups(gname,did,temp1,temp2) values('D组',2,null,null);


alter table groups 
  add constraint fk_groups_plan
     foreign key(pid) references plan(pid);
alter table groups drop foreign key fk_groups_plan

drop table power;
--权限表：编号、权限名、用户编号
create table power (
	powerid int primary key auto_increment,
	powername VARCHAR(50),
	uid int,
	temp1 VARCHAR(200),
	temp2 VARCHAR(200)
)


drop table notice
--通知表:编号、内容、通知权重、发布时间、发布人编号、发送给小组的编号、发送给用户的编号,是否查看
create table notice(
	nid int primary key auto_increment,
	content VARCHAR(4000),
	nweight int,
	createtime  DATETIME,
	did int,
	gid int,
	uid int,
	temp1 VARCHAR(200),
	temp2 VARCHAR(200)
)

insert into notice(content,nweight,createtime,did,gid,uid) values("1111",1,now(),1,1,1);
select * from notice;

drop table notice;
alter table notice 
  add constraint fk_notice_users
     foreign key(uid) references users(uid);
alter table notice drop foreign key fk_notice_users




drop table file
--共享文件表：编号、文件名、文件描述、路径、上传用户的id、上传时间、下载次数、文件权重
create table file(
	fid int primary key auto_increment,
	fname  VARCHAR(50),
	description VARCHAR(200),
	path VARCHAR(100),
	uid int,
	uptime DATETIME,
	downtimes int,
	fweight int,
	temp1 VARCHAR(200),
	temp2 VARCHAR(200)
)

alter table file 
  add constraint fk_file_users
     foreign key(uid) references users(uid);

---------------------------------------------------------初始化数据----------------------------------
insert into plan(pname,content,timestart,timelimit,timeend,pstatus) 
	values('OA系统开发','OA系统的上线与测试',now(),DATE_ADD(now(),INTERVAL 3 DAY),null,'进行中')
	
select * from plan

----

insert into users(uname,upwd,sex,photo,entrytime,tel,email,qq,birthday ,address ,did ,ustatus ,gid )
	values('a','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2','男',null,now(),'13579246811','12345678@ls.com','12345679','1987-11-12','湖南',1,'正常',1)
insert into users(uname,upwd,sex,photo,entrytime,tel,email,qq,birthday ,address ,did ,ustatus ,gid )
	values('b','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2','女',null,now(),'13222222222','12222222@ls.com','12345679','1987-11-12','湖南',1,'正常',1)

	
	
update users set upwd = "6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2";
select * from users
delete from users where uid = 4;

-----
insert into groups(gname ,pid )
	values('OA开发小组',1)

select * from groups

-----
insert into power (powername,uid)
	values('管理员',1)
select * from power

----
insert into notice(content,nweight ,createtime  ,uid ,nstatus)
	values('今晚加班',1,now(),1,0)
select * from notice

-----
insert into file(fname,description,path ,uid ,uptime ,downtimes ,fweight)
	values('绝密资料','这是一份绝密资料',null,1,now(),0,1)
select * from file