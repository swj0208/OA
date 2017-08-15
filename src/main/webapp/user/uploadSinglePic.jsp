<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.yc.utils.*,java.util.*"%>

<%
	FileUpload fu  = new FileUpload();
	Map<String,String> map = fu.uploadFiles(pageContext, request);
	
	
	
	//取出回调函数名  ：jsonp技术
	response.setContentType("text/html;charset=UTF-8");
	
	String callback = request.getParameter("CKEditorFuncNum");
	
	out.println("<script type=\"text/javascript\">");
	out.println("window.parent.CKEDITOR.tools.callFunction("+callback+",'"+map.get("upload_weburl")+"','')");
	out.println("</script>");
	out.flush();
%>