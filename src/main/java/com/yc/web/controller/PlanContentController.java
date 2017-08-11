package com.yc.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.PlanContent;
import com.yc.biz.PlanContentBiz;
import com.yc.web.model.JsonModel;

@RestController
public class PlanContentController {
	
	@Resource(name="planContentBizImpl")
	private PlanContentBiz planContentBiz;
	
	@RequestMapping("/findPlanContent.action")
	public JsonModel findPlanContent(PlanContent pc, HttpSession session) throws Exception {
		JsonModel jm=this.planContentBiz.findPlanContent(pc);
		return jm;
	}
}
