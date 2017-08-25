<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	String basePathWS = request.getServerName() + ":"
			+ request.getServerPort() + path + "/";
%>


<style>
textarea {
	height: 300px;
	width: 100%;
	resize: none;
	outline: none;
}

input[type=button] {
	float: right;
	margin: 5px;
	width: 50px;
	height: 35px;
	border: none;
	color: white;
	font-weight: bold;
	outline: none;
}

.clear {
	background: red;
}

.send {
	background: green;
}

.clear:active {
	background: yellow;
}

.send:active {
	background: yellow;
}

.msg {
	width: 90%;
	height: 25px;
	outline: none;
}

#content {
	border: 1px solid gray;
	width: 100%;
	height: 90%;
	overflow-y: scroll;
}

.from {
	background-color: green;
	width: 80%;
	border-radius: 10px;
	height: 30px;
	line-height: 30px;
	margin: 5px;
	float: left;
	color: white;
	padding: 5px;
	font-size: 22px;
}

.to {
	background-color: gray;
	width: 80%;
	border-radius: 10px;
	height: 30px;
	line-height: 30px;
	margin: 5px;
	float: right;
	color: white;
	padding: 5px;
	font-size: 22px;
}

.name {
	color: gray;
	font-size: 12px;
}

.tmsg_text {
	color: white;
	background-color: #bdcfe6;
	font-size: 18px;
	border-radius: 5px;
	padding: 2px;
}

.fmsg_text {
	color: white;
	background-color:#eaf0f7;
	font-size: 18px;
	border-radius: 5px;
	padding: 2px;
}

.sfmsg_text {
	color: white;
	background-color: #f99e95;
	font-size: 18px;
	border-radius: 5px;
	padding: 2px;
}

.tmsg {
	clear: both;
	float: right;
	width: 80%;
	text-align: right;
}

.fmsg {
	clear: both;
	float: left;
	width: 80%;
}
</style>

<script type="text/javascript">
	var path = '<%=basePathWS%>';
	var uid=${users.uid};
	if(uid==null){
		alert("您没有登录，请登录后继续...");
	}
	var from=uid;
	var fromName='${users.uname}';
	alert(from);
	alert(fromName);
	var to=uid==1?2:1;
	
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
		var textCss=data.from==-1?"sfmsg_text":"fmsg_text";
		$("#content").append("<div class='fmsg'><label class='name'>"+data.fromName+"&nbsp;"+data.date+"</label><div class='"+textCss+"'>"+data.text+"</div></div>");
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
		var v=$("#msg").val();
		if(v==""){
			return;
		}else{
			var data={};
			data["from"]=from;
			data["fromName"]=fromName;
			data["to"]=to;
			data["text"]=v;
			websocket.send(JSON.stringify(data));
			$("#content").append("<div class='tmsg'><label class='name'>我&nbsp;"+new Date().Format("yyyy-MM-dd hh:mm:ss")+"</label><div class='tmsg_text'>"+data.text+"</div></div>");
			scrollToBottom();
			$("#msg").val("");
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

<div id="w" class="easyui-window" title="聊天框"
	data-options="iconCls:'icon-save',closed:true"
	style="width: 700px; height: 350px; padding: 2px;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'east',split:true" style="width: 150px">
			右边
		
		</div>
		<div data-options="region:'center'" style="padding: 2px;">
			<div id="content"></div>
			
			
				<input type="text" placeholder="请输入要发送的信息" id="msg" class="msg" onkeydown="send(event)">
				
				<a class="easyui-linkbutton" href="javascript:void(0)" onclick="sendMsg()">发送</a>
				<!-- <a class="easyui-linkbutton" href="javascript:void(0)" onclick="clearAll()" style="width: 100px">清空</a>
				<a class="easyui-linkbutton" href="javascript:void(0)" onclick="exit()" style="width: 100px">退出</a> -->
			
		
		</div>
		<div data-options="region:'south',border:false"
			style="text-align: right; padding: 2px 0 0;height: 30px">
			
			<input type="text" style="height: 22px;width: 80%" >
			
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
				href="javascript:void(0)" onclick="javascript:alert('ok')" 
				style="width: 100px">管理员发送</a> 
			<!-- <a class="easyui-linkbutton"
				data-options="iconCls:'icon-cancel'" href="javascript:void(0)"
				onclick="javascript:alert('cancel')" style="width: 80px">Cancel</a> -->
		</div>
	</div>
</div>
