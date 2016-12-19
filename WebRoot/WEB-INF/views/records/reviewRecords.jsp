<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<link href="${ctx}/res/resource/style/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">   

</head>
<body>
<div class="container-fluid" id="searchPanel">
	 <div class="row" >
		    <form id="searchDateForm" class="form-inline " role="form">
		    
	     			<label class="input-lg control-label">选择年份:</label>
				    <select id="sel_year"  class="form-control  input-lg" style="width:30%"></select>
				    
			 		<label class="input-lg control-label">选择月份:</label>
					<select id="sel_month"  class="form-control  input-lg" style="width:30%">
								    <option value="01">1月</option>
								    <option value="02">2月</option>
								    <option value="03">3月</option>
								    <option value="04">4月</option>
								    <option value="05">5月</option>
								    <option value="06">6月</option>
								    <option value="07">7月</option>
								    <option value="08">8月</option>
								    <option value="09">9月</option>
								    <option value="10">10月</option>
								    <option value="11">11月</option>
								    <option value="12">12月</option>
				   </select>
				   <button type="button" class="input-group btn btn-lg btn-primary" onclick="getRecordByMonth()">
					 			 	<i class="icon-search"></i>按月查询
				   </button>
		    </form>
    </div>
</div>
<br>
<div class="container-fluid" id="searchPanel">
	 <div class="row" >
		    <form id="searchDateForm" class="form-inline form-group-lg" role="form">
		    
		     			<label class="input-lg control-label">开始日期:</label>
					   <input id="qssj" class="form-control date form_date required" style="width:30%"
				                         data-date="" data-date-format="yyyy-mm-dd" name="qssj"
				                         placeholder="起始时间" type="text" value="${qssj}" />
					    
			 		<label class="input-lg control-label">结束日期:</label>
					 <input id="jssj" class="form-control date form_date required"  name="jssj" style="width:30%"
				                    	data-date="" data-date-format="yyyy-mm-dd" placeholder="结束时间" type="text" value="${jssj}" />
				                  
				
				<button type="button" class="input-group btn btn-lg btn-primary" onclick="getRecordByMonth()">
				 			 	<i class="icon-search"></i>按天查询
				 			 </button>
				 			 
				
		    </form>
    </div>
</div>·
    
      <cui:grid id="articleGrid${idSuffix}" rownumbers="true" fitStyle="fill"  multiselect="true" altRows="true"   
		    	  	url="${ctx}/record/getRecordByDate.do?username=${loginUser.username}" rowNum="20"
		    	  	afterSortableRows="gridSortableRows"  >
		    	<cui:gridCols>
		    		<cui:gridCol name="id" hidden="true">id</cui:gridCol>
		    		<cui:gridCol name="times" align="center">日期</cui:gridCol>
		    		<cui:gridCol name="incomeTotal"  align="center">日工资</cui:gridCol>
		    		<cui:gridCol name="profit" width="80" align="center">剩余</cui:gridCol>
		    		<cui:gridCol name="costDaily" width="80" align="center">开销</cui:gridCol>
		    		<cui:gridCol name="eating" width="80" align="center">吃饭水果</cui:gridCol>
		    		<cui:gridCol name="supermarket" width="80" align="center">超市</cui:gridCol>
		    		<cui:gridCol name="party" width="80" align="center">聚餐</cui:gridCol>
		    		<cui:gridCol name="rent" width="80" align="center">房租水电</cui:gridCol>
		    		<cui:gridCol name="book" width="80" align="center">买书</cui:gridCol>
		    		<cui:gridCol name="clothes" width="80" align="center">买衣服</cui:gridCol>
		    		<cui:gridCol name="traffic" width="80" align="center">交通</cui:gridCol>
		    		<cui:gridCol name="elseCost" width="80" align="center">其他</cui:gridCol>
		    		<cui:gridCol name="remark" width="380">备注</cui:gridCol>
		      </cui:gridCols>
	 		  <cui:gridPager gridId="articleGrid${idSuffix}" />
	 </cui:grid> 

<script src="${ctx}/res/resource/style/js/layer/layer.js"></script>
<script src="${ctx}/res/resource/style/js/layer/laydate/laydate.js"></script>		    
		    
	<script>
	$(function() {
		$("#recordReviewNav").addClass("active");
		$("#recordReviewNav").parent("ul").children("li").not("#recordReviewNav").removeClass("active");

		$("#jqgh_recordGrid_times").click(); 
		var years=['2016','2017'];
		for(var i=0;i<years.length;i++){
			$("#sel_year").append("<option value='"+years[i]+"'>"+years[i]+"年"+"</option>");
		}
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
	
	$().ready(function() {
		$("#dateChooseForm").validate();
	});
	function  getRecordByMonth(){
		var year=$("#sel_year").val();
		var month=$("#sel_month").val();
		var result=year+"-"+month+"-01";
		var params = {};
		var baseSearch = "${ctx}/record/getRecordByDate.do?username=${loginUser.username}&qssj="+result;
		reloadGrid(params,baseSearch);
	}
	function  getRecordByDate(){
		var params = {};
		params["qssj"]=$("#qssj").val();
		params["jssj"]=$("#jssj").val();
		var baseSearch = "${ctx}/record/getRecordByDate.do?username=${loginUser.username}";
		reloadGrid(params,baseSearch);
	}
	
	function reloadGrid(params,baseSearch){
		var reviewGrid=$("#articleGrid${idSuffix}");
		reviewGrid.grid("option","postData",params);
		reviewGrid.grid("option","url",baseSearch);
		reviewGrid.grid("reload"); 
	}
	
	</script>
</body>
</html>