package com.yc.biz;

import com.yc.bean.Plan;
import com.yc.web.model.JsonModel;

public interface PlanBiz {

	// 查询所有的工作计划
	public JsonModel<Plan> findAllPlan(Plan plan);
	
}
