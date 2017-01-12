<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<%@taglib prefix="cui" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>黄大大财务管理软件</title>
<%@ include file="../../include/headerForCUI.jsp"%>
<style>.error{color:red;}</style>
</head>
<body>

			<div style="margin:5px 0"></div>
			<div class="container-fluid">
				 <div class="row ">		
					 <div class="btn-group span5 col-xs-offset-1huang">
							<button type="button" class="btn btn-lg  btn-primary" data-toggle="modal" 
				   				data-target="#wordsAddOrEditModal" onclick="addOrEdit(0)">
							  <i class="icon-plus"></i>新增</button>
						    <button type="button" class="btn btn-lg  btn-success" onclick="addOrEdit(1)">
						      <i class="icon-pencil"></i>修改</button>
						    <button type="button" class="btn btn-lg  btn-danger" onclick="deleteWordsArray(1)">
							  <i class="icon-minus"></i>删除</button>
						</div>
				 </div>
			</div>	
			<div style="margin:5px 0"></div>
			
		    <cui:grid id="wordsGrid${idSuffix}" rownumbers="true" width="auto" height="450" multiselect="true" altRows="true"   
		    	url="${ctx}/words/getWordsGrid.do?holdername=${username}&status=0" rowNum="20" afterSortableRows="gridWordsSortableRows">
		    	<cui:gridCols>
		    		<cui:gridCol name="id" hidden="true"></cui:gridCol>
		    		<cui:gridCol name="orderNo"  hidden="true"></cui:gridCol>
		    		<cui:gridCol name="topNo"  hidden="true"></cui:gridCol>
		    		<cui:gridCol name="content" width="1300" formatter="formateText">Words</cui:gridCol>
		    	</cui:gridCols>
		    	<cui:gridPager gridId="wordsGrid${idSuffix}" />
		    </cui:grid> 
  
		    
	<script>
	
	function gridWordsSortableRows(e, ui){
		debugger;
		var grid = $("#"+e.target.id);
		
		var itemId = ui.itemId[0];
		var attactRowData= grid.grid("getRowData",itemId);
		var topNo1=attactRowData.topNo;
		
		var targetId=ui.targetId;
		var injuryRowData= grid.grid("getRowData",targetId);
		var topNo2=injuryRowData.topNo;
		
		if(topNo1*topNo2==0){
			message("拖动失败！不能拖动置顶内容！");
			grid.grid('reload');
			return;
		}
		
		var sortAfterIDs = ui.permutation.join();
		var sortBeforeIDs = ui.originalPermutation.join();
		var firstNoTopOrder=0;
		var sortAfterIDsArr=sortAfterIDs.split(",");
		//遍历 获取第一个非置顶tip的 orderNo，如果是置顶的，则直接从sortAfterIDs移除
		for(var k=0;k<sortAfterIDsArr.length;k++){
			var topNo=grid.grid("getRowData",sortAfterIDsArr[k]).topNo;
			if(topNo==0){
				sortAfterIDsArr.shift();
			}else{
				firstNoTopOrder=grid.grid("getRowData",sortAfterIDsArr[k]).orderNo;
				break;
			}
		}
		
		sortAfterIDs="";
		for(var j=0;j<sortAfterIDsArr.length;j++){
				sortAfterIDs=sortAfterIDs+","+sortAfterIDsArr[j];
			}
		
		
		$.ajax({
			type: 'post',
			url : ctx + '/words/sort.do',
			data: {
				"firstNoTopOrder":firstNoTopOrder,
				"sortAfterIDs": sortAfterIDs
			},
			dataType: 'json',
			success	: function(data){
				debugger;
				if(data.msg){
					message("排序成功");
				}else{
					message("排序失败");
					grid.grid('reload');
				}
				
			},
			error: function(e){
				error(e);
				grid.grid('reload');
			}
		});
		
		
	}
	
	function formateText(cellValue, options, rowObject){
		if(rowObject.topNo==0){
			cellValue="["+"<span style='color:blue;'>置顶</span>"+"] "+cellValue
		}
		return cellValue;
	}
	
	function addOrEdit(index){
		$("#addOrEditWordsForm")[0].reset(); 
		//0 stands for create, 1 stands for update todo, 2stands for update do
		if(index==0){
			$("#wordsModalDescription").html("Create Words");
		}else{
			var wordsGrid = $("#wordsGrid${idSuffix}");
			var sel=wordsGrid.grid("option", "selarrrow");
			var row =wordsGrid.grid("getRowData",sel);
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
			
    		$("#wordsModalDescription").html("Update Words");
			$("#wordsId").val(row.id);
			
			if(row.topNo==0){
				$("#wordsContent").val(row.content.substring(5));
			}else{
				$("#wordsContent").val(row.content);	
			}
			
			$("#wordsTopNo").val(row.topNo);
			$("#wordsOrderNo").val(row.orderNo);
			$("#wordsAddOrEditModal").modal();
		}
	}
	
	//删除编码
	function deleteWords(ids){
		var wordsGrid=$("#wordsGrid${idSuffix}");
		$.confirm("确定删除选中记录吗？", function(r) {
			if (r) {
				loading("删除中，请稍候...");
				$.ajax({
						type : 'post',
						url : ctx + '/words/delete.do?id='+ids,
						success : function(data) {
							if(data.msg){
								hide();
								message("删除成功！");
								wordsGrid.grid('reload');
							}else{
								hide();
								wordsGrid.grid('reload');
								error(e);
							}
						},
						error : function(e) {
							hide();
							error(e);
						}
				});
				
			} else {
				message("取消");
			}
		});
	}
	
	//批量删除
	function deleteWordsArray(index){
		var wordsGrid = $("#wordsGrid${idSuffix}");
		var sel = wordsGrid.grid("option", "selarrrow");
		if(sel.length<1){
			message("请至少选择一条记录！");
			return;
		}
		var ids=wordsGrid.grid("getRowData",sel[0]).id;;
		for(var i=1;i<sel.length;i++){
			ids=ids+","+wordsGrid.grid("getRowData",sel[i]).id;
		}
		deleteWords(ids);
	}
	</script>
</body>
</html>