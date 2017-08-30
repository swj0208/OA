package com.yc.web.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.yc.bean.Permission;
import com.yc.biz.PermissionBiz;
import com.yc.web.model.JsonModel;

@RestController
public class PermissionController {

	@Resource(name="permissionBizImpl")
	private PermissionBiz permissionBiz;
	
	@RequestMapping(value="/user/addPermissionUser.action")
	private JsonModel addPermissionUser(Permission permission) throws Exception {
		JsonModel jsonModel = new JsonModel();
		Permission p = permissionBiz.findPermissionByuid(permission);
		if(p!=null){
			jsonModel.setCode(0);
			jsonModel.setMsg("此人已经拥有权限");
		}else{
			boolean r = permissionBiz.addPermission(permission);
			if(r){
				jsonModel.setCode(1);
			}else{
				jsonModel.setCode(0);
			}
		}
		return jsonModel;
	}
	
	
	
}
