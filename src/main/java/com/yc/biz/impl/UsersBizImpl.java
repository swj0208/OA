package com.yc.biz.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jspsmart.upload.SmartUploadException;
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
	 * @throws SmartUploadException 
	 * @throws SQLException 
	 * @throws IOException 
	 * @throws ServletException 
	 */
	@Override
	public boolean add(Users users) {
		users.setUpwd(Encrypt.md5AndSha(users.getUpwd()));
		baseDao.save(users, "saveUser");
		if(users!=null){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<Users> getAllUsers(Users users) {
		return this.baseDao.findAll(users, "findAllUsersCondition");
	}

	@Override
	public int getAllUsersCount(Users users) {
		return Integer.parseInt(this.baseDao.findOne(users,"findAllUsersConditionCount").toString());
	}
	
	
	

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<Users> getUserBygidanddid(int did ,int gid) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("did", did+"");
		map.put("gid", gid+"");
		return baseDao.findAll(Users.class, "getUserBygidanddid", map);
	}


	
	@Override
	public boolean delUsers(int uid) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("uid", uid);
		baseDao.del(Users.class, "delUsers", map);
		return true;
	}



	@Override
	public boolean updateUsers(Users users) {
		this.baseDao.update(users, "updateUsers");
		return true;
	}



	@Override
	public boolean updatePwd(Users users) {
		this .baseDao.update(users, "updatePwd");
		return true;
	}



	@Override
	public List<Users> getUsersByUid(Integer uid) {
		Users u=new Users();
		u.setUid(uid);
		List<Users> list=this.baseDao.findAll(u, "findUsersByUid");
		return list;
	}



	
	public List<Users> findPermissionforUser(Users users) {
		List<Users> list = baseDao.findAll(users, "findPermissionforuser");
		return list;
	}



	@Override
	public int findPermissionCount(Users users) {
		int count = (int) baseDao.findOne(users, "findPermissionCount");
		return count;
	}



	@Override
	public List<Users> findUserByDid(Users users) {
		return baseDao.findAll(users, "findUserByDid");
	}
}
