package com.yc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexControllere {
	
	@RequestMapping(value="/index.action",method = RequestMethod.GET)
	public String index(){
		return "login";
	}
	
	@RequestMapping(value="/toMain.action",method = RequestMethod.GET)
	public String toMain(){
		return "main";
	}

	@RequestMapping(value="/toAddNotice.action",method = RequestMethod.GET)
	public String toAddMessage(){
		return "notice/AddNotice";
	}
}
