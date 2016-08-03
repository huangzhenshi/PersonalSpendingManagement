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


<%@ include file="../../include/headerForCUI.jsp"%>
<title>黄大大财务管理软件</title>
<script src="${ctx}/res/resource/style/js/md5.min.js"></script>
<script src="${ctx}/res/resource/style/js/sha1.js"></script>
<script src="${ctx}/res/thirdParty/jqfloat.min.js"></script>
<script src="${ctx}/res/resource/style/js/bootstrap.min.js"></script>
<script src="${ctx}/mainJs/function.js"></script>
<!-- 引入layer插件 -->
<script src="${ctx}/res/resource/style/js/layer/layer.js"></script>
<script src="${ctx}/res/resource/style/js/layer/laydate/laydate.js"></script>
<link href="${ctx}/res/resource/style/css/inforGlobal.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/res/resource/style/css/bootstrap.min.css" rel="stylesheet"/>
	
   

</head>
<body>

	<!-- 导航栏 -->
 	<%@include file="../common/navbar.jsp" %>
 
	<!-- 查询条件 -->
	<div class="row">
	<div class="col-sm-12">
	<form:form id="searchForm" action="${ctx}/record/getRecordByDate.do" method="post"  class="form-inline">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/><!-- 支持排序 -->
		<div class="form-group">
			<span>操作菜单：</span>
				<input id="title" name="title" type="text" maxlength="50" class="form-control input-sm" value="${log.title}"/>
			<span>用户ID：</span>
				<input id="createBy.id" name="createBy.id" type="text" maxlength="50" class="form-control input-sm" value="${log.createBy.id}"/>
			<span>URI：</span>
				<input id="requestUri" name="requestUri" type="text" maxlength="50"  class="form-control input-sm" value="${log.requestUri}"/>
			<span>日期范围：&nbsp;</span>
				<input id="beginDate" name="beginDate" type="text" maxlength="20" 
				class="laydate-icon form-control layer-date input-sm"
				value="<fmt:formatDate value="${log.beginDate}" pattern="yyyy-MM-dd"/>"/>
			<label>&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="endDate" name="endDate" type="text" maxlength="20" class=" laydate-icon form-control layer-date input-sm"
				value="<fmt:formatDate value="${log.endDate}" pattern="yyyy-MM-dd"/>" />
				
				&nbsp;&nbsp;
			&nbsp;
		 </div>	
	</form:form>
	<br/>
	</div>
	</div>
	
		   <%--  <cui:grid id="recordGrid${idSuffix}" rownumbers="true" width="auto" height="750" multiselect="true" altRows="true"  afterSortableRows="gridSortableRows" 
		    	url="${ctx}/record/getRecords.do?username=${loginUser.username}">
		    	<cui:gridCols>
		    		<cui:gridCol name="id" hidden="true">id</cui:gridCol>
		    		<cui:gridCol name="times">日期</cui:gridCol>
		    		<cui:gridCol name="incomeTotal" hidden="true">日工资</cui:gridCol>
		    		<cui:gridCol name="profit" width="80">剩余</cui:gridCol>
		    		<cui:gridCol name="costDaily" width="80">开销</cui:gridCol>
		    		<cui:gridCol name="eating" width="80">吃饭水果</cui:gridCol>
		    		<cui:gridCol name="supermarket" width="80">超市</cui:gridCol>
		    		<cui:gridCol name="party" width="80">聚餐</cui:gridCol>
		    		<cui:gridCol name="rent" width="80">房租水电</cui:gridCol>
		    		<cui:gridCol name="loan" width="80">贷款</cui:gridCol>
		    		<cui:gridCol name="book" width="80">买书</cui:gridCol>
		    		<cui:gridCol name="clothes" width="80">买衣服</cui:gridCol>
		    		<cui:gridCol name="traffic" width="80">交通</cui:gridCol>
		    		<cui:gridCol name="elseCost" width="80">其他</cui:gridCol>
		    		<cui:gridCol name="remark" width="380">备注</cui:gridCol>
		    		<cui:gridCol name="op" fixed="true" width="80" align="center" formatter="operateFormatter">操作选项</cui:gridCol>
		    	</cui:gridCols>
		    </cui:grid>  --%>
		    
	<script>
	$(function() {
		
	});
	
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
				window.location.href=('${ctx}/record/delete.do?id='+id);
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
	</script>
</body>
</html>