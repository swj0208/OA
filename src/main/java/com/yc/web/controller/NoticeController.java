package com.yc.web.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.yc.bean.Notice;
import com.yc.biz.NoticeBiz;
import com.yc.web.model.JsonModel;

@RestController
public class NoticeController {

	@Resource(name="noticeBizImpl")
	private NoticeBiz noticeBiz;
	
	@RequestMapping("/user/noticeAdd.action")
	public JsonModel noticeAdd(Notice notice){
		JsonModel jsonModel = new JsonModel();
		boolean r = noticeBiz.AddNotice(notice);
		if (r) {
			jsonModel.setCode(1);
		} else {
			jsonModel.setCode(0);
		}
		return jsonModel;
	}
	
	@RequestMapping(value="/user/findAllNotice.action")
	private JsonModel findAll(Notice notice, HttpSession session) throws Exception {
		JsonModel jsonModel = new JsonModel();
		notice.setOrderby("nid");
		notice.setOrderway("desc");
		int start=(notice.getPages()-1)*notice.getPagesize();
		notice.setStart(start);
		JsonModel jm=this.noticeBiz.getNotice(notice);
		session.setAttribute("notice", jm);
		return jm;

	}
	
	
	
	@RequestMapping(value="/doNoticeDetail.action")
	public void toNoticeDetail(Integer nid,HttpServletResponse response,HttpSession session ,HttpServletRequest request) throws ServletException, IOException{
		JsonModel jm=new JsonModel();
		List<Notice> list=noticeBiz.findAll(nid);
		jm.setRows(list);
		jm.setCode(1);
		session.setAttribute("jm", jm);
		
		request.getRequestDispatcher("/WEB-INF/pages/notice/detail.jsp").forward(request, response);
	}
		
}
