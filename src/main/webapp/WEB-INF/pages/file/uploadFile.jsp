<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript">
	$(function() {
		$("#addBtn").click(function(){
			var opt = {
				type : "POST",
				url : "user/fileupload.action",
				dataType : "JSON",
				success : function(data) {
					if (data.code == 1) {
						alert("提交成功");
						location.href = "toUploadFile.action";
					} else {
						alert("提交失败！" + data.msg);
					}
				}
			}
			$("#uploadFile").ajaxSubmit(opt);
		});
	});
</script>
<body>
	<form id="uploadFile" method="post" enctype="multipart/form-data">
		<div style="text-align: left">
			上传文件：
			<input type="file" name="file" id="file" />
			<br /> 文件说明：
			<textarea rows="3" cols="20" id="description" name="description"></textarea>
			<br /> 文件权重：
			<select class="text" name="fweight" id="fweight">
				<option>4</option>
				<option>3</option>
				<option>2</option>
				<option>1</option>
			</select>
			<br /> 发送部门：
			<select class="text" name="todid" id="todid" onchange="onchangedepartment(this.value)">
				<option></option>
				<c:forEach items="${Department }" var="d">
					<option value="${d.did }">${d.department}</option>
				</c:forEach>
			</select>
			发送小组：
			<select class="text" name="togid" id="togid" onchange="onchangegname()">
			</select>
			发送员工：
			<select class="text" name="touid" id="touid"></select>
			<br />
			<input type="button" id="addBtn" value="上传" />
		</div>
	</form>
</body>
<script>
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
				$("#togid").html(str);
				$("#touid").html('');
			}

		});
	}
	function onchangegname() {
		var todid = $("#todid").val();
		var togid = $("#togid").val();
		$.ajax({
			url : "user/uname_list.action",
			type : "POST",
			data : "did=" + todid + "&gid=" + togid,
			dataType : "JSON",
			success : function(data) {
				var str = "";
				str += '<option></option>';
				var length = data.rows.length;
				for (var i = 0; i < length; i++) {
					var u = data.rows[i];
					str += '<option value='+u.uid+'>' + u.uname + '</option>';
				}
				$("#touid").html(str);
			}

		});
	}
</script>
</html>