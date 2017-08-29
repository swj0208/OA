package com.yc.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.yc.bean.Fileupload;
import com.yc.bean.Message;
import com.yc.bean.Users;
import com.yc.biz.FileuploadBiz;
import com.yc.biz.MessageBiz;
import com.yc.utils.FileuploadReady;
import com.yc.web.model.JsonModel;

@RestController
public class MessageController {

	@Resource(name="messageBizImpl")
	private MessageBiz messageBiz;
	
	@Resource(name = "fileuploadBizImpl")
	private FileuploadBiz fileuploadBiz;
	
	
	/**
	 * 发消息
	 * @param message
	 * @param file
	 * @param request
	 * @param response
	 * @param session
	 * @throws IllegalStateException
	 * @throws IOException
	 * @throws ServletException
	 */
	@RequestMapping("/user/messageAdd.action")
	public void messageAdd(Message message,
			@RequestParam("file") CommonsMultipartFile file,
			HttpServletRequest request,HttpServletResponse response,
			HttpSession session) throws IllegalStateException, IOException, ServletException{
		JsonModel jsonModel = new JsonModel();
		if(!file.isEmpty()){
		//先上传文件
			Fileupload fileupload = new Fileupload();
			FileuploadReady fileuploadReady = new FileuploadReady();
			String fileName = "";
			Map<String, String> map = fileuploadReady.upload(fileName,file, request);
			String oldFilename = map.get("oldFilename");
			String destFilePathName = map.get("destFilePathName");
			
			fileupload.setPath(destFilePathName);
			fileupload.setFname(oldFilename);
			Users users = (Users) session.getAttribute("users");
			fileupload.setUid(users.getUid());
	
			File newFile = new File(destFilePathName);
			// 通过CommonsMultipartFile的方法直接写文件（注意这个时候）
			file.transferTo(newFile);
			fileupload = fileuploadBiz.addFile2(fileupload);
			message.setFid(fileupload.getFid());
		}
		boolean x = messageBiz.sendMessage(message);
		request.getRequestDispatcher("/WEB-INF/pages/message/sendMessage.jsp").forward(request, response);
	}
	
	@RequestMapping(value="/user/findMessage.action")
	private JsonModel findAll(Message message, HttpServletRequest request) throws Exception {
		JsonModel jsonModel = new JsonModel();
		int pages = Integer.parseInt(request.getParameter("page").toString());
		int pagesize = Integer.parseInt(request.getParameter("rows").toString());
		int start = (pages-1)*pagesize;
		message.setStart(start);
		message.setPagesize(pagesize);
		List<Message> list = messageBiz.findMessageByCondition(message);
		Integer count = messageBiz.findMessageCount();
		jsonModel.setRows(list);
		jsonModel.setTotal(count);
		return jsonModel;
	}
	
}
