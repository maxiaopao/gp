<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>数据管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		function success(){
			console.log(top.find("iframe")[0]);
			top.find("iframe")[0].contentWindow.location = 'https://www.baidu.com';
			//top.location.replace('${ctx}/buss/expense/calendar');
			//top.location = 'https://www.baidu.com';
			//self.location='https://www.baidu.com'; 
			//window.location.href='https://www.baidu.com';
			//window.parent.success();
		}
	</script>
</head>
<body>
		<sys:message content="${message}"/>		
		
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" onclick="success()" type="submit" value="确定"/>&nbsp;
		</div>
</body>
</html>