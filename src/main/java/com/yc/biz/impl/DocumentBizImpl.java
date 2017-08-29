package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Document;
import com.yc.bean.Users;
import com.yc.biz.DocumentBiz;
import com.yc.dao.BaseDao;

@Service
@Transactional
public class DocumentBizImpl implements DocumentBiz {

	@Resource(name = "baseDao")
	private BaseDao baseDao;
	
	@Override
	public boolean editorDocument(Document document) {
		baseDao.save(document, "editorDocument");
		if (document!=null) {
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<Object> findDocumentByCondition(Document document) throws Exception {
		List<Object> list = baseDao.findAll(document, "FindDocumentByCondition");
		return list;
	}

	@Override
	public int findDocumentCount() throws Exception {
		int count = (int) baseDao.findOne(Document.class, "DocumentCount");
		return count;
	}

	@Override
	public List<Users> findLeaderBydid(Users users) {
		return baseDao.findAll(users, "findLeaderBydid");
	}

	@Override
	public boolean goodDocument(Document document) {
		baseDao.update(document, "goodDocument");
		return true;
	}

	@Override
	public boolean badDocument(Document document) {
		baseDao.update(document, "badDocument");
		return true;
	}

	@Override
	public boolean passDocument(Document document) {
		baseDao.update(document, "passDocument");
		return true;
	}

	@Override
	public boolean archiveDocument(Document document) {
		baseDao.update(document, "archiveDocument");
		return true;
	}


}
