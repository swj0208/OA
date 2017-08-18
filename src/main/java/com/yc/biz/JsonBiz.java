package com.yc.biz;


import javax.servlet.http.HttpServletResponse;

public interface JsonBiz {
	
	public void outjson(Object obj,HttpServletResponse resp) throws Exception;
	
	public void outjsonstr(String jsonstr, HttpServletResponse resp) throws Exception ;

}
