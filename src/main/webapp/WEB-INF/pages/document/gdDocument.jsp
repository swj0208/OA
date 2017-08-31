<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#showGDDocumentTable').edatagrid({
			url : 'user/findGDDocument.action', //查询时加载的URL
			pagination : true,//显示分页
			pageSize : 10, //默认分页的条数
			pageList : [ 5, 10, 15, 20, 25, 30 ],//可选分页条数
			fitColumns : false,//自适应列
			fit : true,//自动补全
			title : "归档公文",
			idField : "doid",//标识，会记录我们选中的一行的id，不一定是id，通常是主键
			rownumbers : "true",//显示行号
			nowrap : "true",//不换行显示
			sortName : "doid",//排序的列 这个参数会传到7后台的servlet上，所以要有后台对应的接受
			sortOrder : "desc",//排序方式
			singleSelect : true,

			//以上的四种增删改查操作，只要失败，都会回调这个onError
			onError : function(a, b) {
				$.messager.alert("错误", "操作失败");
			},
			columns : [ [
					{
						field : 'doid',
						title : '公文编号',
						width : 100,
						align : 'center',
						hidden : 'true'
					},
					{
						field : 'dotitle',
						title : '公文标题',
						width : 100,
						align : 'center'
					},
					{
						field : 'funame',
						title : '发送者',
						width : 50,
						align : 'center'
					},
					{
						field : 'douname',
						title : '实行者',
						width : 50,
						align : 'center'
					},
					{
						field : 'tuname',
						title : '审批者',
						width : 50,
						align : 'center'
					},
					{
						field : 'dotime',
						title : '上传时间',
						width : 150,
						align : 'center'
					},
					{
						field : 'fname',
						title : '公文名',
						width : 100,
						align : 'center'
					},
					{
						field : 'dostatus',
						title : '审核状态',
						width : 100,
						align : 'center'
					}]]
		});
	});
</script>
<title></title>
</head>
<body>
	<table id="showGDDocumentTable"></table>
</body>
</html>