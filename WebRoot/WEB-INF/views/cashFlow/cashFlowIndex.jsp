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
</head>
<body>
<input type="text" name="holderName" id="holderName"  hidden="true" value="${loginUser.username}"/>
<div class="container-fluid">
	 <div class="row">
			<div class="col-xs-offset-1huang  col-lg-3">
				<br>
				<button type="button" class="btn  btn-primary"  data-toggle="modal" 
	   				data-target="#addOrEditCashFlowModal" onclick="addOrEditCashFlow(0)">
				  <i class="icon-plus"></i>新增</button>
			    <button type="button" class="btn  btn-success" onclick="addOrEditCashFlow(1,0,'income')">
			      <i class="icon-pencil"></i>修改</button>
			    <button type="button" class="btn btn-danger" onclick="deleteCashFlowArray(1)">
			      <i class="icon-minus"></i>删除</button>
			</div>
			
			<div class="col-lg-7">
				 <h3  class="text-left" id="yearIncomeTotal">收入明细(${total})</h3>
			</div>
		</div>
		
</div>
		    <cui:grid id="incomeCashFlowGrid${idSuffix}" rownumbers="true" width="auto" height="700" multiselect="true" altRows="true" 
		    	url="${ctx}/cashFlow/getAllCashFlow.do?username=${loginUser.username}&type=0">
		    	<cui:gridCols>
		    		<cui:gridCol name="id" hidden="true">id</cui:gridCol>
		    		<cui:gridCol name="times" align="center">流转日期</cui:gridCol>
		    		<cui:gridCol name="item" align="center">收入大类</cui:gridCol>
		    		<cui:gridCol name="money" align="center">流转金额</cui:gridCol>
		    		<cui:gridCol name="remark" width="380">备注</cui:gridCol>
		    	</cui:gridCols>
		    </cui:grid> 
		    
<div class="container-fluid">
	 <div class="row">
			<div class="col-xs-offset-1huang  col-lg-3">
			<br>
				<button type="button" class="btn  btn-primary" data-toggle="modal" 
	   				data-target="#addOrEditCashFlowModal"  onclick="addOrEditCashFlow(0)">
				  <i class="icon-plus"></i>新增</button>
			    <button type="button" class="btn btn-success" onclick="addOrEditCashFlow(1)">
			      <i class="icon-pencil"></i>修改</button>
			    <button type="button" class="btn btn-danger" onclick="deleteCashFlowArray(0)">
			      <i class="icon-minus"></i>删除</button>
			</div>
			
			<div class="col-lg-7">
				 <h3  class="text-left">支出明细</h3>
			</div>
		</div>
		
</div>
		    <cui:grid id="cashFlowGrid${idSuffix}" rownumbers="true" 
		    	width="auto" height="700" multiselect="true" altRows="true" 
		    	url="${ctx}/cashFlow/getAllCashFlow.do?username=${loginUser.username}&type=1">
		    	<cui:gridCols>
		    		<cui:gridCol name="id" hidden="true">id</cui:gridCol>
		    		<cui:gridCol name="times" align="center">流转日期</cui:gridCol>
		    		<cui:gridCol name="item" align="center">支出大类</cui:gridCol>
		    		<cui:gridCol name="money" align="center">流转金额</cui:gridCol>
		    		<cui:gridCol name="remark" width="380">备注</cui:gridCol>
		    	</cui:gridCols>
		    </cui:grid> 
		   
		    
	<script>
	/* //删除记录
	function deleteCashFlow(id){
		$.confirm("确定删除吗？", function(r) {
			if (r) {
				refreshCenter('${ctx}/cashFlow/delete.do?id='+id+'&holderName=${username}');
			} else {
				message("取消");
			}
		});
	} */
	
	
	function deleteCashFlow(ids){
		$.confirm("确定删除选中记录吗？", function(r) {
			if (r) {
				loading("删除中，请稍候...");
				$.ajax({
						type : 'post',
						url : ctx + '/cashFlow/delete.do?id='+ids+'&holderName=${username}',
						success : function(data) {
							if(data.msg){
								hide();
								message("删除成功！");
								$("#yearIncomeTotal").html('收入明细('+data.total+')')
								$("#incomeCashFlowGrid${idSuffix}").grid("reload");
								$("#cashFlowGrid${idSuffix}").grid("reload");
							}else{
								hide();
								error(e);
							}
						},
						error : function(e) {
							hide();
							error(e);
						}
				});
				
			} else {
				message("取消");
			}
		});
	}
	
	
	//批量删除  index=1 表示 流入表的批量删除，=0表示 流出表的批量删除
	function deleteCashFlowArray(index){
		if(index==1){
			var cashFlowGrid = $("#incomeCashFlowGrid${idSuffix}");
		}else{
			var cashFlowGrid = $("#cashFlowGrid${idSuffix}");
			
		}
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
	//index: 0 新增 1 按钮点击修改 2 操作选项中点击修改   资金流出列表的处理函数
	function addOrEditCashFlow(index,id,type){
		debugger;
		$("#addOrEditCashFlowForm")[0].reset(); 
		if(index==1){
			if(type=="income"){
				var cashFlowGrid = $("#incomeCashFlowGrid${idSuffix}");
			}else{
				var cashFlowGrid = $("#cashFlowGrid${idSuffix}");
			}
			var sel=cashFlowGrid.grid("option", "selarrrow");
			var row = cashFlowGrid.grid("getRowData",sel);
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
			$("#cashFlowModalDescription").html("Update cashFlow");
			
			$("#cashFlowId").val(row.id);
			$("#cashFlowTimes").val(row.times);
			$("#cashFlowItem").val(row.item);
			$("#cashFlowMoney").val(row.money);
			$("#cashFlowRemark").val(row.remark);
			$("#addOrEditCashFlowModal").modal();
		}else{
			$("#cashFlowModalDescription").html("Record new cashFlow");
		}
	}
	
	$(function(){
		if('${message}'){
			message('${message}');
		}
	})
		
	</script>
</body>
</html>