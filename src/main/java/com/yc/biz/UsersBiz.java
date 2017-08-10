package com.yc.biz;

import java.util.List;

import com.yc.bean.Users;

public interface UsersBiz {
	
	/**
	 * 登录
	 * @param users
	 * @return
	 */
	public Users login(Users users);
	
	public boolean add(Users users);
	
	public List<Users> getAllUsers(Users users);
	
	public int getAllUsersCount(Users users);
	
}
