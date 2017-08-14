package com.yc.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yc.bean.Department;
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
	
	@RequestMapping(value="/toShowPlan.action",method = RequestMethod.GET)
	public String toPlan(){
		return "plan/plandoing";
	}

	@RequestMapping(value="/toAddNotice.action",method = RequestMethod.GET)
	public String toAddMessage(Department department,HttpSession session){
		return "notice/addNotice";
	}
	
	@RequestMapping(value="/toManageNotice.action",method = RequestMethod.GET)
	public String toManageNotice(Department department,HttpSession session){
		return "notice/manageNotice";
	}
}
