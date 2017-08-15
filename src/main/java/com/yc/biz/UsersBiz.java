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
	
	
	public List<Users> getAllUsers(Users users);
	
	public int getAllUsersCount(Users users);
	

	
	List<Users> getUserBygidanddid(int did, int gid);

	public boolean add(Users users);
}
