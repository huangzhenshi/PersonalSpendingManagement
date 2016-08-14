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
<script src="${ctx}/res/resource/style/js/bootstrap.minnew.js"></script>
<script src="${ctx}/res/resource/style/js/bootstrap.min.js"></script>

<script src="${ctx}/mainJs/function.js"></script>
<link href="${ctx}/res/resource/style/css/inforGlobal.css" type="text/css" rel="stylesheet" />
<%-- <link href="${ctx}/res/resource/style/css/bootstrap.minnew.css" rel="stylesheet"/> --%>
<link href="${ctx}/res/resource/style/css/bootstrap.min.css" rel="stylesheet"/>

   

</head>
<body>

	<!-- 导航栏 -->
 	<%@include file="../common/navbar.jsp" %>
	 <div class="row">
			<div class="btn-group span5 col-xs-offset-1huang">
				<button type="button" class="btn btn-lg btn-primary" onclick="addOrEditCard(0)">
				  <i class="icon-plus"></i>新增</button>
			    <button type="button" class="btn btn-lg btn-success" onclick="addOrEditCard(1)">
			      <i class="icon-pencil"></i>修改</button>
			    <button type="button" class="btn btn-lg btn-danger" onclick="deleteCardArray()">
			      <i class="icon-minus"></i>删除</button>
			</div>
		</div>
		
		    <cui:grid id="cardGrid${idSuffix}" rownumbers="true" width="auto" height="750" multiselect="true" altRows="true" 
		    	url="${ctx}/cards/getAllCard.do?username=${loginUser.username}">
		    	<cui:gridCols>
		    		<cui:gridCol name="id" align="center">id</cui:gridCol>
		    		<cui:gridCol name="bankName" align="center">银行名称</cui:gridCol>
		    		<cui:gridCol name="accountNumber" align="center">卡号</cui:gridCol>
		    		<cui:gridCol name="balance" width="80" align="center">余额</cui:gridCol>
		    		<cui:gridCol name="location" width="80" align="center">归属地</cui:gridCol>
		    		<cui:gridCol name="password" width="80" align="center">Hint</cui:gridCol>
		    		<cui:gridCol name="updateTime" width="80" align="center">更新时间</cui:gridCol>
		    		<cui:gridCol name="remark" width="380">备注</cui:gridCol>
		    		<cui:gridCol name="op" fixed="true" width="80" align="center" formatter="operateFormatter">操作选项</cui:gridCol>
		    	</cui:gridCols>
		    </cui:grid> 
		    
	<script>
	//格式化操作栏
function operateFormatter(cellValue, options, rowObject){
	var result = "";
		result += " <a href='javascript:addOrEditCard(2,\""+ rowObject.id+"\");' title='修改' class='grideditbtn'></a> ";
		result += " <a href='javascript:deleteCard(\""+ rowObject.id+ "\");' title='删除' class='griddeletebtn'></a> ";
	return result;}
	//删除编码
	function deleteCard(id){
		$.confirm("确定删除吗？", function(r) {
			if (r) {
				window.location.href=('${ctx}/cards/delete.do?id='+id);
			} else {
				message("取消");
			}
		});
	}
	
	//批量删除
	function deleteCardArray(){
		var cardGrid = $("#cardGrid${idSuffix}");
		var sel = cardGrid.grid("option", "selarrrow");
		if(sel.length<1){
			message("请至少选择一条记录！");
			return;
		}
		var ids=cardGrid.grid("getRowData",sel[0]).id;;
		for(var i=1;i<sel.length;i++){
			ids=ids+","+cardGrid.grid("getRowData",sel[i]).id;
		}
		deleteCard(ids);
	}
	//index: 0 新增 1 按钮点击修改 2 操作选项中点击修改
	function addOrEditCard(index,id){
		debugger;
		//点击操作选项中修改数据
		if(index==2){
			window.location.href=('${ctx}/cards/editOrUpdateCard.do?id='+id);
		}else if(index==1){
			var cardGrid = $("#cardGrid${idSuffix}");
			var sel = cardGrid.grid("option", "selarrrow");
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
			var idUpdate = cardGrid.grid("getRowData",sel).id;
			window.location.href=('${ctx}/cards/editOrUpdateCard.do?id='+idUpdate+'&holderName=${loginUser.username}');
		}else{
			window.location.href=('${ctx}/cards/editOrUpdateCard.do?holderName=${loginUser.username}');
		}
	}
	</script>
</body>
</html>