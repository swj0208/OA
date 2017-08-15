package com.yc.web.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
import com.yc.web.model.JsonModel;

@RestController
public class FileController {

	@Resource(name = "fileuploadBizImpl")
	private FileuploadBiz fileuploadBiz;

	@RequestMapping("/user/fileupload.action")
	public JsonModel fileUpload(Fileupload fileupload, HttpSession session,
			@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request) throws IOException {
		JsonModel jsonModel = new JsonModel();
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
		String fuuid = fileupload.getFuuid();
		String fileName = fuuid + filePrefixName + "." + ext;
		// xxx/xxx/webapps/file/2017/7/xxx.jpgyyyjpg
		weburl += fileName;
		// 物理路径: xxx/xxx/webapps/file/2017/7/20170720222222.png
		String destFilePathName = picpath + "/" + fileName;
		// 存
		fileupload.setPath(weburl);
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
	public List<Fileupload> showFile(Fileupload fileupload){
		
		return null;
	}

	@RequestMapping("/user/fileDownload.action")
	public ResponseEntity<byte[]> fileDownload(Fileupload fileupload) throws IOException {
		//待改：根据传过来的id查file
		File file = new File(fileupload.getPath());
		HttpHeaders headers = new HttpHeaders();
		String filename = new String(fileupload.getFname().getBytes("UTF-8"), "iso-8859-1");
		headers.setContentDispositionFormData("attachment", filename);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
	}

	private String genNewFilePrefixName() {
		// 生成新的文件名
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String filePrefixName = sdf.format(d); // 文件的前缀名
		return filePrefixName;
	}

}
