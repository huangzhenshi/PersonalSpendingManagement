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
 <div class="container-fluid" id="searchPanel">
	 <div class="row" >
			<form  class="form-inline" role="form">	
					<button type="button" class="btn btn-lg  btn-primary " data-toggle="modal" 
			   				data-target="#BlogAddOrEditModal" onclick="addOrEditBlog(0)">
						  <i class="icon-plus"></i>Add</button>
					    <button type="button" class="btn btn-lg  btn-success " onclick="addOrEditBlog(1)">
					      <i class="icon-pencil"></i>Edit</button>
					    <button type="button" class="btn btn-lg  btn-danger " onclick="deleteBlogArray()">
						  <i class="icon-minus"></i>Delete</button>
						  
						<span style="margin:0 5px">Category:</span>
					  	<select id="blogCategory"   name="category" class="form-control input-lg" onchange="selectCategory();" style="width:180px">
					  		<option value=""> </option>
									 <c:forEach items="${mainTypeList}" var="category">
												<option value="${category}">${category}</option>
									 </c:forEach>
							</select>
							
						<span style="margin:0 5px">Type:</span>
					  	<select id="blogNextlevelCategory"   name="nextlevelCategory" class="form-control input-lg" onchange="selectNextLevelCategory();" style="width:180px">
					  			<option value="">   </option>
						</select>
							
					    <div class="input-group " style="float: right; margin:0 20px 0 0;">
					   		<input type="text" class="form-control input-lg" onkeydown="if(event.keyCode == 13) return false;" id="searchInfo" placeholder="输入TiTle模糊查询">
					   		<span class="input-group-addon btn btn-lg btn-primary icon-search" onclick="search();" onkeydown="if(event.keyCode == 13) return false;">搜索</span>
						</div>
		
		  	</form>
	</div>
</div>

<div style="margin:5px 0"></div>
		    <cui:grid id="blogGrid${idSuffix}" rownumbers="true" fitStyle="fill" multiselect="true" altRows="true"   
		    	url="${ctx}/blog/getBlogGrid.do?holdername=${username}" rowNum="20">
		    	<cui:gridCols>
		    		<cui:gridCol name="id" hidden="true">id</cui:gridCol>
		    		<cui:gridCol name="tagTime" width="80" align="center">TagTime</cui:gridCol>
		    		<cui:gridCol name="title" width="400" formatter="formatePreview">Title</cui:gridCol>
		    		<cui:gridCol name="category" width="80" align="center">Category</cui:gridCol>
		    		<cui:gridCol name="nextlevelCategory" width="80" align="center">Type</cui:gridCol>
		    		<cui:gridCol name="lastTime" width="80" align="center">LastTime</cui:gridCol>
		    	</cui:gridCols>
		    	<cui:gridPager gridId="blogGrid${idSuffix}" />
		    </cui:grid> 
		    
	<script>
	function formatePreview(cellValue, options, rowObject){
		return "<a href='javascript:addOrEditBlog(2,\""+rowObject.id +"\");' style='color:blue;'>"+cellValue+"</a>";
	}
	
	function selectNextLevelCategory(){
		var baseSearch = "${ctx}/blog/getBlogGrid.do";
		var blogGrid=$("#blogGrid${idSuffix}");
		var params = {};
		params["category"] =$("#blogCategory").val();
		params["holdername"] ='${username}';
		params["nextlevelCategory"] =$("#blogNextlevelCategory").val();
		blogGrid.grid("option","postData",params);
		blogGrid.grid("option","url",baseSearch);
		blogGrid.grid("reload"); 
	}
	
	
	//reload the grid  and sycn the nextlevelCategory Select element at the same time
	function selectCategory(){
		$("#blogNextlevelCategory").empty();
		$("#blogNextlevelCategory").append('<option value="">  </option>');
		var blogGrid=$("#blogGrid${idSuffix}");
		var category=$("#blogCategory").val();
		var baseSearch="${ctx}/blog/getBlogGrid.do";
		if(!isEmpty(category.trim())){
				$.ajax({
					type : 'post',
					url : ctx + '/blog/findAllNextleverCategory.do',
					dataType : "json",
					data : {
						username : '${username}',
						category: category
					},
					success : function(data) {
						$.each(data, function(i) {     
							var option='<option value="'+data[i]+'">'+data[i]+'</option>';
							$("#blogNextlevelCategory").append(option);
						}); 
						var params = {};
						params["category"] =category;
						params["holdername"] ='${username}';
						blogGrid.grid("option","postData",params);
						blogGrid.grid("option","url",baseSearch);
						blogGrid.grid("reload"); 
					},
					error : function(e) {
						hide();
						blogGrid.grid('reload');
						error(e);
					}
				});
		}
	}
	
	
	
	function search(){
		var baseSearch = "${ctx}/blog/getBlogGrid.do?holdername=${username}&category="+$("#blogCategory").val()+"&nextlevelCategory="+$("#blogNextlevelCategory").val()+"&title="+$("#searchInfo").val();
		var blogGrid=$("#blogGrid${idSuffix}");
		blogGrid.grid("option","url",baseSearch);
		blogGrid.grid("reload"); 
	}
	
	function refreshGrid(){
		$("#blogGrid${idSuffix}").grid('reload');
	}
	
	function successHandlerShowMessage(msg){
		message(msg);
	}

	function addOrEditBlog(index,id){
		if(index==0){
			openWindow("${ctx}/blog/toCkeditorPage.do?username=${username}");
		}else if(index==1){
			var blogGrid = $("#blogGrid${idSuffix}");
			var sel=blogGrid.grid("option", "selarrrow");
			var row = $("#blogGrid${idSuffix}").grid("getRowData",sel);
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
			openWindow("${ctx}/blog/toCkeditorPage.do?username=${username}&id="+row.id);
		}else{
			openWindow("${ctx}/blog/toCkeditorPage.do?username=${username}&id="+id);
		}
		
		
	}
	$(function(){
		if('${message}'){
			message('${message}');
		}
	})
						
	//删除编码
	function deleteBlog(ids){
		var blogGrid=$("#blogGrid${idSuffix}");
		$.confirm("确定删除选中记录吗？", function(r) {
			if (r) {
				loading("删除中，请稍候...");
				$.ajax({
						type : 'post',
						url : ctx + '/blog/delete.do?id='+ids,
						success : function(data) {
							if(data.msg){
								debugger;
								hide();
								message("删除成功！");
								blogGrid.grid('reload');
							}else{
								hide();
								blogGrid.grid('reload');
								error(e);
							}
						},
						error : function(e) {
							hide();
							blogGrid.grid('reload');
							error(e);
						}
				});
				
			} else {
				message("取消");
			}
		});
	}
	
	//批量删除
	function deleteBlogArray(){
		var blogGrid = $("#blogGrid${idSuffix}");
		var sel = blogGrid.grid("option", "selarrrow");
		if(sel.length<1){
			message("请至少选择一条记录！");
			return;
		}
		var ids="'"+blogGrid.grid("getRowData",sel[0]).id+"'";
		for(var i=1;i<sel.length;i++){
			ids=ids+",'"+blogGrid.grid("getRowData",sel[i]).id+"'";
		}
		deleteBlog(ids);
	}
	</script>
</body>
</html>