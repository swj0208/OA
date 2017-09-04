package com.yc.biz;

import java.util.List;

import com.yc.bean.Message;

public interface MessageBiz {

	/**
	 * 发消息
	 * @param message
	 * @return
	 */
	public boolean sendMessage(Message message);

	/**
	 * 按条件查找信息
	 * @param message
	 * @return
	 * @throws Exception
	 */
	public List<Message> findMessageByCondition(Message message) throws Exception;

	/**
	 * 信息的数量
	 * @return
	 * @throws Exception
	 */
	public int findMessageCount(Message message) throws Exception;
	
	
	/**
	 * 根据mid查找信息详情
	 */
	public List<Message> findContentBymid(Message message);
}
