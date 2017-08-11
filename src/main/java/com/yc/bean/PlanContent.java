package com.yc.bean;

import java.io.Serializable;

public class PlanContent implements Serializable {

	private static final long serialVersionUID = -3347579206755594285L;

	private int pid;
	private String content;

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "PlanContent [pid=" + pid + ", content=" + content + "]";
	}

	public PlanContent(int pid, String content) {
		super();
		this.pid = pid;
		this.content = content;
	}

	public PlanContent() {
		super();
	}

}
