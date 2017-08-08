<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="easyui15/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui15/themes/icon.css">
<script type="text/javascript" src="easyui15/jquery.min.js"></script>
<script type="text/javascript" src="easyui15/jquery.easyui.min.js"></script>
</head>
<body>

	<table class="easyui-datagrid" title="待办事宜"
		style="width:auto; height: 250px"
		data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'pid',width:100,align:'center'">计划编号</th>
				<th data-options="field:'pname',width:100,align:'center'">计划名称</th>
				<th data-options="field:'gname',width:100,align:'center'">所属团队</th>
				<th data-options="field:'timestart',width:200,align:'center'">发布时间</th>
				<th data-options="field:'timelimit',width:200,align:'center'">截至时间</th>
				<th data-options="field:'timeend',width:200,align:'center'">完成时间</th>
				<th data-options="field:'pstatus',width:80,align:'center'">目前状态</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>123</td>
				<td>A计划</td>
				<td>团队A</td>
				<td>2017年8月8日16点16分</td>
				<td>2017年8月18日16点16分</td>
				<td></td>
				<td>进行中</td>
			</tr>
			<tr>
				<td>234</td>
				<td>B计划</td>
				<td>团队B</td>
				<td>2017年8月5日16点16分</td>
				<td>2017年8月18日16点16分</td>
				<td>2017年8月8日16点16分</td>
				<td>已完成</td>
			</tr>
		</tbody>
	</table>
</body>
</html>