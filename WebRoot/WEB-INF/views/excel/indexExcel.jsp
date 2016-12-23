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


<title>黄大大财务管理软件</title>

</head>
<body>
	<div class="col-xs-offset-1huang">
		<div class="checkbox">
		  <label>
		    <input type="checkbox" name="checkbox" value="expense">开销记录
		  </label>
		</div>
		
		<div class="checkbox">
		  <label>
		    <input type="checkbox" name="checkbox" value="property">资产信息
		  </label>
		</div>
		
		<div class="checkbox">
		  <label>
		    <input type="checkbox" name="checkbox" value="card">银行卡信息
		  </label>
		</div>
		
		<div class="checkbox">
		  <label>
		    <input type="checkbox" name="checkbox" value="cashflow">资金流动信息
		  </label>
		</div>
		<button  class="btn btn-success" onclick="downloadAccount();">download</button>
	</div>
	
		    
	<script>
	function downloadAccount(){
		var value="";
		$('input[name="checkbox"]:checked').each(function(){ 
				value+=$(this).val()+",";
			}); 
		if(isEmpty(value)){
			message("please check an option!");
			return;
		}
		window.location.href=('${ctx}/excel/downloadAccount.do?username=${username}&items='+value);
		
		
	}
	</script>
</body>
</html>