package com.yc.biz.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.User;
import com.yc.biz.UserBiz;
import com.yc.dao.BaseDao;
import com.yc.utils.Encrypt;
import com.yc.web.model.JsonModel;
@Service
@Transactional
public class UserBizImpl implements UserBiz {
	@Resource(name="baseDao")
	private BaseDao baseDao;
	
	@Override
	@Transactional(readOnly=true,propagation=Propagation.SUPPORTS)
	public User login(User user) {
		user.setUpwd(Encrypt.md5AndSha(user.getUpwd()));
		User vu=(User) this.baseDao.findOne(user, "userLogin");
		return vu;
	}

}
