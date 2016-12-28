<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="cui" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<div style="display: none;">login</div>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>黄大大财务管理软件</title>
</head>
<body style="text-align:center;">

	<div style="width:90%;margin:auto;" >
		<form class="form-horizontal" role="form" action="${ctx}/cashFlow/addOrEditCashFlowSava.do" method="post">
			<h2 class="form-signin-heading text-center">${message}</h2>
		   <div class="form-group">
		   		<input type="text" name="id" hidden="true" value="${cashFlow.id}" class="input-block-level"/>
		   		<input type="text" name="holderName" hidden="true" value="${loginUser.username}" class="input-block-level"/>
		   		
		   		  <label for="firstname" class="col-sm-2 control-label">流转日期:</label>
			      <div class="col-sm-10">
			         <input type="text" class="form-control" id="firstname" name="times" value="${cashFlow.times}">
			      </div>
			      
			      <label for="firstname" class="col-sm-2 control-label">category:</label>
			      <div class="col-sm-10">
			         <input type="text" class="form-control" id="firstname" name="item" value="${cashFlow.item}">
			      </div>
			      
			      <label for="firstname" class="col-sm-2 control-label">流转金额:</label>
			      <div class="col-sm-10">
			         <input type="text" class="form-control" id="firstname" name="money" value="${cashFlow.money}">
			      </div>
			      
			      <label for="lastname" class="col-sm-2 control-label">备注:</label>
			      <div class="col-sm-10">
			         <input type="text" class="form-control required" id="lastname" name="remark" value="${cashFlow.remark}">
			      </div>
				    
		   	</div>
		     
		     <button type="submit" class="btn btn-lg btn-success col-xs-offset-5">提交</button>
		</form>
	</div>
 </body>
</html>
