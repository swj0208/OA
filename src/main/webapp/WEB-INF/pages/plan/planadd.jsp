<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="dlg" title="增加新的计划"
	style="display: none; padding: 10px; width: 400px;">

	<form id="addPlanForm" method="post">
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
		<div style="text-align: center; padding: 5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="submitForm()" style="width: 80px">提交</a>
		</div>
	</form>

</div>
