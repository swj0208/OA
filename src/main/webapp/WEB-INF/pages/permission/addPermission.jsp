<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="dlg" title="添加权限" style="display: none; padding: 10px; width: 400px;">
	<form id="addPermissionForm" method="post">
		部门：
		<select class="text" name="did" id="did" onchange="onchangedepartment(this.value)">
			<option></option>
			<c:forEach items="${Department }" var="d">
				<option value="${d.did }">${d.department}</option>
			</c:forEach>
		</select>
		<br/>
		小组：
		<select class="text" name="gid" id="gid" onchange="onchangegname()">
		</select>
		<br/>
		员工：
		<select class="text" name="uid" id="uid"></select>
		<br />
		<select class="text" name="perid" id="perid">
			<c:forEach items="${permission }" var="n">
				<option value="${n.perid }">${n.pername}</option>
			</c:forEach>
		</select>
		<br />
		<div style="text-align: center; padding: 5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width: 80px">提交</a>
		</div>
	</form>
</div>
<script>
	function submitForm() {
		$.ajax({
			type : "POST",
			data : $("#addPermissionForm").serialize(),
			url : "user/addPermissionUser.action",
			dataType : "JSON",
			success : function(data) {
				if (data.code == 1) {
					$.messager.alert("提示！", "发送成功");
					$('#dlg').dialog('close');
				} else {
					$.messager.alert("提示！", "发送失败！" + data.msg);
				}
			}
		});
	}

	function onchangedepartment(obj) {
		var did = obj;
		$.ajax({
			url : "user/group_list.action",
			type : "POST",
			data : "did=" + did,
			dataType : "JSON",
			success : function(data) {
				var str = "";
				str += '<option></option>';
				var length = data.rows.length;
				for (var i = 0; i < length; i++) {
					var s = data.rows[i];
					str += '<option value='+s.gid+'>' + s.gname + '</option>';
				}
				$("#gid").html(str);
				$("#uid").html('');
			}

		});
	}
	function onchangegname() {
		var did = $("#did").val();
		var gid = $("#gid").val();
		$.ajax({
			url : "user/uname_list.action",
			type : "POST",
			data : "did=" + did + "&gid=" + gid,
			dataType : "JSON",
			success : function(data) {
				var str = "";
				str += '<option></option>';
				var length = data.rows.length;
				for (var i = 0; i < length; i++) {
					var u = data.rows[i];
					str += '<option value='+u.uid+'>' + u.uname + '</option>';
				}
				$("#uid").html(str);
			}

		});
	}
</script>