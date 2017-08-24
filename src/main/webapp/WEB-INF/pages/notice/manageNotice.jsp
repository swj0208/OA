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
				field : 'ntitle',
				title : '标题',
				width : 100,
				align : 'center'
			}, {
				field : 'ncontent',
				title : '内容',
				width : 100,
				align : 'center'
			}, {
				field : 'uname',
				title : '员工',
				width : 100,
				align : 'center'
			}, {
				field : 'ntype',
				title : '类别',
				width : 100,
				align : 'center'
			}, {
				field : 'publictime',
				title : '发布时间',
				width : 150,
				align : 'center'
			}
			] ],
			view: detailview,
            detailFormatter: function(index, row) {
                return '<div id="ddv-' + index + '" style="padding:5px;"></div>';
            },
             onExpandRow: function(index, row) {
            	 $('#ddv-'+index).datagrid({  
                     fitColumns:true,  
                     singleSelect:true,  
                     rownumbers:false,  
                     loadMsg:'',  
                     height:'auto',
                     nowrap: false,
                     columns:[[  
                         {field:'ntitle',title:'标题'},  
                         {field:'ncontent',title:'内容' }
                          
                     ]], 
                     
                     onResize:function(){  
                         $('#manNoticeTable').datagrid('fixDetailRowHeight',index);  
                     },  
                     onLoadSuccess:function(){  
                         setTimeout(function(){  
                             $('#manNoticeTable').datagrid('fixDetailRowHeight',index);  
                         },0);  
                     } 
            	 }); 
            	 $('#manNoticeTable').datagrid('selectRow',index);
            	 var obj=$('#manNoticeTable').datagrid('getSelected');
            	 var data={
            			 'rows':[{
            				 ntitle:obj.ntitle,
            				 ncontent:obj.ncontent
            			 }]
            		 }
            	$('#ddv-'+index).datagrid('loadData',data); //加载选中行数据
                $('#manNoticeTable').datagrid('fixDetailRowHeight', index);
            } 
	
		})
	});
</script>
<title>公告管理</title>
</head>
<body>
	<table id="manNoticeTable"></table>
</body>
</html>