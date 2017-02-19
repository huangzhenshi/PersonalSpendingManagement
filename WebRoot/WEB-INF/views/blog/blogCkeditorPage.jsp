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

<title>Tornado_huang</title>
<%@ include file="../../include/headerForCUI.jsp"%>
<script type="text/javascript" src="${ctx}/res/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx}/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${ctx}/ckfinder/ckfinder.js"></script>
<script src="${ctx}/res/resource/style/js/ajaxfileupload.js"></script>
<style>.error{color:red;}</style>
</head>

<body >
<form name="form" id="addOrEditBlogForm" action="${ctx}/blog/addOrEditBlogSava.do">
				<input name="holdername" value="${username}" hidden=true""/>
				<input name="id" value="${blog.id}" hidden=true""/>
		<div class="container-fluid">
			 <div class="row ">					
				<div class="col-lg-3" >
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
			 <div class="col-lg-3">
				 <div class="form-group"> 
				 <div style="margin:25px 0"></div>
						  <span onclick="submitBlog();" class="btn " style="background-color:#3686E8;color:white">保存</span>
						  <span onclick="showUpload();" class="btn " style="background-color:#3686E8;color:white">附件</span>
						  <span onclick="showCode();" class="btn " style="background-color:#3686E8;color:white">JS代码</span>
						  <span onclick="window.close();" class="btn " style="background-color:#3686E8;color:white">取消</span>
				 </div>
			</div>
		</div>
		<!-- upload function -->
		<div id="uploadDiv" style="display:none;" >
                                <input name="file" value="请选择路径" type="file" id="fileToUpload" style="display:	inline;">
                                <span onclick="uploadSomeFile();"  class="btn" style="background-color:#3686E8;color:white">导入</span>
                                <ul class="inline" id="attachmentList" style="color:blue;">
								</ul>
        </div>
        		<div id="codeDiv" style="display:none,width:100%;" >
        		<lable>源码</lable>
                <textarea id="codeContent"rows="10" style="width:95%;" name="code">${blog.code}</textarea>              
        </div>
			    <textarea id="editor1" name="content" class="ckeditor" rows="10">${blog.content}</textarea>

			   
		
		</form>
<script type="text/javascript">

$(function(){
	if(!'${blog.tagTime}'){
		$("#tagTime").val(getDateTodayDayOnly());
	}
		var arr='${blog.attachment}'.split(",");
		$.each(arr,function(index){
			 var a="<a href='${ctx}/blog/downAttachment.do?path="+arr[index]+"' style='color:blue;'>"+arr[index]+"</a>";
	        	$("#attachmentList").append(" <li value='"+arr[index]+"'>"+a+"</li>");
				
			})
        //处理CKEDITOR的值 处理获取图片的地址
        function CKupdate() {
             for (instance in CKEDITOR.instances)
                 CKEDITOR.instances[instance].updateElement();
        }
		if(isEmpty('${code}')){
			$("#codeDiv").css("display","none");
		}else{
			$("#codeDiv").css("display","block");
		}
        
    })

function showCode(){
	var play=$("#codeDiv").css("display");
	if(play=="block"){
		$("#codeDiv").css("display","none");
	}else{
		$("#codeDiv").css("display","block");
	}
}

function showUpload(){
	var play=$("#uploadDiv").css("display");
	if(play=="block"){
		$("#uploadDiv").css("display","none");
	}else{
		$("#uploadDiv").css("display","block");
	}
}
function uploadSomeFile(){
	var pathArr=$("#fileToUpload").val().split("\\");
	var fileName=pathArr[pathArr.length-1];
	if(isEmpty(fileName)){
		message("请选择上传文件");
		return;
	}
	var fileType=fileName.split(".")[1];
	if("txt"!=fileType){
		message("仅支持txt格式附件上传");
		return;
	}
	 $.ajaxFileUpload({  
		 url : ctx + '/blog/import.do',
		 dataType: 'json',//返回数据的类型  
         fileElementId:'fileToUpload',//file标签的id
         success: function (result) {  
        		 var a="<a href='${ctx}/blog/downAttachment.do?path="+result+fileName+"' style='color:blue;'>"+result+fileName+"</a>";
        	$("#attachmentList").append(" <li value="+result+">"+a+"</li>");
         },  
         error: function (data) {  
        	 message(e.msg);
         }  
     });  	
}

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
		debugger;
		var attachment="";
		$("#attachmentList li").each(function(){
			debugger;
			var process=1;
			 attachment = attachment+$(this).text()+",";
		});
		attachment=attachment.substring(0,attachment.length-1);
		if(attachment.substring(0,1)==","){
			attachment=attachment.substring(1);	
		}
		
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
						"nextlevelCategory":$("#blogNextlevelCategory").val(),
						"attachment":attachment,
						"code":$("#codeContent").val()
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

    </script>
</body>
</html>