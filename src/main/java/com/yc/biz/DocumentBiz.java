package com.yc.biz;

import java.util.List;
import com.yc.bean.Document;
import com.yc.bean.Users;

public interface DocumentBiz {

	/**
	 * 发消息
	 * @param message
	 * @return
	 */
	public boolean editorDocument(Document document);

	/**
	 * 按条件查找信息
	 * @param message
	 * @return
	 * @throws Exception
	 */
	public List<Object> findDocumentByCondition(Document document) throws Exception;

	/**
	 * 信息的数量
	 * @return
	 * @throws Exception
	 */
	public int findDocumentCount() throws Exception;
	
	/**
	 * 根据用户部门id查找部门主管
	 * @param users
	 * @return
	 */
	public List<Users> findLeaderBydid(Users users);
	
	/**公文审批通过
	 * 
	 */
	public boolean goodDocument(Document document);
	
	/**公文审批未通过
	 * 
	 */
	public boolean badDocument(Document document);
	
	
	/**经理审批通过
	 *  
	 */
	public boolean passDocument(Document document);
	
	
	/**公文归档
	 *  
	 */
	public boolean archiveDocument(Document document);
	
	
	/**
	 * 任务完成
	 */
	public boolean finishDocument(Document document);
	
	
	/**
	 * 查找已归档公文
	 */
	public List<Document> FindGDDocument(Document document);
	
	/**
	 * 已归档公文的数量
	 */
	public int findGDDocumentCount(Document document) throws Exception;
}
