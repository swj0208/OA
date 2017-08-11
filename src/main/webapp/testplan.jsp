<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


<script type="text/javascript">
	$(function() {
		initData();
	});

	function initData(params) {
		$('#tt').datagrid({
			url : 'findAllPlan.action?pages=1',
			width : 700,
			height : 400,
			title : '待办事宜',
			iconCls : 'icon-save',
			fitColumns : true,
			rownumbers : true, //是否加行号
			pagination : true, //是否显式分页
			pageSize : 15, //页容量，必须和pageList对应起来，否则会报错
			pageNumber : 2, //默认显示第几页
			pageList : [ 15, 30, 45 ],//分页中下拉选项的数值
			columns : [ [
			//book.ItemId, book.ProductId, book.ListPrice, book.UnitCost, book.Status, book.Attr1                   
			{
				field : 'pid',
				title : '计划编号'
			}, 
			{
				field : 'pname',
				title : '计划名称'
			}, 
			{
				field : 'gname',
				title : '所属团队'
			}, 
			{
				field : 'timestart',
				title : '发布时间'
			}, 
			{
				field : 'timelimit',
				title : '截至时间'
			}, 
			{
				field : 'timeend',
				title : '完成时间'
			}, 
			{
				field : 'pstatus',
				title : '目前状态'
				
			} ] ],
                view: detailview,
                detailFormatter: function(index, row) {
                    return '<div id="ddv-' + index + '" style="padding:5px;"></div>';
                },
                 onExpandRow: function(index, row) {
                	 $('#ddv-'+index).datagrid({  
                         url:'findPlanContent.action?pid='+row.pid,
                         fitColumns:true,  
                         singleSelect:true,  
                         rownumbers:true,  
                         loadMsg:'',  
                         height:'auto',
                         nowrap: false,
                         columns:[[  
                             {field:'pid',title:'编号'},  
                             {field:'content',title:'内容',align:'center' }
                              
                         ]],  
                         onResize:function(){  
                             $('#tt').datagrid('fixDetailRowHeight',index);  
                         },  
                         onLoadSuccess:function(){  
                             setTimeout(function(){  
                                 $('#tt').datagrid('fixDetailRowHeight',index);  
                             },0);  
                         } 
                	 });  
                    $('#tt').datagrid('fixDetailRowHeight', index);
                } 
		});
	}
</script>

<table id="tt" ></table>




</body>
</html>