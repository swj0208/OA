package com.yc.bean;

import java.io.Serializable;

public class CommonBean implements Serializable {

	private static final long serialVersionUID = -1220734587096028186L;
	
	private Integer pages=1;
	private Integer pageSize=5;
	private String orderby;
	private String orderway;
	
	private Integer start;

	public Integer getPages() {
		return pages;
	}

	public void setPages(Integer pages) {
		this.pages = pages;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	public String getOrderway() {
		return orderway;
	}

	public void setOrderway(String orderway) {
		this.orderway = orderway;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	@Override
	public String toString() {
		return "CommonBean [pages=" + pages + ", pageSize=" + pageSize + ", orderby=" + orderby + ", orderway="
				+ orderway + ", start=" + start + "]";
	}
	
	
}
