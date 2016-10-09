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
</head>
<body>
<div>
		<input type="text" name="holderName" id="holderName"  hidden="true" value="${loginUser.username}"/>
	    <cui:grid id="smartGrid${idSuffix}" rownumbers="true" width="auto" height="750"
	    	url="${ctx}/smart/getSmartByMonthGrid.do?username=${loginUser.username}" rowNum="20">
	    	<cui:gridCols>
	    		<cui:gridCol name="times" align="center">月份</cui:gridCol>
	    		<cui:gridCol name="incomeTotal"  align="center">工资</cui:gridCol>
	    		<cui:gridCol name="costDaily"  align="center" formatter="formateEnterAccess">总开销</cui:gridCol>
	    		<cui:gridCol name="profit"  align="center">总结余</cui:gridCol>
	    		<cui:gridCol name="op" align="center" formatter="operateFormatter">开销比例</cui:gridCol>
	    		<cui:gridCol name="eating"  align="center">饮食</cui:gridCol>
	    		<cui:gridCol name="rent"  align="center">房租</cui:gridCol>
	    		<cui:gridCol name="book"  align="center">买书</cui:gridCol>
	    		<cui:gridCol name="clothes"  align="center">买衣服</cui:gridCol>
	    		<cui:gridCol name="traffic"  align="center">交通</cui:gridCol>
	    		<cui:gridCol name="elseCost"  align="center" formatter="zeroFormat">其他</cui:gridCol>
	    	</cui:gridCols>
	    </cui:grid> 
</div>		    
	<script>
	
	//格式化操作栏
function operateFormatter(cellValue, options, rowObject){
		var ratio=rowObject.costDaily/rowObject.incomeTotal;
		return ratio.toFixed(4)*100 +'%';
	}
	
function formateEnterAccess(cellValue, options, rowObject){
	var username=$("#holderName").val();
	var qssj=rowObject.times+"-01";
	var url="${ctx}/smart/gotoDetail.do?username="+username+"&qssj="+qssj+"&util="+rowObject.elseCost;
	var result="<span onclick='refreshCenter(\""+url+"\")' style='color:blue;'>"+cellValue+"</span>"
	return result;
}
	</script>
</body>
</html>