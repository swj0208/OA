package com.yc.utils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FileuploadReady {

	public Map<String, String> upload(String fileName,CommonsMultipartFile file,HttpServletRequest request){
		String oldFilename = file.getOriginalFilename(); // 上传时的名字
		Calendar c = Calendar.getInstance();// 获取tomcat
		String tomcatdir = request.getRealPath("/"); // xxx/xxx/webapps/oa
		File tomcatFile = new File(tomcatdir);
		File webapppath = tomcatFile.getParentFile(); // xxx/xxx/webapps
		// xxx/xxx/webapps/file/2017/8
		File picpath = new File(webapppath, "file" + File.separator + c.get(Calendar.YEAR) + File.separator
				+ (c.get(Calendar.MONTH) + 1) + File.separator);
		// 访问路径名
		String weburl = "../file/" + c.get(Calendar.YEAR) + "/" + (c.get(Calendar.MONTH) + 1) + "/";
		// 判断目录是否存在，不在则创建
		if (picpath.exists() == false) {
			picpath.mkdirs();
		}
		String filePrefixName = genNewFilePrefixName();// 由时间得到的新名字
		// 取出原文件的后缀名
		String ext = oldFilename.substring(oldFilename.lastIndexOf(".") + 1).toUpperCase();
		// 拼接新的文件名
		String uuid = UUID.randomUUID().toString();
		fileName = uuid+filePrefixName + "." + ext;  //
		// xxx/xxx/webapps/file/2017/7/xxx.jpgyyyjpg
		weburl += fileName;
		// 物理路径: xxx/xxx/webapps/file/2017/7/20170720222222.png
		String destFilePathName = picpath + "/" + fileName;
		// 存
		Map<String, String> map = new HashMap<String, String>();
		map.put("oldFilename", oldFilename);//原来的文件名
		map.put("destFilePathName", destFilePathName);//物理路径
		map.put("weburl", weburl);//存数据库那个路径
		return map;
	}
	
	private String genNewFilePrefixName() {
		// 生成新的文件名
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String filePrefixName = sdf.format(d); // 文件的前缀名
		return filePrefixName;
	}
}
