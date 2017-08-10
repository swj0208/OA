package com.yc.biz;

import java.util.List;

import com.yc.bean.Groups;

public interface GroupsBiz {

	public List<Groups> getGroupByCondition(int did);
}
