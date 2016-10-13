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
<%@ include file="../../include/headerForCUI.jsp"%>
</head>
<body>
<div>
<%-- <h2 class="text-center">${times}本月累计其他开销${elseTotal}元</h2> --%>
	<input type="text" id="holderName"  hidden="true" value="${username}"/>
	<div id="pie" style="width:1000px;height:450px;">  </div>


	    <cui:grid id="elseGrid${idSuffix}" rownumbers="true" width="auto" height="900"
	    		url="${ctx}/smart/getElseDetailGrid.do?username=${loginUser.username}&qssj=${times}" rowNum="50">
	    	<cui:gridCols>
	    		<cui:gridCol name="times" align="center">日期</cui:gridCol>
	    		<cui:gridCol name="columnName"  align="center">开销名称</cui:gridCol>
	    		<cui:gridCol name="value"  align="center">金额</cui:gridCol>
	    	</cui:gridCols>
	    </cui:grid> 
	    
</div>	
	<script src="${ctx}/res/thirdParty/echart/js/esl/esl.js"></script>	    
	<script>		

	var fileLocation ='${ctx}/res/thirdParty/echart/js/echarts';
	require.config({
	   
	    paths:{ 
	         echarts: fileLocation,
	            'echarts/chart/line': fileLocation,
	            'echarts/chart/bar': fileLocation,
	            'echarts/chart/pie': fileLocation
	 
	    }
	});

	// 作为入口
	require(
	    [
	        'echarts',
	        'echarts/chart/pie'
	    ], 
		
		displayChart
	    
	);

	function displayChart(ec) {
	    	//饼图
			var pieChart = ec.init(document.getElementById('pie'));
			var pieChartOtion = getPieChartOption();	
	        pieChart.setOption(pieChartOtion);
	    }
		
		//获得Pie图的选项和数据
		function getPieChartOption(){
		 

				var	option = {
				title : {
					text:'${month}月开销明细',
					subtext: '累计开销${all}',
					x:'center'
				},tooltip : {
					trigger: 'item',
					formatter: "{a} <br/>{b} : {c} ({d}%)"
				},
				legend: {
					orient : 'vertical',
					x : 'left',
					data:${details}
				},
				calculable : true,
				series : [
					{
						name:'当月开销',
						type:'pie',
						radius : '55%',
						center: ['50%', '50%'],
						data:${echartList}
					}
				]
			};
			return option;
		}

	
	</script>

</body>
</html>