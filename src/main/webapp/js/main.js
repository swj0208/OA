$(function() {
	
	//审批流转
	var approvalTree = [
			{
				"text" : "起草申请",
				"attributes" : {
					"url" : "<iframe width='100%' height='100%'  frameborder='0' src='toShowNewApproval.action'/>"
				}
			},
			{
				"text" : "我的申请",
				"attributes" : {
					"url" : "<iframe width='100%' height='92%' frameborder='0' src='toShowPlan.action'/>"
				}
			},
			{
				"text" : "待我审批",
				"attributes" : {
					"url" : "<iframe width='100%' height='100%' frameborder='0' src='toTalk.action'/>"
				}
			},
			{
				"text" : "经我审批",
				"attributes" : {
					"url" : "<iframe width='100%' height='100%' frameborder='0' src='toTalk.action'/>"
				}
			},
			{
				"text" : "我的承办",
				"attributes" : {
					"url" : "<iframe width='100%' height='100%' frameborder='0' src='toTalk.action'/>"
				}
			},
			{
				"text" : "审批数据查询",
				"attributes" : {
					"url" : "<iframe width='100%' height='100%' frameborder='0' src='toTalk.action'/>"
				}
			}

	];
	
	
	
	// 行政管理
	var PoTreeData = [ /*
	 * { "text" : "待办事宜", "state" : "closed", "data":[
	 */
	                   {
	                	   "text" : "查看计划",
	                	   "attributes" : {
	                		   "url" : "<iframe width='100%' height='100%'  frameborder='0' src='toShowPlan.action'/>"
	                	   }
	                   },
	                   {
	                	   "text" : "工作日志",
	                	   "attributes" : {
	                		   "url" : "<iframe width='100%' height='92%' frameborder='0' src='toShowPlaned.action'/>"
	                	   }
	                   },
	                   {
	       				"text" : "聊天",
	       				"attributes" : {
	       					"url" : "<iframe width='100%' height='100%' frameborder='0' src='toTalk.action'/>"
	       					}
	       				}

	                   /*
	                    * "children" : [ { "text" : "查看计划", "attributes" : { "url" : "<iframe
	                    * width='100%' height='100%' src='toShowPlan.action'/>" } }, { "text" :
	                    * "工作日志", "attributes" : { "url" : "<iframe width='100%' height='100%'
	                    * src='toShowPlan.action'/>" } }, { "text" : "报表管理", "attributes" : { "url" : "<iframe
	                    * width='100%' height='100%' src='toShowPlan.action'/>" } } ] }
	                    */
	                   ];
	
	
	
	
	
	// 信息系统
	var noticeTreeData = [ {
		"text" : "信息管理",
		"state" : "closed",
		"children" : [
		              {
		            	  "text" : "发布消息",
		            	  "attributes" : {
		            		  "url" : "<iframe width='100%' height='100%' frameborder='0' src='toAddNotice.action'/>"
		            	  }
		              },
		              {
		            	  "text" : "消息管理",
		            	  "attributes" : {
		            		  "url" : "<iframe width='100%' height='100%' frameborder='0' src='toManageNotice.action'/>"
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
		            		  "url" : "<iframe width='100%' height='100%' src='user/toUploadFile.action'/>"
		            	  }
		              },
		              {
		            	  "text" : "查看所有文件",
		            	  "attributes" : {
		            		  "url" : "<iframe width='100%' height='100%' src='user/toShowFile.action'/>"
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
	var userpowerTreeData = [ {
		"text" : "人员管理",
		"state" : "closed",
		"children" : [
		              {
		            	  "text" : "添加人员",
		            	  "attributes" : {
		            		  "url" : 

		            			  "<iframe width='100%' height='100%' src='toAddUser.action'/>"
		            	  }
		              },
		              {
		            	  "text" : "人员列表",
		            	  "attributes" : {
		            		  "url" : 

		            			  "<iframe width='100%' height='100%'  src='toManUser.action'/>"
		            	  }

		              }]
	}];

	showTree("PoTree", PoTreeData);
	showTree("approvalTree", approvalTree);
	showTree("noticeTree", noticeTreeData);
	showTree("planTree", planTreeData);
	showTree("userTree", userTreeData);
	showTree("fileTree", fileTreeData);
	showTree("powerTree", powerTreeData);
	showTree("userpowerTree", userpowerTreeData);
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

			/*
			 * url : node.attributes.url, tools : [ { iconCls : 'icon-cancel',
			 * handler : function() { $(this).panel("close"); } } ],
			 */
			// href:node.attributes.url
			content : node.attributes.url
		})
	}
}

//function setIframeHeight(iframe) {
//	if (iframe) {
//		var iframeWin = iframe.contentWindow
//		|| iframe.contentDocument.parentWindow;
//		if (iframeWin.document.body) {
//			iframe.height = iframeWin.document.documentElement.scrollHeight
//			|| iframeWin.document.body.scrollHeight;
//		}
//	}
//};