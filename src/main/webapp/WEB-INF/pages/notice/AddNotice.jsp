<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script src="ckeditor/ckeditor.js">
</script>
<hr />
<form id="addMessageForm" action="" method="post" enctype="multipart/form-data">
	<div style="text-align: left">
		消息权重：
		<select class="text" name="togid" id="togid" onchange="onchangetogid(this.value)">
			<option>5</option>
			<option>4</option>
			<option>3</option>
			<option>2</option>
			<option>1</option>
		</select>
		<br /> 
		发送部门：<select class="text" name="department" id="department" onchange="onchangedepartment(this.value)">
			<option value="1"></option>
		</select>
		发送小组：<select class="text" name="gname" id="gname" onchange="onchangegname(this.value)">
			</select>
		发送员工：<select class="text" name="uname" id="uname"">
			</select>
		<br />
		消息内容：
		<textarea class="ckeditor" name="content"></textarea>
		<br />
		<input type="submit" id="addBtn" value="发送" />
	</div>
	
	<script type="text/javascript">
	function onchangedepartment(obj){
		var department = obj;
		$.ajax({
			url:"group_list.action",
			type:"POST",
			data:"department="+department,
			dataType:"JSON",
			success:function(data){
				var str = "";
				var length = data.rows.length;
				for(var i=0;i<length;i++){
					var street = data.rows[i];
					str+='<option>'+gname+'</option>';
				}
				$("#gname").html(str);
			}
		
		});
	}
	
	function onchangegname(obj){
		var gname = obj;
		$.ajax({
			url:"uname_list.action",
			type:"POST",
			data:"gname="+gname,
			dataType:"JSON",
			success:function(data){
				var str = "";
				var length = data.rows.length;
				for(var i=0;i<length;i++){
					var street = data.rows[i];
					str+='<option>'+uname+'</option>';
				}
				$("#uname").html(str);
			}
		
		});
	}
</script>
</form>
</html>