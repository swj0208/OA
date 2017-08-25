<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script src="ckeditor/ckeditor.js">
	
</script>
<script type="text/javascript">
	$(function() {
		$("#addBtn").click(function() {
			for (instance in CKEDITOR.instances) {
				CKEDITOR.instances[instance].updateElement();
			}
			$.ajax({
				type : "POST",
				url : "user/noticeAdd.action",
				data : $("#addMessageForm").serialize(),
				dataType : "JSON",
				success : function(data) {
					if (data.code == 1) {
						alert("提交成功");
						location.href = "toAddNotice.action";
					} else {
						alert("提交失败！" + data.msg);
					}
				}
			});
		});
	});
	
	function send(){
		for (instance in CKEDITOR.instances) {
			CKEDITOR.instances[instance].updateElement();
		}
		$.ajax({
			type : "POST",
			url : "user/noticeAdd.action",
			data : $("#addMessageForm").serialize(),
			dataType : "JSON",
			success : function(data) {
				if (data.code == 1) {
					alert("提交成功");
					location.href = "toAddNotice.action";
				} else {
					alert("提交失败！" + data.msg);
				}
			}
		});
	}
	
	function clearForm() {
		$('#addMessageForm').form('clear');
	}
</script>

<style type="text/css">
	#nweight{
		width: 70px;
		text-align: center;
	}
	
	#did{
		width: 100px;
		text-align: center;
	}
	
	#gid{
		width: 100px;
		text-align: center;
	}
	
	#uid{
		width: 100px;
		text-align: center;
	}

</style>

<hr />
<form id="addMessageForm" action="" method="post" enctype="multipart/form-data">
	<span style="margin-bottom: 5px">
		消息权重：
	</span>
	<select class="text" name="nweight" id="nweight" onchange="onchangetogid(this.value)">
		<option>4</option>
		<option>3</option>
		<option>2</option>
		<option>1</option>
	</select>
	<span style="margin-left: 30px">
		 发送部门：
	</span>
	<select class="text" name="did" id="did" onchange="onchangedepartment(this.value)" >
		<option></option>
		<c:forEach items="${Department }" var="d">
			<option value="${d.did }">${d.department}</option>
		</c:forEach>
	</select>
	<span style="margin-left: 30px">
		发送小组：
	</span>
	<select class="text" name="gid" id="gid" onchange="onchangegname()">
	</select>
	<span style="margin-left: 30px">
		发送员工：
	</span>
	<select class="text" name="uid" id="uid">
	</select>
	<br /> 消息内容：
	<textarea class="ckeditor" name="content" id="content"></textarea>
	<br />
	<!-- <input type="button" id="addBtn" value="发送" /> -->
	<div style="text-align: center; padding: 1px 0">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="send()" style="width: 80px" iconCls="icon-ok">发送</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" 
			onclick="clearForm()" style="width: 80px" iconCls="icon-clear">清空数据</a>
	</div>
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