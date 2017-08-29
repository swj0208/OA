<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script>
$(function() {
		$("#addBtn").click(function() {
			$.ajax({
				type : "POST",
				url : "user/findPermissionforuser.action?page=0&&rows=0",
				data : $("#myform").serialize(),
				dataType : "JSON",
				success : function(data) {
					
				}
			});
		});
	});
</script>
<body class="easyui-layout layout panel-noscroll">
	<div data-options="region:'North',split:true" title="查询区" style="height: 20%">
		<form id="myform">
			<select class="text" name="pername" id="pername" onchange="onchangedepartment(this.value)">
				<c:forEach items="${permission }" var="d">
					<option value="${d.pername }">${d.pername}</option>
				</c:forEach>
			</select>
			<input type="button" id="addBtn" value="查找" />
		</form>
	</div>
	<div data-options="region:'South',title:'显示'" style="height: 80%">
		<%@ include file="manPermission.jsp"%>
	</div>
</body>