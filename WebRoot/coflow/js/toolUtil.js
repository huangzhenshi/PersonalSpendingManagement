var isForceCloseTab = false;
var process_tabs_parent = null;
var pwin = window.parent.window;
var currentProcessStatus = "";
/**
 * 打开指定流程文件
 * @param id
 */
function openXmlDoc(id){
	if(id != null){
		$.ajax({
			  type: "POST",
			  url: basePath+"/backstage/website/work-flow-define!getProcessFile.json",
			  data:"id="+id,
			  success: function(data){
				  if(data != ""){
					  var tabId = id;//树节点(版本)id
					  var xmlData = data.xmlDoc;//流程图数据
					  var xmlDoc = stringToXml(xmlData);
					  var packageNode = xmlDoc.getElementsByTagName("Package")[0];
					  var packageId = packageNode.getAttribute("id");
					  var packageName = packageNode.getAttribute("name");
					  var div = $("#area_"+tabId);
					  var title = packageName + data.version;
					  addPanel(xmlDoc,tabId,title);
					  initProcessMenu(data.status, tabId);
				  }
			  },
			  error:function(){
				  alert("加载失败,当前网络发生错误!");
			  }
		});
	}
	
}
function initProcessMenu(status,tabId) {
	status = status.toLowerCase();
	currentProcessStatus = status;
	var showItems = [];
	if (status == "unknown" || status=="error") {
		showItems = ["fileCopy"];
	} else if(status == "local" || status == "undefined") {
		showItems = ["upload","fileCopy"];
	} else if (status == "running" || status == "modified running") {
		showItems = ["stop","syncDataFieldTable","fileCopy"];
	} else if(status == "updated" || status == "modified updated") {
		showItems = ["stop","fileCopy"];
	} else if(status == "stoped" || status == "modified stoped") {
		showItems = ["start","delete","fileCopy"];
	} else if(status == "unregist" || status == "modified unregist") {
		showItems = ["delete","reg","syncDataFieldTable","fileCopy"];
	}
	projectMenuItem(showItems,tabId);
}


function projectMenuItem(showItems,tabId){
	var menuItems = ["delete","reg","upload",
	 				"start","stop","syncDataFieldTable","fileCopy"
	 			];
	var prefix = "toolbar_btn_";
	var suffix = "_"+tabId;
	for(var i=0;i<menuItems.length;i++){
		$('#'+prefix+menuItems[i]+suffix).attr("disabled","true");
	}
	for(var i=0;i<showItems.length;i++){
		$('#'+prefix+showItems[i]+suffix).removeAttr("disabled");
	}
	
}


/**
 * 同步相关数据表
 */
function syncDataField(){
	var tab = $('#process_tabs').tabs("getSelected");
	var tabId = $(tab).data("tabId");
	$.ajax({
		  type: "POST",
		  url:  basePath+"/backstage/website/work-flow-define!syncDataFieldTable.json",
		  data:"id="+tabId,
		  success: function(msg) {
			  if(msg.success) {
				  alert("操作成功！");
			  } else {
				  alert(msg.message);
			  }
		  },
		  error:function() {
			 alert("同步相关数据表发生错误，请联系管理员！");
		  }
	});
}

/**
 * 上传流程
 */
function uploadProcess(){
	var tab = $('#process_tabs').tabs("getSelected");
	var tabId = $(tab).data("tabId");
	$.ajax({
		type: "POST",
		url: basePath+"/backstage/website/work-flow-define!uploadProcess.json",
		data: "id=" + tabId,
		success: function(msg) {
			if (msg.success) {
				var d = msg.data;
				initProcessMenu(d.status, d.id);
				alert("上传成功！");
			} else {
				alert(msg.message);
			}
		},
		error:function(){
			alert("上传流程发生错误，请联系管理员！");
		}
	});
}

/**
 * 注册流程
 */
function registerProcess(){
	var tab = $('#process_tabs').tabs("getSelected");
	var tabId = $(tab).data("tabId");
	$.ajax({
		type: "POST",
		url: basePath+"/backstage/website/work-flow-define!registerProcess.json",
		data:"id="+tabId,
		success: function(msg){
			if (msg.success) {
				var items = msg.data, status;
				for (var i = 0; i < items.length; i++) {
					var item = items[i];
					if (tabId == item.id) {
						initProcessMenu(item.status, tabId);
						alert("注册成功！");
					}
				}
			} else {
				alert(msg.message);
			}
		},
		error:function(){
			alert("注册流程发生错误，请联系管理员！");
		}
	});
}
/**
 * 启动流程
 */
function startProcess(){
	var tab = $('#process_tabs').tabs("getSelected");
	var tabId = $(tab).data("tabId");
	$.ajax({
		type: "POST",
		url: basePath+"/backstage/website/work-flow-define!startProcess.json",
		data:"id="+tabId,
		success: function(msg){
			if (msg.success) {
				var items = msg.data, status;
				for (var i = 0; i < items.length; i++) {
					var item = items[i];
					if (tabId == item.id) {
						initProcessMenu(item.status, tabId);
						alert("启动成功！");
					}
				}
			} else {
				alert(msg.message);
			}
		},
		error:function(){
			alert("启动流程发生错误，请联系管理员！");
		}
	});
}
/**
 * 停止流程
 */
function stopProcess(){
	var tab = $('#process_tabs').tabs("getSelected");
	var tabId = $(tab).data("tabId");
	$.ajax({
		type: "POST",
		url: basePath+"/backstage/website/work-flow-define!stopProcess.json",
		data:"id="+tabId,
		success: function(msg){
			if (msg.success) {
				var d = msg.data;
				initProcessMenu(d.status, d.id);
				alert("停止成功！");
			} else {
				alert(msg.message);
			}
		},
		error:function(){
			alert("停止流程发生错误，请联系管理员！");
		}
	});
}
/**
 * 删除流程(删除的是引擎端的)
 */
function deleteProcess(){
	var tab = $('#process_tabs').tabs("getSelected");
	var tabId = $(tab).data("tabId");
	$.ajax({
		type: "POST",
		url: basePath+"/backstage/website/work-flow-define!deleteProcess.json",
		data:"id="+tabId,
		success: function(msg){
			if (msg.success) {
				var d = msg.data;
				initProcessMenu(d.status, d.id);
				alert("删除成功！");
			} else {
				alert(msg.message);
			}
		},
		error:function(){
			alert("删除流程发生错误，请联系管理员！");
		}
	});
}
/**
 * 更新组织用户
 */
function updateOrganization(){
	var tab = $('#process_tabs').tabs("getSelected");
	var tabId = $(tab).data("tabId");
	$.ajax({
		type: "POST",
		url: basePath+"/backstage/website/work-flow-define!updateOrganization",
		data:"id="+tabId,
		success: function(data){
			if(data == "success"){
				alert("成功");
			}else if(data == "error"){
				alert("失败");
			}else{
				alert(data);
			}
		},
		error:function(){
			alert("更新组织用户发生错误，请联系管理员！");
		}
	});
}
/**
 * 同步服务器
 */
function syncServer(){
	var tab = $('#process_tabs').tabs("getSelected");
	var tabId = $(tab).data("tabId");
	$.ajax({
		type: "POST",
		url: basePath+"/backstage/website/work-flow-define!syncServer.json",
		data:"id="+tabId,
		success: function(data){
			/*try{
				var rdata = $.parseJSON(data);
				if(rdata != null){
					 var zTree = $.fn.zTree.getZTreeObj("projectView");
					  for(var i=0;i<rdata.length;i++){
						  var node2 = zTree.getNodeByParam("id", rdata[i].id);
						  if(node2 != null){
							  node2.name = rdata[i].name;
							  if(rdata[i].status)
								  node2.status = rdata[i].status;
							  zTree.updateNode(node2);
							  if(rdata[i].id == tabId){
								  initProcessMenu(rdata[i].status,tabId);
							  }
						  }else{
							  zTree.addNodes(node,rdata[i]);
						  }
					  }
				}
			}catch(e){
				if(data != ""){
					alert(data);
				}
			}*/
			if (msg.success) {
				var d = msg.data;
				//pwin.updateCurrentNode(d.text, d.userdata);
				//initProcessMenu(rdata[i].status,rdata[i].id);
			} else {
				alert("操作失败！");
			}
		},
		error:function(){
			alert("同步失败失败,当前网络发生错误!");
		}
	});
	
}

function addLocalCopyDialog(){
	$('#dlg_addLocalCopyProcess').dialog('open');
}
function addLocalCopy(){
	var version  = $("#f_addLocalCopy_version").val();
	if(typeof(version)== undefined || $.trim(version) == ""){
		alert("版本号不能为空");
		return false;
	}
	var tab = $('#process_tabs').tabs("getSelected");
	var tabId = $(tab).data("tabId");
	$.ajax({
		type: "POST",
		url: basePath+"/backstage/website/work-flow-define!addLocalCopy.json",
		data:"id="+tabId+"&version="+version,
		success: function(msg){
			if (msg.success) {
				var d = msg.data;
				$('#dlg_addLocalCopyProcess').dialog('close');
				alert("操作成功！");
			} else {
				alert(msg.message);
			}
		},
		error:function(){
			alert("增加失败,当前网络发生错误!");
		}
	});
}


/**
 * 保存
 * @param tab
 * @param isClosed
 */
function saveXmlDocToServer(tab,isClosed){
	var tabId = $(tab).data("tabId");
	var backupXmlDocString = $(tab).data("backup");
	$(tab).trigger("updateCurrentXmlDoc");
	var currentXmlDocString = $(tab).data("currentXmlDoc");
	if(backupXmlDocString == currentXmlDocString){
		return;
	}
	var status = currentProcessStatus;
	if (status) status = status.toLowerCase();
	/*if(status == "running"){
	}*/
	var data = currentXmlDocString;
	data = encodeBase64Json(data);
	$.ajax({
		  type: "POST",
		  url: basePath+"/backstage/website/work-flow-define!saveProcessFile.json",
		  data: {"id":tabId,"data": data},
		  success: function(msg){
			  if(!isClosed){
				  $(tab).data("backup",currentXmlDocString);
				  var t = tab.panel('options').tab;
				  var title = tab.panel("options").title;
				  var s_title = t.find('span.tabs-title');
				  if(title.substring(0,1) == "*"){
					  title = title.substring(1);
				  }
				  s_title.html(title);
			  }
			  $(tab).data("isChange",false);
			  if (msg.success) {
				  alert("保存成功!");
			  } else {
				  alert("保存失败!");
			  }
			  
		  },
		  error:function(){
			  alert("保存失败,当前网络发生错误!");
		  }
	});
}

/**
 * 流程校验
 * @param tab
 */
function validate(tab){
	var tabId = $(tab).data("tabId");
	var xmlDoc = $(tab).data("xmlDoc");
	var data = xmlToString(xmlDoc);
	$.ajax({
		  type: "POST",
		  url: basePath+"/backstage/website/work-flow-define!checkProcessFile.json?",
		  data:{"id":tabId,"data": data},
		  success: function(msg){
			  if (msg.success) {
				 alert("校验成功！");
			  } else {
				 alert(msg.message);
			  }
		  },
		  error:function(){
			  alert("校验失败,当前网络发生错误!");
		  }
	});

}
/**
 * 格式化展示
 */
function formatShow(xmlDoc){
	var data = xmlToString(xmlDoc);
	$.ajax({
		  type: "POST",
		  url: basePath+"/backstage/website/work-flow-define!formatShow.json",
		  data:"data="+data,
		  success: function(data){
			  $("#dlg_xmlContent").val(data);
			  $('#dlg').dialog('open');
		  },
		  error:function(){
			  alert("当前网络发生错误!");
		  }
	});
}
/**
 * 自动检测当前xmlDoc是否发生改变
 * @param tab
 */
function autoCheckChange(tab){
	if(tab != null){
		if($(tab).data("isChange")){
			return;
		}
		var backupXmlDoc = $(tab).data("backup");
		$(tab).trigger("updateCurrentXmlDoc");
		var currentXmlDoc = $(tab).data("currentXmlDoc");
		var t = tab.panel('options').tab;
		var title = tab.panel("options").title;
		var s_title = t.find('span.tabs-title');
		if(backupXmlDoc != currentXmlDoc){
			$(tab).data("isChange",true);
			if(title.substring(0,1) != "*"){
				title = "*"+title;
			}
			s_title.html(title)
		}
	}
}

function getX(obj){ 
	var parObj=obj; 
	var left=obj.offsetLeft; 
	while(parObj=parObj.offsetParent){ 
		left+=parObj.offsetLeft; 
	} 
	return left; 
} 
	 
function getY(obj){ 
	var parObj=obj; 
	var top=obj.offsetTop; 
	while(parObj = parObj.offsetParent){ 
		top+=parObj.offsetTop; 
	} 
	return top; 
} 
/**
 * 通过index排序形参
 * @param x
 * @param y
 * @returns
 */
function sortFormalParamByIndexAsc(x,y){
	return (eval(x.index)>eval(y.index))?1:-1;
}