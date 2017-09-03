package com.yc.biz.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.yc.bean.Permission;
import com.yc.biz.PermissionBiz;
import com.yc.dao.BaseDao;

@Service
@Transactional
public class PermissionBizImpl implements PermissionBiz {

	@Resource(name = "baseDao")
	private BaseDao baseDao;
	
	@Override
	public List<Permission> findPermission() {
		List<Permission> list = baseDao.findAll(Permission.class, "findPermission");
		return list;
	}

	

	@Override
	public boolean addPermission(Permission permission) {
		baseDao.save(permission, "addPermission");
		if(permission!=null){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Permission findPermissionByuid(Permission permission) {
		permission = (Permission) baseDao.findOne(permission, "findPermissionByuid");
		return permission;
	}

}
