package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Notice;
import com.yc.biz.NoticeBiz;
import com.yc.dao.BaseDao;

@Service
@Transactional
public class NoticeBizImpl implements NoticeBiz {

	@Resource(name = "baseDao")
	private BaseDao baseDao;
	
	@Override
	public boolean AddNotice(Notice notice) {
		baseDao.save(notice, "AddNotice");
		return true;
	}

	@Override
	public List<Notice> findAllNotice(Notice notice) throws Exception {
		List<Notice> list = baseDao.findAll(notice, "FindNoticeByCondition");
		return list;
	}

	@Override
	public int findNoticeCount() throws Exception {
		int count = (int) baseDao.findOne(Notice.class, "NoticeCount");
		return count;
	}

}
