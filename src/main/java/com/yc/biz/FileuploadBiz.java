package com.yc.biz;

import java.util.List;
import com.yc.bean.Fileupload;

public interface FileuploadBiz {

	/**
	 * 返回布尔值，用来判断是否添加成功，成功则JsonModel返回1
	 * @param fileupload
	 * @return
	 */
	public boolean addFile(Fileupload fileupload);
	
	/**
	 * 返回对象，因为发消息，公告时需要fid
	 * @param fileupload
	 * @return
	 */
	public Fileupload addFile2(Fileupload fileupload);
	
	public List<Fileupload> findFile(Fileupload	fileupload);
	
	//删除
	public boolean deleteFile(Fileupload fileupload);
	
	public int findFileCount(Fileupload	fileupload) throws Exception;
	
	public Fileupload findFilefordownload(Fileupload	fileupload);
	
	public void updateDownloadtimes(Fileupload fileupload);
	
	
}
