package com.yc.biz;

import java.util.List;

import com.yc.bean.Notice;

public interface NoticeBiz {

	public boolean AddNotice(Notice notice);

	public List<Notice> findAllNotice(Notice notice) throws Exception;

	public int findNoticeCount() throws Exception;
}
