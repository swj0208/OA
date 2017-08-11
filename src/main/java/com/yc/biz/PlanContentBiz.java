package com.yc.biz;

import com.yc.bean.Plan;
import com.yc.bean.PlanContent;
import com.yc.web.model.JsonModel;

public interface PlanContentBiz {
	//查找计划的具体内容
	public JsonModel<PlanContent> findPlanContent(PlanContent pc);
}
