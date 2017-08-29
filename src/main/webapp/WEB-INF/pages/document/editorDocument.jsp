<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script src="ckeditor/ckeditor.js">
	
</script>

<hr />
<form id="editorDocument" action="user/editorDocument.action" method="post" enctype="multipart/form-data">
	接收主管：
	<select class="text" name="dotouid" id="dotouid">
		<option></option>
		<c:forEach items="${leader }" var="d">
			<option value="${d.uid }">${d.uname}</option>
		</c:forEach>
	</select>
	<br /> 
	主题：
	<input type="text" name="dotitle" id="dotitle"/>
	<br /> 
	上传附件：
	<input type="file" name="file" id="file" />
	<br/>
	消息内容：
	<textarea class="ckeditor" name="docontent" id="docontent"></textarea>
	<br />
	<input type="submit" id="addBtn" value="发送"/>
</form>
</html>
<script type="text/javascript">
/*
	 $(function() {
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
	}); 
	*/
</script>