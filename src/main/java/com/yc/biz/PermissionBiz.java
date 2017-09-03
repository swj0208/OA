package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.Permission;

public interface PermissionBiz {

	/**
	 * 查找所有的权限
	 */
	public List<Permission> findPermission();
	
	
	public boolean addPermission(Permission permission);
	
	
	public Permission findPermissionByuid(Permission permission);
	
	
	
}
