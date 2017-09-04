package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.Achieve;

public interface AchieveBiz {
	//查找计划的具体执行
	public List<Achieve> findAchieve(int pid);
	
	//完成任务步骤
	public boolean completeAchieve(Achieve achieve);
	
	//添加备注
	public boolean addAchieveRemark(Achieve achieve);
	
	//新增步骤
	public boolean addAchieve(List<Achieve> list);
	
}
