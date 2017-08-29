package com.yc.biz;


import java.util.List;

import com.yc.bean.Fileupload;
import com.yc.bean.Users;

public interface UsersBiz {
	
	/**
	 * 登录
	 * @param users
	 * @return
	 */
	public Users login(Users users);
	
	//查询所有用户
	public List<Users> getAllUsers(Users users);
	
	//根据UID查询用户个人信息
	public List<Users> getUsersByUid(Integer uid);
	
	//查询用户的数量
	public int getAllUsersCount(Users users);
	

	//根据部门id,小组id查询用户
	List<Users> getUserBygidanddid(int did, int gid);

	//人员添加
	public boolean add(Users users);
	
	// 删除工作计划
	public boolean delUsers(int uid);
	
	//修改工作状态
	public boolean updateUsers(Users users);
	
	//用户修改个人信息
	public boolean updatePwd(Users users);
	

	
	
}
