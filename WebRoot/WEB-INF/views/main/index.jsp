<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/global.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>信息发布平台5.0</title>



<script src="${ctx}/res/jquery-cui/4.0.2/dev/ui/jquery-1.9.1.min.js"></script>

<link href="${ctx}/res/resource/style/css/common.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/res/resource/style/css/body.css" type="text/css" rel="stylesheet" />

<%@ include file="../../include/headerForCUI.jsp"%>
<%@include file="../cards/editOrUpdateCardModal.jsp" %>
<%@include file="../records/editOrUpdateRecordModal.jsp" %>
<%@include file="../code/editOrUpdateCodeModal.jsp" %>

<style>
html,body {
	height: 100%;
	width: 100%;
}
</style>
</head>
<body>
<input type="text" id="username"  hidden="true" value="${loginUser.username}"/>
	<cui:layout id="coralui-layout" fit="true">
			<cui:layoutRegion region="north" split="false" style="height:60px;border:none">
			<%@ include file="head.jsp"%>
			</cui:layoutRegion>
			<cui:layoutRegion  region='center' split="false" onLoad="layoutCenterResize" onResize="layoutCenterResize">
				
			</cui:layoutRegion>
			<cui:layoutRegion  region='south' split="false" style="height:25px" onLoad="layoutCenterResize" onResize="layoutCenterResize">
				<div>hello,kitty</div>
			</cui:layoutRegion>
	</cui:layout>
</body>
</html>