package com.yc.biz;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.SmartUploadException;
import com.yc.bean.Fileupload;

public interface FileuploadBiz {

	public boolean addFile(Fileupload fileupload);
}
