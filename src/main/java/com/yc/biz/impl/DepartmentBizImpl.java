package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Department;
import com.yc.biz.DepartmentBiz;
import com.yc.dao.BaseDao;


@Service
@Transactional
public class DepartmentBizImpl implements DepartmentBiz {

	@Resource(name = "baseDao")
	private BaseDao baseDao;
	
	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public List<Department> getDepartmentBydname(Department department) {
		return  baseDao.findAll(department, "getDepartmentBydname");
	}

	

}
