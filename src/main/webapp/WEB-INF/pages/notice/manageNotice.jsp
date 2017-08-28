<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript" src="js/ycPageBar.js"></script>
<script type="text/javascript">

	$(function(){
		gopage(1,50);
	});
	function gopage(pages,pagesize){
		$.ajax({
			type:"POST",
			data:"pages="+pages+"&pagesize="+pagesize,
			url:"user/findAllNotice.action",
			dataType:"JSON",
			success:function(data){
				if(data.code== 1){
				 	 $("#manNotice").html("");
					$(data.rows).each(
						function(index,item){
						var str = "<li><h4>";
						str+='<a href="doNoticeDetail.action?nid='+item.nid+'">' +item.ntitle+'</a>'
						str+='<h4></li>';
						$("#manNotice").html($("#manNotice").html()+str);
					}); 
					$.createPageBar(data,"pagebardiv") 
				}else{
					alert("查询失败！原因"+data.msg);
				}
			}
		});
	}
	
	
</script>
<title>公告管理</title>
</head>
<body>
<div>
	<div id="notice" class="wrap">
	<h6>公告列表</h6>
	<!--  <div class="manNotice" id="manNotice" style=" width:25% ;float:left">
		<div id="pagebardiv"></div>
	</div>  -->
	<div style=" width:30% ;float:left;border:1px solid red;background-color:white">
	<input type="hidden" id="ntype" name="ntype" value="通知">
		<p style="font-size:20px;color:red"><center><h1>通知:</h1></center></p>
		<div style="text-align:center"> <c:forEach items="${notice.rows }" var="n">
		<c:if test="${n.ntype eq '通知' }">
		<p><h4><a href="doNoticeDetail.action?nid=${ n.nid}">${n.ntitle }</a></h4></p>
		</c:if>
			
		</c:forEach></div>
	</div>
	<div  style=" width:30% ;float:left;border:1px solid red;margin-left:40px;background-color:white">
	<input type="hidden" id="ntype" name="ntype" value="行政公告">
		<p style="font-size:20px;color:red"><center><h1>行政公告:</h1></center></p>
		<div style="text-align:center"><c:forEach items="${notice.rows }" var="n">
		<c:if test="${n.ntype eq '行政公告' }">
		<p><h4><a href="doNoticeDetail.action?nid=${ n.nid}">${n.ntitle }</a></h4></p>
		</c:if>
			
		</c:forEach></div>
	</div>
	<div  style=" width:30% ;float:left;border:1px solid red;margin-left:40px;background-color:white">
	<input type="hidden" id="ntype" name="ntype" value="部门公告">
		<p style="font-size:20px;color:red"><center><h1>部门公告:</h1></center></p>
		<div style="text-align:center"><c:forEach items="${notice.rows }" var="n">
		<c:if test="${n.ntype eq '部门公告' }">
		<p><h4><a href="doNoticeDetail.action?nid=${ n.nid}">${n.ntitle }</a></h4></p>
		</c:if>
			
		</c:forEach></div>
	</div>
	</div>
	
	
</div>
</body>
</html>