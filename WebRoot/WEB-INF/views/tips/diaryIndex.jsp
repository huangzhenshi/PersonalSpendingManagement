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


<title>Tornado_huang</title>
<%@ include file="../../include/headerForCUI.jsp"%>
</head>
<body>
<div style="margin:5px 0"></div>
<div class="container-fluid">
	 <div class="row ">		
		 <div class="btn-group col-xs-offset-1huang">
				<button type="button" class="btn btn-lg  btn-primary" data-toggle="modal" 
	   				data-target="#DiaryAddOrEditModal" onclick="addOrEditDiary(0)">
				  <i class="icon-plus"></i>Add</button>
			    <button type="button" class="btn btn-lg  btn-success" onclick="addOrEditDiary(1)">
			      <i class="icon-pencil"></i>Edit</button>
			    <button type="button" class="btn btn-lg  btn-danger" onclick="deleteDiaryArray()">
				  <i class="icon-minus"></i>Delete</button>
				  	
				<div class="input-group  col-sm-4" style="float: right; margin:0 30px 0 0;">
			   		<input type="text" class="form-control input-lg" id="searchInfo" placeholder="输入Title模糊查找">
			   		<span class="input-group-addon btn btn-lg btn-primary icon-search" onclick="search();">搜索</span>
				</div>
				  <div class="input-group  col-sm-1" style="float: right;">
				  	<select id="articleType"   name="type" class="form-control input-lg">
								 <c:forEach items="${codeList}" var="code">
											<option value="${code.value}">${code.code}</option>
								 </c:forEach>
						</select>
				 </div>
				
				  
			</div>
	 </div>
</div>	
<div style="margin:5px 0"></div>

		    <cui:grid id="diaryGrid${idSuffix}" rownumbers="true" fitStyle="fill" multiselect="true" altRows="true"   
		    	url="${ctx}/diary/getDiaryGrid.do?holdername=${username}" rowNum="20">
		    	<cui:gridCols>
		    		<cui:gridCol name="id" hidden="true">id</cui:gridCol>
		    		<cui:gridCol name="tagTime" width="80" align="center">TagTime</cui:gridCol>
		    		<cui:gridCol name="type" width="80"  align="center" formatter="formateType">Type</cui:gridCol>
		    		<cui:gridCol name="title" width="400" formatter="formatePreview">Title</cui:gridCol>
		    		<cui:gridCol name="lastTime" width="80" align="center">LastTime</cui:gridCol>
		    	</cui:gridCols>
		    	<cui:gridPager gridId="diaryGrid${idSuffix}" />
		    </cui:grid> 
		    
	<script>
	function search(){
		var baseSearch = "${ctx}/diary/getDiaryGrid.do?holdername=${username}&type="+$("#articleType").val()+"&title="+$("#searchInfo").val();
		var diaryGrid=$("#diaryGrid${idSuffix}");
		diaryGrid.grid("option","url",baseSearch);
		diaryGrid.grid("reload"); 
	}
	
	function refreshGrid(){
		$("#diaryGrid${idSuffix}").grid('reload');
	}
	
	function successHandlerShowMessage(msg){
		message(msg);
	}
	function formatePreview(cellValue, options, rowObject){
		var id=rowObject.id;
		var result="<a href='#' style='color:blue;' onclick='addOrEditDiary(2,"+id+")'>"+cellValue+"</a>";
		return result;
	}
	
	
	
	
	
	function addOrEditDiary(index,id){
		if(index==0){
			openWindow("${ctx}/diary/toCkeditorPage.do?username=${username}");
		}else if(index==1){
			var diaryGrid = $("#diaryGrid${idSuffix}");
			var sel=diaryGrid.grid("option", "selarrrow");
			var row = $("#diaryGrid${idSuffix}").grid("getRowData",sel);
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
			openWindow("${ctx}/diary/toCkeditorPage.do?username=${username}&id="+row.id);
		}else{
			openWindow("${ctx}/diary/toCkeditorPage.do?username=${username}&id="+id);
		}
		
		
	}
	
	function opentest(){
		openWindow("${ctx}/sleep/toMainSleepPage.do?username=${username}");
	}
	
	
	
	$(function(){
		if('${message}'){
			message('${message}');
		}
	})
						
	//删除编码
	function deleteDiary(ids){
		var diaryGrid=$("#diaryGrid${idSuffix}");
		$.confirm("确定删除选中记录吗？", function(r) {
			if (r) {
				loading("删除中，请稍候...");
				$.ajax({
						type : 'post',
						url : ctx + '/diary/delete.do?id='+ids,
						success : function(data) {
							if(data.msg){
								hide();
								message("删除成功！");
								diaryGrid.grid('reload');
							}else{
								hide();
								diaryGrid.grid('reload');
								error(e);
							}
						},
						error : function(e) {
							hide();
							diaryGrid.grid('reload');
							error(e);
						}
				});
				
			} else {
				message("取消");
			}
		});
	}
	
	//批量删除
	function deleteDiaryArray(){
		var diaryGrid = $("#diaryGrid${idSuffix}");
		var sel = diaryGrid.grid("option", "selarrrow");
		if(sel.length<1){
			message("请至少选择一条记录！");
			return;
		}
		var ids=diaryGrid.grid("getRowData",sel[0]).id;;
		for(var i=1;i<sel.length;i++){
			ids=ids+","+diaryGrid.grid("getRowData",sel[i]).id;
		}
		deleteDiary(ids);
	}
	</script>
</body>
</html>