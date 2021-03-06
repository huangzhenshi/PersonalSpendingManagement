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
<div class="container-fluid">
	 <div class="row ">					
		<div class="col-lg-3" >
		<br>
			<button type="button" class="btn btn-primary" data-toggle="modal" 
   				data-target="#addOrEditRecordModal" onclick="addOrEdit(0)">
			  <i class="icon-plus"></i>新增</button>
		    <button type="button" class="btn btn-success" onclick="addOrEdit(1)">
		      <i class="icon-pencil"></i>修改</button>
		    <button type="button" class="btn btn-danger" onclick="deleteRecordArray()">
			  <i class="icon-minus"></i>删除</button>
			  
		</div>
		<div class="col-lg-7">
			<h2 class="text-left">本月累计开销<span id="costAllSpan">${costAll}</span>元，累计结余<span id="profitAllSpan">${profitAll}</span>元</h3>
		</div>
			          
	 </div>	
</div>
		
			<input type="text" name="holderName" id="holderName"  hidden="true" value="${loginUser.username}"/>
			<input type="text" id="salaryRecord"  hidden="true" value="${salary}"/>
			<input type="text" id="rentRecord"  hidden="true" value="${rent}"/>
			<input type="text" id="eatingRecord"  hidden="true" value="${eating}"/>
		    <cui:grid id="recordGrid${idSuffix}" rownumbers="true" fitStyle="fill" multiselect="true" altRows="true"  afterSortableRows="gridSortableRows" 
		    	url="${ctx}/record/getRecordReviewGrid.do?username=${username}" rowNum="20">
		    	<cui:gridCols>
		    		<cui:gridCol name="id" hidden="true">id</cui:gridCol>
		    		<cui:gridCol name="times" align="center">日期</cui:gridCol>
		    		<cui:gridCol name="costDaily" width="80" align="center">开销</cui:gridCol>
		    		<cui:gridCol name="profit" width="80" align="center">结余</cui:gridCol>
		    		<cui:gridCol name="incomeTotal" width="80" align="center">工资</cui:gridCol>
		    		<cui:gridCol name="eating" width="80" align="center">饮食</cui:gridCol>
		    		<cui:gridCol name="supermarket" width="80" align="center">超市</cui:gridCol>
	<%-- 	    		<cui:gridCol name="party" width="80" align="center">聚餐</cui:gridCol> --%>
		    		<cui:gridCol name="rent" width="80" align="center">房租</cui:gridCol>
		    		<cui:gridCol name="book" width="80" align="center">买书</cui:gridCol>
		    		<cui:gridCol name="clothes" width="80" align="center">买衣服</cui:gridCol>
		    		<cui:gridCol name="traffic" width="80" align="center">交通</cui:gridCol>
		    		<cui:gridCol name="elseCost" width="80" align="center" formatter="zeroFormat">其他</cui:gridCol>
		    		<cui:gridCol name="remark" width="380">备注</cui:gridCol>
		    		<cui:gridCol name="op" fixed="true" width="80" align="center" formatter="operateFormatter">操作选项</cui:gridCol>
		    	</cui:gridCols>
		    	<cui:gridPager gridId="recordGrid${idSuffix}" />
		    </cui:grid> 
		    
	<script>
	
	$(function(){
		if('${message}'){
			message('${message}');
		}
	})
	//格式化操作栏
function operateFormatter(cellValue, options, rowObject){
	var result = "";
		result += " <a href='javascript:addOrEdit(2,\""+ rowObject.id+"\");' title='修改' class='grideditbtn'></a> ";
		result += " <a href='javascript:deleteRecord(\""+ rowObject.id+ "\");' title='删除' class='griddeletebtn'></a> ";
	return result;}
	//删除编码
	function deleteRecord(id){
		$.confirm("确定删除吗？", function(r) {
			if (r) {
				refreshCenter('${ctx}/record/delete.do?id='+id+'&username='+$("#holderName").val());
			} else {
				message("取消");
			}
		});
	}
	
	//批量删除
	function deleteRecordArray(){
		var recordGrid = $("#recordGrid${idSuffix}");
		var sel = recordGrid.grid("option", "selarrrow");
		if(sel.length<1){
			message("请至少选择一条记录！");
			return;
		}
		var ids=recordGrid.grid("getRowData",sel[0]).id;;
		for(var i=1;i<sel.length;i++){
			ids=ids+","+recordGrid.grid("getRowData",sel[i]).id;
		}
		deleteRecord(ids);
	}
	//index: 0 新增 1 按钮点击修改 2 操作选项中点击修改
	function addOrEdit(index,id){
		debugger;
		$("#addOrEditRecordForm")[0].reset(); 
		if("${top10ElseName}"){
			$("#top10ElseName").html("${top10ElseName}");
		}
		if(index==0){
			$("#recordIncomeTotal").val($("#salaryRecord").val());
			$("#recordRent").val($("#rentRecord").val());
			$("#recordEating").val($("#eatingRecord").val());
			$("#recordTimes").val(getDateTodayDayOnly());
			//周一到周五 交通费用 才自动填充,周日的值是0，多么神奇！
			var today=new Date().getDay();
			if(today>0&&today<6){
				$("#recordTraffic").val('${traffic}');
			}
			$("#recordModalDescription").html("Record new cost");
			return;
		}
		if(index==1){
			var recordGrid = $("#recordGrid${idSuffix}");
			var sel=recordGrid.grid("option", "selarrrow");
			var row = $("#recordGrid${idSuffix}").grid("getRowData",sel);
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
			
		}else if(index==2){
			var row = $("#recordGrid${idSuffix}").grid("getRowData",id);
		}
		$("#recordModalDescription").html("Update cost");
		$("#recordId").val(row.id);
		$("#recordTimes").val(row.times);
		$("#recordIncomeTotal").val(row.incomeTotal);
		$("#recordEating").val(row.eating);
		$("#recordSupermarket").val(row.supermarket);
		$("#recordParty").val(row.party);
		$("#recordRent").val(row.rent);
		$("#recordBook").val(row.book);
		$("#recordClothes").val(row.clothes);
		$("#recordTraffic").val(row.traffic);
		$("#recordRemark").val(row.remark);
		$("#addOrEditRecordModal").modal();
	}
	
	
	/* //删除编码
	function deleteRecord(id){
		var recordGrid = $("#recordGrid${idSuffix}");
		$.confirm("确定删除吗？", function(r) {
			if (r) {
				$.ajax({
					type : 'post',
					url : ctx + '/recordAjax/getGridData',
					data : {
						id : id
					},
					dataType : "json",
					success : function(data) {
						
						recordGrid.grid("reload");
						
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
	 */
	/* 
	//新增或修改codingItem
	function addOrUpdateRecord(id) {
		var codingItemGrid = $("#codingItemGrid${idSuffix}");
		var codingItemForm = $("#codingItemForm${idSuffix}");
		codingItemForm.form("clear");
		var url = null;
		var title = null;
		if(id){
			url= ctx + '/backstage/system/coding-item!update.json'; 
			codingItemForm.form("load", ctx + '/backstage/system/coding-item/'+id+'/edit.json');//根据ID加载codingItem的各类信息
			title="修改编码";
		}else{
			url= ctx + '/backstage/system/coding-item.json'; //默认调用create()方法
			codingItemForm.form("load", ctx + '/backstage/system/coding!indexDetail.json?id=${codingId}&code=${code}');//预加载codingID和code
			title="新增编码";
		}
		dialog(
				"#codingItemDialog${idSuffix}",
				{
					width : 400,
					title : title
				},
				{
					"保存" : function() {
						var _this = this;
						if (codingItemForm.form("valid")) {
							loading("保存中...");
							$.ajax({
								type : 'post',
								url : url,
								data : codingItemForm.form("formData", false),
								dataType : 'json',
								success : function(data) {
									hide();
									$(_this).dialog("close");
									message("操作成功！");
									codingItemGrid.grid('reload');
								},
								error : function(e) {
									hide();
									error(e);
								}
							});
						} else {
							message("未通过页面校验！");
						}
					},
					"关闭" : function() {
						$(this).dialog("close");
					}
				}).dialog("open");
	} */

	/* //index: 0 新增 1 按钮点击修改 2 操作选项中点击修改
	function addOrEdit(index,id){
		debugger;
		//点击操作选项中修改数据
		if(index==2){
			window.location.href=('${ctx}/record/addOrUpdate.do?id='+id);
		}else if(index==1){
			var recordGrid = $("#recordGrid${idSuffix}");
			var sel = recordGrid.grid("option", "selarrrow");
			if(sel.length !=1){
				message("请选择一条记录！");
				return;
			}
			var idUpdate = recordGrid.grid("getRowData",sel).id;
			window.location.href=('${ctx}/record/addOrUpdate.do?id='+idUpdate);
		}else{
			window.location.href=('${ctx}/record/addOrUpdate.do?holderName=${loginUser.username}');
		}
	} */
	</script>
</body>
</html>