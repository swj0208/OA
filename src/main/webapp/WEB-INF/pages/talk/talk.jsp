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
	background-color: fuchsia;
}

#right {
	width: 80%;
	float: right;
}

#content {
	width: 100%;
	height: 90%;
	overflow-y: scroll;
	height: 400px;
	background-color: lime;
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
</style>

<script type="text/javascript">
	var path = '<%=basePathWS%>';
	var uid=${users.uid};
	var fromId=uid;
	var fromName='${users.uname}';
	alert(fromId);
	alert(fromName);
	
	var websocket;
	if ('WebSocket' in window) {
		websocket = new WebSocket("ws://" + path + "/ws?uid="+uid);
	} else if ('MozWebSocket' in window) {
		websocket = new MozWebSocket("ws://" + path + "/ws"+uid);
	} else {
		websocket = new SockJS("http://" + path + "/ws/sockjs"+uid);
	}
	websocket.onopen = function(event) {
		console.log("WebSocket:已连接");
		console.log(event);
	};
	websocket.onmessage = function(event) {
		var data=JSON.parse(event.data);
		console.log("WebSocket:收到一条消息",data);
		var textCss=data.fromId==-1?"sfmsg_text":"fmsg_text";
		$("#content").append("<div class='fmsg'><label class='name'>"+data.fromName+"&nbsp;"+data.chatDate+"</label><div class='"+textCss+"'>"+data.chatText+"</div></div>");
		scrollToBottom();
	};
	websocket.onerror = function(event) {
		console.log("WebSocket:发生错误 ");
		console.log(event);
	};
	websocket.onclose = function(event) {
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
			data["toUid"]=toUid;
			data["toDid"]=toDid;
			data["chatText"]=v;
			websocket.send(JSON.stringify(data));
			$("#content").append("<div class='tmsg'><label class='name'>我&nbsp;"+new Date().Format("yyyy-MM-dd hh:mm:ss")+"</label><div class='tmsg_text'>"+data.chatText+"</div></div>");
			scrollToBottom();
			$("#chatText").val("");
		}
	}
	
	function scrollToBottom(){
		var div = document.getElementById('content');
		div.scrollTop = div.scrollHeight;
	}
	
	Date.prototype.Format = function (fmt) { //author: meizz 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
	
	function send(event){
		var code;
		 if(window.event){
			 code = window.event.keyCode; // IE
		 }else{
			 code = event.which; // Firefox
		 }
		if(code==13){ 
			sendMsg();            
		}
	}
	
	function clearAll(){
		$("#content").empty();
	}
	
	function exit(){
		console.log("WebSocket:已关闭");
		websocket.close();
		location.href="../index.jsp";
	}

</script>

<!-- 左边 -->
<div id="left">
	当前在线人数：<label></label> <br>

</div>

<!-- 右边 -->
<div id="right">
	<form action="">
		<input type="hidden" id="toUid">
		<input type="hidden" id="toDid">
		
		<div id="content"></div>
		<input type="text" placeholder="请输入要发送的信息" id="chatText">
		<input type="submit" value="发送" id="btn">
	</form>
</div>