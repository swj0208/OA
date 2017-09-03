package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Message;
import com.yc.biz.MessageBiz;
import com.yc.dao.BaseDao;

@Service
@Transactional
public class MessageBizImpl implements MessageBiz {

	@Resource(name = "baseDao")
	private BaseDao baseDao;
	
	@Override
	public boolean sendMessage(Message message) {
		baseDao.save(message, "SendMessage");
		if (message!=null) {
			return true;
		}else{
			return false;
		}
		
	}

	@Override
	public List<Message> findMessageByCondition(Message message) throws Exception{
		List<Message> list = baseDao.findAll(message, "FindMessageByCondition");
		return list;
	}

	@Override
	public int findMessageCount(Message message) throws Exception {
		int count = (int) baseDao.findOne(message, "MessageCount");
		return count;
	}

}
