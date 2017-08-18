package com.yc.biz.impl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.yc.biz.JsonBiz;

@Service
@Transactional
public class JsonBizImpl implements JsonBiz {

	@Override
	public void outjson(Object obj, HttpServletResponse resp) throws Exception {
			Gson gson=new Gson();
			String jsonstr=gson.toJson(obj);
			outjsonstr(jsonstr, resp);
	}



		


	@Override
	public void outjsonstr(String jsonstr, HttpServletResponse resp) throws Exception {
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.println(jsonstr);
		out.flush();
		out.close();
		

	}

}
