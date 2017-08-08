package com.yc.utils;

import java.io.IOException;
import java.io.File;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.Files;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class FileUpload extends HttpServlet {
	
	private long singleSize=10*1024*1024;
	private String allowedFilesList="jpg,png,bmp,gif";
	private String deniedFilesList="bat,sh,exe,class,html,js,css";
	private long totalFileSize=4*singleSize;
	
	
	public Map<String , String>uploadFiles(PageContext pageContext,HttpServletRequest request) throws ServletException, IOException, SQLException, SmartUploadException{
		Map<String, String>map=new HashMap<String,String>();
		SmartUpload su=new SmartUpload();
		su.initialize(pageContext); //初始化
		su.setCharset("utf-8");
		
		//定义允许上传的文件类型
		su.setAllowedFilesList(allowedFilesList);
		//不允许
		su.setDeniedFilesList(deniedFilesList);
		//单个文件最大限制
		su.setMaxFileSize(singleSize);
		//所有上传文件的总容量限制
		su.setTotalMaxFileSize(totalFileSize);
		
		su.upload();
		
		//取参数 Request是smartupload的request-->HttpServletRequest
		Request re=su.getRequest();
		Enumeration<String> enu=re.getParameterNames();
		while(enu.hasMoreElements()){
			String pn=enu.nextElement();
			map.put(pn, re.getParameter(pn));
		}
		
		//取出上传的文件
		Files files=su.getFiles();
		int count=files.getCount();
		if(files!=null&&count>0){
			for(int i=0;i<count;i++){
				//去Tomcat路径
				Calendar c=Calendar.getInstance();
				String tomcatdir=request.getRealPath("/");
				File tomcatFile=new File( tomcatdir );//取news的父路径
				File webapppath=tomcatFile.getParentFile();
				
				File picpath=new File(webapppath,"pic"+File.separator+c.get(Calendar.YEAR)+File.separator
						+(c.get(Calendar.MONTH)+1)+File.separator);
				//访问路径名
				String weburl="../pic/"+c.get(Calendar.YEAR)+"/"+(c.get(Calendar.MONTH)+1)+"/";
				
				//判断目录是否存在,不存在则创建
				if(picpath.exists()==false){
					picpath.mkdirs();
				}
				//只取列表中的第一个文件,写全路径,防止系统以为是java.io.File lei
				com.jspsmart.upload.File file=files.getFile(i);
				
				String filePrefixName=genNewFilePrefixName();
				//取出原文件名
				String extName=file.getFileExt();
				//拼接新的文件名
				String fileName=filePrefixName+"."+extName;
				
				weburl+=fileName;
				//物理路径
				String destFilePathName=picpath+"/"+fileName;
				//存
				file.saveAs(destFilePathName,SmartUpload.SAVE_PHYSICAL);
				
				String fieldName=file.getFieldName();
				String oldFileName=file.getFileName();
				
				map.put(fieldName+"_weburl", weburl);
				map.put(fieldName+"_destFilePathName", destFilePathName);
				map.put(fieldName+"_oldFileName", oldFileName);
			}
		}
		return map;
	}

	private String genNewFilePrefixName() {
		//生成新的文件名
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("SSyyyyMMddHHmmss");
		String filePrefixName=sdf.format(date);
		return filePrefixName;
	}
	
	public long getSingleSize(){
		return singleSize;
	}

	public String getAllowedFilesList() {
		return allowedFilesList;
	}


	public void setAllowedFilesList(String allowedFilesList) {
		this.allowedFilesList = allowedFilesList;
	}


	public String getDeniedFilesList() {
		return deniedFilesList;
	}


	public void setDeniedFilesList(String deniedFilesList) {
		this.deniedFilesList = deniedFilesList;
	}


	public long getTotalFileSize() {
		return totalFileSize;
	}

	public void setTotalFileSize(long totalFileSize) {
		this.totalFileSize = totalFileSize;
	}

	public void setSingleSize(long singleSize) {
		this.singleSize = singleSize;
	}

	
	
}
