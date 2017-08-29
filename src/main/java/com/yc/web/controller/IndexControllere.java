package com.yc.web.controller;


import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yc.biz.DepartmentBiz;

@Controller
public class IndexControllere {
	
	@Resource(name="departmentBizImpl")
	private DepartmentBiz departmentBiz;
	
	@RequestMapping(value="/index.action",method = RequestMethod.GET)
	public String index(){
		return "login";
	}
	
	@RequestMapping(value="/toMain.action",method = RequestMethod.GET)
	public String toMain(){
		return "main";
	}
	
	@RequestMapping(value="/toAddUser.action",method = RequestMethod.GET)
	public String toAddUser(){
		return "user/addUser";
	}
	
	@RequestMapping(value="/toManUser.action",method = RequestMethod.GET)
	public String toManUser(){
		return "user/manUser";
	}
		
	@RequestMapping(value="/toShowPlan.action",method = RequestMethod.GET)
	public String toPlan(){
		return "plan/plandoing";
	}

	
	@RequestMapping(value="/toAddNotice.action",method = RequestMethod.GET)
	public String toAddMessage(){
		return "notice/addNotice";
	}
	
	@RequestMapping(value="/toManageNotice.action",method = RequestMethod.GET)
	public String toManageNotice(){
		return "notice/manageNotice";
	}
	
	
	@RequestMapping(value="/user/toUploadFile.action",method = RequestMethod.GET)
	public String totoUploadFile(){
		return "file/uploadFile";
	}
	
	@RequestMapping(value="/user/toShowFile.action",method = RequestMethod.GET)
	public String toShowFile(){
		return "file/showFile";
	}
	
	@RequestMapping(value="/user/toShowMeFile.action",method = RequestMethod.GET)
	public String toShowMeFile(){
		return "file/showMeFile";
	}
	
	@RequestMapping(value="/toMyselfMessage.action",method = RequestMethod.GET)
	public String toMyselfMessage(){
		return "myself/myselfMessage";
	}
	
}
