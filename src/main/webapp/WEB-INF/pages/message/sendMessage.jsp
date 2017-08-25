<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script src="ckeditor/ckeditor.js">
	
</script>
<script type="text/javascript">
	/* $(function() {
		$("#addBtn").click(function(){
			for (instance in CKEDITOR.instances) {
				CKEDITOR.instances[instance].updateElement();
			}
			var opt = {
				type : "POST",
				url : "user/messageAdd.action",
				dataType : "JSON",
				success : function(data) {
					if (data.code == 1) {
						alert("提交成功");
						location.href = "user/toAddMessage.action";
					} else {
						alert("提交失败！" + data.msg);
					}
				}
			}
			$("#addMessageForm").ajaxSubmit(opt);
		});
	}); */
	
</script>
<hr />
<form id="addMessageForm" action="user/messageAdd.action" method="post" enctype="multipart/form-data">
	消息权重：
	<select class="text" name="mweight" id="mweight">
		<option>4</option>
		<option>3</option>
		<option>2</option>
		<option>1</option>
	</select>
	<br /> 发送部门：
	<select class="text" name="did" id="did" onchange="onchangedepartment(this.value)">
		<option></option>
		<c:forEach items="${Department }" var="d">
			<option value="${d.did }">${d.department}</option>
		</c:forEach>
	</select>
	接收小组：
	<select class="text" name="gid" id="gid" onchange="onchangegname()">
	</select>
	接收员工：
	<select class="text" name="uid" id="uid">
	</select>
	<br /> 
	上传文件：
	<input type="file" name="file" id="file" />
	<br/>
	消息内容：
	<textarea class="ckeditor" name="content" id="content"></textarea>
	<br />
	<input type="submit" id="addBtn" value="发送" />
</form>
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
</html>