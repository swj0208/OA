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

import com.yc.bean.Document;
import com.yc.bean.Fileupload;
import com.yc.bean.Users;
import com.yc.biz.DocumentBiz;
import com.yc.biz.FileuploadBiz;
import com.yc.utils.FileuploadReady;
import com.yc.web.model.JsonModel;

@RestController
public class DocumentController {

	@Resource(name="documentBizImpl")
	private DocumentBiz documentBiz;
	
	@Resource(name = "fileuploadBizImpl")
	private FileuploadBiz fileuploadBiz;
	
	@RequestMapping("/user/editorDocument.action")
	public void messageAdd(Document document,
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
			document.setDofid(fileupload.getFid());
		}
		Users users = (Users) session.getAttribute("users");
		document.setDofromuid(users.getUid());
		boolean x = documentBiz.editorDocument(document);
		request.getRequestDispatcher("/WEB-INF/pages/document/editorDocument.jsp").forward(request, response);
	}
	
	@RequestMapping(value="/user/findDocument.action")
	private JsonModel findAll(Document document, HttpServletRequest request) throws Exception {
		JsonModel jsonModel = new JsonModel();
		int pages = Integer.parseInt(request.getParameter("page").toString());
		int pagesize = Integer.parseInt(request.getParameter("rows").toString());
		int start = (pages-1)*pagesize;
		document.setStart(start);
		document.setPagesize(pagesize);
		List<Object> list = documentBiz.findDocumentByCondition(document);
		Integer count = documentBiz.findDocumentCount();
		jsonModel.setRows(list);
		jsonModel.setTotal(count);
		return jsonModel;
	}
	
	@RequestMapping(value="/user/goodDocument.action")
	private JsonModel goodDocument(Document document, HttpServletRequest request,HttpServletResponse response) throws Exception {
		JsonModel jsonModel = new JsonModel();
		boolean r = documentBiz.goodDocument(document);
		if(r){
			jsonModel.setCode(1);
		}else{
			jsonModel.setCode(0);
		}
		return jsonModel;
	}
	
	@RequestMapping(value="/user/badDocument.action")
	private JsonModel badDocument(Document document) throws Exception {
		JsonModel jsonModel = new JsonModel();
		boolean r = documentBiz.badDocument(document);
		if(r){
			jsonModel.setCode(1);
		}else{
			jsonModel.setCode(0);
		}
		return jsonModel;
	}
	
	@RequestMapping(value="/user/passDocument.action")
	private JsonModel passDocument(Document document, HttpServletRequest request,HttpServletResponse response) throws Exception {
		JsonModel jsonModel = new JsonModel();
		boolean r = documentBiz.passDocument(document);
		if(r){
			jsonModel.setCode(1);
		}else{
			jsonModel.setCode(0);
		}
		return jsonModel;
	}
	
	@RequestMapping(value="/user/archiveDocument.action")
	private JsonModel archiveDocument(Document document, HttpServletRequest request,HttpServletResponse response) throws Exception {
		JsonModel jsonModel = new JsonModel();
		boolean r = documentBiz.archiveDocument(document);
		if(r){
			jsonModel.setCode(1);
		}else{
			jsonModel.setCode(0);
		}
		return jsonModel;
	}
	
	@RequestMapping(value="/user/finishDocument.action")
	private JsonModel finishDocument(Document document) throws Exception {
		JsonModel jsonModel = new JsonModel();
		boolean r = documentBiz.finishDocument(document);
		if(r){
			jsonModel.setCode(1);
		}else{
			jsonModel.setCode(0);
		}
		return jsonModel;
	}
	
	
	//已归档的公文
	@RequestMapping(value="/user/findGDDocument.action")
	private JsonModel findGDDocument(Document document, HttpServletRequest request) throws Exception {
		JsonModel jsonModel = new JsonModel();
		int pages = Integer.parseInt(request.getParameter("page").toString());
		int pagesize = Integer.parseInt(request.getParameter("rows").toString());
		int start = (pages-1)*pagesize;
		document.setStart(start);
		document.setPagesize(pagesize);
		List<Document> list = documentBiz.FindGDDocument(document);
		Integer count = documentBiz.findGDDocumentCount(document);
		jsonModel.setRows(list);
		jsonModel.setTotal(count);
		return jsonModel;
	}
	
	
}
