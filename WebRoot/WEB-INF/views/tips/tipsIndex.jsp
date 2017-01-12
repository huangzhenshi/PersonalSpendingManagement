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
				   				data-target="#tipsAddOrEditModal" onclick="addOrEdit(0)">
							  <i class="icon-plus"></i>新增</button>
						    <button type="button" class="btn btn-lg  btn-success" onclick="addOrEdit(1)">
						      <i class="icon-pencil"></i>修改</button>
						    <button type="button" class="btn btn-lg  btn-danger" onclick="deleteTipsArray(1)">
							  <i class="icon-minus"></i>删除</button>
						</div>
				 </div>
			</div>	
			<div style="margin:5px 0"></div>
			
		    <cui:grid id="tipsGrid${idSuffix}" rownumbers="true" width="auto" height="450" multiselect="true" altRows="true"   
		    	url="${ctx}/tips/getTipsGrid.do?holdername=${username}&status=0" rowNum="20" afterSortableRows="gridTipsSortableRows">
		    	<cui:gridCols>
		    		<cui:gridCol name="id" hidden="true"></cui:gridCol>
		    		<cui:gridCol name="orderNo"  hidden="true"></cui:gridCol>
		    		<cui:gridCol name="topNo"  hidden="true"></cui:gridCol>
		    		<cui:gridCol name="content" width="1300" formatter="formateText">Tips</cui:gridCol>
		    		<cui:gridCol name="description"  width="200">Description</cui:gridCol>
		    	</cui:gridCols>
		    	<cui:gridPager gridId="tipsGrid${idSuffix}" />
		    </cui:grid> 
  
		    
	<script>
	
	
	function gridTipsSortableRows(e, ui){
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
			url : ctx + '/tips/sort.do',
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
		$("#addOrEditTipsForm")[0].reset(); 
		//0 stands for create, 1 stands for update todo, 2stands for update do
		if(index==0){
			$("#tipsModalDescription").html("Create Tips");
		}else{
			var tipsGrid = $("#tipsGrid${idSuffix}");
			var sel=tipsGrid.grid("option", "selarrrow");
			var row =tipsGrid.grid("getRowData",sel);
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
			
    		$("#tipsModalDescription").html("Update Tips");
			$("#tipsId").val(row.id);
			
			if(row.topNo==0){
				$("#tipsContent").val(row.content.substring(5));
			}else{
				$("#tipsContent").val(row.content);	
			}
			
			$("#tipsDescription").val(row.description);
			$("#tipsTopNo").val(row.topNo);
			$("#tipsOrderNo").val(row.orderNo);
			$("#tipsAddOrEditModal").modal();
		}
	}
	
	//删除编码
	function deleteTips(ids){
		var tipsGrid=$("#tipsGrid${idSuffix}");
		$.confirm("确定删除选中记录吗？", function(r) {
			if (r) {
				loading("删除中，请稍候...");
				$.ajax({
						type : 'post',
						url : ctx + '/tips/delete.do?id='+ids,
						success : function(data) {
							if(data.msg){
								hide();
								message("删除成功！");
								tipsGrid.grid('reload');
							}else{
								hide();
								tipsGrid.grid('reload');
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
	function deleteTipsArray(index){
		var tipsGrid = $("#tipsGrid${idSuffix}");
		var sel = tipsGrid.grid("option", "selarrrow");
		if(sel.length<1){
			message("请至少选择一条记录！");
			return;
		}
		var ids=tipsGrid.grid("getRowData",sel[0]).id;;
		for(var i=1;i<sel.length;i++){
			ids=ids+","+tipsGrid.grid("getRowData",sel[i]).id;
		}
		deleteTips(ids);
	}
	</script>
</body>
</html>