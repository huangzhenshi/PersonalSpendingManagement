/**
 * 删除流程实例
 */
function deleteProcessInstance(){
	var workFlowManagerGrid = $("#workFlowManagerGrid");
	var ids = workFlowManagerGrid.grid("option", "selarrrow");
	if(ids==""){
		$.message("请选择一条记录！");
		return;
	}
	var processInstanceIds = new Array();
	$.each(ids, function(i){
		var row = workFlowManagerGrid.grid("getRowData", ids[i]);
		processInstanceIds.push(row.instanceId);
    });
	$.confirm("确定要删除吗？", function(r) {
		if (r) {
			$.ajax({
				type: "POST",
				url: ctx+"/backstage/website/work-flow-manager!deleteProcessInstance.json?processInstanceId="+processInstanceIds,
				success: function(msg){
					message("操作成功");
					workFlowManagerGrid.grid('reload');
				},
				error:function(e){
					error(e);
				}
			});
		}else{
			message("取消");
		}
	});
}
/**
 * 挂起流程实例
 * 
 */
function suspendProcessInstance(){
	var workFlowManagerGrid = $("#workFlowManagerGrid");
	var ids = workFlowManagerGrid.grid("option", "selarrrow");
	if(ids==""){
		$.message("请选择一条记录！");
		return;
	}
	var processInstanceIds = new Array();
	$.each(ids, function(i){
		var row = workFlowManagerGrid.grid("getRowData", ids[i]);
		processInstanceIds.push(row.instanceId);
    });
	$.confirm("确定要删除吗？", function(r) {
		if (r) {
			$.ajax({
				type: "POST",
				url: ctx+"/backstage/website/work-flow-manager!suspendProcessInstance.json?processInstanceId="+processInstanceIds,
				success: function(msg){
					message("操作成功");
					workFlowManagerGrid.grid('reload');
				},
				error:function(e){
					error(e);
				}
			});
		}else{
			message("取消");
		}
	});
}
/**
 * 恢复流程实例
 */
function resumeProcessInstance(){
	var workFlowManagerGrid = $("#workFlowManagerGrid");
	var ids = workFlowManagerGrid.grid("option", "selarrrow");
	if(ids==""){
		$.message("请选择一条记录！");
		return;
	}
	var processInstanceIds = new Array();
	$.each(ids, function(i){
		var row = workFlowManagerGrid.grid("getRowData", ids[i]);
		processInstanceIds.push(row.instanceId);
    });
	$.confirm("确定要删除吗？", function(r) {
		if (r) {
			$.ajax({
				type: "POST",
				url: ctx+"/backstage/website/work-flow-manager!resumeProcessInstance.json?processInstanceId="+processInstanceIds,
				success: function(msg){
					message("操作成功");
					workFlowManagerGrid.grid('reload');
				},
				error:function(e){
					error(e);
				}
			});
		}else{
			message("取消");
		}
	});
}
/**
 * 终止流程实例
 */
function abortProcessInstance(){
	var workFlowManagerGrid = $("#workFlowManagerGrid");
	var ids = workFlowManagerGrid.grid("option", "selarrrow");
	if(ids==""){
		$.message("请选择一条记录！");
		return;
	}
	var processInstanceIds = new Array();
	$.each(ids, function(i){
		var row = workFlowManagerGrid.grid("getRowData", ids[i]);
		processInstanceIds.push(row.instanceId);
    });
	$.confirm("确定要删除吗？", function(r) {
		if (r) {
			$.ajax({
				type: "POST",
				url: ctx+"/backstage/website/work-flow-manager!abortProcessInstance.json?processInstanceId="+processInstanceIds,
				success: function(msg){
					message("操作成功");
					workFlowManagerGrid.grid('reload');
				},
				error:function(e){
					error(e);
				}
			});
		}else{
			message("取消");
		}
	});
}
/**
 * 查看流转
 * @returns
 */
function viewProcessGraph(){
	var workFlowManagerGrid = $("#workFlowManagerGrid");
	var ids = workFlowManagerGrid.grid("option", "selarrrow");
	if(ids=="" || ids.length>1){
		$.message("请选择一条记录！");
		return;
	}
	var row = workFlowManagerGrid.grid("getRowData", ids[0]);
	openWindow(ctx+'/backstage/website/article-audit!coflowGraph?processInstanceId='+row.processInstanceId);
}
