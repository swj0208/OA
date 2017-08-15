package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.Plan;

public interface PlanBiz {

	// 查询所有的工作计划
	public List<Plan> findAllPlan(Plan plan);

	// 查询所有的工作计划的总数量
	public int findAllPlanCount(Plan plan);

	// 添加新的工作计划
	public boolean addPlan(Plan plan);

	// 删除工作计划
	public boolean delPlan(int pid);

	// 计划完成
	public boolean completePlan(int pid);

	// 修改计划
	public boolean updatePlan(Plan plan);
}
