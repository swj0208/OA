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
						location.href = "toAddUser.action";
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
	 	
		
		
		
</script>
<title>添加员工</title>
</head>
<body>


<div class="easyui-panel" title="添加员工" style="width:400px " align="center">
		
		<hr/>
		<form id="addUserForm"class="easyui-form" method="post" data-options="novalidate:true" enctype="multipart/form-data">
			<table cellpadding="5" >
			<tr>
				<td>用&nbsp;户&nbsp;名:</td>
				<td><input class="easyui-textbox" type="text" name="uname" id="uname" value="pw"/></td>
			</tr>
			<tr>
				<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
				<td> <input class="easyui-textbox" type="password" name="upwd" id="uname" value="a"/></td>
			</tr>
			<tr>
				<td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:	</td>
				<td> <label><input name="sex" id="sex" type="radio" value="男" />男 </label>
					<label><input name="sex" id="sex" type="radio" value="女" />女 </label>
				</td>
			</tr>
			<tr>
				<td>照&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片:</td>
				<td><input type="file" name="file" id="file" onchange="showUploadImg(this,'showpic')" accept="image/*"/><br/>
				<input type="button" value="隐藏图片" onclick="document.getElementById('showpic').style.display='none';"/>
				<input type="button" value="显示图片" onclick="document.getElementById('showpic').style.display='block';"/><br/>
				<img id="showpic" />
				</td>
			</tr>
			<tr>
				<td>加入时间:</td>
				<td> <input type="text" id=entrytime name="entrytime" class="easyui-datebox"/></td>
			</tr>
			<tr>
				<td>联系电话:</td>
				<td> <input type="text" name="tel" id="tel" value="1234"  class="easyui-textbox"/></td>
			</tr>
			<tr>
				<td>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</td>
				<td> <input type="text" name="email" id="email" value="234@qq.com"  class="easyui-textbox"/></td>
			</tr>	 
			<tr>
				<td>出生日期:</td>
				<td> <input type="text" name="birthday" id="birthday" class="easyui-datebox"/></td>
			</tr>	
			<tr>
				<td>家庭地址:</td>
				<td> <input type="text" name="address" id="address" value="湖南"  class="easyui-textbox"/></td>
			</tr>
			<tr>
				<td>所属部门：</td>
				<td>
				<select  name="did" id="did" onchange="onchangedepartment(this.value)">
					<option></option>
					<c:forEach items="${Department }" var="d">
					<option value="${d.did }">${d.department}</option>
					</c:forEach>
				</select>
				</td>
			</tr>	
			<tr>
				<td>所属小组:</td>
				<td>
				<select id="gid" style="width:150px" name="gid"></select>
				</td>
			</tr>	
			<tr>
				<td> 状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</td>
				<td>
				<select class="easyui-combobox" name="ustatus" id="ustatus">
					<option value="正常">正常</option>
					<option value="请假">请假</option>
					<option value="出差">出差</option>
				</select>
				</td>
			</tr>

			<tr>	
			<td><input type="button" id="addBtn" value="添加" /></td></tr>
			</table>
		</form>
		</div>
</body>
</html>