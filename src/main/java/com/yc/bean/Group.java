package com.yc.bean;

import java.io.Serializable;

public class Group implements Serializable {

	private static final long serialVersionUID = 4334853560591069153L;

	private Integer gid;
	private String gname;
	private Integer pid;

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	@Override
	public String toString() {
		return "Group [gid=" + gid + ", gname=" + gname + ", pid=" + pid + "]";
	}

}
