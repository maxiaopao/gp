<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>数据管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/buss/expense/">数据列表</a></li>
		<li class="active"><a href="${ctx}/buss/expense/form?id=${expense.id}">数据<shiro:hasPermission name="buss:expense:edit">${not empty expense.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="buss:expense:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="expense" action="${ctx}/buss/expense/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">日期：</label>
			<div class="controls">
				<input name="expenseDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${expense.expenseDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">出发地：</label>
			<div class="controls">
				<form:select path="fromAddress" class="input-medium required">
					<form:option value="" label="请选择"/>
					<form:options items="${addressList}" itemLabel="address" itemValue="address" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">目的地：</label>
			<div class="controls">
				<form:select path="toAddress" class="input-medium required">
					<form:option value="" label="请选择"/>
					<form:options items="${addressList}" itemLabel="address" itemValue="address" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">事由：</label>
			<div class="controls">
				<form:textarea path="reason" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">加班时间：</label>
			<div class="controls">
				<input name="overtime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="${expense.overtime}"
					onclick="WdatePicker({dateFmt:'HH:mm',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		
		
		<div class="control-group">
			<label class="control-label">公交：</label>
			<div class="controls">
				<form:input path="busPrice" htmlEscape="false" maxlength="11" class="input-xlarge digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地铁：</label>
			<div class="controls">
				<form:input path="metroPrice" htmlEscape="false" maxlength="11" class="input-xlarge digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">出租车：</label>
			<div class="controls">
				<form:input path="taxiPrice" htmlEscape="false" maxlength="11" class="input-xlarge digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">误餐费：</label>
			<div class="controls">
				<form:select path="mealPrice" class="input-medium required">
					<form:option value="20" label="20"/>
					<form:option value="40" label="40"/>
					<form:option value="60" label="60"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="buss:expense:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>