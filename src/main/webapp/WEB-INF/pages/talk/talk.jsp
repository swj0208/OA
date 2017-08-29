<%@page import="com.yc.bean.Chat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	String basePathWS = request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<style type="text/css">
#left {
	width: 20%;
	float: left;
}

#right {
	width: 80%;
	float: right;
}

#content {
	width: 100%;
	height: 90%;
	overflow-y: scroll;
	height: 350px;
}

#chatText{
	margin-left:2px;
	height: 25px;
	width: 85%;
}

#btn{
	height: 25px;
	width:10%;
}

.leftText{
	width: 90%;
	background-color: #DDDDDD;
	margin-left: 20px;
	border: 1px;
	float: ledt;
}

.rightText{
	width: 90%;
	margin-left: 50px;
	background-color: #ABF141;
	border: 1px;
}

.rightName{
	text-align: right;
}

.out{
	width: 100%;
}

.leftUl{
	margin-left: 15px;
	font-size: 15px;
}

.leftLi{
	margin-left: 55px;
	color: #FAC000;
}
.leftLiMe{
	margin-left: 55px;
	color:#FF1493;
}

#onlineCount{
	font-size: 24px;
}


</style>


<script type="text/javascript">
	var path = '<%=basePathWS%>';
	var uid=${users.uid};
	var fromId=uid;
	var fromName='${users.uname}';
	var toUidL;
	var toDidL;
	
	var websocket;
	if ('WebSocket' in window) {
		websocket = new WebSocket("ws://" + path + "/ws");
	} else if ('MozWebSocket' in window) {
		websocket = new MozWebSocket("ws://" + path + "/ws");
	} else {
		websocket = new SockJS("http://" + path + "/ws/sockjs");
	}
	
	websocket.onopen = function(event) {
		console.log("WebSocket:已连接");
		console.log(event);
	};
	
	websocket.onmessage = function(event) {
		/* console.log(event.data); */
		
		try{
			var data=JSON.parse(event.data);
			if(data.fromName!=fromName&&data.fromName!=null&&data.fromName!=""){
				var str="<div class='out'><p class='leftName'>"+data.fromName+"&nbsp;&nbsp;"+data.chatDate+"</p>";
				str+="<div class='leftText'>"+data.chatText+"</div></div>";
				$("#content").append(str);
			}
			if(data.onlineCount!=null&&data.onlineCount!=""){
				$("#onlineCount").empty();
				$("#onlineCount").append(data.onlineCount);
			}
			if(data.userList!=null&&data.userList!=""){
				
				for(var i=0;i<data.userList.length;i++){
					var id=data.userList[i].did;
					$("#leftDid-"+id+"").empty();
				}
				
				for(var i=0;i<data.userList.length;i++){
					var di=data.userList[i].did;
					var ui=data.userList[i].uid;
					var name=data.userList[i].uname;
					if(name==fromName){
						var str='<li class="leftLiMe"><a href="javascript:void(0)" onclick="getUid('+ui+',\''+name+'\')">'+data.userList[i].uname+'</a></li>';
					}else{
						
					var str='<li class="leftLi"><a href="javascript:void(0)" onclick="getUid('+ui+',\''+name+'\')">'+data.userList[i].uname+'</a></li>';
					}
					
					$("#leftDid-"+di+"").append(str);
					
				}
			}
		}catch (e) {
			
		}
		scrollToBottom();
	};
	
	websocket.onerror = function(event) {
		alert("通信失去连接，请刷新重试...");
		
		console.log("WebSocket:发生错误 ");
		console.log(event);
	};
	
	websocket.onclose = function(event) {
		$.messager.show({
			title : '温馨提示',
			msg : '您已下线！',
			timeout : 0,
			showType : 'slide'
		});
		console.log("WebSocket:已关闭");
		console.log(event);
	}
	
	function sendMsg(){
		var v=$("#chatText").val();
		if(v==""){
			return;
		}else{
			var data={};
			data["fromId"]=fromId;
			data["fromName"]=fromName;
			if($("#toUid").val()==''){
				data["toUid"]=null;
			}else{
				data["toUid"]=$("#toUid").val();
				if(fromId==$("#toUid").val()){
					alert("请不要选择自己为会话对象！");
					return;
				}
			}
			if($("#toDid").val()==''){
				data["toDid"]=null;
			}else{
				data["toDid"]=$("#toDid").val();	
			}
			if(data["toUid"]==null&&data["toDid"]==null){
				alert("请选择会话对象！");
				return ;
			}
			data["chatText"]=v;
			var str="<div class='out'><p class='rightName'>我&nbsp;&nbsp;"+new Date().Format("yyyy-MM-dd hh:mm:ss")+"</p>";
			str+="<div class='rightText'>"+data.chatText+"</div></div>";
			$("#content").append(str);
			scrollToBottom();
			websocket.send(JSON.stringify(data));
			$('#chatText').val("");
		}
	}
	
	function scrollToBottom(){
		var div = document.getElementById('content');
		div.scrollTop = div.scrollHeight;
	}
	

	function clearAll() {
		$("#content").empty();
	}

	function exit() {
		console.log("WebSocket:已关闭");
		websocket.close();
		location.href = "../index.jsp";
	}
	
	function getDid(did,department){	
		$('#toDid').val(did);
		$('#toUid').val(null);
		
		$('#with').empty();
		$("#with").append(department+"：");
	}
	function getUid(uid,uname){
		$('#toUid').val(uid);
		$('#toDid').val(null);
		
		$('#with').empty();
		$("#with").append(uname+"：");

	}
</script>

<!-- 左边 -->
<div id="left">
	当前在线人数：<b><label id="onlineCount"></label></b> <br>
	<div id="userList">
		<c:forEach items="${Department }" var="d">
			<div>
				<ul class="leftUl">
					<a href="javascript:void(0)" onclick="getDid(${d.did },'${d.department}')">${d.department}</a>
				</ul>
				
				<div id="leftDid-${d.did }">
				
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<!-- 右边 -->
<div  id="right">
	<input type="hidden" id="toUid">
	<input type="hidden" id="toDid">
	<div style="background-color: #D7D6D2">
		<span id="with" style="color: #DD22DD;font-size: 15px;"></span>
	</div>
	<div id="content">
	
	</div>
	

	<input type="text" placeholder="请输入要发送的信息" id="chatText">
	<input type="button" value="发送" id="btn" onclick="sendMsg()">
</div>