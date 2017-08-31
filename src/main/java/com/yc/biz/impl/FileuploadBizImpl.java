package com.yc.biz.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Fileupload;
import com.yc.biz.FileuploadBiz;
import com.yc.dao.BaseDao;
import com.yc.web.model.JsonModel;

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

	@Override//
	public List<Fileupload> findFile(Fileupload fileupload) {
		return baseDao.findAll(fileupload, "findFile");
	}

	@Override
	public int findFileCount(Fileupload	fileupload) throws Exception {
		int count = (int) baseDao.findOne(fileupload, "FileCount");
		return count;
	}

	@Override
	public Fileupload findFilefordownload(Fileupload fileupload) {
		return (Fileupload) baseDao.findOne(fileupload, "findFilefordownload");
	}
//
//	@Override
//	public List<Fileupload> sendMeFile(Fileupload fileupload) {
//		return baseDao.findAll(fileupload, "sendMeFile");
//	}
//
//	@Override
//	public int sendMeFileCount(Fileupload fileupload) {
//		int count=(int) baseDao.findOne(fileupload, "sendMeFileCount");
//		return count;
//	}

//	@Override
//	public JsonModel<Fileupload> searchHouse(Map<String, Object> map) {
//		List<Fileupload> list=baseDao.findAll(Fileupload.class, "sendMeFile",map);
//		int total=(int) baseDao.getFunc(Fileupload.class, "sendMeFileCount",map);
//
//		JsonModel<Fileupload> jsonModel=new JsonModel<Fileupload>();
//		jsonModel.setRows(list);
//		jsonModel.setTotal(total);
//		jsonModel.setPages(Integer.parseInt(map.get("pages").toString()));
//		jsonModel.setPageSize(Integer.parseInt(map.get("pagesize").toString()));
//		return jsonModel;
//	}
//	
	@Override
	public boolean deleteFile(Fileupload fileupload) {
		this.baseDao.del(fileupload, "deleteFile");
		return true; 
	}

	public void updateDownloadtimes(Fileupload fileupload) {
		baseDao.update(fileupload, "updatedownloadtimes");
	}

	@Override
	public Fileupload addFile2(Fileupload fileupload) {
		baseDao.save(fileupload, "addFile");
		return fileupload;
	}

	@Override
	public List<Fileupload> meSendOutFile(Fileupload fileupload) {
		return baseDao.findAll(fileupload, "findMeSendFile");
	}

	@Override
	public int meSendOutFileCount(Fileupload fileupload) {
		int count=(int) baseDao.findOne(fileupload, "findMeSendFileCount");
		return count;
	}

//	@Override
//	public JsonModel<Fileupload> searchMeSendFile(Map<String, Object> map) {
//		List<Fileupload> list=baseDao.findAll(Fileupload.class, "findMeSendFile",map);
//		int total=(int) baseDao.getFunc(Fileupload.class, "findMeSendFileCount",map);
//
//		JsonModel<Fileupload> jsonModel=new JsonModel<Fileupload>();
//		jsonModel.setRows(list);
//		jsonModel.setTotal(total);
//		jsonModel.setPages(Integer.parseInt(map.get("pages").toString()));
//		jsonModel.setPageSize(Integer.parseInt(map.get("pagesize").toString()));
//		return jsonModel;
//	}

	

} 
