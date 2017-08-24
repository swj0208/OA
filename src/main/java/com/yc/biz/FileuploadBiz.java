package com.yc.biz;

import java.util.List;
import com.yc.bean.Fileupload;

public interface FileuploadBiz {

	public boolean addFile(Fileupload fileupload);
	
	public List<Fileupload> findFile(Fileupload	fileupload);
	
	
	public int findFileCount() throws Exception;
	
	public Fileupload findFilefordownload(Fileupload	fileupload);
	
	public List<Fileupload> sendMeFile(Fileupload	fileupload);
	
	public int sendMeFileCount();
}
