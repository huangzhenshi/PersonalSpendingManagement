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
</head>
<body>

	<!-- 导航栏 -->
 	<%@include file="../common/navbar.jsp" %>
	 <div class="row">
			<div class="btn-group span5 col-xs-offset-1huang">
				<button type="button" class="btn btn-lg btn-primary" onclick="addOrEditProperty(0)">
				  <i class="icon-plus"></i>新增</button>
			    <button type="button" class="btn btn-lg btn-success" onclick="addOrEditProperty(1)">
			      <i class="icon-pencil"></i>修改</button>
			    <button type="button" class="btn btn-lg btn-danger" onclick="deletePropertyArray()">
			      <i class="icon-minus"></i>删除</button>
			</div>
		</div>
		
		    <cui:grid id="propertyGrid${idSuffix}" rownumbers="true" width="auto" height="750" multiselect="true" altRows="true" 
		    	url="${ctx}/property/getAllProperty.do?username=${loginUser.username}">
		    	<cui:gridCols>
		    		<cui:gridCol name="id" hidden="true">id</cui:gridCol>
		    		<cui:gridCol name="times" align="center">日期</cui:gridCol>
		    		<cui:gridCol name="total" width="80" align="center">Total</cui:gridCol>
		    		<cui:gridCol name="card1"  align="center">招商银行</cui:gridCol>
		    		<cui:gridCol name="card2"  align="center">中国银行</cui:gridCol>
		    		<cui:gridCol name="cash"  align="center">现金</cui:gridCol>
		    		<cui:gridCol name="alipay" align="center">支付宝</cui:gridCol>
		    		<cui:gridCol name="creditCard" align="center">信用卡</cui:gridCol>
		    		<cui:gridCol name="mortgage"  align="center">按揭</cui:gridCol>
		    		<cui:gridCol name="housingFund"  align="center">公积金</cui:gridCol>
		    		<cui:gridCol name="rent"  align="center">房租折算</cui:gridCol>
		    		<cui:gridCol name="loan1" >别人欠我</cui:gridCol>
		    		<cui:gridCol name="loan2"  align="center">欠别人</cui:gridCol>
		    		<cui:gridCol name="remark" width="380">备注</cui:gridCol>
		    		<cui:gridCol name="op" fixed="true" width="80" align="center" formatter="operateFormatter">操作选项</cui:gridCol>
		    	</cui:gridCols>
		    </cui:grid> 
		    
	<script>
	$(function() {
		$("#propertyNav").addClass("active");
		$("#propertyNav").parent("ul").children("li").not("#propertyNav").removeClass("active");
	});
	//格式化操作栏
function operateFormatter(cellValue, options, rowObject){
	var result = "";
		result += " <a href='javascript:addOrEditProperty(2,\""+ rowObject.id+"\");' title='修改' class='grideditbtn'></a> ";
		result += " <a href='javascript:deleteProperty(\""+ rowObject.id+ "\");' title='删除' class='griddeletebtn'></a> ";
	return result;}
	//删除编码
	function deleteProperty(id){
		$.confirm("确定删除吗？", function(r) {
			if (r) {
				window.location.href=('${ctx}/property/delete.do?id='+id);
			} else {
				message("取消");
			}
		});
	}
	
	//批量删除
	function deletePropertyArray(){
		var propertyGrid = $("#propertyGrid${idSuffix}");
		var sel = propertyGrid.grid("option", "selarrrow");
		if(sel.length<1){
			message("请至少选择一条记录！");
			return;
		}
		var ids=propertyGrid.grid("getRowData",sel[0]).id;;
		for(var i=1;i<sel.length;i++){
			ids=ids+","+propertyGrid.grid("getRowData",sel[i]).id;
		}
		deleteProperty(ids);
	}
	//index: 0 新增 1 按钮点击修改 2 操作选项中点击修改
	function addOrEditProperty(index,id){
		debugger;
		//点击操作选项中修改数据
		if(index==2){
			window.location.href=('${ctx}/property/editOrUpdateProperty.do?id='+id);
		}else if(index==1){
			var propertyGrid = $("#propertyGrid${idSuffix}");
			var sel = propertyGrid.grid("option", "selarrrow");
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
			var idUpdate = propertyGrid.grid("getRowData",sel).id;
			window.location.href=('${ctx}/property/editOrUpdateProperty.do?id='+idUpdate+'&holderName=${loginUser.username}');
		}else{
			window.location.href=('${ctx}/property/editOrUpdateProperty.do?holderName=${loginUser.username}');
		}
	}
	</script>
</body>
</html>