package com.yc.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.Achieve;
import com.yc.biz.AchieveBiz;
import com.yc.web.model.JsonModel;

@RestController
public class AchieveController {
	
	@Resource(name="achieveBizImpl")
	private AchieveBiz achieveBiz;
	
	@RequestMapping("/findAchieve.action")
	public JsonModel findAchieve(Integer pid){
		JsonModel jm=new JsonModel();
		List<Achieve> list=achieveBiz.findAchieve(pid);
		jm.setRows(list);
		return jm;
	}
	
	@RequestMapping("/completeAchieve.action")
	public JsonModel completeAchieve(Achieve achieve){
		JsonModel jm=new JsonModel();
		boolean flag=achieveBiz.completeAchieve(achieve);
		if(flag){
			jm.setCode(1);
		}else{
			jm.setCode(0);
		}
		return jm;
	}
	
	@RequestMapping("/addAchieveRemark.action")
	public JsonModel addAchieveRemark(Achieve achieve){
		JsonModel jm=new JsonModel();
		boolean flag=achieveBiz.addAchieveRemark(achieve);
		if(flag){
			jm.setCode(1);
		}else{
			jm.setCode(0);
		}
		return jm;
	}
	
	@RequestMapping("/addAchieve.action")
	public JsonModel addAchieve(@RequestBody List<Achieve> achieveList) {
		JsonModel jm = new JsonModel();
		boolean flag= achieveBiz.addAchieve(achieveList);
		if(flag){
			jm.setCode(1);
		}else {
			jm.setCode(0);
		}
		return jm;
	}
}
