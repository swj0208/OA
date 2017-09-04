<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#manMessageTable').edatagrid({
			url : 'user/findMessage.action', //查询时加载的URL
			pagination : true,//显示分页
			pageSize : 10, //默认分页的条数
			pageList : [ 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 60, 100 ],//可选分页条数
			fitColumns : false,//自适应列
			fit : true,//自动补全
			title : "通告管理",
			idField : "mid",//标识，会记录我们选中的一行的id，不一定是id，通常是主键
			rownumbers : "true",//显示行号
			nowrap : "true",//不换行显示
			sortName : "createtime",//排序的列 这个参数会传到7后台的servlet上，所以要有后台对应的接受
			sortOrder : "desc",//排序方式
			singleSelect : true,

			//以上的四种增删改查操作，只要失败，都会m调这个onError
			onError : function(a, b) {
				$.messager.alert("错误", "操作失败");
			},
			columns : [ [ {
				field : 'mid',
				title : '信息编号',
				width : 100,
				align : 'center',
				hidden : 'true'
			},{
				field : 'fromuname',
				title : '发送者编号',
				width : 100,
				align : 'center'
			},{
				field : 'department',
				title : '部门编号',
				width : 100,
				align : 'center'
			}, {
				field : 'gname',
				title : '小组',
				width : 100,
				align : 'center'
			}, {
				field : 'touname',
				title : '接收者',
				width : 100,
				align : 'center'
			}, {
				field : 'mweight',
				title : '权重',
				width : 100,
				align : 'center'
			},{
				field : 'fname',
				title : '文件名',
				width : 100,
				align : 'center'
			},
			{
				field : 'operate',
				title : '下载',
				align : 'center',
				width : 100,
				formatter : function(val, row, index) {
					if(row.fid!=null){
						var str = '<a href="javascript:void(0)" onclick="filedownload('+ index + ')">下载</a>';
						return str;
					}
				}
			},
			{
				field : 'operate2',
				title : '详情',
				align : 'center',
				width : 100,
				formatter : function(val, row, index) {
					var str = '<a href="javascript:void(0)" onclick="showMessage('+ index + ')">消息详情</a>';
					return str;
				}
			}] ]
		})
	});
	
	function filedownload(index){
		$('#manMessageTable').datagrid('selectRow',index);
		var row = $('#manMessageTable').datagrid('getSelected');
		location.href="user/fileDownload.action?fid="+row.fid;
	}
	
	
	function showMessage(index){
		$('#manMessageTable').datagrid('selectRow',index);
		var row = $('#manMessageTable').datagrid('getSelected');
		$.ajax({
			type : "POST",
			url : "user/findContentBymid.action?mid="+row.mid,
			dataType : "JSON",
			success : function(data) {
				$('#content_dlg').show();
				$('#content_dlg').dialog({
				});
				//具体内容
				$('#content_div').empty();
				var str1=data.rows[0].content;
				$('#content_div').append(str1);
			}
		});

	}
</script>
<title>信息中心</title>
</head>
<body>
	<table id="manMessageTable"></table>
	<div id="content_dlg" title="消息详情" style="display: none; padding: 10px; width: 500px;">
	<b>信息具体内容：</b>
	<div id="content_div">
	
	</div>

	</div>
</body>
</html>