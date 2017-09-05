<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style type="text/css">
.class{
	font-size:20px;
	color: orange;
}


</style>
<script type="text/javascript" src="js/ycPageBar.js"></script>
<script type="text/javascript">

	$(function(){
		$.ajax({
			type:"POST",
			url:"user/findAllNotice.action",
			//data:"pages="+pages+"&pagesize="+pagesize,
			dataType:"JSON",
			success:function(data){
				 if(data.code== 1){
				 	// $("#manNotice").html("");
					  $(data.rows).each(
						function(index,item){
						if(item.ntype=='通知'){
							var str1='<p><h4><a href="doNoticeDetail.action?nid='+item.nid+'"><span class="class">'+item.ntitle+'</span>['+item.publictime+']</a></h4></p>';
							
							$("#div_1").append(str1);
						}else if(item.ntype=='行政公告'){
							var str1='<p><h4><a href="doNoticeDetail.action?nid='+item.nid+'"><span class="class">'+item.ntitle+'</span>['+item.publictime+']</a></h4></p>';							
							$("#div_2").append(str1);
						}else if(item.ntype=='部门公告'){
							var str1='<p><h4><a href="doNoticeDetail.action?nid='+item.nid+'"><span class="class">'+item.ntitle+'</span>['+item.publictime+']</a></h4></p>';							
							$("#div_3").append(str1);
						}
					}); 
				}else{
					alert("查询失败！原因"+data.msg);
				} 
			}
		});
	});
	
	function refresh(){
		location.href="toManageNotice.action";
	}
	
</script>
<title>公告管理</title>
</head>
<body>
<div>
	<div id="notice" class="wrap">
	<div><h3>公告列表</h3><input type="button" onclick="refresh()" value="刷新"/></div>
	<div style=" width:30% ;float:left;border:1px solid red;background-color:white">
	<input type="hidden" id="ntype" name="ntype" value="通知">
		<p style="font-size:20px;color:red"><center><h1>通知</h1></center></p>
		<div style="text-align:center" id="div_1"> 
		</div>
	</div>
	<div  style=" width:30% ;float:left;border:1px solid red;margin-left:40px;background-color:white">
	<input type="hidden" id="ntype" name="ntype" value="行政公告">
		<p style="font-size:20px;color:red"><center><h1>行政公告</h1></center></p>
		<div style="text-align:center"id="div_2">
		</div>
	</div>
	<div  style=" width:30% ;float:left;border:1px solid red;margin-left:40px;background-color:white">
	<input type="hidden" id="ntype" name="ntype" value="部门公告">
		<p style="font-size:20px;color:red"><center><h1>部门公告</h1></center></p>
		<div style="text-align:center" id="div_3"></div>
	</div>
	</div>
	
	
	
</div>
</body>
</html>