package com.yc.web.controller;


import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yc.bean.Users;
import com.yc.biz.DocumentBiz;
import com.yc.web.model.JsonModel;

@Controller
public class IndexControllere {
	
	@Resource(name="documentBizImpl")
	private DocumentBiz documentBiz;
	
	
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

	
	@RequestMapping(value="/user/toAddMessage.action",method = RequestMethod.GET)
	public String toAddMessage(){
		return "message/sendMessage";
	}
	
	@RequestMapping(value="/user/toManageMessage.action",method = RequestMethod.GET)
	public String toManageNotice(){
		return "message/manageMessage";
	}
	
	
	@RequestMapping(value="/user/toUploadFile.action",method = RequestMethod.GET)
	public String totoUploadFile(){
		return "file/uploadFile";
	}
	
	@RequestMapping(value="/user/toShowFile.action",method = RequestMethod.GET)
	public String toShowFile(){
		return "file/showFile";
	}
	
	@RequestMapping(value="/user/toWebsocket.action",method = RequestMethod.GET)
	public String toWebsocket(){
		return "websocket/websocket";
	}
	
	@RequestMapping(value="/user/toEditorDocument.action",method = RequestMethod.GET)
	public void toEditorDocument(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		Users users = (Users) session.getAttribute("users");
		List<Users> list = documentBiz.findLeaderBydid(users);
		session.setAttribute("leader", list);
		request.getRequestDispatcher("/WEB-INF/pages/document/editorDocument.jsp").forward(request, response);;
	}
	
	@RequestMapping(value="/user/toManageDocument.action",method = RequestMethod.GET)
	public String toManageDocument(){
		return "document/manageDocument";
	}
	
	
}
