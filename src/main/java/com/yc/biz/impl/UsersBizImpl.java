package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Users;
import com.yc.biz.UsersBiz;
import com.yc.dao.BaseDao;
import com.yc.utils.Encrypt;

@Service
@Transactional
public class UsersBizImpl implements UsersBiz {

	@Resource(name = "baseDao")
	private BaseDao baseDao;
	
	/**
	 * 登录操作
	 * (non-Javadoc)
	 * @see com.yc.biz.UsersBiz#login(com.yc.bean.Users)
	 */
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public Users login(Users users) {
		users.setUpwd(Encrypt.md5AndSha(users.getUpwd()));
		Users u =  (Users) this.baseDao.findOne(users, "getUserByLogin");
		return u;
	}

	/**
	 * 添加用户
	 */
	@Override
	public boolean add(Users users) {
		baseDao.save(users, "saveUser");
		return true;
	}

	@Override
	public List<Users> getAllUsers(Users users) {
		return this.baseDao.findAll(users, "findAllUsersCondition");
	}

	@Override
	public int getAllUsersCount(Users users) {
		return Integer.parseInt(this.baseDao.findOne(users,"findAllUsersConditionCount").toString());
	}


}
