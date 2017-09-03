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
</script>
<hr />
<form id="addMessageForm" action="" method="post" enctype="multipart/form-data">
	发布人:
	<input type="hidden" id="uid" name="uid" value="${users.uid}">
	<br/> 	公告标题:
	<input type="text" name="ntitle" id="ntitle"/>
	<br /> 公告类型:
	<select class="text" name="ntype" id="ntype">
		<option></option>
		<option>通知</option>
		<option>部门公告</option>
		<option>行政公告</option>
	</select>
	<br /> 消息内容:
	<textarea class="ckeditor" name="ncontent" id="ncontent"></textarea>
	<input type="button" id="addBtn" value="发送" />
</form>
<script>

</script>
</html>