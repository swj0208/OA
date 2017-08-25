package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.Fileupload;
import com.yc.web.model.JsonModel;

public interface FileuploadBiz {

	public boolean addFile(Fileupload fileupload);
	
	public List<Fileupload> findFile(Fileupload	fileupload);
	
	
	public int findFileCount() throws Exception;
	
	public Fileupload findFilefordownload(Fileupload	fileupload);
	
	public List<Fileupload> sendMeFile(Fileupload	fileupload);
	
	public int sendMeFileCount(Fileupload fileupload);
	
	public JsonModel<Fileupload> searchHouse(Map<String, Object> map);
}
