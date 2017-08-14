package com.yc.web.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.Plan;
import com.yc.biz.PlanBiz;
import com.yc.utils.DatetimeFormat;
import com.yc.web.model.JsonModel;

@RestController
public class PlanController {
	@Resource(name = "planBizImpl")
	private PlanBiz planBiz;

	// 查找到所有的计划
	@RequestMapping("/findAllPlan.action")
	public JsonModel findAllPlan(Plan plan, HttpServletRequest request) throws Exception {
		JsonModel jm = new JsonModel();
		int pages = Integer.parseInt(request.getParameter("page").toString());
		int pagesize = Integer.parseInt(request.getParameter("rows").toString());
		int start = (pages - 1) * pagesize;
		String orderby = request.getParameter("sort").toString();
		String orderway = request.getParameter("order").toString();
		plan.setStart(start);
		plan.setPagesize(pagesize);
		plan.setOrderby(orderby);
		plan.setOrderway(orderway);
		List<Plan> list = this.planBiz.findAllPlan(plan);
		Integer count = this.planBiz.findAllPlanCount(plan);
		jm.setRows(list);
		jm.setTotal(count);
		return jm;
	}

	// 添加计划
	@RequestMapping("/addPlan.action")
	public JsonModel addPlan(Plan plan) {
		JsonModel jm = new JsonModel();
		// 时间格式设置
		String time = plan.getTimelimit();
		DatetimeFormat df = new DatetimeFormat();
		time = df.datetimeformat(time);
		plan.setTimelimit(time);

		// 截止时间不能小于当前时间
		Date d = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datenow = dateFormat.format(d);
		if (time.compareTo(datenow) < 0) {
			jm.setCode(0);
			jm.setMsg("截止时间不能小于当前时间！");
			return jm;
		}

		if (plan.getPname() != null &&!plan.getPname().equals("")&&
				plan.getContent() != null &&!plan.getContent().equals("")&& 
				plan.getTimelimit() != null&&!plan.getTimelimit().equals("")&&
				plan.getGid() != null&&!plan.getGid().equals("")) {
			boolean flag = this.planBiz.addPlan(plan);
			if (flag) {
				jm.setCode(1);
			} else {
				jm.setCode(0);
			}
		} else {
			jm.setCode(0);
			jm.setMsg("数据不能为空！");
		}
		return jm;
	}

	// 删除计划
	@RequestMapping("/delPlan.action")
	public JsonModel delPlan(Integer pid) throws Exception {
		boolean flag = this.planBiz.delPlan(pid);
		JsonModel jm = new JsonModel();
		if (flag) {
			jm.setCode(1);
		} else {
			jm.setCode(0);
		}
		return jm;
	}

	// 完成计划
	@RequestMapping("/completePlan.action")
	public JsonModel completePlan(Integer pid) throws Exception {
		boolean flag = this.planBiz.completePlan(pid);
		JsonModel jm = new JsonModel();
		if (flag) {
			jm.setCode(1);
		} else {
			jm.setCode(0);
		}
		return jm;
	}

	// 修改计划
	@RequestMapping("/updatePlan.action")
	public JsonModel updatePlan(Plan plan) throws Exception {
		JsonModel jm = new JsonModel();
		// 时间格式设置
		String time = plan.getTimelimit();
		DatetimeFormat df = new DatetimeFormat();
		time = df.datetimeformat(time);
		plan.setTimelimit(time);

		String timestart = plan.getTimestart();
		// 截止时间不能小于开始时间
		if (time.compareTo(timestart) < 0) {
			jm.setCode(0);
			jm.setMsg("截止时间不能小于开始时间！");
			return jm;
		}
		
		if (plan.getPname() != null &&!plan.getPname().equals("")&&
				plan.getContent() != null &&!plan.getContent().equals("")&& 
				plan.getTimelimit() != null&&!plan.getTimelimit().equals("")&&
				plan.getGid() != null&&!plan.getGid().equals("")) {
			if (this.planBiz.updatePlan(plan)) {
				jm.setCode(1);
			} else {
				jm.setCode(0);
			}
		} else {
			jm.setCode(0);
			jm.setMsg("数据不能为空！");
		}
		return jm;
	}

}
