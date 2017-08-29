<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	function clearSearchForm() {
		$('#searchPlanForm').form('clear');
	}

	function closeSearchForm() {
		$('#searchPlanForm').form('clear');
		$('#search_dlg').dialog('close');
	}
</script>

<!-- 查找计划 -->
<div id="search_dlg" title="查找计划"
	style="display: none; padding: 10px; width: 400px;">

	<form id="searchPlanForm" method="post">
		<div style="margin-bottom: 10px">
			<input class="easyui-numberbox" name="pid" style="width: 100%"
				data-options="label:'计划编号:',missingMessage:'请输入数字格式'">
		</div>
		<div style="margin-bottom: 10px">
			<input class="easyui-textbox" name="pname" style="width: 100%"
				data-options="label:'计划名称:'">
		</div>
		<div style="margin-bottom: 10px">
			<input class="easyui-datetimebox" name="timefrom"
				style="width: 100%" data-options="label:'开始时间from:'"
				editable="false">
		</div>
		<div style="margin-bottom: 10px">
			<input class="easyui-datetimebox" name="timeto"
				style="width: 100%" data-options="label:'to:'" editable="false">
		</div>
		<div style="margin-bottom: 10px">
			<input class="easyui-numberbox" name="gid" style="width: 100%"
				data-options="label:'任务小组编号:',missingMessage:'请输入数字格式'">
		</div>
		<div style="margin-bottom: 10px">
			<input class="easyui-textbox" name="gname" style="width: 100%"
				data-options="label:'任务小组名称:'">
		</div>
		<div style="margin-bottom: 10px">
			<input class="easyui-textbox" name="content"
				style="width: 100%; height: 50px"
				data-options="label:'计划具体内容:',multiline:true">
		</div>
		<div style="margin-bottom: 10px;">
			<select class="easyui-combobox" name="pstatus" label="目前状态"
				style="width: 100%" editable="false">
				<option value="已完成">已完成</option>
				<option value="进行中">进行中</option>
				<option value="已废除">已废除</option>
				<option value="所有状态" selected>所有状态</option>
			</select>
		</div>
		<div style="text-align: center; padding: 1px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="searchForm()" style="width: 80px" iconCls="icon-ok">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="closeSearchForm()" style="width: 80px"
				iconCls="icon-cancel">关闭</a> <a href="javascript:void(0)"
				class="easyui-linkbutton" onclick="clearSearchForm()"
				style="width: 80px" iconCls="icon-clear">清空数据</a>
		</div>

	</form>

</div>