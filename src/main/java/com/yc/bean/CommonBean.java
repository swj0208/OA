package com.yc.bean;

import java.io.Serializable;

public class CommonBean implements Serializable {

	private static final long serialVersionUID = -1220734587096028186L;

	private Integer pages = 1;
	private Integer pagesize = 5;
	private String orderby;// select * from xxx order by 列名 desc/asc
	private String orderway;
	private Integer start;

	public CommonBean() {
		super();
	}

	public CommonBean(Integer pages, Integer pagesize, String orderby, String orderway, Integer start) {
		super();
		this.pages = pages;
		this.pagesize = pagesize;
		this.orderby = orderby;
		this.orderway = orderway;
		this.start = start;
	}

	@Override
	public String toString() {
		return "CommonBean [pages=" + pages + ", pagesize=" + pagesize + ", orderby=" + orderby + ", orderway="
				+ orderway + ", start=" + start + "]";
	}

	public Integer getPages() {
		return pages;
	}

	public void setPages(Integer pages) {
		this.pages = pages;
	}

	public Integer getPagesize() {
		return pagesize;
	}

	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
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

}
