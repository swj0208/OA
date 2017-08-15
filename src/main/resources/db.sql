create database oa;

drop database oa;

drop table plan
--任务表： 任务编号、任务名、内容、开始时间、时间限制、完成时间、状态、
create table plan(
	pid int primary key auto_increment,
	pname VARCHAR(50),
	content VARCHAR(2000),
	timestart DATETIME,
	timelimit DATETIME,
	timeend DATETIME,
	gid int,
	pstatus VARCHAR(50),
	temp1 VARCHAR(200),
	temp2 VARCHAR(200)
	
)

select * from plan;


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
insert into department(department,temp1,temp2) values("人事部",null,null);
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
insert into plan(pname,content,timestart,timelimit,timeend,gid,pstatus) 
	values('OA系统开发','OA系统的上线与测试',now(),DATE_ADD(now(),INTERVAL 3 DAY),null,1,'进行中');
insert into plan(pname,content,timestart,timelimit,timeend,gid,pstatus) 
	values('第四季度策划','OA系统的上线与测试',now(),DATE_ADD(now(),INTERVAL 4 DAY),null,2,'进行中');
insert into plan(pname,content,timestart,timelimit,timeend,gid,pstatus) 
	values('任务计划的测试1','OA系统的上线与测试',now(),DATE_ADD(now(),INTERVAL 5 DAY),null,3,'进行中');
insert into plan(pname,content,timestart,timelimit,timeend,gid,pstatus) 
	values('任务计划的测试2','OA系统的上线与测试',now(),DATE_ADD(now(),INTERVAL 2 DAY),null,3,'进行中');
insert into plan(pname,content,timestart,timelimit,timeend,gid,pstatus) 
	values('任务计划的测试3','OA系统的上线与测试',now(),DATE_ADD(now(),INTERVAL 1 DAY),null,3,'进行中');
insert into plan(pname,content,timestart,timelimit,timeend,gid,pstatus) 
	values('任务计划的测试4','OA系统的上线与测试',now(),DATE_ADD(now(),INTERVAL 3 DAY),null,3,'进行中');
insert into plan(pname,content,timestart,timelimit,timeend,gid,pstatus) 
	values('任务计划的测试5','OA系统的上线与测试',now(),DATE_ADD(now(),INTERVAL 3 DAY),null,3,'进行中');
insert into plan(pname,content,timestart,timelimit,timeend,gid,pstatus) 
	values('任务计划的测试6','OA系统的上线与测试',now(),DATE_ADD(now(),INTERVAL 3 DAY),null,3,'进行中');
insert into plan(pname,content,timestart,timelimit,timeend,gid,pstatus) 
	values('任务计划的测试7','OA系统的上线与测试',now(),DATE_ADD(now(),INTERVAL 3 DAY),null,3,'进行中');
insert into plan(pname,content,timestart,timelimit,timeend,gid,pstatus) 
	values('任务计划的测试8','OA系统的上线与测试',now(),DATE_ADD(now(),INTERVAL 3 DAY),null,3,'进行中');
insert into plan(pname,content,timestart,timelimit,timeend,gid,pstatus) 
	values('任务计划的测试9','OA系统的上线与测试',now(),DATE_ADD(now(),INTERVAL 3 DAY),null,3,'进行中');
insert into plan(pname,content,timestart,timelimit,timeend,gid,pstatus) 
	values('任务计划的测试10','OA系统的上线与测试',now(),DATE_ADD(now(),INTERVAL 3 DAY),null,3,'进行中');
	
select * from plan


----

insert into users(uname,upwd,sex,photo,entrytime,tel,email,qq,birthday ,address ,department ,ustatus ,gid )
	values('a','a','男',null,now(),'13579246810','12345678@zs.com','12345678','1987-1-1','湖南','开发部','正常',1)
insert into users(uname,upwd,sex,photo,entrytime,tel,email,qq,birthday ,address ,department ,ustatus ,gid )
	values('wp','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2','男',null,now(),'13579246811','12345678@ls.com','12345679','1987-11-12','湖南','开发部','休假',1)
	
	values('李四','12345678','男',null,now(),'13579246811','12345678@ls.com','12345679','1987-11-12','湖南','开发部','休假',1)
insert into users(uname,upwd,sex,photo,entrytime,tel,email,qq,birthday ,address ,did ,ustatus ,gid )
	values('ws','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2','男',null,now(),'13579246811','12345678@ls.com','12345679','1987-11-12','湖南',1,'正常',1)
insert into users(uname,upwd,sex,photo,entrytime,tel,email,qq,birthday ,address ,did ,ustatus ,gid )
	values('a','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2','男',null,now(),'13579246811','12345678@ls.com','12345679','1987-11-12','湖南',1,'正常',1)
insert into users(uname,upwd,sex,photo,entrytime,tel,email,qq,birthday ,address ,did ,ustatus ,gid )
	values('v','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2','女',null,now(),'13222222222','12222222@ls.com','12345679','1987-11-12','湖南',1,'正常',1)

	
	
update users set upwd = "6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2";
select * from users
delete from users where uid = 4;

-----
insert into groups(gname )
	values('OA开发小组')
insert into groups(gname )
	values('第一策划小组')
insert into groups(gname )
	values('第一测试小组')

select * from groups

-----
insert into power (powername,uid)
	values('管理员',1)
select * from department

----
insert into notice(content,nweight ,createtime  ,uid ,nstatus)
	values('今晚加班',1,now(),1,0)
select * from notice

-----
insert into file(fname,description,path ,uid ,uptime ,downtimes ,fweight)
	values('绝密资料','这是一份绝密资料',null,1,now(),0,1)
select * from file


--查找小组的工作计划的详情	
select pid,pname,content,timestart,timelimit,timeend,pstatus,gid from plan 
			where gid=1 and pstatus='进行中'

select * from plan
select pid,pname,content,timestart,timelimit,timeend,pstatus,gid from plan WHERE  pstatus='进行中'  limit 0,5



update plan set content = "计划编号5--计算机的诞生和发展促进了人类社会的进步和繁荣，作为信息科学的载体和核心，计算机科学在知识时代扮了重要的角色。在行政机关、企事业单位工作中，是采用Internet/Intranet技术，基于工作流的概念，以计算机为中心，采用一系列现代化的办公设备和先进的通信技术，广泛、全面、迅速地收集、整理、加工、存储和使用信息，使企业内部人员方便快捷地共享信息，高效地协同工作；改变过去复杂、低效的手工办公方式，为科学管理和决策服务，从而达到提高行政效率的目的。一个企业实现办公自动化的程度也是衡量其实现现代化管理的标准。中国专家在第一次全国办公自动化规划讨论会上提出办公自动化的定义为：利用先进的科学技术，使部分办公业务活动物化于人以外的各种现代化办公设备中，由人与技术设备构成服务于某种办公业务目的的人一机信息处理系统。
--OA未来： “以人为本”是协同的精髓.企业的核心管控环节包括各项事务都存在一个事前规划预测、事中执行监控、事后分析优化的循环体系，都要有一个目标制定、分解执行落地、执行中资源协助、执行后分析优化的过程，不管是流程管理、知识管理还是目标绩效、计划任务管理。当我们把目光聚焦到执行者身上，就很轻易地得出以人为中心的协同运营导航平台的原型：这个平台需要能够明确地传达他的工作体系是怎样的、目标是什么、执行落地的步骤该怎么操作、执行过程中所需要的资源应该从哪里获取，以及执行的过程可以怎样来优化等等，而这个执行的过程支撑着企业各项事务的落地和效果。因此，以人为中心是协同的精髓之所在。"
where pid=5

select pid,pname,content,timestart,timelimit,timeend,pstatus,plan.gid as gid,gname from plan left join  groups 
		on plan.gid=groups.gid
		
		
insert into plan(pname,content,timestart,timelimit,gid,pstatus)
		values('测试14','具体内容',now(),DATE_ADD(now(),INTERVAL 5 DAY),1,'进行中')
		
delete from plan where pid=19



select pid,pname,timestart,timelimit,timeend,pstatus,plan.gid as
		gid,gname from plan left join groups
		on plan.gid=groups.gid 
		order by pid
		asc
		limit 0,5
		and pstatus='进行中'
		
		
select * from plan