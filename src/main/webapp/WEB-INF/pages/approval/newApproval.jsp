<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script type="text/javascript">
	function showRight(){
		//$("#right").ht
		
	}

</script>

<!-- 左边 -->
<div style="width: 20%; float: left;">

	<div class="easyui-panel" style="border: 0px;overflow-y: hidden;">
		<ul class="easyui-tree">

			<li>
				<span>财务类</span>
				<ul>
					<li><span><a>差旅费用报销单</a></span></li>
					<li><span><a>借支单</a></span></li>
					<li><span><a>部门预算申请表</a></span></li>
					<li><span><a>费用报销单</a></span></li>
					<li><span><a>费用支出报销单</a></span></li>
					<li><span><a>业务招待费用申请单</a></span></li>
					<li><span><a>请款单</a></span></li>
				</ul>
			</li>
			<li>
				<span>人事类</span>
				<ul>
					<li><span><a>转正申请单</a></span></li>
					<li><span><a>离职申请单</a></span></li>
					<li><span><a>调薪申请单</a></span></li>
				</ul>
			</li>
			<li>
				<span>行政类</span>
				<ul>
					<li><span><a>项目任务单</a></span></li>
				</ul>
			</li>
			<li>
				<span>考勤类</span>
				<ul>
					<li><span><a>加班申请单</a></span></li>
					<li><span><a>请假申请单</a></span></li>
					<li><span><a>销假申请单</a></span></li>
					<li><span><a>调休申请单</a></span></li>
					<li><span><a>出差申请单</a></span></li>
				</ul>
			</li>
			<li>
				<span>业务类</span>
				<ul>
					<li><span><a>报价审批单</a></span></li>
					<li><span><a>设备采购单</a></span></li>
					<li><span><a>设备维护申请单</a></span></li>
					<li><span><a>工作报告</a></span></li>
				</ul>
			</li>
			<li>
				<span>合同类</span>
				<ul>
					<li><span><a>合同审批单</a></span></li>
				</ul>
			</li>
			<li data-options="state:'closed'">
				<span>其它类</span>
				<ul>
					<li><span><a>待补充...</a></span></li>
				</ul>
			</li>
			
			
		</ul>
	</div>
</div>

<!-- 右边 -->
<div id="right" style="width: 80%; background-color: lime; float: right;">
	<!-- 差旅费用报销单 -->
	<form>
		报销部门：<label id="department">业务部</label>
		<span style="margin-left: 200px;margin-bottom: 2px">
			<input class="easyui-datebox" label="报销日期："  style="width:200px;">
		</span><br>
		<div style="margin-bottom: 2px">
			<input class="easyui-textbox" name="message"
				style="width: 90%; height: 60px"
				data-options="label:'出差任务:',multiline:true">
		</div><br>
		<span style="margin-bottom: 2px">
			<input class="easyui-datebox" label="出发日期："  style="width:200px;">
		</span>
		<span style="margin-left: 50px">
			<input class="easyui-datebox" label="回归日期："  style="width:200px;">
		</span>
		<span style="margin-left: 50px">
			<input class="easyui-textbox" label="目的地："  style="width:200px;">
		</span><br>
		
		机票费:<input type="text"><br>
		车船费：<input type="text"><br>
		市内交通费：<input type="text"><br>
		住宿费：<input type="text"><br>
		出差补助：<input type="text"><br>
		其它：<input type="text"><br>
		总计：<input type="text"><br>
		报销金额：<input type="text"><br>
		申请人：<input type="text"><br>
		部门负责人<input type="text"><br>
		总经理：<input type="text"><br>
		申请人备注：<input type="text"><br>
		部门负责人批注：<input type="text"><br>
		总经理批注：<input type="text"><br>
		<input type="button" value="提交申请">
		
	</form>


</div>




</body>
</html>