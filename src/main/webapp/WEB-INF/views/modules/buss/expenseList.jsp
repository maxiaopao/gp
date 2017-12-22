<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>数据管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出报销数据吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/buss/expense/exportExcel");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
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
		<li class="active"><a href="${ctx}/buss/expense/">数据列表</a></li>
		<shiro:hasPermission name="buss:expense:edit"><li><a href="${ctx}/buss/expense/form">数据添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="expense" action="${ctx}/buss/expense/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>日期：</label>
				<input name="expenseDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${expense.expenseDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li>
			<li class="btns">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
			<input id="btnExport" class="btn btn-primary" type="button" value="导出"/>
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>日期</th>
				<th>出发地</th>
				<th>目的地</th>
				<th>事由</th>
				<th>加班时间</th>
				<th>公交</th>
				<th>地铁</th>
				<th>出租车</th>
				<th>误餐费</th>
				<th>是否通过</th>
				<th>是否已经报销</th>
				<th>创建时间</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="buss:expense:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="expense">
			<tr>
				<td><a href="${ctx}/buss/expense/form?id=${expense.id}">
					<fmt:formatDate value="${expense.expenseDate}" pattern="yyyy-MM-dd"/>
				</a></td>
				<td>
					${expense.fromAddress}
				</td>
				<td>
					${expense.toAddress}
				</td>
				<td>
					${expense.reason}
				</td>
				<td>
					${expense.overtime}
				</td>
				<td>
					${expense.busPrice}
				</td>
				<td>
					${expense.metroPrice}
				</td>
				<td>
					${expense.taxiPrice}
				</td>
				<td>
					${expense.mealPrice}
				</td>
				<td>
					${expense.passSign}
				</td>
				<td>
					${expense.expenseSign}
				</td>
				<td>
					<fmt:formatDate value="${expense.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${expense.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${expense.remarks}
				</td>
				<shiro:hasPermission name="buss:expense:edit"><td>
    				<a href="${ctx}/buss/expense/form?id=${expense.id}">修改</a>
					<a href="${ctx}/buss/expense/delete?id=${expense.id}" onclick="return confirmx('确认要删除该数据吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>