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
<script type="text/javascript" src="${ctx}/res/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${ctx}/res/ckfinder/ckfinder.js"></script>
<style>.error{color:red;}</style>
</head>

<body >
<form name="form" id="addOrEditDiaryForm" action="${ctx}/diary/addOrEditDiarySava.do">
				<input name="holdername" value="${username}" hidden=true""/>
				<input name="id" value="${diary.id}" hidden=true""/>
		<div class="container-fluid">
			 <div class="row ">					
				<div class="col-lg-7" >
					<div class="form-group"> 
					      <label >TITLE:</label>    
							<input  class="form-control required"  id="title" name="title" value="${diary.title}"/>
					 </div>
					  
				</div>
				<div class="col-lg-3">
				<div class="form-group"> 
					      <label >TAG_DATE:</label>   
						<input type="text" class="date form_date form-control required" id="sleepTimes" name="tagTime" value="${diary.tagTime}"
									         	 data-date="" data-date-format="yyyy-mm-dd" />
				</div>          
			 </div>	
			 <div class="col-lg-2">
				 <div class="form-group"> 
						  <button class=" form-control btnBs btn-success">SAVE</button>
						  <button class=" form-control btnBs btn-primary" onclick="closeDiary()">CLOSE</button>
				 </div>
			</div>
		</div>
		
			    <textarea id="editor1" name="content" class="ckeditor" rows="10">&nbsp;${diary.content}
			    </textarea>
			   
		
		</form>
<script type="text/javascript">
function closeDiary(){
	window.opener=null;
	window.open('','_self');
	window.close();
}
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


$().ready(function() {
		$("#addOrEditDiaryForm").validate();
	});
	/* function sub(){
		debugger;
		var editor1 = CKEDITOR.instances.editor1.getData();//取得textarea的值
		var title= $("#title").val();
		window.location.href="myPicture.do?editor1="+editor1+"&title="+title;
     
	
	} */
        /* $(function () {
            // var editor = CKEDITOR.replace("editor1", { "toolbar": "Basic" }); //显示编辑器
            // CKFinder.setupCKEditor(editor, "ckfinder/"); //设置图片管理组件

            //处理CKEDITOR的值 处理获取图片的地址
            function CKupdate() {
                 for (instance in CKEDITOR.instances)
                     CKEDITOR.instances[instance].updateElement();
            }
            
            
        }) */

    </script>
</body>
</html>