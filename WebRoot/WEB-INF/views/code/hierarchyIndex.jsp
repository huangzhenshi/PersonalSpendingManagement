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

	<div style="margin:5px 0"></div>
			<div class="container-fluid">
				 <div class="row ">		
					 <div class="btn-group span5 col-xs-offset-1huang">
							<button type="button" class="btn btn-lg  btn-primary" data-toggle="modal" 
				   				data-target="#hierarchyAddOrEditModal" onclick="addOrEdit(0)">
							  <i class="icon-plus"></i>Add</button>
						    <button type="button" class="btn btn-lg  btn-success" onclick="addOrEdit(1)">
						      <i class="icon-pencil"></i>Modify</button>
						    <button type="button" class="btn btn-lg  btn-danger" onclick="deleteHierarchyArray(1)">
							  <i class="icon-minus"></i>Delete</button>
						</div>
				 </div>
			</div>	
			<div style="margin:5px 0"></div>
			
	    <cui:grid id="hierarchyGrid${idSuffix}" rownumbers="true" fitStyle="fill" multiselect="true" altRows="true" 
	    	url="${ctx}/hierarchy/getHierarchyGrid.do?username=${username}" rowNum="20">
	    	<cui:gridCols>
	    		<cui:gridCol name="id" hidden="true">id</cui:gridCol>
	    		<cui:gridCol name="category" align="center">Category</cui:gridCol>
	    		<cui:gridCol name="type" align="center">Type</cui:gridCol>
	    		<cui:gridCol name="parentId" align="center">ParentId</cui:gridCol>
	    		<cui:gridCol name="parentType" align="center">ParentType</cui:gridCol>
	    	</cui:gridCols>
	    	<cui:gridPager gridId="hierarchyGrid${idSuffix}" />
	    </cui:grid> 
		    
	<script>
	
	$(function(){
		$("#hierarchyParentType").empty(); 
		$("#hierarchyCategory").empty(); 
		$("#hierarchyParentType").append('<option value="">  </option>');
		var arr=${typeList};
		for(var i=0;i<arr.length;i++){
			var option='<option value="'+arr[i].id+'">'+arr[i].text+'</option>';
			$("#hierarchyParentType").append(option);
		}
		
		var arrCategory=${categoryList};
		$.each(arrCategory, function(i) {     
			var option='<option value="'+arrCategory[i].value+'">'+arrCategory[i].code+'</option>';
			$("#hierarchyCategory").append(option);
		}); 
		
	})
	
	function addOrEdit(index){
		$("#addOrEditHierarchyForm")[0].reset(); 
		//0 stands for create, 1 stands for update todo, 2stands for update do
		if(index==0){
			$("#hierarchyModalDescription").html("Create Hierarchy");
		}else{
			var hierarchyGrid = $("#hierarchyGrid${idSuffix}");
			var sel=hierarchyGrid.grid("option", "selarrrow");
			var row =hierarchyGrid.grid("getRowData",sel);
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
    		$("#hierarchyModalDescription").html("Update Hierarchy");
			$("#hierarchyId").val(row.id);
			$("#hierarchyCategory").val(row.category);
			$("#hierarchyType").val(row.type);
			$("#hierarchyParentType").val(row.parentId);
			$("#hierarchyAddOrEditModal").modal();
		}
	}
	
	//删除编码
	function deleteHierarchy(ids){
		var hierarchyGrid=$("#hierarchyGrid${idSuffix}");
		$.confirm("确定删除选中记录吗？", function(r) {
			if (r) {
				loading("删除中，请稍候...");
				$.ajax({
						type : 'post',
						url : ctx + '/hierarchy/delete.do?id='+ids,
						success : function(data) {
							if(data.msg){
								hide();
								message("删除成功！");
								hierarchyGrid.grid('reload');
							}else{
								hide();
								hierarchyGrid.grid('reload');
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
	function deleteHierarchyArray(index){
		var hierarchyGrid = $("#hierarchyGrid${idSuffix}");
		var sel = hierarchyGrid.grid("option", "selarrrow");
		if(sel.length<1){
			message("请至少选择一条记录！");
			return;
		}
		var ids=hierarchyGrid.grid("getRowData",sel[0]).id;;
		for(var i=1;i<sel.length;i++){
			ids=ids+","+hierarchyGrid.grid("getRowData",sel[i]).id;
		}
		deleteHierarchy(ids);
	}

	</script>
</body>
</html>