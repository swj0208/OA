package com.yc.biz;

import java.util.List;
import com.yc.bean.Fileupload;

public interface FileuploadBiz {

	public boolean addFile(Fileupload fileupload);
	
	public List<Fileupload> findFile(Fileupload	fileupload);
	
	//删除
	public boolean deleteFile(Fileupload fileupload);
	
	public int findFileCount(Fileupload	fileupload) throws Exception;
	
	public Fileupload findFilefordownload(Fileupload	fileupload);
}
