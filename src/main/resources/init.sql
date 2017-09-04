--查找具体任务详情
select aid,acontent,pid,uname,completetime from achieve
	left join users on achieve.uid=users.uid where pid=1

--组名、成员名、具体内容
select content,uname,gname from plan left join (
		select gname,uname,groups.gid as gid from users left join groups on users.gid=groups.gid where groups.gid=1
	) as a
	on plan.gid=a.gid where pid=1 and a.gid=1
