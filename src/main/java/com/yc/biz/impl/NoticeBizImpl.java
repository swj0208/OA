package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Notice;
import com.yc.biz.NoticeBiz;
import com.yc.dao.BaseDao;
import com.yc.web.model.JsonModel;

@Service
@Transactional
public class NoticeBizImpl implements NoticeBiz {

	@Resource(name = "baseDao")
	private BaseDao baseDao;
	
	@Override
	public boolean AddNotice(Notice notice) {
		baseDao.save(notice, "AddNotice");
		if (notice!=null) {
			return true;
		}else{
			return false;
		}
		
	}

	@Override
	public List<Notice> findAllNotice(Notice notice) throws Exception {
		List<Notice> list = baseDao.findAll(notice, "FindNoticeByCondition");
		return list;
	}

	@Override
	public int findNoticeCount(Notice notice) throws Exception {
		int count = (int) baseDao.findOne(Notice.class, "NoticeCount");
		return count;
	}
	
	@Override
	public JsonModel getNotice(Notice notice) throws Exception {
		JsonModel jm=new JsonModel();
		jm.setCode(1);
		//jm.setPages(notice.getPages());
		//jm.setPageSize(notice.getPagesize());
		List<Notice> list=findAllNotice(notice);
		//int count=findNoticeCount(notice);
		jm.setRows(list);
		//jm.setTotal(count);
		return jm;
		
	}
	
	@Override
	public List<Notice> findAll(Integer nid) {
		Notice no=new Notice();
		no.setNid(nid);
		List<Notice> list=baseDao.findAll(no, "findAll");
		return list;
	}

	@Override
	public List<Notice> findAllNoticeByNtype(Notice notice) throws Exception {
		List<Notice> list = baseDao.findAll(notice, "FindNoticeByNtype");
		return list;
	}

	@Override
	public int findAllNoticeByNtypeCount(Notice notice) throws Exception {
		int count = (int) baseDao.findOne(Notice.class, "FindNoticeByNtypeCount");
		return count;
	}

}
