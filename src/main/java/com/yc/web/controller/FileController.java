package com.yc.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.yc.bean.Fileupload;
import com.yc.bean.Users;
import com.yc.biz.FileuploadBiz;
import com.yc.utils.FileuploadReady;
import com.yc.web.model.JsonModel;

@RestController
public class FileController {

	@Resource(name = "fileuploadBizImpl")
	private FileuploadBiz fileuploadBiz;

	@RequestMapping("/user/fileupload.action")
	public JsonModel fileUpload(Fileupload fileupload, HttpSession session,
			@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request) throws IOException {
		FileuploadReady fileuploadReady = new FileuploadReady();
		JsonModel jsonModel = new JsonModel();
		String fileName = "";
		Map<String, String> map = fileuploadReady.upload(fileName, file, request);
		String oldFilename = map.get("oldFilename");
		String destFilePathName = map.get("destFilePathName");
		
		fileupload.setPath(destFilePathName);
		fileupload.setFname(oldFilename);
		Users users = (Users) session.getAttribute("users");
		fileupload.setUid(users.getUid());

		File newFile = new File(destFilePathName);
		// 通过CommonsMultipartFile的方法直接写文件（注意这个时候）
		file.transferTo(newFile);
		boolean r = fileuploadBiz.addFile(fileupload);
		if (r) {
			jsonModel.setCode(1);
		} else {
			jsonModel.setCode(0);
		}
		return jsonModel;
	}
	
	
	@RequestMapping("/user/showFile.action")
	public JsonModel showFile(Fileupload fileupload,HttpServletRequest request) throws Exception{
		JsonModel jsonModel = new JsonModel();
		int pages = Integer.parseInt(request.getParameter("page").toString());
		int pagesize = Integer.parseInt(request.getParameter("rows").toString());
		int start = (pages-1)*pagesize;
		fileupload.setStart(start);
		fileupload.setPagesize(pagesize);
		List<Fileupload> list = fileuploadBiz.findFile(fileupload);
		Integer count = fileuploadBiz.findFileCount();
		jsonModel.setRows(list);
		jsonModel.setTotal(count);
		return jsonModel;
	}

	@RequestMapping("/user/fileDownload.action")
	public ResponseEntity<byte[]> fileDownload(int fid) throws IOException {
		//待改：根据传过来的id查file
		Fileupload fileupload = new Fileupload();
		fileupload.setFid(fid);
		fileupload = (Fileupload) fileuploadBiz.findFilefordownload(fileupload);
		File file = new File(fileupload.getPath());
		HttpHeaders headers = new HttpHeaders();
		String filename = new String(fileupload.getFname().getBytes("UTF-8"), "iso-8859-1");
		headers.setContentDispositionFormData("attachment", filename);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
	}
	
	
}
