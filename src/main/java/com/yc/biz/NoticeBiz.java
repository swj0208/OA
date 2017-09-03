package com.yc.biz;

import java.util.List;

import com.yc.bean.Notice;
import com.yc.web.model.JsonModel;

public interface NoticeBiz {

	public boolean AddNotice(Notice notice);

	public List<Notice> findAllNotice(Notice notice) throws Exception;
	
	public List<Notice> findAllNoticeByNtype(Notice notice) throws Exception;
	
	public int findAllNoticeByNtypeCount(Notice notice) throws Exception;

	public int findNoticeCount(Notice notice) throws Exception;

	public JsonModel getNotice(Notice notice) throws Exception;

	public List<Notice> findAll(Integer nid);
	
	
	
}
