<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script type="text/javascript">

$(function() {
	$('#showfileTable').edatagrid({
		url : 'user/showFile.action', //查询时加载的URL
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
		toolbar:tb,
		columns : [ [
				{
					field : 'fid',
					title : '文件编号',
					align : 'center',
					hidden : 'true'
				},
				{
					field : 'fname',
					title : '文件名',
					align : 'center'
				},
				{
					field : 'description',
					title : '简介',
					align : 'center'
				},
				{
					field : 'uname',
					title : '发送人',
					align : 'center'
				},
				{
					field : 'uptime',
					title : '上传时间',
					align : 'center'
				},
				{
					field : 'downtimes',
					title : '下载次数',
					align : 'center'
				},
				{
					field : 'operate',
					title : '操作',
					align : 'center',
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
	$('#showfileTable').datagrid("reload");
}

	
	//删除文件
	function deleteFile() {
		var rows = $('#showfileTable').datagrid('getSelected');
		if (null == rows || rows.length == 0) {
			noSelect();
			return;
		}
		$.messager.confirm('计划完成', '你确定要删除这个文件吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					data : rows,
					url : "deleteFile.action",
					dataType : "JSON",
					success : function(data) {
						if (data.code == 1) {
							$.messager.alert("提示！", "文件删除成功！");
							$('#showfileTable').datagrid("reload");
						} else {
							$.messager.alert("提示！", "文件删除失败！");
						}
					}
				});
			}
		});
	}
	
	//如果没有选择数据
	function noSelect() {
		$.messager.show({
			title : '请注意',
			msg : '请选择数据记录后继续该操作！',
			timeout : 5000,
			showType : 'slide'
		});
	}
	
	//查找文件
	function searchFile() {
		$.ajax({
			type : "POST",
			data:$('#searchFileForm').serialize(),
			url : "searchFile.action",
			dataType : "JSON",
			success : function(data) {
				if(data.code==0){
					alert(data.msg);
					$('#searchFileForm').form('clear');
				}else{
					$('#showfileTable').datagrid("loadData", data.rows);
				}
			}
		});
	}
	
	function clearSearchFileForm() {
		$('#searchFileForm').form('clear');
	}
</script>
<title>显示文件</title>
</head>
<body>
	<table id="showfileTable"></table>
</body>
<div id="tb" style="padding: 2px 5px;">
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="deleteFile()" style="margin-left: 10px">删除</a>
	<form id="searchFileForm" style="float: left">
		上传日期 : <input class="easyui-datetimebox"  id="timefrom" name="timefrom" editable="false">
		— <input class="easyui-datetimebox"  id="timeto" name="timeto" editable="false">  
		文件名: <input class="easyui-textbox" style="width: 110px"  panelHeight="auto" id="fname" name="fname">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="searchFile()">查找</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-clear" onclick="clearSearchFileForm()">清空搜索栏</a>
	</form>
</div>
</html>