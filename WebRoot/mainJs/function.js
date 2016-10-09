try{
	String.prototype.endWith=function(str){
	if(str==null||str==""||this.length==0||str.length>this.length)
	  return false;
	if(this.substring(this.length-str.length)==str)
	  return true;
	else
	  return false;
	return true;
	}
	String.prototype.startWith=function(str){
	if(str==null||str==""||this.length==0||str.length>this.length)
	  return false;
	if(this.substr(0,str.length)==str)
	  return true;
	else
	  return false;
	return true;
	}
	String.prototype.trim=function(){
		return $.trim(this);
	}
	String.prototype.replaceAll = function(reallyDo, replaceWith, ignoreCase) {
	    if (!RegExp.prototype.isPrototypeOf(reallyDo)) {
	        return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi": "g")), replaceWith);
	    } else {
	        return this.replace(reallyDo, replaceWith);
	    }
	}
		 /** * 对Date的扩展，将 Date 转化为指定格式的String * 月(M)、日(d)、12小时(h)、24小时(H)、分(m)、秒(s)、周(E)、季度(q)
	    可以用 1-2 个占位符 * 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) * eg: * (new
	    Date()).pattern("yyyy-MM-dd hh:mm:ss.S")==> 2006-07-02 08:09:04.423
	 * (new Date()).pattern("yyyy-MM-dd E HH:mm:ss") ==> 2009-03-10 二 20:09:04
	 * (new Date()).pattern("yyyy-MM-dd EE hh:mm:ss") ==> 2009-03-10 周二 08:09:04
	 * (new Date()).pattern("yyyy-MM-dd EEE hh:mm:ss") ==> 2009-03-10 星期二 08:09:04
	 * (new Date()).pattern("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18
	 */
	Date.prototype.pattern=function(fmt) {
	    var o = {
	    "M+" : this.getMonth()+1, //月份
	    "d+" : this.getDate(), //日
	    "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时
	    "H+" : this.getHours(), //小时
	    "m+" : this.getMinutes(), //分
	    "s+" : this.getSeconds(), //秒
	    "q+" : Math.floor((this.getMonth()+3)/3), //季度
	    "S" : this.getMilliseconds() //毫秒
	    };
	    var week = {
	    "0" : "/u65e5",
	    "1" : "/u4e00",
	    "2" : "/u4e8c",
	    "3" : "/u4e09",
	    "4" : "/u56db",
	    "5" : "/u4e94",
	    "6" : "/u516d"
	    };
	    if(/(y+)/.test(fmt)){
	        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
	    }
	    if(/(E+)/.test(fmt)){
	        fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[this.getDay()+""]);
	    }
	    for(var k in o){
	        if(new RegExp("("+ k +")").test(fmt)){
	            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
	        }
	    }
	    return fmt;
	}
}catch(e){
	
}
/**对dialog方法进行简单的封装
 * selector: 选择器
 * options: dialog参数
 * buttons: 将按钮参数单独分离出来*/
function dialog(selector,options,buttons){
	if(typeof(buttons)=="undefined"){
		buttons = options;
		options = {};
	}
	var _options = {
		autoOpen : false,
		height : 'auto',
		width : 600,
		modal : true,
		buttons: buttons
	};

	options = $.extend({},_options,options);
	$(selector).dialog(options);
	return $(selector);
}

/*function refreshCenter(url){
	panel = $("#coralui-layout").layout("panel","center");
	url = addSiteIdParameter(url);
	panel.panel("refresh", url);
}
*/
function refreshCenter(url){
	panel = $("#coralui-layout").layout("panel","center");
	panel.panel("refresh", url);
}

function addSiteIdParameter(url){
	if(url.indexOf("siteId")==-1){
		if(url.indexOf("?")!=-1){
			url += "&siteId="+currentSiteId;
		}else{
			url += "?siteId="+currentSiteId;
		}
	}
	return url;
}

function toDisplay(name){
	if(!name)return;
	if(typeof(menuName)!=undefined){
		menuName = name;
	}
	panel = $("#coralui-layout").layout("panel","west");
	if(name == "ledger"){
		if(panel.length>0){
			panel = $("#coralui-layout").layout("remove","west");
		}
		panel = $("#coralui-layout").layout("panel","center");
		panel.panel("refresh", ctx+"/backstage/ledger!ledger");
	}else{
		if(panel.length==0){
			$("#coralui-layout").layout("add",{region: 'west',width: 220,height:500,split: true});
			panel = $("#coralui-layout").layout("panel","west");
			panel.panel("option","onLoad",initTreebox);
			panel.panel("option","onResize",initTreebox);
		}
		panel = $("#coralui-layout").layout("panel","west");
		panel.panel("refresh", ctx+"/backstage/ledger!leftMenu"+name);
		panel = $("#coralui-layout").layout("panel","center");
		panel.panel("refresh", ctx+"/backstage/ledger!center"+name);
	}
}

function panelMenuMouseOver(id){
	if($("#"+id).attr("class") == "selected")return;
	$("#"+id+" > .normal").hide();
	$("#"+id+" > .focus").show();
}
function panelMenuMouseOut(id){
	if($("#"+id).attr("class") == "selected")return;
	$("#"+id+" > .normal").show();
	$("#"+id+" > .focus").hide();
}

function hasWorkFlow(e,ui){
	if(ui.checked){
		$("#hasWorkFlow").show();
		$("#isInherit").checkbox("uncheck");
	}else{
		$("#hasWorkFlow").hide();
		//$("#isInherit").checkbox("check");
	}
}

function hasWorkFlowInherit(e,ui){
	if(ui.checked){
		$("#isWorkflow").checkbox("uncheck");
		$("#hasWorkFlow").hide();
	}else{

	}
}

function showDiv(obj,id){
	var display = $("#"+id).css("display");
	if(display == "block"){
		$("#"+id).hide("normal");
	}else{
		$("#"+id).show("normal");
	}
	var imgs = $(obj).find("img");
	if(imgs.length>0){
		if(display == "block"){
			$(imgs[0]).attr("src",ctx+"/res/resource/style/images/Arrowhead-Down-01-32.png")
		}else{
			$(imgs[0]).attr("src",ctx+"/res/resource/style/images/Arrowhead-01-32.png")
		}
	}
}
function openWindow(url){
	openWindow(url,modal,isblank,width,height);
}
function openWindow(url,modal,isblank,width,height){
	//debugger;
	var winWidth = window.screen.availWidth-10+"px";
	var winHeight = window.screen.availHeight-70+"px";
	//if(typeof(width) == 'undefined'){
		width = winWidth;
	//}
	//if(typeof(height) == 'undefined'){
		height = winHeight;
	//}
	if(modal){
		window.showModalDialog(url,'','dialogWidth='+width+';dialogHeight='+height+';resizable:yes;scroll:yes;status:no; center=yes; help=no');
	}else{
//		if(!isblank){			
	//		window.open(url,'newwindow');
//		}else{			
			window.open(url,'_blank','width='+width+',height='+height+',fullscreen=yes,type=fullWindow,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=yes, status=yes');
//		}
	}
}

function isIE() { //ie?
    if (!!window.ActiveXObject || "ActiveXObject" in window)
        return true;
    else
        return false;
}
function isFox() { //fox?
	if (navigator.userAgent.indexOf('Firefox') >= 0)
		return true;
	else
		return false;
}

function isChrome(){
	if(window.navigator.userAgent.indexOf("Chrome") !== -1 )
		return true;
    else
        return false;	
}

function dialogLoad() {
	$.parser.parse();
}
function uploadCommonDialogOpen(){
	$("#commonUploadForm").form("clear");//清空表单
	$("#commonFileUploadGrid").grid("clearGridData","false");
	$("#commonUploadTabs").tabs("option","active",0);//tab定位到第一个
	$("#commonLocalFile_select").css("display","block");//本地文件上传显示
	$("#commonNetworkUrl_select").css("display","none");//网络地址隐藏
	$("#commonUploadSourceType").radiolist("setValue","1");//来源类型设置为本地
	$("#commonUploadUrl").val("");//清空网络地址输入

}

function isUrl(url){
	var isUrl = false;
	if(url){
		var prefix = url.indexOf("http://");
		if(url.indexOf("http://") == 0 || url.indexOf("https://") == 0) isUrl = true;
	}
	return isUrl;
}


/**
 * 今日
 */
function getCurrentDateTime(){
	var dd = new Date();
	var date = dd.pattern("yyyy-MM-dd HH:mm:ss");
	return date;
}
/**
 * 今日
 */
function getDateToday(){
	var dd = new Date();
	var date = dd.pattern("yyyy-MM-dd");
	var datePre = date+" 00:00:00";
	var dateNext = date+" 24:00:00";
	return [datePre,dateNext];
}

function getDateTodayDayOnly(){
	var dd = new Date();
	return dd.pattern("yyyy-MM-dd");
}
/**
 * 最近N天
 * @returns {Array}
 */
function getDateRecentDay(days){
	var dd = new Date();
	var date = dd.pattern("yyyy-MM-dd");
	var dateNext = date+" 24:00:00";
	dd.setDate(dd.getDate()-days)
	date = dd.pattern("yyyy-MM-dd");
	var datePre = date+" 00:00:00";
	return [datePre,dateNext];
}
/**
 * 本周
 * @returns {Array}
 */
function getDateWeek(){
	var dd=new Date();
	var days =dd.getDay();
	var date = dd.pattern("yyyy-MM-dd");
	var dateNext = date+" 24:00:00";
	dd.setDate(dd.getDate()-days+1);
	date = dd.pattern("yyyy-MM-dd");
	var datePre = date+" 00:00:00";
	return [datePre,dateNext];
}
/**
 * 本月
 * @returns {Array}
 */
function getDateMonth(){
	var dd=new Date();
	var days =dd.getDay();
	var date = dd.pattern("yyyy-MM-dd");
	var dateNext = date+" 24:00:00";
	date = dd.pattern("yyyy-MM");
	var datePre = date+"-01 00:00:00";
	return [datePre,dateNext];
}
function message(msg){
	$.message(msg);
}
function warning(msg){
	$.message({message:"警告！"+msg, cls:"warning"});
}
function error(eMsg){
	
	var msg;
	if(eMsg&&eMsg['statusText']&&(eMsg['statusText'].indexOf('NetworkError')!=-1 || eMsg['statusText'].indexOf('error')!=-1)){
		$.message({message:"错误！网络异常，有可能断网或后台服务停止服务", cls:"danger"});
		return;
	}
	if(eMsg&&eMsg.responseText&&eMsg.responseText.indexOf("权限")!=-1){
		return;
	}
	if(eMsg&&eMsg['statusText']&&(eMsg['statusText'].indexOf('abort')!=-1)){
		return;
	}
	if((typeof eMsg)=='string'){
		$.message({message:"错误！"+eMsg, cls:"danger"});
		return;
	}
	
	try{
		//msg = jQuery.parseJSON($.trim(eMsg.responseText)).message;
		msg = eMsg.responseText;
		if(msg&&msg.indexOf('message\":')!=-1&&msg.indexOf(',\"code')!=-1){
			msg = msg.substring(msg.indexOf('message\":')+('message\":'.length), msg.indexOf(',\"code'));
			if(msg.lastIndexOf("Exception: ")!=-1){
				msg = msg.substring(msg.lastIndexOf('Exception: ')+('Exception: '.length));
			}
		} else {
			return;
		}
	}catch(e){
		if((typeof eMsg)=='string'){
			msg = eMsg;
		}else if(eMsg.statusText=='abort'){
			return;
		}else{
			msg = e.message;
		}
		//console.log(e);
	}
	if(msg&&msg.indexOf("Unable")!=-1){
		return;
	}
	if(!msg){
		msg="系统异常！";
	}
	$.message({message:"错误！"+msg, cls:"danger"});
}

/**
 * 汉字转拼音(首字母)
 */
function makePy(chinese) {
	$.ajax({
		type: 'post',
		url	: ctx+"/backstage/ledger!chinese2FirstSpell.json",
		data: {"map.chinese":chinese},
		dataType: 'json',
		async: false,
		success	: function(data){
			result = data;
		},
		error: function(e){
			error(e);
		}
	});
	return result;
}

//检查唯一性
function checkUnique(){
	var value = this.value;
	var url = this.form.action;
	if(!url)return;
	var moduleName = null;
	var menuName = null;
	if(url.indexOf("!")!=-1){
		moduleName = url.substring(url.lastIndexOf("/")+1,url.indexOf("!")); //获取模块名称, 如/infoplat/backstage/system/user!, 则返回user
		menuName = url.substring(url.lastIndexOf("/",url.lastIndexOf("/")-1)+1,url.lastIndexOf("/")); //获取菜单名称, 如/infoplat/backstage/system/user!, 则返回system
		url = url.substring(0,url.indexOf("!"));
	}
	url = url+"!checkUnique.json";

	var name = this.name;
	var id = this.form.id.value;

	var dataJson = {};
	if(moduleName != "site" && menuName != "system"){
		dataJson["Q_EQ_siteId"] = currentSiteId;
	}
	if(moduleName == "resource" || moduleName == "channel"){
		dataJson["Q_EQ_parentId"] = this.form.parentId.value;;
	}
	dataJson["Q_EQ_"+name] = value;
	dataJson["id"] = id;
	var errorMessage = value+"已经存在！";
	var result ={};

	$.ajax({
		type: 'post',
		url	: url,
		data: dataJson,
		dataType: 'json',
		async: false,
		success	: function(data){
			result = { isValid: data, errMsg: errorMessage };
		},
		error: function(e){
			error(e);
		}
	});
	return result;
}
function gridSortableRows(e, ui){
	//debugger;
	var grid = $("#"+e.target.id);
	var url = grid.grid("option","url");
	/* var datatype = grid.grid("option","datatype");
	if(datatype&&datatype=="local"){
		return;
	} */
	if(!url)return;
	if(url.indexOf("!")!=-1){
		url = url.substring(0,url.indexOf("!"));
	}
	url = url+"!sort.json";
	var sortAfterIDs = ui.permutation.join();
	var sortBeforeIDs = ui.originalPermutation.join();
	//alert(ui.permutation.length);
	 $.ajax({
		type: 'post',
		url	: url,
		data: {
				"sort.sortAfterIDs": sortAfterIDs,
				"sort.sortBeforeIDs":sortBeforeIDs
		},
		dataType: 'json',
		success	: function(data){
			 message("排序成功");
		},
		error: function(e){
			error(e);
		}
	});
}
function gridArticleSortableRows(e, ui){
	var grid = $("#"+e.target.id);
	var url = grid.grid("option","url");
	/* var datatype = grid.grid("option","datatype");
	if(datatype&&datatype=="local"){
		return;
	} */
	if(!url)return;
	if(url.indexOf("!")!=-1){
		url = url.substring(0,url.indexOf("!"));
	}
	url = url+"!sort.json";
	var itemId = ui.itemId[0];
	var preItemId = ui.prevItemId;
	var nextItemId = ui.nextItemId;
	var sortAfterIDs = ui.permutation.join();
	var sortBeforeIDs = ui.originalPermutation.join();
	//alert(ui.permutation.length);
	$.ajax({
		type: 'post',
		url	: url,
		data: {
			"sort.curItemId":itemId,
			"sort.preItemId":preItemId,
			"sort.nextItemId":nextItemId,
			"sort.sortAfterIDs": sortAfterIDs,
			"sort.sortBeforeIDs":sortBeforeIDs
		},
		dataType: 'json',
		success	: function(data){
			message("排序成功");
		},
		error: function(e){
			error(e);
		}
	});
}

//公用的打开编辑图片界面的方法
function editImage(filePathId,imgId){
	var src = $("#"+imgId).attr("src");
	if(src.indexOf("http://") > -1){
		warning("网络图片不能编辑, 请下载至本地后再编辑");
		return;
	}

	var imgName = getOnlyFileName(src);
	if(imgName == "addpicture"){
		warning("请给一张图片");
		return;
	}
	var filePath = $("#"+filePathId).val();
	var url = ctx + '/backstage/website/crop!index?filePath='+filePath+"&siteId="+currentSiteId+"&sltImgId="+imgId;
	openWindow(url);
	//window.open(url, '_blank');
}

//公共的清除图片的方法
function clearImage(FilePathId,ImgId){
	$("#" + FilePathId).textbox("setValue","");
	$("#" + ImgId).attr("src",ctx + "/res/resource/style/images/addpicture.png");
}

//获取不带后缀的文件名
function getOnlyFileName(fileName) {
	var index = fileName.lastIndexOf("\\");
	if (index == -1) {
		index = fileName.lastIndexOf("/");
	}
	var temp = fileName.substring(index + 1);
	index = temp.indexOf(".");
	temp = temp.substring(0, index);
	return temp;
}

function layoutCenterResize(){
	var panel = $("#coralui-layout").layout("panel","center");
	var centerHeight = panel.panel("option","height") - $('.flashTooltip:visible').outerHeight(true);
	var navHeight = $(".PanelNav:visible").outerHeight(true);
	var panelConOuterHeight = $(".PanelCon").outerHeight(true);
	var panelConInnerHeight = $(".PanelCon").height();
	//alert(centerHeight+";"+navHeight+";"+(panelConOuterHeight-panelConInnerHeight));
	var panelCon = centerHeight- navHeight-(panelConOuterHeight-panelConInnerHeight)-2;
	var searchHeight = $(".PanelSelect").outerHeight(true);
	//alert(searchHeight);
	var listHeight = panelCon-searchHeight -2;
	//alert(listHeight);
	$(".PanelCon").height(panelCon);
	$(".PanelList").height(listHeight);
	
	if($('.flashTooltip').css('display') == 'block'){
		$('#footer').parents('.coral-layout-panel-south').css('top',panel.panel("option","height")+13);
	}
	

	var panelhastabheight = listHeight - $('.nobordertabul').outerHeight(true);
	$('.panelhastabheight').height(panelhastabheight);

	var panellist2 = panelhastabheight - 20;
	$('.PanelList2').height(panellist2);

	var hastreeheight = panellist2 - $('.floatLeft2').outerHeight(true) - 10;
	$('.hastreeheight').height(hastreeheight);

	$('#firstscanimg').height($('#firstscanshow').height() - $('#firstscanbtn:visible').outerHeight(true));
	$('.systemManagementTro').css({
			'width': $('.trosize').width(),
			'height': $('.trosize').height()
	});
	$('.systemManagementTro img').css({
		'max-width': $('.trosize').width(),
		'max-height': $('.trosize').height()
	});
	
	$('#listRequired,#listTaken,#listMaking').height(listHeight- $('.panelul').height());

}





//根据上传的图片类型控制显示和隐藏裁剪按钮
function crop_pic_showOrHide(picType,prefix){
	var img = $("#"+prefix+"crop_pic");
	if(picType != "2"){//不是来源网络
		img.show();
	}else{
		img.hide();
	}
}
function initTreebox(){
	//二级树区域高度
	$('.treebox').height($('.menuLeftSecond').height() - $('.menuLeftSecondHead').height() );
}

//此方法用于左侧菜单功能
try{
	$(function(){
		$('body').on('click','.menuLeftFirst li',function(){
	 		$(this).addClass('hit').siblings().removeClass('hit');
	 	})
	
		$('body').on('click','.menuLeftFirst li.hasTree',function(){
	 		$('.menuLeftSecond').animate({'left':'0'});
	 		var titleHtml = $(this).html();
	 		$('.firstName').html(titleHtml);
	 		var no = parseInt($(this).attr('no'));
	 		$(".treebox .leftTree>div").hide();
	 		$(".treebox .leftTree>div[no='"+no+"']").show();
	
	 	})
	
	 	$('body').on('click','.BackFirst',function(){
	 		$('.menuLeftSecond').animate({'left':'100%'});
	 	})
	
	 	//menuLeftFirst2
	 	$('body').on('click','.menuLeftFirst2>ul>li',function(){
	 		$(this).addClass('hit').siblings().removeClass('hit');
	 	})
	
	})
}catch(e){
	
}

//异步树加载后，自动打开第一层
var treeAsyncTimes={};
 function treeAsyncExpandnode(e, treeId, treeNode) {
	if(treeAsyncTimes[treeId]){
		treeAsyncTimes[treeId]+= 1;
	}else{
		treeAsyncTimes[treeId] = 1;
	}
	//if(treeAsyncTimes[treeId]%2!=0){
	 	var tree = $("#"+treeId);
	    var nodes = tree.tree("getNodes");
	    tree.tree("expandNode",nodes[0], true);
	//}
 }

 //点击树上节点时, 勾选上节点的checkbox
 function checkClickNode(e, treeId, treeNode){
/*	 if(treeNode.level == 0){
		 if(treeNode.checked){
			 $("#"+treeId).tree("checkAllNodes",false);
		 } else {
			 $("#"+treeId).tree("checkAllNodes",true);
		 }
	 } else {
		 if(treeNode.checked){
			 $("#"+treeId).tree("checkNode",treeNode,false);
		 } else {
			 $("#"+treeId).tree("checkNode",treeNode,true);
		 }
	 }*/
	 if(treeNode.checked){
		 $("#"+treeId).tree("checkNode",treeNode,false);
	 } else {
		 $("#"+treeId).tree("checkNode",treeNode,true);
	 }
 }

//勾选指定的的节点
function makeNodeChecked(tree,checkObj,nodesArray){
	for(var i=0; i<checkObj.length ; i++){
		for(var j=0; j<nodesArray.length; j++){
			if(checkObj[i].id === nodesArray[j].id){
				tree.tree("checkNode", nodesArray[j], true);
			}
		}
	}
}


function loading(msg){
	$.loading({
		position: "overlay",
		text: msg
	});
}
function hide(){
	$.loading("hide");
}
//获取缩略图src
function getImageSLTSrc(filePath){
	if(filePath===""){
		filePath=null;
	}
	if(!filePath||filePath.substring(0,4)=='http'){
		return filePath;
	}
	var lastIndex = filePath.lastIndexOf(".");
	var extFormat = filePath.substring(lastIndex);
	var temp = filePath.substring(0,lastIndex);
	temp += "_"+GLOBAL_IMAGE_SIZE+extFormat+"?filePath="+filePath+"&"+new Date();
	return temp;
}
function tooltipinput(placeholder){
	var tooltipinput = '';
	tooltipinput += '<span class="tooltipbarbox" style="display:block;">';
		tooltipinput += '<span class="tooltiparrow"></span>';
		tooltipinput += '<span class="tooltiptext">+placeholder+</span>';
	tooltipinput += '</span>';
	$('.se-searchall').append(tooltipinput);
}

function getClipboard() {
	debugger;
	   if (window.clipboardData) {
	      return(window.clipboardData.getData('Text'));
	   }
	   else if (window.netscape) {
	      netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
	      var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
	      if (!clip) return;
	      var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
	      if (!trans) return;
	      trans.addDataFlavor('text/unicode');
	      clip.getData(trans,clip.kGlobalClipboard);
	      var str = new Object();
	      var len = new Object();
	      try {
	         trans.getTransferData('text/unicode',str,len);
	      }
	      catch(error) {
	         return null;
	      }
	      if (str) {
	         if (Components.interfaces.nsISupportsWString) str=str.value.QueryInterface(Components.interfaces.nsISupportsWString);
	         else if (Components.interfaces.nsISupportsString) str=str.value.QueryInterface(Components.interfaces.nsISupportsString);
	         else str = null;
	      }
	      if (str) {
	         return(str.data.substring(0,len.value / 2));
	      }
	   }
	   else {
		   warning("您的浏览器不能够访问剪切板. 请 ctrl + v 来粘贴");
	   }
	   return null;
	} 

function pasteUrl(id){
	var url = getClipboard();
	if(url){
		$("#"+id).textbox("setValue",url);
	}
}
//为左侧树增加节点
function addLeftTreeNode(tree,treeNode){
	var selNode = tree.tree("getSelectedNodes");
	tree.tree("addNodes",selNode[0],treeNode,true);
}

//为左侧树修改节点
function updateLeftTreeNode(tree,treeNode,id){
	var selNode = tree.tree("getSelectedNodes");
	var childrenNodes = selNode[0].children;
	for(var i in childrenNodes){
		if(childrenNodes[i].id == id){
			childrenNodes[i].name = treeNode.name;
			childrenNodes[i].icon = treeNode.icon;
			tree.tree("updateNode",childrenNodes[i]);
		}
	}
}

//为左侧树删除节点
function deleteLeftTreeNode(tree,id){
	var idsArray = id.toString().split(",");
	var selNode = tree.tree("getSelectedNodes");
	var childrenNodes = selNode[0].children;
	for (var i = idsArray.length-1 ; i >= 0 ; i--) {
		for (var j = childrenNodes.length-1; j >= 0; j--) {
			if(childrenNodes[j].id == idsArray[i]){
				tree.tree("removeNode",childrenNodes[j]);
				break;
			}
		}
	}
}

function openListenAudioDialog(id,name,idSuffix){
	var url = ctx + "/backstage/website/source!indexListenAudio?id="+id+"&mediaFileName="+name;
	if(!id&&name){
		name="";
	}
	dialog(
			"#listenAudioDialog"+idSuffix,
			{
				width : 810,
				height:310,
				title : name,
				url:url
			},
			{
				"关闭" : function() {
					$(this).dialog("close");
				}
			}).dialog("open");
	
}

function downloadFile(url){
	if(!document.getElementById("downloadIframe")){
		$("body").append("<iframe id='downloadIframe' width='0px' height='0px'></iframe>");
	}
	$("#downloadIframe").attr("src",url);
}

function openWatchVideoDialog(id,name,idSuffix){
	var url = ctx + "/backstage/website/source!indexWatchVideo?id="+id+"&mediaFileName="+name;
	if(!id&&name){
		name="";
	}
	
		dialog(
				"#watchVideoDialog"+idSuffix,
				{
					width : 810,
					height : 680,
					title : name,
					url:url
				},
				{
					"关闭" : function() {
						$(this).dialog("close");
					}
				}).dialog("open");

}

function checkFlash(){
	if(isIE()){
		try{
			var swf1 = new ActiveXObject('ShockwaveFlash.ShockwaveFlash');
			return "hasFlash";
		}
		catch(e){
			return "noFlash";
		}
	}else {
		try{
			var swf2 = navigator.plugins['Shockwave Flash'];
			if(swf2 == undefined){
				return "noFlash";
			}
			else {
				return "hasFlash";
			}
		}
		catch(e){
			return "noFlash";
		}
	}
}

function isPic(fileName){
	var lastIndex = fileName.lastIndexOf(".");
	var extFormat = fileName.substring(lastIndex);
	if(extFormat=='.jpg' || extFormat=='.gif' || extFormat=='.png' || extFormat=='.jpeg' || extFormat=='.bmp'){
		return true;
	} else{
		return false;
	}
}

function isCss(fileName){
	var lastIndex = fileName.lastIndexOf(".");
	var extFormat = fileName.substring(lastIndex);
	if(extFormat=='.css'){
		return true;
	} else{
		return false;
	}
}

//Html编码获取Html转义实体
function htmlEncode(value){
	  return $('<div/>').text(value).html();
	}
//Html解码获取Html实体
function htmlDecode(value){
  return $('<div/>').html(value).text();
}
	
function isJs(fileName){
	var lastIndex = fileName.lastIndexOf(".");
	var extFormat = fileName.substring(lastIndex);
	if(extFormat=='.js'){
		return true;
	} else{
		return false;
	}
}

function encodeBase64(value){
	if(!value){
		return value;
	}
	$.base64.utf8encode = true;
	var base64Str = $.base64.btoa(value);
	base64Str = "cescms"+base64Str+"cescms";
	return base64Str;
}

function encodeBase64Json(json){
	debugger;
	if(typeof(json) == "string"){
		return encodeBase64(json);
	}
	for(key in json){
		var value = json[key];
		var reg = new RegExp("<[^>]*>|(?:')|(?:--)|(/\\*(?:.|[\\n\\r])*?\\*/)");
		if(value&&reg.test(value)){
			json[key]=encodeBase64(value);
		}
	}
	return json;
}

function zeroFormat(cellValue){
	if(cellValue==0||cellValue==null){
		return "";
	}
	return cellValue;
}