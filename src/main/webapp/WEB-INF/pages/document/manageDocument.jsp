<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#showDocumentTable')
				.edatagrid(
						{
							url : 'user/findDocument.action', //查询时加载的URL
							pagination : true,//显示分页
							pageSize : 10, //默认分页的条数
							pageList : [ 5, 10, 15, 20, 25, 30, 35, 40, 45, 50,
									60, 100 ],//可选分页条数
							fitColumns : false,//自适应列
							fit : true,//自动补全
							title : "文件管理",
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
										width : 100,
										align : 'center'
									},
									{
										field : 'tuname',
										title : '审批者',
										width : 100,
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
									},
									{
										field : 'operate',
										title : '下载',
										align : 'center',
										width : 100,
										formatter : function(val, row, index) {
											var str = '<a href="javascript:void(0)" onclick="filedownload('
													+ index + ')">下载</a>';
											return str;
										}
									},
									{
										field : 'operate2',
										title : '审批',
										align : 'center',
										width : 100,
										formatter : function(val, row, index) {
											var str = '<a href="javascript:void(0)" onclick="goodDocument('
													+ index
													+ ')">合格</a>/<a href="javascript:void(0)" onclick="badDocument('
													+ index + ')">不合格</a>';
											return str;
										}
									},
									{
										field : 'operate3',
										title : '终审',
										align : 'center',
										width : 100,
										formatter : function(val, row, index) {
											var str = '<a href="javascript:void(0)" onclick="passDocument('
													+ index
													+ ')">pass</a>/<a href="javascript:void(0)" onclick="badDocument('
													+ index + ')">no way</a>';
											return str;
										}
									},{
										field : 'operate4',
										title : '归档',
										align : 'center',
										width : 100,
										formatter : function(val, row, index) {
											var str = '<a href="javascript:void(0)" onclick="gdDocument('
													+ index
													+ ')">归档</a>';
											return str;
										}
									} ] ]
						});

	});
	
	function gdDocument(index) {
		$('#showDocumentTable').datagrid('selectRow', index);
		var row = $('#showDocumentTable').datagrid('getSelected');
		$.ajax({
			type : "POST",
			url : "user/archiveDocument.action?doid=" + row.doid,
			dataType : "JSON",
			success : function(data) {
				if (data.code == 1) {
					$.messager.alert("提示！", "归档成功！");
				} else {
					$.messager.alert("提示！", "归档失败！"+data.msg);
				}
			}
		});
	}
	

	function goodDocument(index) {
		$('#showDocumentTable').datagrid('selectRow', index);
		var row = $('#showDocumentTable').datagrid('getSelected');
		$.ajax({
			type : "POST",
			url : "user/goodDocument.action?doid=" + row.doid+"&dofromuid="+row.dofromuid,
			dataType : "JSON",
			success : function(data) {
				if (data.code == 1) {
					$.messager.alert("提示！", "审批成功！");
				} else {
					$.messager.alert("提示！", "审批失败！"+data.msg);
				}
			}
		});
	}

	function badDocument(index) {
		$('#showDocumentTable').datagrid('selectRow', index);
		var row = $('#showDocumentTable').datagrid('getSelected');
		$('#dlg').show();
		$('#dlg').dialog({
			
		});
		$('#docommentForm').form('load', row);
	}

	function passDocument(index) {
		$('#showDocumentTable').datagrid('selectRow', index);
		var row = $('#showDocumentTable').datagrid('getSelected');
		$.ajax({
			type : "POST",
			url : "user/passDocument.action?doid=" + row.doid,
			dataType : "JSON",
			success : function(data) {
				if (data.code == 1) {
					$.messager.alert("提示！", "审批成功！");
				} else {
					$.messager.alert("提示！", "审批失败！"+data.msg);
				}
			}
		});
	}


	function filedownload(index) {
		$('#showDocumentTable').datagrid('selectRow', index);
		var row = $('#showDocumentTable').datagrid('getSelected');
		location.href = "user/fileDownload.action?fid=" + row.dofid;
	}
	
	function submitForm() {
		$.ajax({
			type : "POST",
			data:$("#docommentForm").serialize(),
			url : "user/badDocument.action",
			dataType : "JSON",
			success : function(data) {
				if (data.code == 1) {
					$.messager.alert("提示！", "发送成功");
                    $('#dlg').dialog('close');
				} else {
					$.messager.alert("提示！", "发送失败！"+data.msg);
				}
			}
		});
	}
</script>
<title></title>
</head>
<body>
	<table id="showDocumentTable"></table>
	<%@ include file="docomment.jsp"%>
</body>
</html>