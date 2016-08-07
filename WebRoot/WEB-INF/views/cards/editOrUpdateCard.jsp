<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>
 </head>
 <body>
  
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<%@taglib prefix="cui" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<div style="display: none;">login@tag</div>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="cache-control" content="no-store, must-revalidate"> 
<meta http-equiv="expires" content="Thu, 01 Jan 1970 00:00:01 GMT"> 
<meta http-equiv="expires" content="0">


<%@ include file="../../include/headerForCUI.jsp"%>
<title>黄大大财务管理软件</title>
<script src="${ctx}/res/resource/style/js/md5.min.js"></script>
<script src="${ctx}/res/resource/style/js/sha1.js"></script>
<script src="${ctx}/res/thirdParty/jqfloat.min.js"></script>
<script src="${ctx}/res/resource/style/js/bootstrap.min.js"></script>
<link href="${ctx}/res/resource/style/css/inforGlobal.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/res/resource/style/css/bootstrap.min.css" rel="stylesheet"/>

</head>
<body style="text-align:center;">
<!-- 导航栏 -->
 	<%@include file="../common/navbar.jsp" %>

<div style="width:90%;margin:auto;" >
<form class="form-horizontal" role="form" action="${ctx}/cards/addOrEditCardSava.do" method="post">
	<h2 class="form-signin-heading">${message}</h2>
   <div class="form-group">
   		<input type="text" name="id" hidden="true" value="${card.id}" class="input-block-level"/>
   		<input type="text" name="holderName" hidden="true" value="${loginUser.username}" class="input-block-level"/>
   		
   		  <label for="firstname" class="col-sm-2 control-label">银行名称:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control" id="firstname" name="bankName" value="${card.bankName}">
	      </div>
	      
	      
	      <label for="firstname" class="col-sm-2 control-label">卡号:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control" id="firstname" name="accountNumber" value="${card.accountNumber}">
	      </div>
	      
	      
	      <label for="firstname" class="col-sm-2 control-label">余额:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control" id="firstname" name="balance" value="${card.balance}">
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
	         <input type="text" class="form-control required" id="lastname" name="updateTime" value="${card.updateTime}">
	      </div>
	      
	      <label for="lastname" class="col-sm-2 control-label">备注:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control required" id="lastname" name="remark" value="${card.remark}">
	      </div>
		    
   </div>
     
     <button type="submit" class="btn btn-lg btn-success">提交</button>
</form>
</div>
	<script>
	
	$(function(){
	})
	
	
	</script>
</body>
</html>
 </body>
</html>
