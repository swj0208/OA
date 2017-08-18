<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#manNoticeTable').edatagrid({
			url : 'user/findAllNotice.action', //查询时加载的URL
			pagination : true,//显示分页
			pageSize : 10, //默认分页的条数
			pageList : [ 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 60, 100 ],//可选分页条数
			fitColumns : false,//自适应列
			fit : true,//自动补全
			title : "通告管理",
			idField : "nid",//标识，会记录我们选中的一行的id，不一定是id，通常是主键
			rownumbers : "true",//显示行号
			nowrap : "true",//不换行显示
			sortName : "nid",//排序的列 这个参数会传到7后台的servlet上，所以要有后台对应的接受
			sortOrder : "desc",//排序方式
			singleSelect : true,

			//以上的四种增删改查操作，只要失败，都会回调这个onError
			onError : function(a, b) {
				$.messager.alert("错误", "操作失败");
			},
			columns : [ [ {
				field : 'nid',
				title : '通知编号',
				width : 100,
				align : 'center',
				hidden : 'true'
			}, {
				field : 'did',
				title : '部门编号',
				width : 100,
				align : 'center'
			}, {
				field : 'gid',
				title : '小组',
				width : 100,
				align : 'center'
			}, {
				field : 'uid',
				title : '员工',
				width : 100,
				align : 'center'
			}, {
				field : 'content',
				title : '内容',
				width : 100,
				align : 'center'
			}, {
				field : 'nweight',
				title : '权重',
				width : 100,
				align : 'center'
			}] ]
		})
	});
</script>
<title>新闻维护</title>
</head>
<body>
	<table id="manNoticeTable"></table>
</body>
</html>