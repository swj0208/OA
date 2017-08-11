package com.yc.web.controller;

import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.yc.bean.Users;
import com.yc.biz.JsonBiz;
import com.yc.biz.UsersBiz;
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


//	@RequestMapping("/user/manUser.action")
//	public void manUser(Users users,HttpServletResponse response) throws Exception {
//			List<Users> list=usersBiz.getAllUsers(users);
//			int count =usersBiz.getAllUsersCount(users);
//			//easyUI要求的格式
//			Map<String, Object> map=new HashMap<String,Object>();
//			map.put("total", count);
//			map.put("rows", list);
//			jsonBiz.outjson(map, response);
//			
//	
//	}
	
	@RequestMapping("/user/manUser.action")
	public String manUser(Users users,HttpServletRequest request) throws Exception {
			JsonModel jModel=new JsonModel();
			int pages=Integer.parseInt(request.getParameter("page").toString());
			int pageSize=Integer.parseInt(request.getParameter("rows").toString());
			int start=(pages-1)*pageSize;
			users.setStart(start);
			users.setPageSize(pageSize);
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


	
	@RequestMapping("/user/user_toAdd.action")
	public String userToAdd(HttpSession session){
		session.setAttribute("TOKEN", 1);
		return "user/addUser";
		
	}
	
	@RequestMapping("/user/user_doAdd.action")
	public String userDoAdd(Users users,HttpSession session,HttpServletRequest request){
		if(session.getAttribute("TOKEN")!=null){
			Users u=(Users) session.getAttribute("user");
			users.setUid(u.getUid());
			boolean result=usersBiz.add(users);
			session.setAttribute("TOKEN", null);
			session.removeAttribute("TOKEN");
		}
		//要利用重定向防止用户重复提交,但是重定向不能定向到.WEB-INF/下面
		return "user/manUser";
		
	}
	
	
}

