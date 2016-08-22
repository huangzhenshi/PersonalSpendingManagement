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
<style>.error{color:red;}</style>
</head>
<body>

	<!-- 导航栏 -->
 	<%@include file="../common/navbar.jsp" %>
 <div class="container">
	 <div class="row">					
		<div class="form-group  btn-group  col-xs-offset-1huang">
			<button type="button" class="btn btn-lg btn-primary" data-toggle="modal" 
   				data-target="#addOrEditCodeModal" onclick="AddOrEditCode(0)">
			  <i class="icon-plus"></i>新增</button>
		    <button type="button" class="btn btn-lg btn-success" onclick="AddOrEditCode(1)">
		      <i class="icon-pencil"></i>修改</button>
		    <button type="button" class="btn btn-lg btn-danger" onclick="deleteCodeArray()">
			  <i class="icon-minus"></i>删除</button>
			<div class="input-group  col-sm-4 pull-right">
		   		<input type="text" class="form-control input-lg" id="searchInfo" placeholder="输入类型或者描述值搜索">
		   		<span class="input-group-addon btn btn-lg btn-primary icon-search" onclick="search();">搜索</span>
			</div>
		</div>		          
	 </div>
	 
<%@include file="editOrUpdateCodeModal.jsp" %>
</div>
		
	    <cui:grid id="codeGrid${idSuffix}" rownumbers="true" width="auto" height="750" multiselect="true" altRows="true" 
	    	data="${codes}" datatype="local" rowNum="130">
	    	<cui:gridCols>
	    		<cui:gridCol name="id" hidden="true">id</cui:gridCol>
	    		<cui:gridCol name="holderName" hidden="true">holderName</cui:gridCol>
	    		<cui:gridCol name="type" align="center">码表类型</cui:gridCol>
	    		<cui:gridCol name="code" align="center">code值</cui:gridCol>
	    		<cui:gridCol name="value" width="80" align="center">码值</cui:gridCol>
	    		<cui:gridCol name="isAll" align="center" formatter="isAllFormat">是否专有</cui:gridCol>
	    		<cui:gridCol name="description" width="380">描述</cui:gridCol>
	    		<cui:gridCol name="op" fixed="true" width="80" align="center" formatter="operateFormatter">操作选项</cui:gridCol>
	    	</cui:gridCols>
	    </cui:grid> 
		    
	<script>
	$(function() {
		$("#codeNav").addClass("active");
		$("#codeNav").parent("ul").children("li").not("#codeNav").removeClass("active");
	});
	//格式化操作栏
	function operateFormatter(cellValue, options, rowObject){
		var result = "";
			result += " <a href='javascript:AddOrEditCode(2,\""+ rowObject.id+"\");' title='修改' class='grideditbtn'></a> ";
			result += " <a href='javascript:deleteCode(\""+ rowObject.id+ "\");' title='删除' class='griddeletebtn'></a> ";
		return result;
	}
	
	function isAllFormat(cellValue, options, rowObject){
		
		if(cellValue==0){
			return "通用码值";
		}
		return "专有码值";
	}
	
	//删除编码
	function deleteCode(id){
		$.confirm("确定删除吗？", function(r) {
			if (r) {
				window.location.href=('${ctx}/code/delete.do?id='+id+'&holderName=${loginUser.username}');
			} else {
				message("取消");
			}
		});
	}
	
	//批量删除
	function deleteCodeArray(){
		var codeGrid = $("#codeGrid${idSuffix}");
		var sel = codeGrid.grid("option", "selarrrow");
		if(sel.length<1){
			message("请至少选择一条记录！");
			return;
		}
		var ids=codeGrid.grid("getRowData",sel[0]).id;;
		for(var i=1;i<sel.length;i++){
			ids=ids+","+codeGrid.grid("getRowData",sel[i]).id;
		}
		deleteCode(ids);
	}
	//index: 0 新增 1 按钮点击修改 2 操作选项中点击修改
	function AddOrEditCode(index,id){
		$("#addOrEditCodeForm")[0].reset(); 
		if(index==0){
			return;
		}
		if(index==1){
			var codeGrid = $("#codeGrid${idSuffix}");
			var sel=codeGrid.grid("option", "selarrrow");
			var row = $("#codeGrid${idSuffix}").grid("getRowData",sel);
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
		}else if(index==2){
			var row = $("#codeGrid${idSuffix}").grid("getRowData",id);
		}
		$("#modalDescription").html("修改码表值");
		$("#codeId").val(id);
		$("#codeType").val(row.type);
		$("#code").val(row.code);
		$("#codeValue").val(row.value);
		$("#description").val(row.description);
		$("#addOrEditCodeModal").modal();
	}
	function search(){
		window.location.href=("${ctx}/code/getAllCodes.do?username=${loginUser.username}&index="+$("#searchInfo").val());
	}
	</script>
</body>
</html>