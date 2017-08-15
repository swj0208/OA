<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="yc" uri="http://www.hyycinfo.com" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>"/>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/dateformat.js"></script><!-- 日期的格式化 -->
<link type="text/css" rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="easyui15/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui15/themes/icon.css">

<script type="text/javascript" src="easyui15/jquery.min.js"></script>
<script type="text/javascript" src="easyui15/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui15/jquery.edatagrid.js"></script>
<script type="text/javascript" src="easyui15/datagrid-detailview.js"></script>
</head>

