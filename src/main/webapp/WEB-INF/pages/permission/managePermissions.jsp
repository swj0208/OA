<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script>
	$(function() {
		$("#findBtn").click(function() {
			$.ajax({
				type : "POST",
				url : "user/findPermissionforuser.action?page=0&&rows=0",
				data : $("#myform").serialize(),
				dataType : "JSON",
				success : function(data) {
					$('#showPermissionTable').datagrid("loadData", data.rows);
				}
			});
		});
	});
	
	$(function() {
		$("#addBtn").click(function() {
			$('#dlg').show();
			$('#dlg').dialog({
				
			});
		});
	});
	
</script>
<body class="easyui-layout layout panel-noscroll">
	<div data-options="region:'north',title:'操作'" style="height: 20%">
		<form id="myform">
			 <select id="state" class="easyui-combobox" name="pername" label="按权限查找用户：" labelPosition="top" style="width:15%;">
				<c:forEach items="${permission }" var="d">
					<option  value="${d.pername }">${d.pername}</option>
				</c:forEach>
			 </select>
			 <input type="button" id="findBtn" value="查找" />
		</form>
		<input type="button" id="addBtn" value="添加权限" />
	</div>
	<div data-options="region:'south',title:'显示'" style="height: 80%">
		<%@ include file="manPermission.jsp"%>
	</div>
	
</body>
	<%@ include file="addPermission.jsp"%>
	