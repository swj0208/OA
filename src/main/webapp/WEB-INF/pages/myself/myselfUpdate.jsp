<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<div id="update_dlg" title="修改员工资料"
	style="display: none; padding: 10px; width: 400px;">
	<form id="updateUserForm" action="" method="post" >
				<input type="hidden" name="uid"  />			
			<table width="100%" border="0">
				<tr>
					<td width="15%">&nbsp;</td>
					<td width="12%">&nbsp;</td>
					<td width="29%">&nbsp;</td>
					<td width="44%">&nbsp;</td>
				</tr>
				
				
				<tr>
					<td>&nbsp;</td>
					<td valign="middle" align="center">新密码：</td>
					<td ><input type="password" id="pwd" name="pwd"   
						></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="middle" align="center">确认新密码：</td>
					<td ><input type="password" name="repwd" id="repwd"
						></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td valign="middle" align="center">验证码：</td>
					<td ><input type="text" name="valcode" 
						>
						<img  src="image.jsp" onclick="changeVilidateCode(this)" border="0" title="点击图片刷新验证码" size="10"/>
						</td>
					<td>&nbsp;</td>
				</tr>
				
				<tr>
					<td>&nbsp;</td>
					<td >
					<a href="javascript:void(0)"  onclick="updateForm()" style="width: 80px;font-size:15px;background-color:red">提交修改</a>
					</td>
					<td>&nbsp;</td>
				</tr>
				
				
				
				<tr>
					<td height="33">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr height="33" cospan="4">
				<td>${jm.msg }</td>
				</tr>
				
			</table>
		</form>

</div>