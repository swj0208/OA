package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public List<Fileupload> findFile(Fileupload fileupload) {
		return baseDao.findAll(fileupload, "findFile");
	}

	@Override
	public int findFileCount() throws Exception {
		int count = (int) baseDao.findOne(Fileupload.class, "FileCount");
		return count;
	}

	@Override
	public Fileupload findFilefordownload(Fileupload fileupload) {
		return (Fileupload) baseDao.findOne(fileupload, "findFilefordownload");
	}

	@Override
	public List<Fileupload> sendMeFile(Fileupload fileupload) {
		return baseDao.findAll(fileupload, "sendMeFile");
	}

	@Override
	public int sendMeFileCount() {
		int count=(int) baseDao.findOne(Fileupload.class, "sendMeFileCount");
		return count;
	}
	

} 
