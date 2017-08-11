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
import com.yc.web.model.JsonModel;

@Service
@Transactional
public class PlanBizImpl implements PlanBiz {

	@Resource(name = "baseDao")
	private BaseDao baseDao;

	@Override
	public JsonModel<Plan> findAllPlan(Plan plan) {
		List<Plan> list = baseDao.findAll(plan, "findAllPlan");
		Map<String, String> map=new HashMap<String,String>();
		map.put("gid", plan.getGid()+"");
		map.put("pstatus", plan.getPstatus());
		int total =  (int) baseDao.getFunc(Plan.class, "findAllPlanCount",map);

		JsonModel<Plan> jsonModel = new JsonModel<Plan>();
		jsonModel.setCode(1);
		jsonModel.setRows(list);
		jsonModel.setTotal(total);
		return jsonModel;
	}

}
