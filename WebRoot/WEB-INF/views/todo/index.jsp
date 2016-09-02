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


<%@ include file="../../include/headerForCUI.jsp"%>
<title>黄大大财务管理软件</title>
<style>.error{color:red;}</style>
</head>
<body>

<!-- 导航栏 -->
<%@include file="../common/navbar.jsp" %>>
<%@include file="recordTodoModal.jsp" %>
		    <cui:grid id="todoGrid${idSuffix}" rownumbers="true" fitStyle="fill"
		    	url="${ctx}/todo/getAllTodo.do?username=${loginUser.username}">
		    	<cui:gridCols>
		    		<cui:gridCol name="type" align="center" formatter="typeTodoFormat">待办类型</cui:gridCol>
		    		<cui:gridCol name="times" align="center">应办日期</cui:gridCol>
		    	</cui:gridCols>
		    </cui:grid> 
		    
	<script>

	$(function() {
		$("#todoNav").addClass("active");
		$("#todoNav").parent("ul").children("li").not("#todoNav").removeClass("active");
	});
	
	function typeTodoFormat(cellValue, options, rowObject){
		var result = "";
		result += "<a href='javascript:openModalByType(\""+rowObject.type+"\",\""+rowObject.times+"\")' title='补录'>"+rowObject.type+"</a> ";
		return result;
	}
	
	function openModalByType(type,times){
		
		
	}
	
	//index: 0 新增 1 按钮点击修改 2 操作选项中点击修改
	function addOrEditTodo(index,id){
		debugger;
		$("#addOrEditTodoForm")[0].reset(); 
		if(index==0){
			$("#TodoUpdateTime").val(getDateTodayDayOnly());
			return;
		}
		if(index==1){
			var TodoGrid = $("#TodoGrid${idSuffix}");
			var sel=TodoGrid.grid("option", "selarrrow");
			var row = $("#TodoGrid${idSuffix}").grid("getRowData",sel);
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
			
		}else if(index==2){
			var row = $("#TodoGrid${idSuffix}").grid("getRowData",id);
		}
		$("#modalDescription").html("修改银行卡");
		$("#TodoId").val(row.id);
		$("#TodoBankName").val(row.bankName);
		$("#TodoAccountNumber").val(row.accountNumber);
		$("#TodoBalance").val(row.balance);
		$("#TodoLocation").val(row.location);
		$("#TodoPassword").val(row.password);
		$("#TodoUpdateTime").val(row.updateTime);
		$("#TodoRemark").val(row.remark);
		$("#addOrEditTodoModal").modal();
	}
	</script>
</body>
</html>