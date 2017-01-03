<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="cui" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>黄大大财务管理软件</title>
</head>
<body>

<div style="width:90%;margin:auto;" >
<form class="form-horizontal" role="form" action="${ctx}/property/addOrEditPropertySava.do" method="post">
	<h2 class="form-signin-heading text-center">${message}</h2>
   <div class="form-group">
   		<input type="text" name="id" hidden="true" value="${property.id}" class="input-block-level"/>
   		<input type="text" name="holderName" hidden="true" value="${loginUser.username}" class="input-block-level"/>
   		
   		  <label for="firstname" class="col-sm-2 control-label">日期:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control" id="firstname" name="times" value="${property.times}">
	      </div>
	      
	      
	      <label for="firstname" class="col-sm-2 control-label">招商银行:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control" id="firstname" name="card1" value="${property.card1}">
	      </div>
	      
	      
	      <label for="firstname" class="col-sm-2 control-label">中国银行:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control" id="firstname" name="card2" value="${property.card2}">
	      </div>
	      
	      <label for="firstname" class="col-sm-2 control-label">浦发银行:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control" id="firstname" name="card3" value="${property.card3}">
	      </div>
	      
	      <label for="firstname" class="col-sm-2 control-label">现金:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control" id="firstname" name="cash" value="${property.cash}">
	      </div>
	      
	      <label for="lastname" class="col-sm-2 control-label">支付宝:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control" id="lastname"  name="alipay" value="${property.alipay}">
	      </div>
      
	   	  <label for="lastname" class="col-sm-2 control-label">信用卡:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control required" id="lastname" name="creditCard" value="${property.creditCard}">
	      </div>
	      
	      <label for="lastname" class="col-sm-2 control-label">贷款:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control required" id="lastname" name="mortgage" value="${property.mortgage}">
	      </div>
	      
	      <label for="lastname" class="col-sm-2 control-label">公积金:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control required" id="lastname" name="housingFund" value="${property.housingFund}">
	      </div>
	      
	      
	      <label for="lastname" class="col-sm-2 control-label">房租折算:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control required" id="lastname" name="rent" value="${property.rent}">
	      </div>
	      
	      <label for="lastname" class="col-sm-2 control-label">别人欠我:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control required" id="lastname" name="loan1" value="${property.loan1}">
	      </div>
	      
	      <label for="lastname" class="col-sm-2 control-label">我欠别人:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control required" id="lastname" name="loan2" value="${property.loan2}">
	      </div>
	      
	      <label for="lastname" class="col-sm-2 control-label">备注:</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control required" id="lastname" name="remark" value="${property.remark}">
	      </div>
		    
   </div>
    <button type="submit" class="btn btn-lg btn-success col-xs-offset-5">提交</button>
</form>
</div>

</body>
</html>
