package com.yc.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.User;
import com.yc.biz.UserBiz;
import com.yc.web.model.JsonModel;


@RestController //类注解,同时使用@Controller 和@ResponseBody
public class UserController {
	@Resource(name="userBizImpl")
	private UserBiz userBiz;
	
	@RequestMapping("/user_login.action")
	public JsonModel login(User user,HttpServletRequest request, HttpSession session){
		JsonModel jsonModel=new JsonModel();
		String zccode=request.getParameter("zccode");
		String rand=session.getAttribute("rand").toString();
		if(!rand.equals(zccode)){
			jsonModel.setCode(0);
			jsonModel.setMsg("验证码错误");
		}else{
			try {
				user=userBiz.login(user);
				if(user!=null){
					session.setAttribute("user", user);
					jsonModel.setCode(1);
					user.setUpwd(null);//设置为空后,密码就不会传到界面
					jsonModel.setObj(user);
				}else{
					jsonModel.setCode(0);
					jsonModel.setMsg( "用户名或密码错误");
				}
			} catch (Exception e) {
				e.printStackTrace();
				jsonModel.setCode(0);
				jsonModel.setMsg(e.getMessage());
			}
		}
		return jsonModel;
	}

}
