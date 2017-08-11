package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Groups;
import com.yc.biz.GroupsBiz;
import com.yc.dao.BaseDao;

@Service
@Transactional
public class GroupsBizImpl implements GroupsBiz {
	
	@Resource(name = "baseDao")
	private BaseDao baseDao;
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<Groups> getGroupByCondition(int did) {
		Groups groups = new Groups();
		groups.setDid(did);
		List<Groups> list = baseDao.findAll(groups, "getGroupsByCondition");
		return list;
	}

}
