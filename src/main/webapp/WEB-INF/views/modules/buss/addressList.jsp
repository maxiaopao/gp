<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>数据管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/buss/address/">数据列表</a></li>
		<shiro:hasPermission name="buss:address:edit"><li><a href="${ctx}/buss/address/form">数据添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="address" action="${ctx}/buss/address/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>归属用户：</label>
				<sys:treeselect id="user" name="user.id" value="${address.user.id}" labelName="user.name" labelValue="${address.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>归属部门：</label>
				<sys:treeselect id="office" name="office.id" value="${address.office.id}" labelName="office.name" labelValue="${address.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>归属区域：</label>
				<sys:treeselect id="area" name="area.id" value="${address.area.id}" labelName="area.name" labelValue="${address.area.name}"
					title="区域" url="/sys/area/treeData" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>地址：</label>
				<form:input path="address" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>归属用户</th>
				<th>归属部门</th>
				<th>归属区域</th>
				<th>地址</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="buss:address:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="address">
			<tr>
				<td><a href="${ctx}/buss/address/form?id=${address.id}">
					${address.user.name}
				</a></td>
				<td>
					${address.office.name}
				</td>
				<td>
					${address.area.name}
				</td>
				<td>
					${address.address}
				</td>
				<td>
					<fmt:formatDate value="${address.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${address.remarks}
				</td>
				<shiro:hasPermission name="buss:address:edit"><td>
    				<a href="${ctx}/buss/address/form?id=${address.id}">修改</a>
					<a href="${ctx}/buss/address/delete?id=${address.id}" onclick="return confirmx('确认要删除该数据吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>