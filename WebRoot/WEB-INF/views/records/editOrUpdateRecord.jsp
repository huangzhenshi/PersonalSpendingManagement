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
<h2 class="sub-header">hello，kitty</h2>
<div style="width:90%;margin:auto;" >
<form class="form-horizontal" role="form" style="width:50%;" class="form-inline" 
	action="${ctx}/record/addOrEditSava" method="post">
   <div class="form-group">
   		<input type="text" name="id" hidden="true" value="${id}"/>
   		<input type="text" name="record.id" hidden="true" value="${record.id}"/>
   		<input type="text" name="record.holderName" hidden="true" value="${owner}"/>
   	  <label for="lastname" class="col-sm-2 control-label">日期:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control required" id="lastname" name="record.times" value="${record.times}">
      </div>
      <label for="firstname" class="col-sm-2 control-label">日工资:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="firstname" name="record.incomeTotal" value="${record.incomeTotal}">
      </div>
      
      <label for="firstname" class="col-sm-2 control-label">日净增涨:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="firstname" name="record.profit" value="${record.profit}">
      </div>
      <label for="lastname" class="col-sm-2 control-label">开销:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="lastname"  name="record.costDaily" value="${record.costDaily}">
      </div>
   </div>
   
   
    <div class="form-group">
      <label for="firstname" class="col-sm-2 control-label">吃饭水果:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="firstname" name="record.eating" value="${record.eating}">
      </div>
      <label for="lastname" class="col-sm-2 control-label">超市:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="lastname" name="record.supermarket" value="${record.supermarket}">
      </div>
      <label for="firstname" class="col-sm-2 control-label">聚餐:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="firstname"  name="record.party" value="${record.party}">
      </div>
      <label for="lastname" class="col-sm-2 control-label">房租水电:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="lastname"  name="record.rent" value="${record.rent}">
      </div>
      
      
      <label for="firstname" class="col-sm-2 control-label">贷款:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="firstname" name="record.loan" value="${record.loan}">
      </div>
      <label for="lastname" class="col-sm-2 control-label">买书:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="lastname" name="record.book" value="${record.book}">
      </div>
      <label for="firstname" class="col-sm-2 control-label">买衣服:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="firstname"  name="record.clothes" value="${record.clothes}">
      </div>
      <label for="lastname" class="col-sm-2 control-label">交通:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="lastname"  name="record.traffic" value="${record.traffic}">
      </div>
    
     </div>
     
     <div class="form-group">
     	<label for="firstname" class="col-sm-2 control-label">其他:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="firstname"   name="record.elseCost" value="${record.elseCost}">
      </div>
      <label for="lastname" class="col-sm-2 control-label">备注:</label>
      <div class="col-sm-10">
         <input type="text" class="form-control" id="lastname"  name="record.remark" value="${record.remark}">
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
