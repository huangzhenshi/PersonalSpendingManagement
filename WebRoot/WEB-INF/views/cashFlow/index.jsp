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
<div class="container-fluid">
	 <div class="row">
			<div class="col-xs-offset-1huang  col-lg-3">
				<button type="button" class="btn btn-lg btn-primary" onclick="addOrEditCashFlow(0)">
				  <i class="icon-plus"></i>新增</button>
			    <button type="button" class="btn btn-lg btn-success" onclick="addOrEditCashFlow(1)">
			      <i class="icon-pencil"></i>修改</button>
			    <button type="button" class="btn btn-lg btn-danger" onclick="deleteCashFlowArray()">
			      <i class="icon-minus"></i>删除</button>
			</div>
			
			<div class="col-lg-7">
				 <h3  class="text-left">收入明细(${total})</h3>
			</div>
		</div>
		
</div>
		    <cui:grid id="2cashFlowGrid${idSuffix}" rownumbers="true" width="auto" height="700" multiselect="true" altRows="true" 
		    	url="${ctx}/cashFlow/getAllCashFlow.do?username=${loginUser.username}&type=0">
		    	<cui:gridCols>
		    		<cui:gridCol name="id" hidden="true">id</cui:gridCol>
		    		<cui:gridCol name="times" align="center">流转日期</cui:gridCol>
		    		<cui:gridCol name="item" align="center">收入大类</cui:gridCol>
		    		<cui:gridCol name="money" align="center">流转金额</cui:gridCol>
		    		<cui:gridCol name="remark" width="380">备注</cui:gridCol>
		    		<cui:gridCol name="op" fixed="true" width="80" align="center" formatter="operateFormatter">操作选项</cui:gridCol>
		    	</cui:gridCols>
		    </cui:grid> 
		    <h3 class="text-center">支出明细</h3>
		    <cui:grid id="cashFlowGrid${idSuffix}" rownumbers="true" 
		    	width="auto" height="700" multiselect="true" altRows="true" 
		    	url="${ctx}/cashFlow/getAllCashFlow.do?username=${loginUser.username}&type=1">
		    	<cui:gridCols>
		    		<cui:gridCol name="id" hidden="true">id</cui:gridCol>
		    		<cui:gridCol name="times" align="center">流转日期</cui:gridCol>
		    		<cui:gridCol name="item" align="center">支出大类</cui:gridCol>
		    		<cui:gridCol name="money" align="center">流转金额</cui:gridCol>
		    		<cui:gridCol name="remark" width="380">备注</cui:gridCol>
		    		<cui:gridCol name="op" fixed="true" width="80" align="center" formatter="operateFormatter">操作选项</cui:gridCol>
		    	</cui:gridCols>
		    </cui:grid> 
		   
		    
	<script>
	$(function() {
		$("#flowNav").addClass("active");
		$("#flowNav").parent("ul").children("li").not("#flowNav").removeClass("active");
	});
	//格式化操作栏
function operateFormatter(cellValue, options, rowObject){
	var result = "";
		result += " <a href='javascript:addOrEditCashFlow(2,\""+ rowObject.id+"\");' title='修改' class='grideditbtn'></a> ";
		result += " <a href='javascript:deleteCashFlow(\""+ rowObject.id+ "\");' title='删除' class='griddeletebtn'></a> ";
	return result;}
	//删除编码
	function deleteCashFlow(id){
		$.confirm("确定删除吗？", function(r) {
			if (r) {
				window.location.href=('${ctx}/cashFlow/delete.do?id='+id+'&holderName=${loginUser.username}');
			} else {
				message("取消");
			}
		});
	}
	
	//批量删除
	function deleteCashFlowArray(){
		var cashFlowGrid = $("#cashFlowGrid${idSuffix}");
		var sel = cashFlowGrid.grid("option", "selarrrow");
		if(sel.length<1){
			message("请至少选择一条记录！");
			return;
		}
		var ids=cashFlowGrid.grid("getRowData",sel[0]).id;;
		for(var i=1;i<sel.length;i++){
			ids=ids+","+cashFlowGrid.grid("getRowData",sel[i]).id;
		}
		deleteCashFlow(ids);
	}
	//index: 0 新增 1 按钮点击修改 2 操作选项中点击修改
	function addOrEditCashFlow(index,id){
		debugger;
		//点击操作选项中修改数据
		if(index==2){
			window.location.href=('${ctx}/cashFlow/editOrUpdateCashFlow.do?id='+id);
		}else if(index==1){
			var cashFlowGrid = $("#cashFlowGrid${idSuffix}");
			var sel = cashFlowGrid.grid("option", "selarrrow");
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
			var idUpdate = cashFlowGrid.grid("getRowData",sel).id;
			window.location.href=('${ctx}/cashFlow/editOrUpdateCashFlow.do?id='+idUpdate+'&holderName=${loginUser.username}');
		}else{
			window.location.href=('${ctx}/cashFlow/editOrUpdateCashFlow.do?holderName=${loginUser.username}');
		}
	}
	</script>
</body>
</html>