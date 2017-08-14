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
			fit:true,
			title : '待办事宜',
			iconCls : 'icon-save',
			singleSelect:true,
			getSelected:true,
			fitColumns : true,
			rownumbers : true, //是否加行号
			pagination : true, //是否显式分页
			nowap: true, //列内容多时自动折至第二行
			sortOrder:'asc',
			sortName:'pid',
			idField:'pid',
			pageSize : 5, //页容量，必须和pageList对应起来，否则会报错
			pageNumber : 1, //默认显示第几页
			pageList : [ 5, 10, 15, 30, 50 ],//分页中下拉选项的数值
			toolbar:['#tb',{//工具条
		        text:'增加',
		        iconCls:'icon-add',
		        handler:function(){
		        	$('#dlg').show();
		        	$('#dlg').dialog({
		        		 iconCls: 'icon-add',
		                 buttons: [{
		                     text:'关闭',
		                     iconCls:'icon-cancel',
		                     handler:function(){
		                        clearForm();
		                        $('#dlg').dialog('close');
		                     }
		                 },{
		                	 iconCls: 'icon-clear',
		                     text:'清空数据',
		                     handler:function(){
		                    	 clearForm();
		                     }
		                 }]
		        	});
		        	
		        }
		    },'-',{
		        text:'删除',
		        iconCls:'icon-remove',
		        handler:function(){
		        	var rows = $('#tt').datagrid('getSelected');  
		            if (null == rows || rows.length == 0) {  
		               noSelect();
		               return;  
		            } 
		        	 $.messager.confirm('删除这个计划', '你确定要删除这个工作计划吗?', function(r){
		                 if (r){
		                	 $.ajax({
		 		    			type : "POST",
		 		    			data:"pid="+rows.pid,
		 		    			url : "delPlan.action",
		 		    			dataType : "JSON",
		 		    			success : function(data) {
		 		    				if (data.code == 1) {
		 		    					$.messager.alert("提示！", "数据删除成功！");
		 		                        $('#tt').datagrid("reload");
		 		                        $('#tt').datagrid("clearSelections");
		 		    				} else {
		 		    					$.messager.alert("提示！", "数据删除失败！");
		 		    				}
		 		    			}
		 		    		});
		                 }
		             });
		        }
		    },'-',{
		    	//这里是修改按钮的具体操作
		        text:'修改',
		        iconCls:'icon-edit',
		        handler:function(){
      			 var rows = $('#tt').datagrid('getSelected');
		            if (null == rows || rows.length == 0) {  
		               noSelect();
		               return;  
		            } 
		            if(rows.pstatus=="已完成"){
		            	$.messager.alert("提示！", "该计划已完成，不能对其进行修改操作！");
		            	return;
		            }
		        	$('#update_dlg').show();
		        	$('#update_dlg').dialog({
		        		 iconCls: 'icon-edit',
		        	});
		        	$('#updatePlanForm').form('load', rows);
		        }
		    }
		    
		    //这里是完成计划按钮
		    , '-',{
		    	text: '计划完成', 
		    	iconCls: 'icon-ok', 
		    	handler: function () {
		    		var rows = $('#tt').datagrid('getSelected');  
		            if (null == rows || rows.length == 0) {  
		               noSelect();
		               return;  
		            } 
		        	 $.messager.confirm('计划完成', '你确定这个工作计划完成了吗?', function(r){
		                 if (r){
		                	 $.ajax({
		 		    			type : "POST",
		 		    			data:"pid="+rows.pid,
		 		    			url : "completePlan.action",
		 		    			dataType : "JSON",
		 		    			success : function(data) {
		 		    				if (data.code == 1) {
		 		    					$.messager.alert("提示！", "计划完成成功！");
		 		                        $('#tt').datagrid("reload");
		 		    				} else {
		 		    					$.messager.alert("提示！", "计划完成失败！");
		 		    				}
		 		    			}
		 		    		});
		                 }
		             });
            	}
            }
		    
		    ,'-',{
		    	//这里是修改按钮的具体操作
		        text:'查找',
		        iconCls:'icon-search',
		        
		        handler:function(){
      				alert("待完成")
		        }
		    } 
		    
		    
		    ],

			columns : [ [
			{
				field:'ck',
				checkbox:true
			},
			{
				field : 'pid',
				title : '计划编号',
				align:'center',
				sortable:true
			}, 
			{
				field : 'pname',
				title : '计划名称',
				sortable:'true',
				align:'center'
			}, 
			{
				field : 'gname',
				title : '所属团队',
				sortable:'true',
				align:'center'
			}, 
			{
				field : 'timestart',
				title : '发布时间',
				sortable:'true',
				align:'center'
			}, 
			{
				field : 'timelimit',
				title : '截止时间',
				sortable:'true',
				align:'center'
			}, 
			{
				field : 'timeend',
				title : '完成时间',
				sortable:'true',
				align:'center'
			}, 
			{
				field : 'pstatus',
				title : '目前状态',
				align:'center',
				sortable:'true'
				
			} ] ],
			
			//数据的样式
			 rowStyler: function(index,row){
                 if (row.pstatus =='已完成'){
                     return 'background-color:#92E4A3;';
                 }
                 if (row.pstatus =='已废除'){
                     return 'background-color:#BBBBBB;';
                 }
                 var date = new Date();
             	 var now=date.Format("yyyy-MM-dd hh:mm:ss");
                 if(now>row.timelimit){
                	 return 'background-color:#ED8989;';
                 }
                 
                 
             }, 
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
                             {field:'pid',title:'编号'},  
                             {field:'content',title:'内容' }
                              
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
                	 $('#tt').datagrid('selectRow',index);
                	 var obj=$('#tt').datagrid('getSelected');
                	 var data={
                			 'rows':[{
                				 pid:obj.pid,
                				 content:obj.content
                			 }]
                		 }
                	$('#ddv-'+index).datagrid('loadData',data); //加载选中行数据
                    $('#tt').datagrid('fixDetailRowHeight', index);
                } 
		});
	}
	

	function clearForm() {
		$('#addPlanForm').form('clear');
	}
	
	function submitForm() {
		$.ajax({
			type : "POST",
			data:$("#addPlanForm").serialize(),
			url : "addPlan.action",
			dataType : "JSON",
			success : function(data) {
				if (data.code == 1) {
					$.messager.alert("提示！", "信息添加成功！");
                    $('#dlg').dialog('close');
                    $('#tt').datagrid("reload");
				} else {
					$.messager.alert("提示！", "信息添加失败！"+data.msg);
				}
			}
		});
	}
	
	function updateForm() {
		$.ajax({
			type : "POST",
			data:$("#updatePlanForm").serialize(),
			url : "updatePlan.action",
			dataType : "JSON",
			success : function(data) {
				if (data.code == 1) {
					$.messager.alert("提示！", "信息修改成功！");
					clearForm();
                    $('#update_dlg').dialog('close');
                    $('#tt').datagrid("reload");
				} else {
					$.messager.alert("提示！", "信息修改失败！"+data.msg);
				}
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
	 
 
</script>

<table id="tt" ></table>

<div id="dlg" title="增加新的计划"
	style="display: none; padding: 10px; width: 400px;">

	<form id="addPlanForm" method="post">
		<div style="margin-bottom: 20px">
			<input class="easyui-textbox" name="pname"  style="width: 100%"
				data-options="label:'计划名称:',required:true">
		</div>
		<div style="margin-bottom: 20px">
			<input class="easyui-datetimebox" name="timelimit"  style="width: 100%"
				data-options="label:'截止时间:',required:true" editable="false">
		</div>
		<div style="margin-bottom: 20px">
			<input class="easyui-textbox" name="gid"  style="width: 100%"
				data-options="label:'任务小组编号:',required:true">
		</div>
		<div style="margin-bottom: 20px">
			<input class="easyui-textbox" name="content" 
				style="width: 100%; height: 80px"
				data-options="label:'计划具体内容:',multiline:true,required:true">
		</div>
		<div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">提交</a>
        </div>
	</form>

</div>

<div id="update_dlg" title="修改计划"
	style="display: none; padding: 10px; width: 400px;">

	<form id="updatePlanForm" method="post">
		<input type="hidden" name="pid"/>
		<input type="hidden" name="timestart"/>
		<div style="margin-bottom: 20px">
			<input class="easyui-textbox" name="pname"
				style="width: 100%" data-options="label:'计划名称:',required:true">
		</div>
		<div style="margin-bottom: 20px">
			<input class="easyui-datetimebox" name="timelimit" 
				style="width: 100%" data-options="label:'截止时间:',required:true" editable="false">
		</div>
		<div style="margin-bottom: 20px">
			<input class="easyui-textbox" name="gid" style="width: 100%"
				data-options="label:'任务小组编号:',required:true">
		</div>
		<div style="margin-bottom: 20px">
			<input class="easyui-textbox" name="content" 
				style="width: 100%; height: 80px"
				data-options="label:'计划具体内容:',multiline:true,required:true">
		</div>
		<div style="margin-bottom: 20px;">
			<select class="easyui-combobox" name="pstatus" label="目前状态"
				style="width: 100%" editable="false">
				<option value="已完成" selected>已完成</option>
				<option value="进行中" >进行中</option>
				<option value="已废除" >已废除</option>
			</select>
		</div>
		<div style="text-align: center; padding: 5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="updateForm()" style="width: 80px">提交修改</a>
		</div>
	</form>

</div>


</body>
</html>