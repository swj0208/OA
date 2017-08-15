package com.yc.biz.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jspsmart.upload.SmartUploadException;
import com.yc.bean.Fileupload;
import com.yc.biz.FileuploadBiz;
import com.yc.dao.BaseDao;

@Service
@Transactional
public class FileuploadBizImpl implements FileuploadBiz {

	@Resource(name = "baseDao")
	private BaseDao baseDao;

	@Override
	public boolean addFile(Fileupload fileupload) {
		baseDao.save(fileupload, "addFile");
		if(fileupload!=null){
			return true;
		}else{
			return false;
		}
	}
	

} 
