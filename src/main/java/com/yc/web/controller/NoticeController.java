package com.yc.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
	private JsonModel findAll(Notice notice, HttpServletRequest request) throws Exception {
		JsonModel jsonModel = new JsonModel();
		int pages = Integer.parseInt(request.getParameter("page").toString());
		int pagesize = Integer.parseInt(request.getParameter("rows").toString());
		int start = (pages-1)*pagesize;
		notice.setStart(start);
		notice.setPagesize(pagesize);
		List<Notice> list = noticeBiz.findAllNotice(notice);
		Integer count = noticeBiz.findNoticeCount();
		jsonModel.setRows(list);
		jsonModel.setTotal(count);
		return jsonModel;
	}
}
