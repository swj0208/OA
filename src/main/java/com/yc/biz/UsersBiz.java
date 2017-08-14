package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.Users;

public interface UsersBiz {
	
	/**
	 * 登录
	 * @param users
	 * @return
	 */
	public Users login(Users users);
	
	
	List<Users> getUserBygidanddid(int did, int gid);
}
