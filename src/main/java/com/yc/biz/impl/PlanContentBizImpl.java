package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.PlanContent;
import com.yc.biz.PlanContentBiz;
import com.yc.dao.BaseDao;
import com.yc.web.model.JsonModel;

@Service
@Transactional
public class PlanContentBizImpl implements PlanContentBiz {
	
	@Resource(name = "baseDao")
	private BaseDao baseDao;
	
	@Override
	public JsonModel<PlanContent> findPlanContent(PlanContent pc) {
		List<PlanContent> list= (List<PlanContent>) baseDao.findAll(pc, "findPlanContent");
		JsonModel<PlanContent> jm=new JsonModel<PlanContent>();
		jm.setRows(list);
		return jm;
	}

}
