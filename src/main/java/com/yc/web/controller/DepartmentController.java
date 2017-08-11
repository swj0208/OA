package com.yc.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.Department;
import com.yc.biz.DepartmentBiz;
import com.yc.web.model.JsonModel;

@RestController
public class DepartmentController {
	@Resource(name="departmentBizImpl")
	private DepartmentBiz departmentBiz;
	
	@RequestMapping("/department_findAll.action")
	public JsonModel department_findAll( Department department, HttpSession session){
		JsonModel jm=(JsonModel) this.departmentBiz.findAllDepartment(department);
		session.setAttribute("department", jm);
		return jm;
	}
}
