<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script type="text/javascript">
	$(function(){
		var treeData=[{
			"text":"类别管理",
			"state":"closed",
			"children":[{
				"text":"新增类别",
				"attributes":{
					"url":"<iframe width='100%' height='100%' src='back/manager/newstype/addType.jsp'/>"
				}
				},{
				"text":"类别维护",
				"attributes":{
					"url":"<iframe width='100%' height='100%' src='back/manager/newstype/manType.jsp'/>"
				}
			}]
		}];
		var treeDataNews=[{
			"text":"新闻管理",
			"state":"closed",
			"children":[{
				"text":"新增新闻",
				"attributes":{
					"url":"<iframe width='100%' height='100%' src='back/manager/news/addNews.jsp'/>"
				}
				},{
				"text":"新闻维护",
				"attributes":{
					"url":"<iframe width='100%' height='100%' src='back/manager/news/manNews.jsp'/>"
				}
			}]
		}];
		var treeDataUser=[{
			"text":"用户管理",
			"state":"closed",
			"children":[{
				"text":"新增用户",
				"attributes":{
					"url":"<iframe width='100%' height='100%' src='back/manager/users/addUsers.jsp'/>"
				}
				},{
				"text":"用户维护",
				"attributes":{
					"url":"<iframe width='100%' height='100%' src='back/manager/users/manUsers.jsp'/>"
				}
			
			}]
		}];

	
		showTree("newsTypeTree",treeData);
		showTree("newsTree",treeDataNews);
		showTree("usersTree",treeDataUser);
	})
	//----------------------------------------------------------
	function showTree(treeId,data){
		$("#"+treeId).tree({
			data:data,  //将这里改成：url:"right.action" 这个地址会得到一个上面  treeData这样的字符串
			onClick:function(node){
				if(node.attributes){
					openTab(node);
				}
			}
		});
	};
	function openTab(node){
		if( $("#mainTt").tabs("exists",node.text) ){
			$("#mainTt").tabs("select",node.text);
		}else{
			$("#mainTt").tabs("add",{
				title:node.text,
				select:true,
				closed:true,
				url: node.attributes.url,
				tools:[{
					iconCls:'icon-cancel',
					handler:function(){
						$(this).panel("close");
					}
				}],
				//href:node.attributes.url
				content:node.attributes.url
			})
		}
	}
</script>
<title>OA在线办公系统欢迎您</title>
</head>
<body class="easyui-layout layout panel-noscroll">
		<div data-options="region:'north'" style="height:100px">top</div>
		<div data-options="region:'south',split:true" style="height:50px">button</div>
		<div data-options="region:'east',split:true" title="East" style="width:200px">right</div>
		<div data-options="region:'west',split:true" title="West" style="width:150px">
		 		<!-- <div id="westpanel"></div> 使用panel-->
			<div class="easyui-accordion" style="width:500px;height:300px;">
			
				<div title="行政管理" style="overflow:auto;padding:10px;">
					<ul id="newsTypeTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
					</ul>
    			</div>
			    <div title="人事档案" style="overflow:auto;padding:10px;">
					<ul id="newsTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
					</ul>
    			</div>
    			<div title="信息系统" style="overflow:auto;padding:10px;">
					<ul id="usersTree" class="easyui-tree" data-options="animate:true,state:closed,fit:true">
					</ul>
    			</div>
			    <div title="个人中心" style="overflow:auto;padding:10px;">
    			</div>
    			<div title="权限管理" style="overflow:auto;padding:10px;">
    			</div>
			</div>
			
		</div>
		<div data-options="region:'center',title:'主操作区',iconCls:'icon-ok'">
			<!--  tabs区，有很多的tabs -->
			<div id="mainTt" class="easyui-tabs" fit="true" border="false">
				<div title="待处理业务区">源辰信息，欢迎您</div>
			</div>
		</div>
</body>
</html>