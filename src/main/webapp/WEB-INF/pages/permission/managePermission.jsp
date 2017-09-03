<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript">
	function show(pages, pername) {
		//发出请求    类别=     pages=1  pagesize=30
		//异步请
		$.ajax({
				type : "POST",
				url : "user/findPermissionforuser.action",
				data : "pages=" + pages + "&pagesize=5&&pername="+ pername,
				dataType : "json", //替换eval('('+xmlHttp.responseText+')')
				success : function(data) {
					$("#showPermissionOfUser").html("");
					var str = "";
					for (var i = 0; i < data.rows.length; i++) {
						var pu = data.rows[i];
						str += "<li>" + pu.department + "\t" + pu.gname
								+ "\t" + pu.uname + "</li>";
					}
					var total = parseInt(data.total);
					var pagesize = parseInt(data.pageSize);
					var totalPage = Math.ceil(total / pagesize);
					if (totalPage > 0) {
						str += "【共" + total + "条记录,每页" + pagesize
								+ "条   第" + pages + "页/共" + totalPage
								+ "页】";
						str += "<a href='javascript:void(0)' onclick='show(1,"+pername+")'>第一页</a>";
						if (pages > 1) {
							str += "<a href='javascript:void(0)' onclick='show("
									+ (pages - 1) +","+pername+")'>上一页</a>";
						} else {
							str += "<a href='javascript:void(0)' onclick='show(1,"+pername+")'>上一页</a>";
						}
						if (pages < totalPage) {
							str += "<a href='javascript:void(0)' onclick='show("
									+ (pages + 1) + ","+pername+")'>下一页</a>";
						} else {
							str += "<a href='javascript:void(0)' onclick='show("
									+ totalPage + ","+pername+")'>下一页</a>";
						}
						str += "<a href='javascript:void(0)' onclick='show("
								+ totalPage + ","+pername+")'>最后一页</a>";
					}
					$("#showPermissionOfUser").html(str);
				}
			})
	}

	function showUser(obj, pername) {
		$("#showPermission > a").css("background-color", "");
		$(obj).css("background-color", "yellow");
		//将tname存到隐藏域中
		show(1, pername);
	}
	
	$(function() {
		$("#addBtn").click(function() {
			$.ajax({
				type : "POST",
				url : "user/addPermissionUser.action",
				data : $("#myform").serialize(),
				dataType : "JSON",
				success : function(data) {
					if (data.code == 1) {
						alert("添加成功！");
						location.href = "user/toManagePermission.action";
					} else {
						alert("添加失败，原因：" + data.msg);
					}
				}
			});
		});
	});
</script>
<div id="showPermission">
	<c:forEach items="${permission }" var="n">
		<a href="javascript:void(0)" onclick="showUser(this,'${n.pername }')">${n.pername }</a>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     </c:forEach>
</div>
<br />
<hr />
<div id="showPermissionOfUser"></div>
<br />
<form id="myform">
	部门：
	<select class="text" name="did" id="did" onchange="onchangedepartment(this.value)">
		<option></option>
		<c:forEach items="${Department }" var="d">
			<option value="${d.did }">${d.department}</option>
		</c:forEach>
	</select>
	小组：
	<select class="text" name="gid" id="gid" onchange="onchangegname()">
	</select>
	员工：
	<select class="text" name="uid" id="uid"></select>
	<br />
	<select class="text" name="perid" id="perid">
		<c:forEach items="${permission }" var="n">
			<option value="${n.perid }">${n.pername}</option>
		</c:forEach>	
	</select>
	<br/>
	<input type="button" id="addBtn" value="添加" />
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
