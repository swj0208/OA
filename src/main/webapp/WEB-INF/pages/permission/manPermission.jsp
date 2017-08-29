<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		$('#showPermissionTable').edatagrid({
			url : 'user/findPermissionforuser.action', //查询时加载的URL
			pagination : true,//显示分页
			pageSize : 10, //默认分页的条数
			pageList : [ 5, 10, 15, 20, 25, 30 ],//可选分页条数
			fitColumns : false,//自适应列
			fit : true,//自动补全
			title : "文件管理",
			idField : "uid",//标识，会记录我们选中的一行的id，不一定是id，通常是主键
			rownumbers : "true",//显示行号
			nowrap : "true",//不换行显示
			sortName : "uid",//排序的列 这个参数会传到7后台的servlet上，所以要有后台对应的接受
			sortOrder : "desc",//排序方式
			singleSelect : true,

			//以上的四种增删改查操作，只要失败，都会回调这个onError
			onError : function(a, b) {
				$.messager.alert("错误", "操作失败");
			},
			columns : [ [
					{
						field : 'perid',
						title : '权限编号',
						width : 100,
						align : 'center',
						hidden : 'true'
					},
					{
						field : 'department',
						title : '部门名',
						width : 100,
						align : 'center'
					},
					{
						field : 'gname',
						title : '小组名',
						width : 100,
						align : 'center'
					},
					{
						field : 'uname',
						title : '管理员',
						width : 100,
						align : 'center'
					},
					{
						field : 'pername',
						title : '权限名',
						width : 150,
						align : 'center'
					}
					] ]
		});
	});
</script>

<table id="showPermissionTable"></table>
