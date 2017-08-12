package com.yc.web.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.List;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.jspsmart.upload.SmartUploadException;
import com.yc.bean.Users;
import com.yc.biz.JsonBiz;
import com.yc.biz.UsersBiz;
import com.yc.utils.FileUpload;
import com.yc.web.model.JsonModel;


@RestController
public class UsersController {

	@Resource(name="usersBizImpl")
	private UsersBiz usersBiz;
	
	@Resource(name="jsonBizImpl")
	private JsonBiz jsonBiz;
	
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
					user.setUpwd(null);   // 设为空后,密码就不会传到界面
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
		return jsonModel;

	}
	
	@RequestMapping("/user/users_add.action")
	public JsonModel addUser(Users user) {
		JsonModel jm=new JsonModel();
		boolean result=usersBiz.add(user);
		if(result){
			jm.setCode(1);
		} else{
			jm.setCode(0);
		}
		return jm;
		
		

	}
	
	@RequestMapping(value="/user/manUser.action")
	public String manUser(Users users,HttpServletRequest request) throws Exception {
			JsonModel jModel=new JsonModel();
			int pages=Integer.parseInt(request.getParameter("page").toString());
			int pagesize=Integer.parseInt(request.getParameter("rows").toString());
			int start=(pages-1)*pagesize;
			users.setStart(start);
			users.setPagesize(pagesize);
			List<Users> list=usersBiz.getAllUsers(users);
			Integer count =usersBiz.getAllUsersCount(users);
			jModel.setRows(list);
			jModel.setTotal(count);
			Gson gson=new Gson();
			Type jsonType=new TypeToken<JsonModel>(){}.getType();
			String strjson=gson.toJson(jModel,jsonType);
			return strjson;
			//easyUI要求的格式
			
	
	}


	
//	@RequestMapping("/user/user_toAdd.action")
//	public String userToAdd(HttpSession session){
//		session.setAttribute("TOKEN", 1);
//		return "user/addUser";
//		
//	}
//	
//	@RequestMapping("/user/user_doAdd.action")
//	public String userDoAdd(Users users,HttpSession session,HttpServletRequest request){
//		if(session.getAttribute("TOKEN")!=null){
//			Users u=(Users) session.getAttribute("user");
//			users.setUid(u.getUid());
//			boolean result=usersBiz.add(users);
//			session.setAttribute("TOKEN", null);
//			session.removeAttribute("TOKEN");
//		}
//		//要利用重定向防止用户重复提交,但是重定向不能定向到.WEB-INF/下面
//		return "user/manUser";
//		
//	}
//	
	
	
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

