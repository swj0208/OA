package com.yc.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Achieve;
import com.yc.biz.AchieveBiz;
import com.yc.dao.BaseDao;

@Service
@Transactional
public class AchieveBizImpl implements AchieveBiz {

	@Resource(name = "baseDao")
	private BaseDao baseDao;
	
	@Override
	public List<Achieve> findAchieve(int pid) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pid", pid);
		List<Achieve> list=this.baseDao.findAll(Achieve.class, "findAchieve", map);
		return list;
	}

	@Override
	public boolean completeAchieve(Achieve achieve) {
		this.baseDao.update(achieve, "completeAchieve");
		return true;
	}

	@Override
	public boolean addAchieveRemark(Achieve achieve) {
		this.baseDao.update(achieve, "addAchieveRemark");
		return true;
	}

	@Override
	public boolean addAchieve(List<Achieve> list) {
		this.baseDao.save(Achieve.class, "addAchieve", list);
		return true;
	}

}
