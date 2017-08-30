<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%-- <%@ include file="talk/talk.jsp"%> --%>
<script type="text/javascript" src="js/main.js"></script>

<title>OA在线办公系统欢迎您</title>

<style type="text/css">
iframe {
	width: 100%;
	height: 100%;
	/*第二种解决方案*/
	/*vertical-aglin:top;*/
	/*vertical-align:bottom;*/
	/*第三种解决方案*/
	display: block;
}
</style>

<body class="easyui-layout layout panel-noscroll">
	<div data-options="region:'north'" style="height: 100px">top</div>
	<div data-options="region:'south',split:true" style="height: 50px">button</div>
	<div data-options="region:'east',split:true" title="East" style="width: 200px">
		
	
	</div>
	<div data-options="region:'west',split:true" title="工具栏" style="width: 150px">
		<!-- <div id="westpanel"></div> 使用panel-->
		<div class="easyui-accordion" style="width: auto; height: 100%;">
			<div title="任务计划" style="overflow: auto; padding: 10px;">
				<ul id="PoTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
				</ul>
			</div>
			 <!--<div title="审批流转" style="overflow: auto; padding: 10px;">
				<ul id="approvalTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
				</ul>
			</div>--> 
			<div title="信息系统" style="overflow: auto; padding: 10px;">
				<ul id="messageTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
				</ul>
			</div>
			<div title="公告管理" style="overflow: auto; padding: 10px;">
				<ul id="noticeTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
				</ul>
			</div>
			<div title="个人中心" style="overflow: auto; padding: 10px;">
				<ul id="userTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
				</ul>
				<ul id="meSendMessageTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
				</ul>
				<ul id="meSendFileTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
				</ul>
				<!-- <ul id="meSendDocumentTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
				</ul> -->
			</div>
			<div title="文件共享" style="overflow: auto; padding: 10px;">
				<ul id="fileTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
				</ul>
			</div>
			<div title="权限管理" style="overflow: auto; padding: 10px;">
				<ul id="powerTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
				</ul>
				<ul id="userpowerTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
				</ul>
			</div>
			<div title="公文管理" style="overflow: auto; padding: 10px;">
				<ul id="documentTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
				</ul>
			</div>
			<div title="在线会话" style="overflow: auto; padding: 10px;">
				<ul id="websocketTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
				</ul>
			</div>
		
			
		</div>
	</div>
	<div data-options="region:'center',title:'主操作区',iconCls:'icon-ok'">
		<!--  tabs区，有很多的tabs -->
		<div id="mainTt" class="easyui-tabs" fit="true" border="false">
			<div title="待处理业务区">在线OA欢迎您</div>
		</div>
	</div>
</body>
</html>