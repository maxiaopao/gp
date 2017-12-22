<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>数据管理</title>
	<meta name="decorator" content="default"/>
	<link href="${ctx}/static/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />
	<script src="${ctx}/static/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			
		});
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="expense" action="" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">日期：</label>
			<div class="controls">
				<input name="expenseDate" id="expenseDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
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
	</form:form>
</body>
</html>