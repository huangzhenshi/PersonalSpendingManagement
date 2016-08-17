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
<script src="${ctx}/res/resource/style/js/md5.min.js"></script>
<script src="${ctx}/res/resource/style/js/sha1.js"></script>
<script src="${ctx}/res/thirdParty/jqfloat.min.js"></script>
<script src="${ctx}/res/resource/style/js/bootstrap.min.js"></script>
<script src="${ctx}/res/resource/style/js/jquery.validate.min.js"></script>
<script src="${ctx}/res/resource/style/js/messages_zh.js"></script>
<script src="${ctx}/mainJs/function.js"></script>

<link href="${ctx}/res/resource/style/css/inforGlobal.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/res/resource/style/css/bootstrap.min.css" rel="stylesheet"/>

   
   <script>
$().ready(function() {
	$("#form1").validate();
	});
</script>
<style>
.error{
	color:red;
}
</style>

</head>
<body>

	<!-- 导航栏 -->
 	<%@include file="../common/navbar.jsp" %>
 	
 	
 	<form method="get" class="cmxform" id="form1" action="">
		  <fieldset>
		    <legend>登录框</legend>
		    <p>
		      <label for="user">用户名</label>
		      <input id="user" name="user" required>
		    </p>
		    <p>
		      <label for="password">密码</label>
		      <input id="password" type="password" name="password" required>
		    </p>
		    <p>
		      <input class="submit" type="submit" value="Login">
		    </p>
		  </fieldset>
	</form>
 <div class="container">
	 <div class="row">					
		<div class="form-group  btn-group  col-xs-offset-1huang">
			<button type="button" class="btn btn-lg btn-primary" data-toggle="modal" 
   				data-target="#addOrEditCodeModal" onclick="AddOrEditCode(0)">
			  <i class="icon-plus"></i>新增</button>
		    <button type="button" class="btn btn-lg btn-success" data-toggle="modal" 
   				data-target="#addOrEditCodeModal"  onclick="AddOrEditCode(1)">
		      <i class="icon-pencil"></i>修改</button>
		    <button type="button" class="btn btn-lg btn-danger" onclick="deleteCodeArray()">
			  <i class="icon-minus"></i>删除</button>
			<div class="input-group  col-sm-4 pull-right">
		   		<input type="text" class="form-control input-lg" placeholder="输入类型或者描述值搜索">
		   		<span class="input-group-addon btn btn-primary">搜索</span>
			</div>
		</div>		          
	 </div>
	 
	<%@include file="editOrUpdateCodeModal.jsp" %>
</div>
		
	    <cui:grid id="codeGrid${idSuffix}" rownumbers="true" width="auto" height="750" multiselect="true" altRows="true" 
	    	data="${codes}" datatype="local" rowNum="130">
	    	<cui:gridCols>
	    		<cui:gridCol name="id" hidden="true">id</cui:gridCol>
	    		<cui:gridCol name="type" align="center">码表类型</cui:gridCol>
	    		<cui:gridCol name="code" align="center">code值</cui:gridCol>
	    		<cui:gridCol name="value" width="80" align="center">码值</cui:gridCol>
	    		<cui:gridCol name="isAll" align="center" formatter="isAllFormat">是否专有</cui:gridCol>
	    		<cui:gridCol name="description" width="380">描述</cui:gridCol>
	    		<cui:gridCol name="op" fixed="true" width="80" align="center" formatter="operateFormatter">操作选项</cui:gridCol>
	    	</cui:gridCols>
	    </cui:grid> 
		    
	<script>
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
		debugger;
		//点击操作选项中修改数据
		if(index==0){
			$("#addOrEditCodeForm")[0].reset();  
			return;
		}else if(index==1){
			var codeGrid = $("#codeGrid${idSuffix}");
			var sel = codeGrid.grid("option", "selarrrow");
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
			var test=codeGrid.grid("getRowData",sel);
			$("#addOrEditCodeForm")[0].reset();  
			$("#modalDescription").val("修改码表值");
			$("#codeId").val(codeGrid.grid("getRowData",sel).id);
			$("#codeType").val(codeGrid.grid("getRowData",sel).type);
			$("#code").val(codeGrid.grid("getRowData",sel).code);
			$("#codeValue").val(codeGrid.grid("getRowData",sel).value);
			$("#description").val(codeGrid.grid("getRowData",sel).description);
			
		}else{
			window.location.href=('${ctx}/code/editOrUpdateCode.do?holderName=${loginUser.username}');
		}
	}
	</script>
</body>
</html>