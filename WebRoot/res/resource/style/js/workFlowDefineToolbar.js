
/**
 * 初始化工作流定义toolbar按钮
 * @param status 流程状态
 */
function initWorkFlowDefineToolbar(status){
	status = transStatus2English(status);
	$("#workFlowDefineToolbar").toolbar("enable");
	if(status != "" && status != "local"){
		$("#workFlowDefineToolbar").toolbar("disableItem", "apply_workFlowDefine");
	}
	
	if(status == "" || status == "local" || status == "stoped" || status == "running"){
		$("#workFlowDefineToolbar").toolbar("disableItem", "update_workFlowDefine");
	}
	
	if(status != "stoped"){
		$("#workFlowDefineToolbar").toolbar("disableItem", "start_workFlowDefine");
	}
	
	if(status != "running" && status != "modified running"){
		$("#workFlowDefineToolbar").toolbar("disableItem", "stop_workFlowDefine");
	}
}


function workFlowDefineSelectRow(e,ui){
	var row = $("#workFlowDefineGrid").grid("getRowData",ui.rowId);
	initWorkFlowDefineToolbar(row.status);
}

function initWorkFlowDefineSelectRow(id){
	var oldOnLoad = $("#workFlowDefineGrid").grid("option","onLoad");
	$("#workFlowDefineGrid").grid("option","onLoad",function(){
		$("#workFlowDefineGrid").grid("setSelection",id,"true");
		$("#workFlowDefineGrid").grid("option","onLoad",oldOnLoad);
	});
	$("#workFlowDefineGrid").grid("reload");
}


function transStatus2Chinese(status) {
	if (status == "undefined") {
		return "未定义";
	} else if (status == "local") {
		return "本地";
	} else if (status == "running") {
		return "运行中";
	} else if (status == "updated") {
		return "已更新";
	} else if (status == "stoped") {
		return "已停止";
	} else if (status == "unregist") {
		return "未注册";
	} else if (status == "unknown") {
		return "未知";
	} else if (status == "error") {
		return "错误";
	} else if (status == "modified") {
		return "已修改";
	} else if ( status == "modified running") {
		return "已修改运行中";
	} else if (status == "modified updated") {
		return "已修改已更新";
	} else if (status == "modified stoped") {
		return "已修改已停止";
	} else if (status == "modified unregist") {
		return "已修改未注册";
	} else {
		return status;
	}
}
function transStatus2English(status) {
	if (status == "未定义") {
		return "undefined";
	} else if (status == "本地") {
		return "local";
	} else if (status == "运行中") {
		return "running";
	} else if (status == "已更新") {
		return "updated";
	} else if (status == "已停止") {
		return "stoped";
	} else if (status == "未注册") {
		return "unregist";
	} else if (status == "未知") {
		return "unknown";
	} else if (status == "错误") {
		return "error";
	} else if (status == "已修改") {
		return "modified";
	} else if ( status == "已修改运行中") {
		return "modified running";
	} else if (status == "已修改已更新") {
		return "modified updated";
	} else if (status == "已修改已停止") {
		return "modified stoped";
	} else if (status == "已修改未注册") {
		return "modified unregist";
	} else {
		return status;
	}
}
