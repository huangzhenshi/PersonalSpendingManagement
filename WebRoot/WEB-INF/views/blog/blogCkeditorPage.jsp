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



<title>Tornado_huang</title>
<%@ include file="../../include/headerForCUI.jsp"%>
<script type="text/javascript" src="${ctx}/res/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx}/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${ctx}/ckfinder/ckfinder.js"></script>
<style>.error{color:red;}</style>
</head>

<body >
<form name="form" id="addOrEditBlogForm" action="${ctx}/blog/addOrEditBlogSava.do">
				<input name="holdername" value="${username}" hidden=true""/>
				<input name="id" value="${blog.id}" hidden=true""/>
		<div class="container-fluid">
			 <div class="row ">					
				<div class="col-lg-4" >
					<div class="form-group"> 
					      <label >TITLE:</label>    
							<input  class="form-control required"  id="title" name="title" value="${blog.title}"/>
					 </div>
				</div>
				
				<div class="col-lg-2" >
					<div class="form-group"> 
					 <label >Categroy:</label>    
						<select id="blogCategory"   name="category" class="form-control" onchange="selectCategory();">
									 <c:forEach items="${mainTypeList}" var="category">
												<option value="${category}" <c:if test="${blog.category==category}">selected</c:if>>${category}</option>
									 </c:forEach>
						</select>
					 </div>
				</div>
				
				<div class="col-lg-2" >
					<div class="form-group"> 
					 <label >Next Level Category:</label>    
						<select id="blogNextlevelCategory"   name="nextlevelCategory" class="form-control" onchange="selectNextLevelCategory();" >
									<option value=""> </option>
						    <c:forEach items="${nextCategoryList}" var="nextCategory">
									<option value="${nextCategory}" <c:if test="${blog.nextlevelCategory==nextCategory}">selected</c:if>>${nextCategory}</option>
							</c:forEach>
						</select>
					 </div>
				</div>
				
				<div class="col-lg-2">
				<div class="form-group"> 
					      <label >TAG_DATE:</label>   
						<input type="text" class="date form_date form-control required" id="tagTime" name="tagTime" value="${blog.tagTime}"
									         	 data-date="" data-date-format="yyyy-mm-dd" />
				</div>          
			 </div>	
			 <div class="col-lg-2">
				 <div class="form-group"> 
				 <div style="margin:15px 0"></div>
						  <span onclick="submitBlog();" class="btn btn-lg" style="background-color:#3686E8;color:white">保存</span>
						  <span onclick="window.close();" class="btn btn-lg" style="background-color:#3686E8;color:white">取消</span>
				 </div>
			</div>
		</div>
		
			    <textarea id="editor1" name="content" class="ckeditor" rows="10">${blog.content}
			    </textarea>
			   
		
		</form>
<script type="text/javascript">
$(function(){
	if(!'${blog.tagTime}'){
		$("#tagTime").val(getDateTodayDayOnly());
	}
})

$().ready(function() {
		$("#addOrEditBlogForm").validate();
	});
	
$('.form_date').datetimepicker({
    language:  'zh-CN',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});
//reload the grid  and sycn the nextlevelCategory Select element at the same time
function selectCategory(){
	$("#blogNextlevelCategory").empty();
	$("#blogNextlevelCategory").append('<option value="">  </option>');
	var category=$("#blogCategory").val();
	if(!isEmpty(category.trim())){
			$.ajax({
				type : 'post',
				url : ctx + '/blog/findAllNextleverCategory.do?username=${username}&category='+category,
				success : function(data) {
					var arrType=data.typeList;
					$.each(arrType, function(i) {     
						var option='<option value="'+arrType[i]+'">'+arrType[i]+'</option>';
						$("#blogNextlevelCategory").append(option);
					}); 
				},
				error : function(e) {
					hide();
					blogGrid.grid('reload');
					error(e);
				}
			});
	}
}


	function submitBlog(){
		if($("#addOrEditBlogForm").valid()){
			$.ajax({
				type : 'post',
				url : '${ctx}/blog/addOrEditBlogSava.do',
				data : {"holdername":"${username}",
						"id":"${blog.id}",
						"title":$("#title").val(),
						"tagTime":$("#tagTime").val(),
						"content":CKEDITOR.instances.editor1.getData(),
						"category":$("#blogCategory").val(),
						"nextlevelCategory":$("#blogNextlevelCategory").val()
				},
				dataType:"json",  
				success : function(data) {
					debugger;
					if(data.msg){
						window.opener.refreshGrid();
						window.close();
						window.opener.successHandlerShowMessage("Success!");
					}else{
						message("Fail!");
					}
				},
				error : function(e) {
					message(e.msg);
					error(e);
				}
			});
		}
	}
    $(function () {
        //处理CKEDITOR的值 处理获取图片的地址
        function CKupdate() {
             for (instance in CKEDITOR.instances)
                 CKEDITOR.instances[instance].updateElement();
        }
        
    })
    </script>
</body>
</html>