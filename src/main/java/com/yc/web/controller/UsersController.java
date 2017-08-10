package com.yc.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.yc.bean.Users;
import com.yc.biz.UsersBiz;
import com.yc.utils.RequestUtil;
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
		return jsonModel;

	}
	
	@RequestMapping("/users_add.action")
	public JsonModel addUser(Users user, HttpServletRequest request, HttpSession session) {
		JsonModel jm=new JsonModel();
		try {
			usersBiz.add(user);//添加时user中没有id,但是更新一定有
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}
		return jm;

	}

	protected void outjson(Object obj,HttpServletResponse resp) throws IOException{
		Gson gson=new Gson();
		String jsonstr=gson.toJson(obj);
		outjsonstr(jsonstr, resp);
	}



	public void outjsonstr(String jsonstr, HttpServletResponse resp) throws IOException {
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.println(jsonstr);
		out.flush();
		out.close();
		
	}
	@RequestMapping("user/manUser.action")
	public void manUser(Users user, HttpServletRequest request, HttpSession session,HttpServletResponse response) throws IOException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
			Users users=RequestUtil.getParemeter(request, Users.class);
			List<Users> list=usersBiz.getAllUsers(users);
			int count =usersBiz.getAllUsersCount(users);
			//easyUI要求的格式
			Map<String, Object> map=new HashMap<String,Object>();
			map.put("total", count);
			map.put("rows", list);
			outjson(map, response);
			
	
	}
}

