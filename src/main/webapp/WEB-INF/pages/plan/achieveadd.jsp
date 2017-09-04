<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
.class_1 {
	height: 20px;
	width: 580px;
}

.class_2{
	height: 20px;
}

.class_3{
	text-align: center;
}

</style>

<script type="text/javascript">

	//添加
	function addRow() {
		var newRow = document.createElement("tr");
		var ibody = document.getElementById("achieveTbody");/* .lastChild; */
		var td0 = document.createElement("td");
		td0.style.display='none';
		td0.innerHTML = "<input name='pid' class='class_0'/>";
		newRow.appendChild(td0);
		var td1 = document.createElement("td");
		td1.innerHTML = "<input type='text' name='acontent' class='class_1'/>";
		newRow.appendChild(td1);
		var td2 = document.createElement("td");
		td2.innerHTML = "<input type='text' name='uid' class='class_2'/>";
		newRow.appendChild(td2);
		var td3 = document.createElement("td");
		
		td3.innerHTML = "<a href='javascript:;' onclick='clearRow(this)'>删除</a>";
		newRow.appendChild(td3);
		ibody.appendChild(newRow);
		
		$(".class_0").val($("#achievePid").val());
	}
	
	// 创建删除函数 
	function clearRow(obj) {
		var ibody = document.getElementById("achieveTable").lastChild;
		var c = obj.parentNode.parentNode;
		c.parentNode.removeChild(c);
	}
	

	
	function addAchieve() {

		var achieveList = new Array();
		var trList = $("#achieveTbody").children("tr")
		for (var i = 0; i < trList.length; i++) {
			var tdArr = trList.eq(i).find("td");
			var _pid = tdArr.eq(0).find('input').val();//pid
			var _acontent = tdArr.eq(1).find('input').val();//acontent
			var _uid = tdArr.eq(2).find('input').val();//    uid
			if(_acontent==null||_acontent==''){
				$.messager.alert("提示！", "请不要插入空数据！");
				return;
			}
			if(_uid==null||_uid==''){
				$.messager.alert("提示！", "请不要插入空数据！");
				return;
			}
			achieveList.push({
				pid : _pid,
				acontent : _acontent,
				uid : _uid
			});
		}

		$.ajax({
			type : "POST",
			data : JSON.stringify(achieveList),
			url : "addAchieve.action",
			dataType : "JSON",
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				if(data.code==1){
					$.messager.alert("提示！", "任务步骤添加成功！");
					$("#achieveTbody").empty();
					$('#addAchieve_dlg').dialog('close');
					$('#tt').datagrid("reload");
				}else{
					$.messager.alert("提示！", "任务步骤添加失败！");
				}
			}
		});

	}

	function delAll() {
		$.messager.confirm('删除所有', '你确定要删除所有任务步骤吗?', function(r) {
			if (r) {
				$("#achieveTbody").empty();
			}
		});
	}
</script>

<div id="addAchieve_dlg" title="添加任务步骤"
	style="display: none; padding: 10px; width: 800px;">

		<form id="form1">
			<input type="hidden" name="pid" id="achievePid">
		</form>
	<form id="addAchieveForm" method="post">
		
		
		<table  id="achieveTable">
			<thead>
				<tr>
					<th style="display: none;"></th>
					<th style="width: 600px; text-align: center">执行内容</th>
					<th style="width: 80px; text-align: center">执行人编号</th>
					<th style="width: 50px; text-align: center">操作</th>
				</tr>
			</thead>
			<tbody id="achieveTbody">
				<tr>
					<td style="display: none;"><input type="text" name="pid" class="class_0"></td>
					<td><input type="text" name="acontent" class="class_1"></td>
					<td><input type="text" name="uid" class="class_2"></td>
					<td><a href="javascript:;" onclick="clearRow(this)">删除</a></td>
					<!--在删除按钮上添加点击事件 -->
				</tr>
			</tbody>

		</table>
		<input type="button" value="添加一行" onclick="addRow()" />
		<input type="button" value="删除所有" onclick="delAll()" style="float: right">

		<div style="text-align: center; padding: 5px 0">
				
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="addAchieve()" style="width: 80px">提交</a>
		</div>
	</form>

</div>