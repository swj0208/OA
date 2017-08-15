package com.yc.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.Users;
import com.yc.biz.UsersBiz;
import com.yc.web.model.JsonModel;


@RestController
public class UsersController {

	@Resource(name="usersBizImpl")
	private UsersBiz usersBiz;
	
	@RequestMapping("/users_login.action")
	public JsonModel login(Users user, HttpServletRequest request, HttpSession session) {
		JsonModel jsonModel = new JsonModel();
		String zccode = request.getParameter("zccode");
		String rand = session.getAttribute("rand").toString();
		if (!rand.equals(zccode)) {
			jsonModel.setCode(0);
			jsonModel.setMsg("验证码错误");
		} else {
			try{
				user = usersBiz.login(user);
				if (user != null) {
					session.setAttribute("user", user);
					jsonModel.setCode(1);
					user.setUpwd(null);    //设为空后,密码就不会传到界面
					jsonModel.setObj(user);
				} else {
					jsonModel.setCode(0);
					jsonModel.setMsg("用户名或密码错误");
				}
			}catch(Exception e){
				e.printStackTrace();
				jsonModel.setCode(0);
				jsonModel.setMsg(e.getMessage());
			}
		}
		session.setAttribute("users", user);
		return jsonModel;
	}
	
	
	@RequestMapping("/user/uname_list.action")
	public JsonModel uname_list(HttpServletRequest request){
		int did = Integer.parseInt( request.getParameter("did") );
		int gid = Integer.parseInt( request.getParameter("gid") );
		List<Users> list = usersBiz.getUserBygidanddid(did,gid);
		JsonModel jm =new JsonModel();
		jm.setRows(list);     //jm.setObj(list);
		return jm;
	}
}
