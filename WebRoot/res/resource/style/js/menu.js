function menubeforeactivate(e, ui){
	//if(ui.newPanel.hasClass("empty"))return false;
}


function toDisplay(name){
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
		}
		panel = $("#coralui-layout").layout("panel","west");
		panel.panel("refresh", ctx+"/backstage/ledger!leftMenu?leftName="+name);
		panel = $("#coralui-layout").layout("panel","center");
		panel.panel("refresh", ctx+"/backstage/ledger!center");
	}
	$(".PanelMenu > li").each(function(i){
			var id = $(this).attr("id");
			if(id == name){
				$("#"+id+" > .normal").hide();
				$("#"+id+" > .focus").show();
				$("#"+id).addClass("selected");
				$("#"+id).removeClass("panelMenuNoraml");
			}else{
				$("#"+id+" > .normal").show();
				$("#"+id+" > .focus").hide();
				$("#"+id).addClass("panelMenuNoraml");
				$("#"+id).removeClass("selected");
			}
	 });
	
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
function confirmDel(name){
	$.confirm("确认删除吗？", function(r) {
		 if (r) {
	$.message( "确定" );
		 } else {
	$.message( "取消" );
		 }
		 });
}

function refreshCenter(url){
	panel = $("#coralui-layout").layout("panel","center");
	panel.panel("refresh", url);
}
function formatter(cellvalue, options, rowObject){
	return "<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
			" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> " +
			" <a href='#'><img src='../style/images/iconpreView.png' alt='预览'/></a>";
}
function formatterMedia(cellvalue, options, rowObject){
	return "<a href='javascript:refreshCenter(\"article/articleList-pics-detail.html\")'><img src='../style/images/iconDetail.png' alt='详细'/></a> "+
	"<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> " +
	" <a href='#'><img src='../style/images/iconpreView.png' alt='预览'/></a>";
}
function formatterVideo(cellvalue, options, rowObject){
	return "<a href='javascript:refreshCenter(\"article/articleList-video-detail.html\")'><img src='../style/images/iconDetail.png' alt='详细'/></a>" +
	"<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> " +
	" <a href='#'><img src='../style/images/iconpreView.png' alt='预览'/></a>";
}
function magazineTypeFormatter(cellvalue, options, rowObject){

	return '<a href="javascript:refreshCenter('+"'magazine/magazineList.html'"+')">期刊管理</a> '+
	"<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> " ;
}
function codeTypeFormatter(cellvalue, options, rowObject){
	return '<a href="javascript:refreshCenter('+"'setting/codeList.html'"+')"><img src="../style/images/iconDetail.png" alt="编码管理"/></a></a> '+
	"<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> " ;
}
function codeFormatter(cellvalue, options, rowObject){
	return "<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> " ;
}
function magazineFormatter(cellvalue, options, rowObject){
	return '<a href="javascript:refreshCenter('+"'article/articleList.html'"+')">期刊文章</a> '+
	"<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> " ;
}
function voteFormatter(cellvalue, options, rowObject){
	return '<a href="javascript:refreshCenter('+"'vote/voteItem.html'"+')"><img src="../style/images/iconDetail.png" alt="调查选项"/></a> '+
	"<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> " ;
}
function sensitiveFormatter(cellvalue, options, rowObject){
	return "<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> " ;
}
function workflowFormatter(cellvalue, options, rowObject){
	return "<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> " ;
}
function channelFormatter(cellvalue, options, rowObject){
	return "<a href='#'><img src='../style/images/iconpreView.png' alt='预览'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> " ;
}
function guestBookListFormatter(cellvalue, options, rowObject){
	return "<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconDetail.png' alt='查看'/></a> " +
	" <a href='#'><img src='../style/images/iconReply.png' alt='回复'/></a> " ;
}
function commentFormatter(cellvalue, options, rowObject){
	return "<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='javascript:refreshCenter(\"comment/commentDetailList.html\")'><img src='../style/images/iconDetail.png' alt='查看'/></a> ";
}
function commentDetailFormatter(cellvalue, options, rowObject){
	return "<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconpreView.png' alt='查看'/></a> ";
}
function imagePlayerFormatter(cellvalue, options, rowObject){
	var str = "";
	str += '<a href="javascript:refreshCenter('+"'imagePlayer/imageList.html'"+')">图片管理</a> | ';
	str += '<a href="javascript:openDialog('+"'addImagePlayer'"+')">修改</a> | ';
	str += '<a href="#">删除</a>';
	return str;
}
function voteItemFormatter(cellvalue, options, rowObject){
	var str = "";
	str += '<a href="javascript:openDialog('+"'showVoteItemDetail'"+')">投票详情</a>';
	return str;
}
function guestBookTypeFormatter(cellvalue, options, rowObject){
	return "<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> ";
}
function roleFormatter(cellvalue, options, rowObject){
	return "<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> ";
}
function logFormatter(cellvalue, options, rowObject){
	return "<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> ";
}

function gtasksFormatter(cellvalue, options, rowObject){
	var str = "";
	str += '<a href="javascript:void(0)" onclick="window.open('+"'approvalPage.html'"+')">主办</a>';
	return str;
}
function adPositionFormatter(cellvalue, options, rowObject){
	return "<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> ";
}
function friendLinkFormatter(cellvalue, options, rowObject){
	return "<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> ";
}
function siteFormatter(){
	return "<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> " +
	" <a href='#'><img src='../style/images/iconpreView.png' alt='预览'/></a>";
}
function templatePackageFormatter(){
	return "<a href='javascript:refreshCenter(\"template/templateList.html\")'><img src='../style/images/iconDetail.png' alt='模版'/></a> " +
			" <a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a>";
}
function templateFormatter(){
	return "<a href='#'><img src='../style/images/icondelet.png' alt='删除'/></a> " +
	" <a href='#'><img src='../style/images/iconchange.png' alt='修改'/></a> " ;
}
function grantChannelFormatter(cellvalue, options, rowObject){
	var str = "";
	str +="<input type='checkbox' checked='checked'/>"
		return str;
}
function openDialog(id){
	if($("#"+id)){
		$("#"+id).dialog({modal: true});
		$("#"+id).dialog("open");
	}
}

function adPositonType(e,item){
	$("#pf").hide();
	$("#tlsj").hide();
	if(item.value == "2"){
		$("#pf").show();
	}else if(item.value == "3"){
		$("#tlsj").show();
	}else if(item.value == "4"){
		$("#pf").show();
	}
}
function memberStatisticsType(e,item){
	$("#memberStatisticsByYear_view").hide();
	$("#memberStatisticsByMonth_view").hide();
	$("#memberStatisticsByWeek_view").hide();
	$("#memberStatisticsByDay_view").hide();
	if(item.value == "1"){
		$("#memberStatisticsByYear_view").show();
	}else if(item.value == "2"){
		$("#memberStatisticsByMonth_view").show();
	}else if(item.value == "3"){
		$("#memberStatisticsByWeek_view").show();
	}else if(item.value == "4"){
		$("#memberStatisticsByDay_view").show();
	}
}
function hasLimit(e,item){
	$("#hasLimit").hide();
	if(item.value == "1"){
		$("#hasLimit").show();
	}else if(item.value == "2"){
		$("#hasLimit").hide();
	}
}
function voteItemType(e,item){
	$("#voteItemType_radioAndCheckbox").hide();
	$("#voteItemType_text").hide();
	$("#voteItemType_images").hide();
	$("#voteItemType_article").hide();
	if(item.value == "1" || item.value == "2"){
		$("#voteItemType_radioAndCheckbox").show();
	}else if(item.value == "3"){
		$("#voteItemType_text").show();
	}else if(item.value == "4"){
		$("#voteItemType_images").show();
	}else if(item.value == "5"){
		$("#voteItemType_article").show();
	}
}
function hasWorkFlow(e,ui){
	if(ui.checked){
		$("#hasWorkFlow").show();
	}else{
		$("#hasWorkFlow").hide();
	}
}
function addModel(){
	$("#addModel").dialog("open");
}
function addFriendLink(){
	$("#addFriendLink").dialog("open");
}
function addFriendLinkType(){
	$("#addFriendLinkType").dialog("open");
}
function showComment(){
	$("#showComment").dialog("open");
}
function addSite(){
	$("#addSite").dialog("open");
}
function addChannel(){
	$("#addChannel").dialog("open");
}
function addSensitive(){
	$("#addSensitive").dialog("open");
}

function getCenterLayoutUrlParam(){
	panel = $("#coralui-layout").layout("panel","center");
	var url = panel.panel("getOptions").url;
	var json = {};
	if(url && url.indexOf("?") != -1){
		para = url.substring(url.indexOf("?")+1);
		var arr = para.split("&");
		for(var i=0;i<arr.length;i++)
		{
			if(arr[i].indexOf("=") != -1){
				var keyValue = arr[i].split("=");
				if(keyValue.length == 2){
					json[keyValue[0]] = keyValue[1];
				}
			}
		}
	}
	return json;
}

function uploadSLT(){
	$("#uploadSLT").dialog("open");
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
			$(imgs[0]).attr("src","../style/images/Arrowhead-Down-01-32.png")
		}else{
			$(imgs[0]).attr("src","../style/images/Arrowhead-01-32.png")
		}
	}
}

function modifyAttachment(attachmentId){
	
	openDialog(attachmentId);
}

function logout(){
	window.location.href = "login.html";
}
function advancedChange(event,ui){
	if(ui.value==1){
		$("#ckeditor").css("display","block");
		$("#word").css("display","none");
		$("#redheadfile").css("display","none");

		$("#ckeditorEditor").css("display","block");
		$("#wordEditor").css("display","none");
		$("#redheadfileEditor").css("display","none");
	}else if(ui.value==2){
		$("#ckeditor").css("display","none");
		$("#word").css("display","block");
		$("#redheadfile").css("display","none");

		$("#ckeditorEditor").css("display","none");
		$("#wordEditor").css("display","block");
		$("#redheadfileEditor").css("display","none");
	}else if(ui.value==3){
		$("#ckeditor").css("display","none");
		$("#word").css("display","none");
		$("#redheadfile").css("display","block");

		$("#ckeditorEditor").css("display","none");
		$("#wordEditor").css("display","none");
		$("#redheadfileEditor").css("display","block");
	}
}
