<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">

	function addRemarkForm() {
		$.ajax({
			type : "POST",
			data : $("#addAchieveRemarkForm").serialize(),
			url : "addAchieveRemark.action",
			dataType : "JSON",
			success : function(data) {
				if (data.code == 1) {
					$.messager.alert("提示！", "备注添加成功！");
					clearForm();
					$('#remark_dlg').dialog('close');
					$('#tt').datagrid("reload");
				} else {
					$.messager.alert("提示！", "备注添加失败！" + data.msg);
				}
			}
		});
	}
</script>

<div id="remark_dlg" title="添加备注"
	style="display: none; padding: 10px; width: 400px;">
	<form id="addAchieveRemarkForm" method="post">
		<input type="hidden" name="aid" /> 
		<div style="margin-bottom: 20px">
			<input class="easyui-textbox" name="remark"
				style="width: 100%; height: 80px"
				data-options="label:'备注内容:',multiline:true,required:true">
		</div>
	</form>
	<div style="text-align: center; padding: 5px 0">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="addRemarkForm()" style="width: 80px">提交</a>
	</div>
</div>