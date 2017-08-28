<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="../header.jsp"%> 
 	<c:forEach items="${jm.rows }" var="j">
	 <p><center>公告类型:${j.ntype }</center></p>
	<p><center>公告标题:${j.ntitle }</center></p>
	<p><center>发布人:${j.uname }</center></p>
	<p><center> 发布时间:${j.publictime }</center><p>
	<p><center>公告内容:${j.ncontent }</center> </p>
	</c:forEach>
	<h4><a href="javascript:history.go(-1)">返回</a> </h4>
