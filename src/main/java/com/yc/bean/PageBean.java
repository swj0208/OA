package com.yc.bean;

import java.io.Serializable;
import java.util.List;
/**
 * 分页bean
 * @author lenovi
 *
 * @param <T>
 */
public class PageBean<T> implements Serializable {

	private static final long serialVersionUID = 7313229623726375795L;

	private Integer total; // *总记录数
	private Integer pages; // *当前为第几页
	private Integer pageSize; // *每页XX条
	private List<T> rows;  // 记录集合
	
	
	public Integer getTotal() {
		return total;
	}
	
	//设置总记录数  要先调用  setPageSize(),setPages();
	public void setTotal(Integer total) {
		this.total = total;
	}
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
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	
	
	
}
