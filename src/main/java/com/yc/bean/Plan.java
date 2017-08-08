package com.yc.bean;

import java.io.Serializable;

public class Plan implements Serializable {

	private static final long serialVersionUID = 24222020371131691L;

	private Integer pid;
	private String pname;
	private String content;
	private String timestart;
	private String timelimit;
	private String timeend;
	private String pstatus;

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTimestart() {
		return timestart;
	}

	public void setTimestart(String timestart) {
		this.timestart = timestart;
	}

	public String getTimelimit() {
		return timelimit;
	}

	public void setTimelimit(String timelimit) {
		this.timelimit = timelimit;
	}

	public String getTimeend() {
		return timeend;
	}

	public void setTimeend(String timeend) {
		this.timeend = timeend;
	}

	public String getPstatus() {
		return pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}

	@Override
	public String toString() {
		return "plan [pid=" + pid + ", pname=" + pname + ", content=" + content + ", timestart=" + timestart
				+ ", timelimit=" + timelimit + ", timeend=" + timeend + ", pstatus=" + pstatus + "]";
	}

	public Plan(Integer pid, String pname, String content, String timestart, String timelimit, String timeend,
			String pstatus) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.content = content;
		this.timestart = timestart;
		this.timelimit = timelimit;
		this.timeend = timeend;
		this.pstatus = pstatus;
	}

	public Plan() {
		super();
	}

}