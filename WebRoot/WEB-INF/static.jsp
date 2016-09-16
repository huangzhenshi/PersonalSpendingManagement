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

<%@ include file="include/headerForCUI.jsp"%>
<title>黄大大财务管理软件</title>
<style>.error{color:red;}</style>
</head>
<body>
<h1 style="color:pink;"> hello kitty</h1>
<div>
	<button onclick="changeGrid();">click me123</button>
</div>
			
		<cui:grid id="articleGrid${idSuffix}" rownumbers="true"  afterSortableRows="gridSortableRows" 
				 url="${ctx}/login/getData.do"		    	
		    	  width="auto" height="750" multiselect="true" altRows="true" >
		    	<cui:gridCols>
		    		<cui:gridCol name="id" >id</cui:gridCol>
		    		<cui:gridCol name="name" align="center">name</cui:gridCol>
		    		<cui:gridCol name="op" fixed="true" width="80" align="center" formatter="operateFormatter">操作选项</cui:gridCol>
		    	</cui:gridCols>
		    </cui:grid> 
		    
	<script>
	function changeGrid(){
		debugger;
		var baseSearch="${ctx}/record/getRecordByDate.do?index=2"	
		var articleGrid = $("#articleGrid${idSuffix}");
		articleGrid.grid("option","url",baseSearch);
		articleGrid.grid("reload");
	}
	
	
	//格式化操作栏
function operateFormatter(cellValue, options, rowObject){
	var result = "";
		result += " <a href='javascript:addOrEdit(2,\""+ rowObject.id+"\");' title='修改' class='grideditbtn'></a> ";
		result += " <a href='javascript:deleteRecord(\""+ rowObject.id+ "\");' title='删除' class='griddeletebtn'></a> ";
	return result;}
	//删除编码
	function deleteRecord(id){
		$.confirm("确定删除吗？", function(r) {
			if (r) {
				window.location.href=('${ctx}/record/delete.do?id='+id+'&username=${loginUser.username}');
			} else {
				message("取消");
			}
		});
	}
	</script>
</body>
</html>