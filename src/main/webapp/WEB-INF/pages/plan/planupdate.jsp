<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="update_dlg" title="修改计划"
	style="display: none; padding: 10px; width: 400px;">

	<form id="updatePlanForm" method="post">
		<input type="hidden" name="pid" /> <input type="hidden"
			name="timestart" />
		<div style="margin-bottom: 20px">
			<input class="easyui-textbox" name="pname" style="width: 100%"
				data-options="label:'计划名称:',required:true">
		</div>
		<div style="margin-bottom: 20px">
			<input class="easyui-datetimebox" name="timelimit"
				style="width: 100%" data-options="label:'截止时间:',required:true"
				editable="false">
		</div>
		<div style="margin-bottom: 20px">
			<input class="easyui-textbox" name="gid" style="width: 100%"
				data-options="label:'任务小组编号:',required:true">
		</div>
		<div style="margin-bottom: 20px">
			<input class="easyui-textbox" name="content"
				style="width: 100%; height: 80px"
				data-options="label:'计划具体内容:',multiline:true,required:true">
		</div>
		<div style="margin-bottom: 20px;">
			<select class="easyui-combobox" name="pstatus" label="目前状态"
				style="width: 100%" editable="false">
				<option value="已完成" selected>已完成</option>
				<option value="进行中">进行中</option>
				<option value="已废除">已废除</option>
			</select>
		</div>
		<div style="text-align: center; padding: 5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="updateForm()" style="width: 80px">提交修改</a>
		</div>
	</form>

</div>