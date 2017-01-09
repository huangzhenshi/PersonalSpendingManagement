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
<%@ include file="../../include/headerForCUI.jsp"%>
<style>.error{color:red;}</style>
</head>
<body>
  <ul id="myTab" class="nav nav-tabs">
    <li class="active">
        <a href="#undo" data-toggle="tab">待办事项 </a>
    </li>
    <li><a href="#done" data-toggle="tab">已办事项</a></li>
</ul>
<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="undo">
			<div style="margin:5px 0"></div>
			<div class="container-fluid">
				 <div class="row ">		
					 <div class="btn-group span5 col-xs-offset-1huang">
							<button type="button" class="btn btn-lg  btn-primary" data-toggle="modal" 
				   				data-target="#addOrEditListTodoModal" onclick="addOrEdit(0)">
							  <i class="icon-plus"></i>新增</button>
						    <button type="button" class="btn btn-lg  btn-success" onclick="addOrEdit(1)">
						      <i class="icon-pencil"></i>修改</button>
						    <button type="button" class="btn btn-lg  btn-danger" onclick="deleteListTodoArray(1)">
							  <i class="icon-minus"></i>删除</button>
							  <button type="button" class="btn btn-lg  btn-primary" onclick="switchStatus(0)">
							  <i class="icon-pencil"></i>办结</button>
						</div>
				 </div>
			</div>	
			<div style="margin:5px 0"></div>
			
		    <cui:grid id="listTodoGrid${idSuffix}" rownumbers="true" width="auto" height="450" multiselect="true" altRows="true"   
		    	url="${ctx}/listTodo/getListTodoGrid.do?holdername=${username}&status=0" rowNum="20">
		    	<cui:gridCols>
		    		<cui:gridCol name="id" hidden="true"></cui:gridCol>
		    		<cui:gridCol name="status" hidden="true"></cui:gridCol>
		    		<cui:gridCol name="description"  width="800">Description</cui:gridCol>
		    		<cui:gridCol name="priority" width="200" align="center"  formatter="formatePriority">Priority</cui:gridCol>
		    		<cui:gridCol name="recordTime" width="200" align="center">CreateTime</cui:gridCol>
		    	</cui:gridCols>
		    	<cui:gridPager gridId="listTodoGrid${idSuffix}" />
		    </cui:grid> 
    </div>
    
    <div class="tab-pane fade" id="done">
       <div style="margin:5px 0"></div>
			<div class="container-fluid">
				 <div class="row ">		
					 <div class="btn-group span5 col-xs-offset-1huang">
							<button type="button" class="btn btn-lg  btn-primary" data-toggle="modal" 
				   				data-target="#addOrEditListTodoModal" onclick="addOrEdit(0)">
							  <i class="icon-plus"></i>新增</button>
						    <button type="button" class="btn btn-lg  btn-success" onclick="addOrEdit(2)">
						      <i class="icon-pencil"></i>修改</button>
						    <button type="button" class="btn btn-lg  btn-danger" onclick="deleteListTodoArray(2)">
							  <i class="icon-minus"></i>删除</button>
							   <button type="button" class="btn btn-lg  btn-primary" onclick="switchStatus(1)">
							  <i class="icon-pencil"></i>恢复</button>
						</div>
				 </div>
			</div>	
			<div style="margin:5px 0"></div>
			
		    <cui:grid id="listdoGrid${idSuffix}" rownumbers="true" width="auto" height="420" multiselect="true" altRows="true"   
		    	url="${ctx}/listTodo/getListTodoGrid.do?holdername=${username}&status=1" rowNum="20">
		    	<cui:gridCols>
		    		<cui:gridCol name="id" hidden="true"></cui:gridCol>
		    		<cui:gridCol name="status" hidden="true"></cui:gridCol>
		    		<cui:gridCol name="description"  width="800">Description</cui:gridCol>
		    		<cui:gridCol name="recordTime" width="300" align="center">CreateTime</cui:gridCol>
		    	</cui:gridCols>
		    	<cui:gridPager gridId="listdoGrid${idSuffix}" />
		    </cui:grid> 
    </div>


		    
	<script>
	
	function switchStatus(index){
		var listTodoGrid = $("#listTodoGrid${idSuffix}");
		var status=1;
		if(index==1){
			listTodoGrid = $("#listdoGrid${idSuffix}");
			status=0;
		}
		var sel = listTodoGrid.grid("option", "selarrrow");
		if(sel.length<1){
			message("请至少选择一条记录！");
			return;
		}
		var ids=listTodoGrid.grid("getRowData",sel[0]).id;;
		for(var i=1;i<sel.length;i++){
			ids=ids+","+listTodoGrid.grid("getRowData",sel[i]).id;
		}
		
		$.ajax({
						type : 'post',
						url  :  ctx + '/listTodo/switchStatus.do?ids='+ids+'&status='+status,
						success : function(data) {
							if(data.msg){
								hide();
								message("Successful！");
								$("#listTodoGrid${idSuffix}").grid('reload');
								$("#listdoGrid${idSuffix}").grid('reload');
							}else{
								error('Fail!');
							}
						},
						error : function(e) {
							hide();
							error(e);
						}
				});
		
	}	
	
	//格式化操作栏
	function formatePriority(cellValue, options, rowObject){
		var result="Urgent";
		if(cellValue==1){
			result="";
		}
		return result;
	}
	
	function addOrEdit(index){
		debugger;
		$("#addOrEditListTodoForm")[0].reset(); 
		//0 stands for create, 1 stands for update todo, 2stands for update do
		if(index==0){
			$("#listTodoModalDescription").html("Create ListTodo");
		}else{
			var listTodoGrid = $("#listTodoGrid${idSuffix}");
			if(index==2){
				listTodoGrid = $("#listdoGrid${idSuffix}");
			}
			var sel=listTodoGrid.grid("option", "selarrrow");
			var row =listTodoGrid.grid("getRowData",sel);
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
    		$("#listTodoModalDescription").html("Update ListTodo");
			$("#listTodoId").val(row.id);
			$("#listTodoRecordTime").val(row.recordTime);
			$("#listTodoDescription").val(row.description);
			$("#listTodoStatus").val(row.status);
			$("#listTodoPriority").val(row.priority);
			$("#addOrEditListTodoModal").modal();
		}
	}
	
	//删除编码
	function deleteListTodo(ids){
		var listTodoGrid=$("#listTodoGrid${idSuffix}");
		var listdoGrid=$("#listdoGrid${idSuffix}");
		$.confirm("确定删除选中记录吗？", function(r) {
			if (r) {
				loading("删除中，请稍候...");
				$.ajax({
						type : 'post',
						url : ctx + '/listTodo/delete.do?id='+ids,
						success : function(data) {
							if(data.msg){
								hide();
								message("删除成功！");
								listTodoGrid.grid('reload');
								listdoGrid.grid('reload');
							}else{
								hide();
								listTodoGrid.grid('reload');
								listdoGrid.grid('reload');
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
	
	//批量删除
	function deleteListTodoArray(index){
		var listTodoGrid = $("#listTodoGrid${idSuffix}");
		if(index==2){
			listTodoGrid = $("#listdoGrid${idSuffix}");
		}
		var sel = listTodoGrid.grid("option", "selarrrow");
		if(sel.length<1){
			message("请至少选择一条记录！");
			return;
		}
		var ids=listTodoGrid.grid("getRowData",sel[0]).id;;
		for(var i=1;i<sel.length;i++){
			ids=ids+","+listTodoGrid.grid("getRowData",sel[i]).id;
		}
		deleteListTodo(ids);
	}
	</script>
</body>
</html>