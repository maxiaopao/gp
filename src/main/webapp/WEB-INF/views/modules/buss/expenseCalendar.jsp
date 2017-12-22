<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>日报填写</title>
	<meta name="decorator" content="default"/>
	
	<link href="${ctx}/static/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />
	<script src="${ctx}/static/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
	<style type="text/css">
		#calendar{width:960px; margin:20px auto 10px auto}
		.fancy{width:450px; height:auto}
		.fancy h3{height:30px; line-height:30px; border-bottom:1px solid #d3d3d3; font-size:14px}
		.fancy form{padding:10px}
		.fancy p{height:28px; line-height:28px; padding:4px; color:#999}
		.input{height:20px; line-height:20px; padding:2px; border:1px solid #d3d3d3; width:100px}
		.btn{-webkit-border-radius: 3px;-moz-border-radius:3px;padding:5px 12px; cursor:pointer}
		.btn_ok{background: #360;border: 1px solid #390;color:#fff}
		.btn_cancel{background:#f0f0f0;border: 1px solid #d3d3d3; color:#666 }
		.btn_del{background:#f90;border: 1px solid #f80; color:#fff }
		.sub_btn{height:32px; line-height:32px; padding-top:6px; border-top:1px solid #f0f0f0; text-align:right; position:relative}
		.sub_btn .del{position:absolute; left:2px}
	</style>
	
	<script type="text/javascript">
	$(function() {
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month'
			},
			events: function(start, end, callback){
				var fstart = $.fullCalendar.formatDate(start, "yyyy-MM-dd");  
		        var fend = $.fullCalendar.formatDate(end, "yyyy-MM-dd");
		        $.ajax({
	        	   type: "POST",
	        	   url: "${ctx}/buss/expense/listCalendar",
	        	   data: "startTimeStr="+fstart+"&endTimeStr="+fend,
	        	   success: function(data){
	        		   var events = [];  
	        		   var reData = eval(data)
			            for (var i = 0; i < reData.length; i++) {  
			                var array_element = reData[i];  
			                var title = array_element.reason;  
			                if (array_element != null) {  
			                    var color = "";  
			                    if (array_element.passSign == 0) {  
			                        color = "green";  
			                    } else if(array_element.passSign == 1){  
			                        color = "gray";  
			                    } else if(array_element.passSign == 2){  
			                        color = "orange";  
			                    }else {
			                    	color = "red";
			                    }
			                    var tjson = {
			                        id: array_element.id,  
			                        title: title,  
			                        start: array_element.expenseDate,  
			                        end: array_element.expenseDate,  
			                        color: color,  
			                        allDay: 1  
			                    }; 
			                    events.push(tjson);  
			                }  
			            }  
			            callback(events); 
	        	   }
	        	});
			},
			eventClick: function (data, allDay, jsEvent, view) {
				var selDate =$.fullCalendar.formatDate(data.start,'yyyy-MM-dd');
				
				top.$.jBox.open("iframe:${ctx}/buss/expense/formCalendar?id="+data.id, "新增报销单", 700, $(top.document).height()-180, {
					buttons:{"确定":"ok",  "关闭":true}, submit:function(v, h, f){
		                if (v=="ok"){
		                	var form = h.find("iframe")[0].contentWindow.$("#inputForm");
		                	$.ajax({
		                        url:"${ctx}/buss/expense/saveExpense",//提交地址
		                        data:form.serialize(),//将表单数据序列化
		                        type:"POST",
		                        dataType:"json",
		                        success:function(result){
		                            if(result.success=="true"){
		                            	top.$.jBox.tip(result.message);
		                            	$('#calendar').fullCalendar( 'refetchEvents' );
		                            }else{
		                            	top.$.jBox.tip(result.message);
		                            }
		                        }
		                    });
		                }
					},
					loaded:function(h){
		                $(".jbox-content", top.document).css("overflow-y","hidden");
		            }
		        });
			},
			dayClick: function(date, allDay, jsEvent, view) {
				var selDate =$.fullCalendar.formatDate(date,'yyyy-MM-dd');
				top.$.jBox.open("iframe:${ctx}/buss/expense/formCalendar", "新增报销单", 700, $(top.document).height()-180, {
					ajaxData:{expenseDate: selDate},
					buttons:{"确定":"ok",  "关闭":true}, submit:function(v, h, f){
		                if (v=="ok"){
		                	var form = h.find("iframe")[0].contentWindow.$("#inputForm");
		                	validateFun(form);
		                	return false;
		                }
					},
					loaded:function(h){
		                $(".jbox-content", top.document).css("overflow-y","hidden");
		            }
		        });
	    	}
		});
		
	});
	
	function ajaxSubmit(form){
		$.ajax({
            url:"${ctx}/buss/expense/saveExpense",//提交地址
            data:form.serialize(),//将表单数据序列化
            type:"POST",
            dataType:"json",
            success:function(result){
                if(result.success=="true"){
                	top.$.jBox.tip(result.message);
                	$('#calendar').fullCalendar( 'refetchEvents' );
                }else{
                	top.$.jBox.tip(result.message);
                }
            }
        });
	}
	function validateFun(form){
		$(form).validate({
			submitHandler: function(form){
				loading('正在提交，请稍等...');
				ajaxSubmit(form);
			},
			errorContainer: "#messageBox",
			errorPlacement: function(error, element) {
				alert(2);
			}
		});
	}
	
	</script>
</head>
<body>
	<div id='calendar'></div>
</body>
</html>