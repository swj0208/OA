package com.yc.biz.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUploadException;
import com.yc.bean.Fileupload;
import com.yc.bean.Plan;
import com.yc.bean.Users;
import com.yc.biz.UsersBiz;
import com.yc.dao.BaseDao;
import com.yc.utils.Encrypt;
import com.yc.utils.FileUpload;

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



	
}
