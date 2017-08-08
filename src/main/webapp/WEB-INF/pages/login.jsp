<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- CSS -->
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
<link rel="stylesheet" href="assets/css/reset.css">
<link rel="stylesheet" href="assets/css/supersized.css">
<link rel="stylesheet" href="assets/css/style.css">
<script src="assets/js/jquery-1.8.2.min.js"></script>
<script src="assets/js/supersized.3.2.7.min.js"></script>
<script src="assets/js/supersized-init.js"></script>
<script src="assets/js/scripts.js"></script>
</head>
<script>
	$(function() {
		$("#button").click(function() {
			$.ajax({
				type : "POST",
				data : $("#login").serialize(),
				url : "users_login.action",
				dataType : "JSON",
				success : function(data) { //ajax  ->  jsonModel
					if (data.code == 1) {
						alert("登录成功！");
						location.href = "toMain.action";
					} else {
						alert("登录失败！原因" + data.msg);
					}
				}
			});
		});
	});
</script>
<body>
	<div class="page-container">
		<h1>Login</h1>
		<form id="login" method="post">
			<input type="text" name="uname" class="username" placeholder="Username">
			<input type="password" name="upwd" class="password" placeholder="Password">
			<input type="text" name="zccode" id="zccode" class="username" placeholder="Zccode" />
			<img src="image.jsp" onclick="changeVilidateCode(this)" border="0" title="点击刷新验证码" size="10" />
			<button id="button" type="button">Sign me in</button>
			<div class="error">
				<span>+</span>
			</div>
		</form>
	</div>
	<!-- Javascript -->
</body>
</html>
