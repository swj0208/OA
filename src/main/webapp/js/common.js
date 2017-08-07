/**
 * 验证码的获取
 */
function changeVilidateCode(obj) {
	var timenow = new Date().getTime();
	obj.src = "image.jsp?d=" + timenow; 
}