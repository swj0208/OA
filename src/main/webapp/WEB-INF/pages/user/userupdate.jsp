<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<div id="update_dlg" title="修改员工资料"
	style="display: none; padding: 10px; width: 400px;">
	<form id="updateUserForm" action="" method="post" >
			<div style="text-align:left;">
				<input type="hidden" name="uid" /> 
			  <div>所属部门：
				<select  name="did" id="did" onchange="onchangedepartment(this.value)">
					<option></option>
					<c:forEach items="${Department }" var="d">
					<option value="${d.did }">${d.department}</option>
					</c:forEach>
				</select> 	
				<br/>	
				所属小组：
				<select   name="gid" id="gid" >	
				</select><br/>
				</div> 
				 状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:<select  name="ustatus" id="ustatus">
					<option value="正常">正常</option>
					<option value="请假">请假</option>
					<option value="出差">出差</option>
				
				</select><br/>
				<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="updateForm()" style="width: 80px">提交修改</a>
			</div>
		</form>

</div>