package com.yc.web.model;

import java.io.Serializable;
import java.util.List;

public class JsonModel<T> implements Serializable {
	private Integer code;//操作状态编码:1.成功 2.失败
	private String msg; //信息
	private Object obj; //对象
	private String url; //下一步要去页面
	
	private Integer total;//总记录数
	private Integer pages;//当前为第几页
	private Integer pageSize;//每页几条
	private List<T> rows; 
	
	
	
	
	@Override
	public String toString() {
		return "JsonModel [code=" + code + ", msg=" + msg + ", obj=" + obj + ", url=" + url + ", total=" + total
				+ ", pages=" + pages + ", pageSize=" + pageSize + ", rows=" + rows + "]";
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getTotal() {
		return total;
	}
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
