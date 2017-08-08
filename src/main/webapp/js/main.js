$(function() {
		// 行政管理
		var PoTreeData = [ {
			"text" : "待办事宜",
			"state" : "closed",
			"children" : [
					{
						"text" : "查看计划",
						"attributes" : {
							"url" : "<iframe width='100%' height='100%' src='toShowPlan.action'/>"
						}
					},
					{
						"text" : "工作日志",
						"attributes" : {
							"url" : "<iframe width='100%' height='100%' src='toShowPlan.action'/>"
						}
					},
					{
						"text" : "报表管理",
						"attributes" : {
							"url" : "<iframe width='100%' height='100%' src='toShowPlan.action'/>"
						}
					}
					]

		} ];
		// 信息系统
		var noticeTreeData = [ {
			"text" : "信息管理",
			"state" : "closed",
			"children" : [
					{
						"text" : "发布消息",
						"attributes" : {
							"url" : "<iframe width='100%' height='100%' src='toAddNotice.action'/>"
						}
					},
					{
						"text" : "消息显示",
						"attributes" : {
							"url" : "<iframe width='100%' height='100%' src='toShowNotice.action'/>"
						}
					} ]
		} ];
		var planTreeData = [ {
			"text" : "任务管理",
			"state" : "closed",
			"children" : [
					{
						"text" : "新增任务",
						"attributes" : {
							"url" : "<iframe width='100%' height='100%' src='toaddPlan.action'/>"
						}
					},
					{
						"text" : "查看任务",
						"attributes" : {
							"url" : "<iframe width='100%' height='100%' src='toshowUsers.action'/>"
						}

					} ]
		} ];
		var userTreeData = [ {
			"text" : "个人管理",
			"state" : "closed",
			"children" : [ {
				"text" : "修改个人信息",
				"attributes" : {
					"url" : "<iframe width='100%' height='100%' src='toUpdateSelf.action'/>"
				}
			} ]
		} ];
		var fileTreeData = [ {
			"text" : "文件中心",
			"state" : "closed",
			"children" : [
					{
						"text" : "上传文件",
						"attributes" : {
							"url" : "<iframe width='100%' height='100%' src='toUploadFile.action'/>"
						}
					},
					{
						"text" : "查看所有文件",
						"attributes" : {
							"url" : "<iframe width='100%' height='100%' src='toshowFile.action'/>"
						}

					} ]
		} ];
		var powerTreeData = [ {
			"text" : "权限中心",
			"state" : "closed",
			"children" : [
					{
						"text" : "查看权限",
						"attributes" : {
							"url" : "<iframe width='100%' height='100%' src='toShowPower.action'/>"
						}
					},
					{
						"text" : "修改权限",
						"attributes" : {
							"url" : "<iframe width='100%' height='100%' src='toUpdatePower.action'/>"
						}

					} ]
		} ];

		showTree("PoTree", PoTreeData);
		showTree("noticeTree", noticeTreeData);
		showTree("planTree", planTreeData);
		showTree("userTree", userTreeData);
		showTree("fileTree", fileTreeData);
		showTree("powerTree", powerTreeData);
	});
	function showTree(treeId, data) {
		$("#" + treeId).tree({
			data : data, // 将这里改成：url:"right.action" 这个地址会得到一个上面 treeData这样的字符串
			onClick : function(node) {
				if (node.attributes) {
					openTab(node);
				}
			}
		});
	};
	function openTab(node) {
		if ($("#mainTt").tabs("exists", node.text)) {
			$("#mainTt").tabs("select", node.text);
		} else {
			$("#mainTt").tabs("add", {
				title : node.text,
				selected : true,
				closable : true,
				
				/* url : node.attributes.url,
				tools : [ {
					iconCls : 'icon-cancel',
					handler : function() {
						$(this).panel("close");
					}
				} ],*/ 
				// href:node.attributes.url
				content : node.attributes.url
			})
		}
	}