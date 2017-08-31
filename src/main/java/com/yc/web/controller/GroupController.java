package com.yc.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.Groups;
import com.yc.biz.GroupsBiz;
import com.yc.web.model.JsonModel;

@RestController
public class GroupController {

	@Resource(name="groupsBizImpl")
	private GroupsBiz groupsBiz;
	
	@RequestMapping("/user/group_list.action")
	public JsonModel group_list(int did){
		List<Groups> list = this.groupsBiz.getGroupByCondition(did);
		JsonModel jm =new JsonModel();
		jm.setRows(list);     //jm.setObj(list);
		return jm;
	}
}
