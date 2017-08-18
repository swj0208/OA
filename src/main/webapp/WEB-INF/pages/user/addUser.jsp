<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript">
 	 $(function(){
		$("#addBtn").click(function(){
			var opt = {
				type : "POST",
				url : "user/users_add.action",
				dataType : "JSON",
				success : function(data) {
					if (data.code == 1) {
						alert("提交成功");
						location.href = "toManUser.action";
					} else {
						alert("提交失败！" + data.msg);
					}
				}
			}
			$("#addUserForm").ajaxSubmit(opt);
		});
	});  
	  function showUploadImg(obj,picid){
			//判断浏览器是否支持FileReader接口
			if(typeof FileReader=='undefined'){
				$.messager.alert('Warning','当前浏览器不支持FileReader接口');
				//使选择控件不可操作
				obj.setAttribute("disabled","disabled");
				return;
			}
			var file=obj.files[0];
			var reader=new FileReader();
			reader.onload=function(e){
				$("#"+picid).attr("src",e.target.result);
			}
			reader.readAsDataURL(file)
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
						str += '<option value='+u.uid+'>' + u.ustatus + '</option>';
					}
					$("#ustatus").html(str);
				}

			});
		}  
		
		
		
</script>
<title>添加员工</title>
</head>
<body>



		添加员工
		<hr/>
		<form id="addUserForm" method="post" enctype="multipart/form-data">
			<div style="text-align:left;">
				用&nbsp;户&nbsp;名: <input type="text" name="uname" id="uname" value="pw"/><br/>
				密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码: <input type="password" name="upwd" id="uname" value="a"/><br/>
				性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:	<label><input name="sex" id="sex" type="radio" value="男" />男 </label>
					<label><input name="sex" id="sex" type="radio" value="女" />女 </label><br/>
				照&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片:<input type="file" name="photo" id="photo" onchange="showUploadImg(this,'showpic')" accept="image/*"/><br/>
				<input type="button" value="隐藏图片" onclick="document.getElementById('showpic').style.display='none';"/>
				<input type="button" value="显示图片" onclick="document.getElementById('showpic').style.display='block';"/>
				<br/>
				<img id="showpic" /><br/>
				加入时间:<input type="text" id=entrytime name="entrytime" class="easyui-datebox"/><br/>
				联系电话: <input type="text" name="tel" id="tel" value="1234"/><br/>
				邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱: <input type="text" name="email" id="email" value="234@qq.com"/><br/>
				Q&nbsp;&nbsp;Q&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="qq" id="qq" value="234"/><br/>
				出生日期:<input type="text" name="birthday" id="birthday" class="easyui-datebox"/><br/>
				家庭地址:<input type="text" name="address" id="address" value="湖南"/><br/>
			  <div>所属部门：
				<select class="text" name="did" id="did" onchange="onchangedepartment(this.value)">
					<option></option>
					<c:forEach items="${Department }" var="d">
					<option value="${d.did }">${d.department}</option>
					</c:forEach>
				</select> 		
				所属小组：
				<select class="text" name="gid" id="gid" onchange="onchangegname()">	</select><br/>
				</div> 
				 状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:<select class="text" name="ustatus" id="ustatus">
					<option value="正常" selected>正常</option>
					<option value="请假">请假</option>
					<option value="出差">出差</option>
				
				</select><br/>
				<input type="button" id="addBtn" value="添加" />
			</div>
		</form>
</body>
</html>