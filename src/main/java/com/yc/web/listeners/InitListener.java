package com.yc.web.listeners;


import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.yc.bean.Department;
import com.yc.biz.DepartmentBiz;


/**
 * 当servlet容器一启动就会加载这个类,
 *
 */
public class InitListener implements ServletContextListener {
	private ApplicationContext ac;

	public InitListener() {
	}

	public void contextInitialized(ServletContextEvent sce) {
		// 取application
		ServletContext application = sce.getServletContext();
		// 工具类: tomcat启动时-> ContextLoaderListener -> 读取 contextConfigLocation指定的
		// beans.xml -> 加载整个应用程序中的bean ioc, -> di -> context -> 存到application
		// 利用spring提代的 WebApplicationContextUtils类来获取 spring 容器
		ac = WebApplicationContextUtils.getWebApplicationContext(application);
		DepartmentBiz db = (DepartmentBiz) ac.getBean("departmentBizImpl");
		Department department = new Department();
		List<Department> dList = db.getDepartmentBydname(department);
		application.setAttribute("Department", dList);
		//TODO:   项目初始化操作
	}

	public void contextDestroyed(ServletContextEvent sce) {
	}

}
