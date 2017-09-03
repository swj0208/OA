package com.yc.bean;

import java.io.Serializable;
import java.util.List;

public class Achieve implements Serializable {

	private static final long serialVersionUID = -4053322773504548727L;

	private Integer aid;
	private String acontent;
	private Integer pid;
	private Integer uid;
	private String completetime;
	private String uname;
	private String remark;

	public Achieve(Integer aid, String acontent, Integer pid, Integer uid, String completetime, String uname,
			String remark) {
		super();
		this.aid = aid;
		this.acontent = acontent;
		this.pid = pid;
		this.uid = uid;
		this.completetime = completetime;
		this.uname = uname;
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Achieve [aid=" + aid + ", acontent=" + acontent + ", pid=" + pid + ", uid=" + uid + ", completetime="
				+ completetime + ", uname=" + uname + ", remark=" + remark + "]";
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getAcontent() {
		return acontent;
	}

	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getCompletetime() {
		return completetime;
	}

	public void setCompletetime(String completetime) {
		this.completetime = completetime;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Achieve() {
		super();
	}

}
