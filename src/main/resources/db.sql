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
drop table plan;
select * from plan;

select * from users u left join department d on u.did=d.did left join groups g on g.gid=u.gid  where 1=1
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

insert into users(uname,upwd,sex,photo,entrytime,tel,email,qq,birthday ,address ,did ,ustatus ,gid )
	values('b','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2','男',null,now(),'13579246811','12345678@ls.com','12345679','1987-11-12','湖南',1,'入职',1)
insert into users(uname,upwd,sex,photo,entrytime,tel,email,qq,birthday ,address ,did ,ustatus ,gid )
	values('c','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2','男',null,now(),'13579246811','12345678@ls.com','12345679','1987-11-12','湖南',2,'入职',2)
insert into users(uname,upwd,sex,photo,entrytime,tel,email,qq,birthday ,address ,did ,ustatus ,gid )
	values('d','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2','男',null,now(),'13579246811','12345678@ls.com','12345679','1987-11-12','湖南',2,'入职',1)
insert into users(uname,upwd,sex,photo,entrytime,tel,email,qq,birthday ,address ,did ,ustatus ,gid )
	values('e','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2','男',null,now(),'13579246811','12345678@ls.com','12345679','1987-11-12','湖南',1,'入职',2)

	
	select
		fid,fname,description,path,a.uname as uname,uptime,downtimes,fweight,touid,togid,todid
		from file left join (select uid,uname from users) a on a.uid = file.uid
		
select * from users;

delete  from users where 1=1;
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

drop table permission;


		select users.uid as
		uid,department.department as department,groups.gname as gname,users.uname as uname,
		permission.pername as pername,permission.perid as perid from users
		left join permissionforuser on permissionforuser.uid = users.uid left
		join permission on
		permissionforuser.perid = permission.perid 
		left join department on users.did = department.did
		left join groups on users.gid = groups.gid

		
		select
		doid,dotitle,docontent,dofromuid,dotouid,douid,dotime,dofid,dostatus,docomment,a.uname
		as funame,b.uname as tuname,c.uname as douname,file.fname as fname,permissionforuser.perid
		from document left join
		users a on document.dofromuid = a.uid
		left join users b  on document.dotouid = b.uid 
		left join users c  on document.douid = c.uid 
		left join file on document.dofid = file.fid
		left join permissionforuser on permissionforuser.uid = document.dotouid
		
		
		select users.uid as
		uid,department.department as department,groups.gname as gname,users.uname as uname,
		permission.pername as pername,permission.perid as perid from users
		left join permissionforuser on permissionforuser.uid = users.uid left
		join permission on
		permissionforuser.perid = permission.perid 
		left join department on users.did = department.did
		left join groups on users.gid = groups.gid
		
		
		select a.perid as perid,a.pername as pername,
		c.uname as uname,d.gname as gname,e.department as department 
		from  permission a 
		left join permissionforuser b on b.perid = a.perid left join
		users c on b.uid = c.uid left join groups d on d.gid = c.gid
		left join  department e  on e.did = c.did
		
		select count(*) from users left join permissionforuser on users.uid = permissionforuser.uid
		left join permission on permission.perid = permissionforuser.perid 
		where permission.pername!=null
		
		select users.uid as
		uid,department.department as department,groups.gname as gname,users.uname as uname,
		permission.pername as pername,permission.perid as perid from users
		left join permissionforuser on permissionforuser.uid = users.uid left
		join permission on
		permissionforuser.perid = permission.perid 
		left join department on users.did = department.did
		left join groups on users.gid = groups.gid
		where permission.pername !=""
--权限表：编号、权限名、用户编号
create table permission(
	perid int primary key auto_increment,
	pername VARCHAR(50),
	temp1 VARCHAR(200),
	temp2 VARCHAR(200)
)
select * from permission
--职员权限表：
create table permissionforuser(
	perid int,
	uid int
)
drop table permissionforuser;
select * from permissionforuser
delete from permissionforuser p where uid = 6 on p.perid=c.perid


select p.perid as perid,pername,uid,uname  from permission p left join 
(select users.uid as uid,uname,perid  from users left join permissionforuser on users.uid=permissionforuser.uid where users.uid=3)  u
on p.perid=u.perid

		select
		doid,dotitle,docontent,dofromuid,dotouid,dotime,dofid,dostatus,docomment,a.uname
		as funame,b.uname as tuname,file.fname as fname,permissionforuser.perid
		from document left join
		users a on document.dofromuid = a.uid
		left join users b  on document.dotouid = b.uid left
		join file on document.dofid = file.fid
		left join permissionforuser on permissionforuser.uid = document.dotouid


select * from permission;
select * from users;
select * from department;
select * from groups;
delete from users where uid = 2;

insert into permission (pername) values('审批公文');
insert into permission (pername) values('公告管理');
insert into permission (pername) values('员工管理');
insert into permission (pername) values('总经理');



select * from permissionforuser
insert into permissionforuser(perid,uid) values(2,1);
insert into permissionforuser(perid,uid) values(1,3);

drop table permissionforuser;


drop table message
--消息表:编号、内容、通知权重、发布时间、发布人编号、发送给小组的编号、发送给用户的编号,是否查看
create table message(
	mid int primary key auto_increment,
	content VARCHAR(4000),
	mweight int,
	fid int,
	createtime  DATETIME,
	fromuid int,
	did int,
	gid int,
	uid int,
	temp1 VARCHAR(200),
	temp2 VARCHAR(200)
)

select mid,content,b.uname as fromuname,c.uname as touname,f.fname as fname,
		d.department as department,e.gname as gname,createtime,mweight from message a
		left join users b on a.fromuid = b.uid left join users c on a.uid = c.uid
		left join department d on a.did = d.did left join groups e on a.gid = e.gid
		left join file f on f.fid = a.fid

select * from message;

drop table message;

alter table notice 
  add constraint fk_notice_users
     foreign key(uid) references users(uid);
alter table notice drop foreign key fk_notice_users



--公文表：公文编号、标题、发送人id、接收人id、实行人id、公文时间、公文内容、附件、返回评语、

drop table file

--公文表：公文编号、标题、发送人id、接收人id、公文时间、公文内容、附件、返回评语、
--(审批状态 --0为未审批，1为审批通过,2为审批不合格,3为经理批准,4为经理不批准,5归档)
create table document(
	doid int primary key auto_increment,
	dotitle VARCHAR(100),
	docontent VARCHAR(10000),
	dofromuid int,
	dotouid int,
	douid int,
	dotime DATETIME,
	dofid int,
	dostatus VARCHAR(50),
	docomment VARCHAR(500),
	temp1 VARCHAR(200),
	temp2 VARCHAR(200)
)
drop table document;
select * from document;

		select
		doid,dotitle,docontent,dofromuid,dotouid,dotime,dofid,dostatus,docomment,a.uname
		as funame,b.uname as tuname,file.fname as fname,permissionforuser.perid as perid
		from document left join
		users a on document.dofromuid = a.uid
		left join users b  on document.dotouid = b.uid left
		join file on document.dofid = file.fid
		left join permissionforuser on permissionforuser.uid = document.dotouid	




--共享文件表：编号、文件名、文件描述、路径、上传用户的id、上传时间、下载次数、文件权重
create table file(
	fid int primary key auto_increment,
	fname  VARCHAR(50),
	description VARCHAR(200),
	path VARCHAR(1000),
	uid int,
	uptime DATETIME,
	downtimes int,
	fweight int,
	touid int,
	togid int,
	todid int,
	fstatus int,
	temp1 VARCHAR(200), 
	temp2 VARCHAR(200)
)
drop table file;
select * from file;

select * from file where (todid = 1 and ISNULL(togid) and ISNULL(touid)) or 
(todid = 1 and togid = 1 and ISNULL(touid)) or (todid = 1 and togid = 1 and touid = 1)



select a.fid as fid ,a.fname as fname,a.description as description,a.uptime as uptime,
	a.downtimes as downtimes,a.uid as uid,u.uname as uname from		
	(select  fid,fname,description,uptime,downtimes,file.uid as uid,uname from  file 
	inner join  users on    ( todid=did  and  ISNULL(togid) and ISNULL(touid))
	or (todid =did  and togid=gid and ISNULL(touid)) 
	or (todid = did and togid =gid  and touid=users.uid) where 
	users.uid=3) a left join users u on a.uid=u.uid
	
	
select a.fid as fid ,a.fname as fname,a.description as description,a.uptime as uptime,
	a.downtimes as downtimes,a.uid as uid,b.uname as uname from file a left join users b on 
a.uid = b.uid left join users c on (( a.todid=c.did  and  ISNULL(a.togid) and ISNULL(a.touid))
	or (a.todid =c.did  and a.togid=c.gid and ISNULL(a.touid)) 
	or (a.todid = c.did and a.togid =c.gid  and a.touid=c.uid)) where 
	a.touid = 3 and a.fstatus = 1 	
	
	
	
delete  from file where fid = 1;
update file set downtimes = downtimes+1 where fid = 1
drop table file;

alter table file 
  add constraint fk_file_users
     foreign key(uid) references users(uid);

     select a.fid as fid ,a.fname as fname,a.description as description,a.uptime as uptime,
		a.downtimes as downtimes,a.uid as uid,u.uname as uname from
     ((select  fid,fname,description,uptime,downtimes,file.uid as uid,uname,fstatus from  file 
		inner join  users on    ( todid=did  and  ISNULL(togid) and ISNULL(touid))
		or (todid =did  and togid=gid and ISNULL(touid)) 
		or (todid = did and togid =gid  and touid=users.uid) where 
		users.uid=1) a left join users u on a.uid=u.uid )
		where a.fstatus =1 
     	and a.fname like '%1%'
		
		
     update document set dostatus = 0,dotouid = 1 where doid = 1
     
     
     update document set
		dostatus = '审批通过',dotouid = (select distinct a.uid from
		(select uname,uid from users where did=(select did from users where uid = 1)
		) a
		left join permissionforuser on a.uid = permissionforuser.uid
		where permissionforuser.uid = (select uid from permissionforuser where
		perid = 2))
		,dotouid = 1 where doid = 1
     
     
     select * from users right join 
     (select uid from permissionforuser where perid =
     (select perid from permission where pername='审批公文')) a on users.uid = a.uid where did = 1;
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


select * from groups

-----
insert into power (powername,uid)
	values('管理员',1)
select * from department



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

		