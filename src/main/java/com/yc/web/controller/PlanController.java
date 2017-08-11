package com.yc.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.Plan;
import com.yc.biz.PlanBiz;
import com.yc.web.model.JsonModel;

@RestController
public class PlanController {
	@Resource(name="planBizImpl")
	private PlanBiz planBiz;
	
	@RequestMapping("/findAllPlan.action")
	public JsonModel findAllPlan(Plan plan, HttpSession session) throws Exception {
		plan.setOrderby("pid");
		plan.setOrderway("desc");
		int start = (plan.getPages() - 1) * plan.getPagesize();
		plan.setStart(start);
		Map< String, String> map=new  HashMap<String, String>();
//		map.put("gid", "1");
//		map.put("Orderby", "pid");
//		map.put("Orderway", "desc");
//		map.put("pstatus", "进行中");
//		map.put("start", 1+"");
//		map.put("pagesize", 5+"");
		JsonModel jm = this.planBiz.findAllPlan(plan);
		session.setAttribute("plan", jm);
		return jm;
	}
	
}
