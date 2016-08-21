<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<%@taglib prefix="cui" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="cache-control" content="no-store, must-revalidate"> 
<meta http-equiv="expires" content="Thu, 01 Jan 1970 00:00:01 GMT"> 
<meta http-equiv="expires" content="0">

<style> .error{ color:red;}</style>
<%@ include file="../../include/headerForCUI.jsp"%>
<title>黄大大财务管理软件</title>
</head>
<body style="text-align:center;">
<!-- 导航栏 -->
<%@include file="../common/navbar.jsp" %>

<div style="width:90%;margin:auto;" >
<form class="form-horizontal" id="cardForm" role="form" action="${ctx}/cards/addOrEditCardSava.do" method="post">
	<h2 class="form-signin-heading">${message}</h2>
   <div class="form-group">
   		<input type="text" name="id" hidden="true" value="${card.id}" class="input-block-level"/>
   		<input type="text" name="holderName" hidden="true" value="${loginUser.username}" class="input-block-level"/>
   		
   		  <label for="firstname" class="col-sm-2 control-label">银行名称:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control" id="firstname" name="bankName" value="${card.bankName}" required>
	      </div>
	      
	      
	      <label for="firstname" class="col-sm-2 control-label">卡号:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control" id="firstname" name="accountNumber" value="${card.accountNumber}">
	      </div>
	      
	      
	      <label for="firstname" class="col-sm-2 control-label">余额:</label>
	      <div class="col-sm-10">
	         <input type="isInteger" class="form-control" id="firstname" name="balance" value="${card.balance}" required>
	      </div>
	      
	      <label for="firstname" class="col-sm-2 control-label">归属地:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control" id="firstname" name="location" value="${card.location}">
	      </div>
	      
	      <label for="lastname" class="col-sm-2 control-label">Hint:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control" id="lastname"  name="password" value="${card.password}">
	      </div>
      
	   	  <label for="lastname" class="col-sm-2 control-label">更新日期:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control date form_date" id="lastname" name="updateTime"
		         	 data-date="" data-date-format="yyyy-mm-dd" required value="${card.updateTime}">
	      </div>
	      
	      <label for="lastname" class="col-sm-2 control-label">备注:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control" id="lastname" name="remark" value="${card.remark}">
	      </div>
		    
   </div>
     
     <button type="submit" class="btn btn-lg btn-success">提交</button>
</form>
</div>
	<script>
	$('.form_date').datetimepicker({
	    language:  'zh-CN',
	    weekStart: 1,
	    todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
	});
	$().ready(function() {
		$("#cardForm").validate();
	});
	
	$(function(){
	})
	
	
	</script>
</body>
</html>
 </body>
</html>
