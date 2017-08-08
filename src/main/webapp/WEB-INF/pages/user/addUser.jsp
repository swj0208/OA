<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript" src="back/manager/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
	$(function(){
		showNewsType();
		$("#addBtn").click(function(){
			$.ajax({
				type:"POST",
				url:"addUser.action",
				data:$("#addUserForm").serialize(),
				dataType:"JSON",
				success:function(data){
					if(data.code==1){
						$.messager.alert('Warning','添加成功');
					}else{
						$.messager.alert('Warning','添加失败,'+data.errorMsg);
					}
				}
			});
		});
	});
	
	function showNewsType(){
		var url="back/newsType.action";
		$.ajax({
			type:"POST",
			url:url,
			data:"op=findAll&status=1",
			dataType:"json",
			success:function(data){
				
				str="";
				for( var i=0;i<data.rows.length;i++){
					var newstype=data.rows[i];
					str+="<option value='"+newstype.tid+"'>"+newstype.tname+"</option>";
				}
				$("#tid").html(str);
			}
		});
	}
	
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

</script>
<title>添加新闻</title>
</head>
<body>




		发布新闻
		<hr/>
		<form id="addUserForm" action="" method="post" enctype="multipart/form-data">
			<div style="text-align:left;">
				用户名: <input type="text" name="uname" id="uname"/>
				密码: <input type="password" name="upwd" id="uname" value="a"/>
				性别:	<label><input name="sex" id="sex" type="radio" value="" />男 </label>
					<label><input name="sex" id="sex" type="radio" value="" />女 </label>
				照片:<input type="file" name="photo" id="photo" onchange="showUploadImg(this,'showpic')" accept="image/*"/><br/>
				<input type="button" value="隐藏图片" onclick="document.getElementById('showpic').style.display='none';"/>
				<input type="button" value="显示图片" onclick="document.getElementById('showpic').style.display='block';"/>
				<br/>
				<img id="showpic" /><br/>
				加入时间:<input type="Date" id=entrytime name="entrytime"/>
				联系电话: <input type="text" name="tel" id="tel"/>
				邮箱: <input type="text" name="email" id="email"/>
				出生日期:<input type="Date" name="birthday" id="birthday"/>
				家庭地址:<input type="text" name="address" id="address"/>
				<div>所属部门：
				<select class="text" name="department" id="department" onchange="onchangeDistrict(this.value)">
										<option value=""></option>
				</select> 			
				所属小组：
				<select class="text" name="gid" id="gid">	</select>
				</div>
				<select class="text" name="ustatus" id="ustatus">
				</select>
				自我描述:
				<textarea class="ckeditor" name="temp1"></textarea>
				<input type="button" id="addBtn" value="添加"/>
			</div>
		</form>
		
	
</body>
</html>