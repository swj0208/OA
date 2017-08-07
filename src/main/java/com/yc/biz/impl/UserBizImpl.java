package com.yc.biz.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.User;
import com.yc.biz.UserBiz;
import com.yc.dao.BaseDao;
@Service
public class UserBizImpl implements UserBiz {
	@Resource(name="baseDao")
	private BaseDao baseDao;
	
	@Override
	public User login(User user) {
		return null;
	}

}
