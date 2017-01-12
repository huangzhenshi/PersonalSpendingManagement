<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<%@taglib prefix="cui" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<div style="display: none;">login</div>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="cache-control" content="no-store, must-revalidate"> 
<meta http-equiv="expires" content="Thu, 01 Jan 1970 00:00:01 GMT"> 
<meta http-equiv="expires" content="0">


<title>黄大大财务管理软件</title>
<%@ include file="../../include/headerForCUI.jsp"%>
<style>.error{color:red;}</style>
</head>
<body>
<div style="margin:5px 0"></div>
<div class="container-fluid">
	 <div class="row ">		
		 <div class="btn-group span5 col-xs-offset-1huang">
				<button type="button" class="btn btn-lg  btn-primary" data-toggle="modal" 
	   				data-target="#addOrEditSleepModal" onclick="addOrEdit(0)">
				  <i class="icon-plus"></i>新增</button>
			    <button type="button" class="btn btn-lg  btn-success" onclick="addOrEdit(1)">
			      <i class="icon-pencil"></i>修改</button>
			    <button type="button" class="btn btn-lg  btn-danger" onclick="deleteSleepArray()">
				  <i class="icon-minus"></i>删除</button>
			</div>
	 </div>
</div>	
<div style="margin:5px 0"></div>

		    <cui:grid id="sleepGrid${idSuffix}" rownumbers="true" fitStyle="fill" multiselect="true" altRows="true"   
		    	url="${ctx}/sleep/getSleepGrid.do?username=${username}" rowNum="20">
		    	<cui:gridCols>
		    		<cui:gridCol name="id" hidden="true">id</cui:gridCol>
		    		<cui:gridCol name="times" align="center">日期</cui:gridCol>
		    		<cui:gridCol  name="op" align="center" formatter="formateWeek">星期</cui:gridCol>
		    		<cui:gridCol name="getUp" width="80" align="center">起床时间</cui:gridCol>
		    		<cui:gridCol name="getSleep" width="80" align="center">上床时间</cui:gridCol>
		    		<cui:gridCol name="breakfast" width="100" align="center">BREAKFAST</cui:gridCol>
		    		<cui:gridCol name="lunch" width="80" align="center">LUNCH</cui:gridCol>
		    		<cui:gridCol name="dinner" width="80" align="center">DINNER</cui:gridCol>
		    		<cui:gridCol name="remark" width="300" align="center">备注</cui:gridCol>
		    	</cui:gridCols>
		    	<cui:gridPager gridId="sleepGrid${idSuffix}" />
		    </cui:grid> 
		    
	<script>
	//格式化操作栏
	function formateWeek(cellValue, options, rowObject){
		var day=new Date(rowObject.times).getDay();
			switch(day){
		        case 1:
		        	return "星期一";
		            break;
		        case 2:
		        	return "星期二";
		            break;
		        case 3:
		            return "星期三";
		            break;
		        case 4:
		            return "星期四";
		            break;
		        case 5:
		            return "星期五";
		            break;
		        case 6:
		            return "星期六";
		            break;
		        case 0:
		            return "星期天";
		            break;
		        default:
		            return "";
	    	}
	}
	
	function addOrEdit(index){
		$("#addOrEditSleepForm")[0].reset(); 
		
		//case index =1 is update,else is add new
		if(index==1){
			var sleepGrid = $("#sleepGrid${idSuffix}");
			var sel=sleepGrid.grid("option", "selarrrow");
			var row = $("#sleepGrid${idSuffix}").grid("getRowData",sel);
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
			$("#sleepModalDescription").html("Update sleep time");
			
			$("#sleepId").val(row.id);
			$("#sleepTimes").val(row.times);
			$("#sleepGetUp").val(row.getUp);
			$("#sleepGetSleep").val(row.getSleep);
			$("#sleepBreakfast").val(row.breakfast);
			$("#sleepLunch").val(row.lunch);
			$("#sleepDinner").val(row.dinner);
			$("#sleepRemark").val(row.remark);
			$("#addOrEditSleepModal").modal();
		}else{
			$("#sleepTimes").val(getDateTodayDayOnly());
			$("#sleepModalDescription").html("Record sleep time");
		}
		
	}
	$(function(){
		if('${message}'){
			message('${message}');
		}
	})
						
	//删除编码
	function deleteSleep(ids){
		var sleepGrid=$("#sleepGrid${idSuffix}");
		$.confirm("确定删除选中记录吗？", function(r) {
			if (r) {
				loading("删除中，请稍候...");
				$.ajax({
						type : 'post',
						url : ctx + '/sleep/delete.do?id='+ids,
						success : function(data) {
							if(data.msg){
								hide();
								message("删除成功！");
								sleepGrid.grid('reload');
							}else{
								hide();
								sleepGrid.grid('reload');
								error(e);
							}
						},
						error : function(e) {
							hide();
							sleepGrid.grid('reload');
							error(e);
						}
				});
				
			} else {
				message("取消");
			}
		});
	}
	
	//批量删除
	function deleteSleepArray(){
		var sleepGrid = $("#sleepGrid${idSuffix}");
		var sel = sleepGrid.grid("option", "selarrrow");
		if(sel.length<1){
			message("请至少选择一条记录！");
			return;
		}
		var ids=sleepGrid.grid("getRowData",sel[0]).id;;
		for(var i=1;i<sel.length;i++){
			ids=ids+","+sleepGrid.grid("getRowData",sel[i]).id;
		}
		deleteSleep(ids);
	}
	</script>
</body>
</html>