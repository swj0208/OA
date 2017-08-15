package com.yc.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Plan;
import com.yc.biz.PlanBiz;
import com.yc.dao.BaseDao;

@Service
@Transactional
public class PlanBizImpl implements PlanBiz {

	@Resource(name = "baseDao")
	private BaseDao baseDao;

	@Override
	public List<Plan> findAllPlan(Plan plan) {
		List<Plan> list = this.baseDao.findAll(plan, "findAllPlan");
		return list;
	}

	@Override
	public int findAllPlanCount(Plan plan) {
		int count = (int) this.baseDao.findOne(plan, "findAllPlanCount");
		return count;
	}

	@Override
	public boolean addPlan(Plan plan) {
		baseDao.save(plan, "addPlan");
		return true;
	}

	@Override
	public boolean delPlan(int pid) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pid", pid);
		baseDao.del(Plan.class, "delPlan", map);
		return true;
	}

	@Override
	public boolean completePlan(int pid) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pid", pid);
		this.baseDao.update(Plan.class, "completePlan", map);
		return true;
	}

	@Override
	public boolean updatePlan(Plan plan) {
		this.baseDao.update(plan, "updatePlan");
		return true;
	}

}
