package com.yc.bean;

import java.io.Serializable;

public class Groups implements Serializable {

	private static final long serialVersionUID = 4334853560591069153L;

	private Integer gid;
	private String gname;
	private Integer did;

	
	
	public Integer getDid() {
		return did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

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

	@Override
	public String toString() {
		return "Groups [gid=" + gid + ", gname=" + gname + ", did=" + did + "]";
	}

}
