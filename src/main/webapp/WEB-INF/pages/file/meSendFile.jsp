<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript">

$(function() {
	$('#showfileTable').edatagrid({
		url : 'user/meSendOutFile.action', //查询时加载的URL
		pagination : true,//显示分页
		pageSize : 10, //默认分页的条数
		pageList : [ 5, 10, 15, 20, 25, 30, 35, 40, 45, 50,
				60, 100 ],//可选分页条数
		fitColumns : false,//自适应列
		fit : true,//自动补全
		title : "文件管理",
		idField : "fid",//标识，会记录我们选中的一行的id，不一定是id，通常是主键
		rownumbers : "true",//显示行号
		nowrap : "true",//不换行显示
		sortName : "fid",//排序的列 这个参数会传到7后台的servlet上，所以要有后台对应的接受
		sortOrder : "desc",//排序方式
		singleSelect : true,

		//以上的四种增删改查操作，只要失败，都会回调这个onError
		onError : function(a, b) {
			$.messager.alert("错误", "操作失败");
		},
		columns : [ [
				{
					field : 'fid',
					title : '文件编号',
					width : 100,
					align : 'center',
					hidden : 'true'
				},
				{
					field : 'fname',
					title : '文件名',
					width : 130,
					align : 'center'
				},
				{
					field : 'description',
					title : '简介',
					width : 130,
					align : 'center'
				},
				{
					field : 'uname',
					title : '发送者',
					width : 100,
					align : 'center'
				},
				{
					field : 'uptime',
					title : '上传时间',
					width : 180,
					align : 'center'
				},
				{
					field : 'downtimes',
					title : '下载次数',
					width : 100,
					align : 'center'
				},
				{
					field : 'operate',
					title : '操作',
					align : 'center',
					width : 100,
					formatter : function(val, row, index) {
						var str = '<a href="javascript:void(0)" onclick="filedownload('+ index + ')">下载</a>';
						return str;
					}
			} ] ]
	});
	
});

function filedownload(index){
	$('#showfileTable').datagrid('selectRow',index);
	var row = $('#showfileTable').datagrid('getSelected');
	location.href="user/fileDownload.action?fid="+row.fid;
}
</script>
<title>显示文件</title>
</head>
<body>
		<input type="hidden" id="did" name="did" value="${users.did }"/>
		<input type="hidden" id="uid" name="uid" value="${users.uid }"/>
	<table id="showfileTable">
		
	</table>
</body>
</html>