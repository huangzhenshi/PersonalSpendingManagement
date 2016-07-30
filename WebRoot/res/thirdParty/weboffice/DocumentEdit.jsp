<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.text.*,java.util.*,java.sql.*,java.text.SimpleDateFormat,java.text.DateFormat,java.util.Date,javax.servlet.*,javax.servlet.http.*,DBstep.iDBManager2000.*" %>
<%
  ResultSet result=null;
  String mSubject=null;
  String mStatus=null;
  String mAuthor=null;
  String mFileName=null;
  String mFileDate=null;
  String mHTMLPath="";

  String mDisabled="";
  String mDisabledSave="";
  String mWord="";
  String mExcel="";
  //自动获取OfficeServer和OCX文件完整URL路径
  String mHttpUrlName=request.getRequestURI();
  String mScriptName=request.getServletPath();
  String mServerName="res/thirdParty/weboffice/OfficeServer.jsp";

  String mServerUrl="http://"+request.getServerName()+":"+request.getServerPort()+mHttpUrlName.substring(0,mHttpUrlName.lastIndexOf(mScriptName))+"/"+mServerName;//取得OfficeServer文件的完整URL
  String mHttpUrl="http://"+request.getServerName()+":"+request.getServerPort()+mHttpUrlName.substring(0,mHttpUrlName.lastIndexOf(mScriptName))+"/";

  String mRecordID=request.getParameter("RecordID");
  String mTemplate=request.getParameter("Template");
  String mFileType=request.getParameter("FileType");
  String mEditType=request.getParameter("EditType");
  String mShowType=request.getParameter("ShowType");
  //String mUserName=new String(request.getParameter("UserName").getBytes("8859_1"));
  String mUserName=request.getParameter("UserName");

  //设置编号初始值
  if (mRecordID==null){
     mRecordID="";
  }

  //设置编辑状态初始值
  if (mEditType==null || mEditType==""){
    mEditType="1,1";
  }

  //设置显示模式初始值
  if (mShowType==null || mShowType==""){
    mShowType="1";
  }

  //设置文档类型初始值
  if (mFileType==null || mFileType==""){
    mFileType=".doc";
  }

  //设置用户名初始值
  if (mUserName==null || mUserName==""){
    mUserName="中信信息";
  }

  //设置模板初始值
  if (mTemplate==null){
    mTemplate="";
  }

  if (mEditType=="0,0"){
    mDisabled="disabled";
    mDisabledSave="disabled";
  }
  else{
    mDisabled="";
  }

  mFileName=mRecordID + mFileType;  //取得完整的文档名称
  if (mFileType.equalsIgnoreCase(".doc") || mFileType.equalsIgnoreCase(".wps")){
    mWord="";
    mExcel="disabled";
  }
  else if (mFileType==".xls"){
    mWord="disabled";
    mExcel="";
  }
  else{
    mDisabled="disabled";
  }
  //文章内容存放路径
  String contentPath = request.getParameter("cp") != null ? request.getParameter("cp") : "";
	if (!"".equals(contentPath)) {
		contentPath = contentPath.replaceAll("\\\\", "/");
		String seperator = "?";
		if (mServerUrl.indexOf(seperator) != -1) {
			seperator = "&";
		}
		mServerUrl += seperator + "cp=" + contentPath;
	}
	//文章内容文件名:文章id
	String fileName = request.getParameter("fn") != null ? request.getParameter("fn") : "";
	if (fileName.indexOf(".") != -1) {
		fileName = fileName.substring(0, fileName.indexOf("."));
	}
	mRecordID = fileName;
  
%>

<html>
<head>
<title>金格科技-iWebOffice2009全文批注实例</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<script type="text/javascript" src="<%=mHttpUrl %>/res/resource/style/js/function.js"></script>
<script language="javascript" for=WebOffice event="OnMenuClick(vIndex,vCaption)">

  if (vIndex==1){  
    WebOpenLocal();     //打开本地文件
  }
  if (vIndex==2){  
    WebSaveLocal();     //保存本地文件
  }
  if (vIndex==3){
    SaveDocument();     //保存正文到服务器上（不退出）
  }
  if (vIndex==5){  
    WebOpenSignature(); //签名印章
  }
  if (vIndex==6){  
    WebShowSignature(); //验证签章
  }
  if (vIndex==8){  
    WebSaveVersion();   //保存版本
  }
  if (vIndex==9){  
    WebOpenVersion();   //打开版本
  }
  if (vIndex==11){
    SaveDocument();     //保存正文到服务器上
    webform.submit();   //然后退出
  }
  if (vIndex==13){  
    WebOpenPrint();     //打印文档
  }
</script>

<script language=javascript for=WebOffice event=OnToolsClick(vIndex,vCaption)>
  //响应工具栏事件
  if (vIndex==11){
    iweboffice.VisibleTools('手写批注',false);       //隐藏或显示iWebOffice工具栏 true显示  false隐藏
  } 
  if (vIndex==12){
    iweboffice.VisibleTools('手写批注',true);        //隐藏或显示iWebOffice工具栏 true显示  false隐藏
  }  
  //if (vIndex==-1){iweboffice.Alert(vCaption);}     //在完成相应操作后响应iWebOffice标准工具栏操作铵钮事件，如"手写批注",vCaption="手写批注"
</script>
<style>
html,body{
	height:100%;
}
*{
margin:0;padding:0;
}
</style>
</head>
<body bgcolor="#ffffff" onload="Load();" onunload="UnLoad();">  <!--引导和退出iWebOffice-->
  <div id="loadTipsforWebOffice">在线word编辑器正在加载中...</div>
  <form name="webform" method="post" action="" onsubmit="" style="height:100%;margin-top:-20px;">  <!--保存iWebOffice后提交表单信息-->
    <input type="hidden" name="RecordID" value="<%=mRecordID%>">
    <input type="hidden" name="Template" value="<%=mTemplate%>">
    <input type="hidden" name="FileType" value="<%=mFileType%>">
    <input type="hidden" name="EditType" value="<%=mEditType%>">
    <input type="hidden" name="HTMLPath" value="<%=mHTMLPath%>">
    <input type="hidden" name="StatusBar">
    <script src="iWebOffice2009.js"></script>
  </form>
</body>
</html>

<script language=javascript>
/*
form表单名称:webform
iWebOffice名称:WebOffice
WebObject文档对象接口，相当于：
如果是Word  文件，WebObject 是Word  VBA的ActiveDocument对象
如果是Excel 文件，WebObject 是Excel VBA的ActiveSheet对象

如：iweboffice.WebObject
*/

var iweboffice;
//作用：显示操作状态
function StatusMsg(mString){
  webform.StatusBar.value=mString;
}

function initWebOfficeProperties(docPath,mRecordID){
	debugger;
	var mServerUrl = "<%=mServerUrl%>";
	if(mServerUrl.indexOf("?")==-1){
		mServerUrl += "?cp="+docPath;
		iweboffice.WebUrl = mServerUrl;
		iweboffice.RecordID=mRecordID; 
	}
	 
}
//作用：载入iWebOffice
function Load(){
	debugger;
  if(!isIE() && !isFox()){
	  document.getElementById("loadTipsforWebOffice").innerHTML = "当前浏览器不支持在线word编辑器,请更换至IE浏览器或火狐浏览器或更换编辑器类型";
	 // alert("当前浏览器不支持在线word编辑器,请更换至IE浏览器或火狐浏览器或更换编辑器类型");
	  return;
  }
  try{
	  debugger;
	iweboffice = document.getElementById("WebOffice");
    //以下属性必须设置，实始化iWebOffice
    iweboffice.WebUrl="<%=mServerUrl%>";             //WebUrl:系统服务器路径，与服务器文件交互操作，如保存、打开文档，重要文件
    iweboffice.RecordID="<%=mRecordID%>";            //RecordID:本文档记录编号
    iweboffice.Template="<%=mTemplate%>";            //Template:模板编号
    iweboffice.FileName="<%=mFileName%>";            //FileName:文档名称
    iweboffice.FileType="<%=mFileType%>";            //FileType:文档类型  .doc  .xls  .wps
    iweboffice.UserName="<%=mUserName%>";            //UserName:操作用户名，痕迹保留需要
    iweboffice.EditType="<%=mEditType%>";            //EditType:编辑类型  方式一、方式二  <参考技术文档>
                                                            //第一位可以为0,1,2,3 其中:0不可编辑;1可以编辑,无痕迹;2可以编辑,有痕迹,不能修订;3可以编辑,有痕迹,能修订；
                                                            //第二位可以为0,1 其中:0不可批注,1可以批注。可以参考iWebOffice2009的EditType属性，详细参考技术白皮书
    iweboffice.MaxFileSize = 8 * 1024;               //最大的文档大小控制，默认是8M，现在设置成8M。
    iweboffice.Language="CH";                        //Language:多语言支持显示选择   CH简体 TW繁体 EN英文
    iweboffice.ShowWindow = 1;                  //控制显示打开或保存文档的进度窗口，默认不显示

    iweboffice.PenColor="#FF0000";                   //PenColor:默认批注颜色
    iweboffice.PenWidth="1";                         //PenWidth:默认批注笔宽
    iweboffice.Print="1";                            //Print:默认是否可以打印:1可以打印批注,0不可以打印批注
    iweboffice.ShowToolBar="0";                      //ShowToolBar:是否显示工具栏:1显示,0不显示

    //以下为自定义工具栏按钮↓ 参数一:Index按钮编号,参数二:Caption按钮显示内容,参数三:Icon图标名称
    iweboffice.AppendTools("11","隐藏手写批注",11);  //在OnToolsClick中的 vIndex=11 ,vCaption="隐藏手写批注";
    iweboffice.AppendTools("12","显示手写批注",12);  //在OnToolsClick中的 vIndex=12 ,vCaption="显示手写批注";
    iweboffice.AppendTools("13","-",0);
    //以上为自定义工具栏按钮↑

    iweboffice.ShowMenu="0";                         //控制整体菜单显示
    //以下为自定义菜单↓
    iweboffice.AppendMenu("1","打开本地文件(&L)");
    iweboffice.AppendMenu("2","保存本地文件(&S)");
    iweboffice.AppendMenu("3","保存远程文件(&U)");
    iweboffice.AppendMenu("4","-");
    iweboffice.AppendMenu("5","签名印章(&Q)");
    iweboffice.AppendMenu("6","验证签章(&Y)");
    iweboffice.AppendMenu("7","-");
    iweboffice.AppendMenu("8","保存版本(&B)");
    iweboffice.AppendMenu("9","打开版本(&D)");
    iweboffice.AppendMenu("10","-");
    iweboffice.AppendMenu("11","保存并退出(&E)");
    iweboffice.AppendMenu("12","-");
    iweboffice.AppendMenu("13","打印文档(&P)");
    //以上为自定义菜单↑
    iweboffice.DisableMenu("宏(&M);选项(&O)...");     //禁止某个（些）菜单项

    //WebSetRibbonUIXML();                                  //控制OFFICE2007的选项卡显示
    iweboffice.WebOpen();                            //打开该文档    交互OfficeServer  调出文档OPTION="LOADFILE"    调出模板OPTION="LOADTEMPLATE"     <参考技术文档>
    iweboffice.ShowType=<%=mShowType%>;              //文档显示方式  1:表示文字批注  2:表示手写批注  0:表示文档核稿

    StatusMsg(iweboffice.Status);                    //状态信息
  }catch(e){
    //alert(e.message);                                   //显示出错误信息
  }
  document.getElementById("loadTipsforWebOffice").style.display= "none";
}

//作用：退出iWebOffice
function UnLoad(){
  if (navigator.userAgent.indexOf("Firefox") >= 0){ //卸载时候，火狐不能使用WebClose接口
	return;
  }
  try{
    if (!iweboffice.WebClose()){
      StatusMsg(iweboffice.Status);
    }else{
      StatusMsg("关闭文档...");
    }
  }catch(e){
    alert(e.message);
  }
}

//作用：打开文档
function LoadDocument(){
	debugger;
  StatusMsg("正在打开文档...");
  if (!iweboffice.WebOpen()){  	//打开该文档    交互OfficeServer的OPTION="LOADFILE"
     StatusMsg(iweboffice.Status);
  }else{
     StatusMsg(iweboffice.Status);
  }
}

//作用：保存文档
function SaveDocument(){
	debugger;
  //iweboffice.WebSetMsgByName("MyDefine1","自定义变量值1");  //设置变量MyDefine1="自定义变量值1"，变量可以设置多个  在WebSave()时，一起提交到OfficeServer中
  if (!iweboffice.WebSave()){    //交互OfficeServer的OPTION="SAVEFILE"  注：WebSave()是保存复合格式文件，包括OFFICE内容和手写批注文档；如只保存成OFFICE文档格式，那么就设WebSave(true)
     StatusMsg(iweboffice.Status);
     return false;
  }else{
     StatusMsg(iweboffice.Status);
     return true;
  }
}


//作用：显示或隐藏痕迹[隐藏痕迹时修改文档没有痕迹保留]  true表示隐藏痕迹  false表示显示痕迹
function ShowRevision(mValue){
  if (mValue){
     iweboffice.WebShow(true);
     StatusMsg("显示痕迹...");
  }else{
     iweboffice.WebShow(false);
     StatusMsg("隐藏痕迹...");
  }
}


//作用：显示或隐藏痕迹[隐藏痕迹时修改文档有痕迹保留]  true表示隐藏痕迹  false表示显示痕迹
function ShowRevision2(mValue){
  if (mValue){
     iweboffice.WebObject.ShowRevisions=true;   //显示痕迹
  }else{
     iweboffice.WebObject.ShowRevisions=false;  //隐藏痕迹
  }
}


//作用：获取痕迹
function WebGetRevisions(){
  var Rev = iweboffice.WebObject.Revisions;		//获取痕迹对象
  var Text="";

  for (i = 1;i <= Rev.Count;i++){
    Text=Text +"“"+ Rev.Item(i).Author+"”";
    if (Rev.Item(i).Type=="1"){
      Text=Text + '进行插入：'+Rev.Item(i).Range.Text+"\r\n";
    }else if (Rev.Item(i).Type=="2"){
      Text=Text + '进行删除：'+Rev.Item(i).Range.Text+"\r\n";
    }
	else {
      Text=Text + '进行其他操作，操作内容：“'+Rev.Item(i).Range.Text+ '”；操作：“'+Rev.Item(i).Formatmessage+"”。\r\n";
    }
  }
  alert("痕迹内容：\r\n\r\n"+Text);
}

//作用：刷新文档
function WebReFresh(){
  iweboffice.WebReFresh();
  StatusMsg("文档已刷新...");
}


//作用：打开版本
function WebOpenVersion(){
  iweboffice.WebOpenVersion();  	//交互OfficeServer  列出版本OPTION="LISTVERSION"     调出版本OPTION="LOADVERSION"   <参考技术文档>
  StatusMsg(iweboffice.Status);
}

//作用：保存版本
function WebSaveVersion(){
  iweboffice.WebSaveVersion();  	//交互OfficeServer的OPTION="SAVEVERSION"
  StatusMsg(iweboffice.Status);

}

//作用：保存当前版本
function WebSaveVersionByFileID(){
  var mText=window.prompt("请输入版本说明:","版本号:V");
  if (mText==null){
     mText="已修改版本.";
  }
  iweboffice.WebSaveVersionByFileID(mText);  	//交互OfficeServer的OPTION="SAVEVERSION"  同时带FileID值   <参考技术文档>
  StatusMsg(iweboffice.Status);
}


//作用：填充模板
function LoadBookmarks(){
  StatusMsg("正在填充模扳...");
  if (!iweboffice.WebLoadBookmarks()){  	//交互OfficeServer的OPTION="LOADBOOKMARKS"
     StatusMsg(iweboffice.Status);
  }else{
     StatusMsg(iweboffice.Status);
  }
}

//作用：标签管理
function WebOpenBookMarks(){
  try{
    iweboffice.WebOpenBookmarks();  	//交互OfficeServer的OPTION="LISTBOOKMARKS"
    StatusMsg(iweboffice.Status);
  }catch(e){alert(e.message);}
}

//作用：设置书签值  vbmName:标签名称，vbmValue:标签值   标签名称注意大小写
function SetBookmarks(vbmName,vbmValue){
  if (!iweboffice.WebSetBookmarks(vbmName,vbmValue)){
     StatusMsg(iweboffice.Status);
  }else{
     StatusMsg(iweboffice.Status);
  }
}

//作用：根据标签名称获取标签值  vbmName:标签名称
function GetBookmarks(vbmName){
  var vbmValue;
  vbmValue=iweboffice.WebGetBookmarks(vbmName);
  return vbmValue;
}

//作用：打印文档
function WebOpenPrint(){
  try{
    iweboffice.WebOpenPrint();
    StatusMsg(iweboffice.Status);
  }catch(e){alert(e.message);}
}


//作用：页面设置
function WebOpenPageSetup(){
   try{
	if (iweboffice.FileType==".doc"){
	  iweboffice.WebObject.Application.Dialogs(178).Show();
	}
	if(iweboffice.FileType==".xls"){
	  iweboffice.WebObject.Application.Dialogs(7).Show();
	}
   }catch(e){alert(e.message);}
}

//作用：插入图片
function WebOpenPicture(){
  try{
    iweboffice.WebOpenPicture();
    StatusMsg(iweboffice.Status);
  }catch(e){alert(e.message);}
}

//作用：签名印章
function WebOpenSignature(){
  alert("如果你要更安全签章,建议采用金格iSignature电子签章软件进行签章:\r\n下载地址http://www.goldgrid.cn/iSignature/Download.asp\r\n\r\n该软件是支持文档完整性保护、CA证书和数字签名技术的,\r\n是通过了<国家公安部和国家保密局>双重认证的安全电子签章产品!");
  try{
    iweboffice.WebOpenSignature();  	//交互OfficeServer的 A签章列表OPTION="LOADMARKLIST"    B签章调出OPTION="LOADMARKIMAGE"    C确定签章OPTION="SAVESIGNATURE"    <参考技术文档>
    StatusMsg(iweboffice.Status);
  }catch(e){alert(e.message);}
}

//作用：验证印章A
function WebShowSignature(){
  try{
    iweboffice.WebShowSignature();  	//交互OfficeServer的OPTION="LOADSIGNATURE"
    StatusMsg(iweboffice.Status);
  }catch(e){alert(e.message);}
}

//作用：验证印章B
function WebCheckSignature(){
  try{
    var i=iweboffice.WebCheckSignature();  	//交互OfficeServer的OPTION="LOADSIGNATURE"
    alert("检测结果："+i+"\r\n 注释: (=-1 有非法印章) (=0 没有任何印章) (>=1 有多个合法印章)");
    StatusMsg(i);
  }catch(e){alert(e.message);}
}

//作用：存为本地文件
function WebSaveLocal(){
  try{
    iweboffice.WebSaveLocal();
    StatusMsg(iweboffice.Status);
  }catch(e){alert(e.message);}
}

//作用：打开本地文件
function WebOpenLocal(){
  try{
    iweboffice.WebOpenLocal();
    StatusMsg(iweboffice.Status);
  }catch(e){alert(e.message);}
}

//作用：保存为HTML文档
function WebSaveAsHtml(){
  try{
    if (iweboffice.WebSaveAsHtml())  	//交互OfficeServer的OPTION="SAVEASHTML"
    {
      webform.HTMLPath.value="<%=contentPath%><%=mRecordID%>.html";
      //window.open("<%=mHttpUrl%>"+ webform.HTMLPath.value);
    }
    StatusMsg(iweboffice.Status);
  }catch(e){alert(e.message);}
}


//作用：保存为文档图片
function WebSaveAsPage(){
  try{
    if (iweboffice.WebSaveImage())  	//交互OfficeServer的OPTION="SAVEIMAGE"
    {
      webform.HTMLPath.value="<%=contentPath%><%=mRecordID%>.html";
      //window.open("<%=mHttpUrl%>"+ webform.HTMLPath.value);
    }
    StatusMsg(iweboffice.Status);
  }catch(e){alert(e.message);}
}


//作用：关闭或显示工具 参数1表示工具条名称  参数2为false时，表示关闭  （名称均可查找VBA帮助）
//参数2为true时，表示显示
function WebToolsVisible(ToolName,Visible){
  try{
    iweboffice.WebToolsVisible(ToolName,Visible);
    StatusMsg(iweboffice.Status);
  }catch(e){alert(e.message);}
}


//作用：禁止或启用工具 参数1表示工具条名称  参数2表示工具条铵钮的编号  （名称和编号均可查找VBA帮助）
//参数3为false时，表示禁止  参数3为true时，表示启用
function WebToolsEnable(ToolName,ToolIndex,Enable){
  try{
    iweboffice.WebToolsEnable(ToolName,ToolIndex,Enable);
    StatusMsg(iweboffice.Status);
  }catch(e){alert(e.message);}
}

//作用：保护与解除  参数1为true表示保护文档  false表示解除保护
function WebProtect(value){
  try{
    iweboffice.WebSetProtect(value,"");  //""表示密码为空
  }catch(e){alert(e.message);}
}

//作用：允许与禁止拷贝功能  参数1为true表示允许拷贝  false表示禁止拷贝
function WebEnableCopy(value){
  try{
    iweboffice.CopyType=value;
  }catch(e){alert(e.message);}
}


//作用：插入远程服务器图片
function WebInsertImage(){
  try{
    iweboffice.WebInsertImage('Image','GoldgridLogo.jpg',true,4);   //交互OfficeServer的OPTION="INSERTIMAGE"  参数1表示标签名称  参数2表示图片文件名  参数3为true透明  false表示不透明  参数4为4表示浮于文字上方  5表示衬于文字下方
    StatusMsg(iweboffice.Status);
  }catch(e){alert(e.message);}
}


//作用：下载服务器文件到本地
function WebGetFile(){
  if (iweboffice.WebGetFile("c:\\WebGetFile.doc","DownLoad.doc")){   //交互OfficeServer的OPTION="GETFILE"  参数1表示本地路径  参数2表示服务器文件名称
    StatusMsg(iweboffice.Status);
  }else{
    StatusMsg(iweboffice.Status);
  }
  alert(iweboffice.Status+"\r\n"+"文件放在c:\\WebGetFile.doc");
}


//作用：上传本地文件到服务器
function WebPutFile(){
  var mLocalFile=iweboffice.WebOpenLocalDialog();
  if (mLocalFile!=""){
    alert(mLocalFile);
    if (iweboffice.WebPutFile(mLocalFile,"Test.doc")){   //交互OfficeServer的OPTION="PUTFILE"  参数1表示本地路径，可以任何格式文件  参数2表示服务器文件名称
      StatusMsg(iweboffice.Status);
    }else{
      StatusMsg(iweboffice.Status);
    }
    alert(iweboffice.Status);
  }
}


//作用：打开远程文件
function WebDownLoadFile(){
  mResult=iweboffice.WebDownLoadFile("http://www.goldgrid.com/Images/abc.doc","c:\\abc.doc");
  if (mResult){
    iweboffice.WebOpenLocalFile("c:\\abc.doc");
    alert("成功");
  }else{
    alert("失败");
  }
}

//作用：取得服务器端时间，设置本地时间  [V6.0.1.5以上支持]
function WebDateTime(){
  mResult=iweboffice.WebDateTime(true);   //交互OfficeServer的OPTION="DATETIME"   true表示返回并设置本地时间为服务器时间；false表示仅返回服务器时间
  alert("提示：已经设置本地时间为 "+mResult);    //该功能主要用于在痕迹保留时读取服务器时间
}


//作用：表格生成及填充
function WebSetWordTable(){
  var mText="",mName="",iColumns,iCells,iTable;
  //设置COMMAND为WORDTABLE
  iweboffice.WebSetMsgByName("COMMAND","WORDTABLE");   //设置变量COMMAND="WORDTABLE"，在WebSendMessage()时，一起提交到OfficeServer中
  //发送到服务器上
  //如果没有错误
  if (iweboffice.WebSendMessage()){                //交互OfficeServer的OPTION="SENDMESSAGE"
	iColumns = iweboffice.WebGetMsgByName("COLUMNS");  //取得列
	iCells = iweboffice.WebGetMsgByName("CELLS");      //取得行
	iTable=iweboffice.WebObject.Tables.Add(iweboffice.WebObject.Application.Selection.Range,iCells,iColumns);   //生成表格
	for (var i=1; i<=iColumns; i++)
	{
   	  for (var j=1; j<=iCells; j++)
	  {
		mName=i.toString()+j.toString();
		mText=iweboffice.WebGetMsgByName(mName);	 //取得OfficeServer中的表格内容
		iTable.Columns(i).Cells(j).Range.Text=mText;   	//填充单元值
	   }
	}
   }
   StatusMsg(iweboffice.Status);
}


//作用：获取文档Txt正文
function WebGetWordContent(){
  try{
   return iweboffice.WebObject.Content.Text;
  }catch(e){alert(e.message);}
}

//作用：写Word内容
function WebSetWordContent(){
  var mText=window.prompt("请输入内容:","测试内容");
  if (mText==null){
     return (false);
  }
  else
  {
     //下面为显示选中的文本
     //alert(iweboffice.WebObject.Application.Selection.Range.Text);
     //下面为在当前光标出插入文本
     iweboffice.WebObject.Application.Selection.Range.Text= mText+"\n";
     //下面为在第一段后插入文本
     //iweboffice.WebObject.Application.ActiveDocument.Range(1).Text=(mText);
  }
}


//作用：打印黑白文档
function WebWordPrintBlackAndWhile(){
   var i,n;

   //图片变黑白
   i=0;
   n=iweboffice.WebObject.Shapes.Count;
   for (var i=1; i<=n; i++)
   {
      iweboffice.WebObject.Shapes.Item(i).PictureFormat.ColorType=3;
   }
   i=0;
   n=iweboffice.WebObject.InlineShapes.Count;
   for (var i=1; i<=n; i++)
   {
      iweboffice.WebObject.InlineShapes.Item(i).PictureFormat.ColorType=3;
   }

   //文字变黑白
   iweboffice.WebObject.Application.Selection.WholeStory();
   iweboffice.WebObject.Application.Selection.Range.Font.Color = 0;
}

//作用：用Excel求和
function WebGetExcelContent(){
    iweboffice.WebObject.Application.Sheets(1).Select;
    iweboffice.WebObject.Application.Range("C5").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "126";
    iweboffice.WebObject.Application.Range("C6").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "446";
    iweboffice.WebObject.Application.Range("C7").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "556";
    iweboffice.WebObject.Application.Range("C5:C8").Select;
    iweboffice.WebObject.Application.Range("C8").Activate;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "=SUM(R[-3]C:R[-1]C)";
    iweboffice.WebObject.Application.Range("D8").Select;
    alert(iweboffice.WebObject.Application.Range("C8").Text);
}


//作用：保护工作表单元
function WebSheetsLock(){
    iweboffice.WebObject.Application.Sheets(1).Select;

    iweboffice.WebObject.Application.Range("A1").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "产品";
    iweboffice.WebObject.Application.Range("B1").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "价格";
    iweboffice.WebObject.Application.Range("C1").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "详细说明";
    iweboffice.WebObject.Application.Range("D1").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "库存";
    iweboffice.WebObject.Application.Range("A2").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "书签";
    iweboffice.WebObject.Application.Range("A3").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "毛笔";
    iweboffice.WebObject.Application.Range("A4").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "钢笔";
    iweboffice.WebObject.Application.Range("A5").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "尺子";

    iweboffice.WebObject.Application.Range("B2").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "0.5";
    iweboffice.WebObject.Application.Range("C2").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "樱花";
    iweboffice.WebObject.Application.Range("D2").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "300";

    iweboffice.WebObject.Application.Range("B3").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "2";
    iweboffice.WebObject.Application.Range("C3").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "狼毫";
    iweboffice.WebObject.Application.Range("D3").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "50";

    iweboffice.WebObject.Application.Range("B4").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "3";
    iweboffice.WebObject.Application.Range("C4").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "蓝色";
    iweboffice.WebObject.Application.Range("D4").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "90";

    iweboffice.WebObject.Application.Range("B5").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "1";
    iweboffice.WebObject.Application.Range("C5").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "20cm";
    iweboffice.WebObject.Application.Range("D5").Select;
    iweboffice.WebObject.Application.ActiveCell.FormulaR1C1 = "40";

    //保护工作表
    iweboffice.WebObject.Application.Range("B2:D5").Select;
    iweboffice.WebObject.Application.Selection.Locked = false;
    iweboffice.WebObject.Application.Selection.FormulaHidden = false;
    iweboffice.WebObject.Application.ActiveSheet.Protect(true,true,true);

    alert("已经保护工作表，只有B2-D5单元格可以修改。");
}

//作用：VBA套红
function WebInsertVBA(){

	//画线
	var object=iweboffice.WebObject;
	var myl=object.Shapes.AddLine(100,60,305,60)
	myl.Line.ForeColor=255;
	myl.Line.Weight=2;
	var myl1=object.Shapes.AddLine(326,60,520,60)
	myl1.Line.ForeColor=255;
	myl1.Line.Weight=2;

	//object.Shapes.AddLine(200,200,450,200).Line.ForeColor=6;
   	var myRange=iweboffice.WebObject.Range(0,0);
	myRange.Select();

	var mtext="★";
	iweboffice.WebObject.Application.Selection.Range.InsertAfter (mtext+"\n");
   	var myRange=iweboffice.WebObject.Paragraphs(1).Range;
   	myRange.ParagraphFormat.LineSpacingRule =1.5;
   	myRange.font.ColorIndex=6;
   	myRange.ParagraphFormat.Alignment=1;
   	myRange=iweboffice.WebObject.Range(0,0);
	myRange.Select();
	mtext="金格发[２０１２]１５４号";
	iweboffice.WebObject.Application.Selection.Range.InsertAfter (mtext+"\n");
	myRange=iweboffice.WebObject.Paragraphs(1).Range;
	myRange.ParagraphFormat.LineSpacingRule =1.5;
	myRange.ParagraphFormat.Alignment=1;
	myRange.font.ColorIndex=1;

	mtext="金格电子政务文件";
	iweboffice.WebObject.Application.Selection.Range.InsertAfter (mtext+"\n");
	myRange=iweboffice.WebObject.Paragraphs(1).Range;
	myRange.ParagraphFormat.LineSpacingRule =1.5;

	//myRange.Select();
	myRange.Font.ColorIndex=6;
	myRange.Font.Name="仿宋_GB2312";
	myRange.font.Bold=true;
	myRange.Font.Size=50;
	myRange.ParagraphFormat.Alignment=1;

	//myRange=myRange=iweboffice.WebObject.Paragraphs(1).Range;
	iweboffice.WebObject.PageSetup.LeftMargin=70;
	iweboffice.WebObject.PageSetup.RightMargin=70;
	iweboffice.WebObject.PageSetup.TopMargin=70;
	iweboffice.WebObject.PageSetup.BottomMargin=70;
}

//作用：模版套红功能
function WebUseTemplate(){
  var mDialogUrl = "Template/TemplateForm.htm";
  var mObject = new Object();
  mObject.Template = "";
  window.showModalDialog(mDialogUrl, mObject, "dialogHeight:200px; dialogWidth:360px;center:yes;scroll:no;status:no;");

  //判断用户是否选择模板
  if (mObject.Template==""){
    StatusMsg("取消套用模板");
    return false;
  }else{
    if(WebAcceptAllRevisions()==false){                         //清除正文痕迹的目的是为了避免痕迹状态下出现内容异常问题。
      StatusMsg("清除正文痕迹失败，套红中止");
      return false;      
    }
    SaveDocument();                                             //保存当前编辑的文档
    iweboffice.WebSetMsgByName("COMMAND","INSERTFILE");  //设置变量COMMAND="INSERTFILE"，在WebLoadTemplate()时，一起提交到OfficeServer中     <参考技术文档>
    iweboffice.Template=mObject.Template;                //全局变量Template赋值，此示例读取服务器目录中模板，如读取数据库中模板，Template值为数据库中的模板编号，则上句代码不需要，如Template="1050560363767"，模板名称为“Word公文模板”，注：模板中有要标签Content，区分大小写，可以自行修改
    iweboffice.EditType="1";                             //控制为不保留痕迹的状态
    if (iweboffice.WebLoadTemplate()){                   //交互OfficeServer的OPTION="LOADTEMPLATE"
      //SetBookmarks("Title","关于中间件研发工作会议通知");     //填充模板其它基本信息，如标题，主题词，文号，主送机关等
      if (iweboffice.WebInsertFile()){                   //填充公文正文   交互OfficeServer的OPTION="INSERTFILE"
        StatusMsg("模板套红成功");
        return true;
      }else{
        StatusMsg(iweboffice.Status);
        return false;
      }
    }else{
      StatusMsg(iweboffice.Status);
      return false;
    }
  }
}

//作用：保存定稿文件
function WebUpdateFile(){
  if (iweboffice.WebUpdateFile()){                //交互OfficeServer的OPTION="UPDATEFILE"，类似WebSave()或WebSaveVersion()方法
     StatusMsg(iweboffice.Status);
  }else{
     StatusMsg(iweboffice.Status);
  }
}



//打印份数控制
function WebCopysCtrlPrint(){
  var mCopies,objPrint;
  objPrint = iweboffice.WebObject.Application.Dialogs(88);     //打印设置对话框
  if (objPrint.Display==-1){
    mCopies=objPrint.NumCopies;    //取得需要打印份数
    iweboffice.WebSetMsgByName("COMMAND","COPIES");
    iweboffice.WebSetMsgByName("OFFICEPRINTS",mCopies.toString());   //设置变量OFFICEPRINTS的值，在WebSendMessage()时，一起提交到OfficeServer中
    iweboffice.WebSendMessage();                               //交互OfficeServer的OPTION="SENDMESSAGE"
    if (iweboffice.Status=="1") {
      alert("可以允许打印，注：该实例设置总文档打印份数2份");
      objPrint.Execute;
    }else{
      alert("已超出允许的打印份数");
      return false;
    }
  }
}


//作用：导入Text
function WebInportText(){
    var mText;
    iweboffice.WebSetMsgByName("COMMAND","INPORTTEXT");  //设置变量COMMAND="INPORTTEXT"，在WebSendMessage()时，一起提交到OfficeServer中
    if (iweboffice.WebSendMessage()){                    //交互OfficeServer的OPTION="SENDMESSAGE"
      mText=iweboffice.WebGetMsgByName("CONTENT");       //取得OfficeServer传递的变量CONTENT值
      iweboffice.WebObject.Application.Selection.Range.Text=mText;
      alert("导入文本成功");
    }
    StatusMsg(iweboffice.Status);
}


//作用：导出Text
function WebExportText(){
    var mText=iweboffice.WebObject.Content.Text;
    iweboffice.WebSetMsgByName("COMMAND","EXPORTTEXT");  //设置变量COMMAND="EXPORTTEXT"，在WebSendMessage()时，一起提交到OfficeServer中
    iweboffice.WebSetMsgByName("CONTENT",mText);         //设置变量CONTENT="mText"，在WebSendMessage()时，一起提交到OfficeServer中，可用于实现全文检索功能，对WORD的TEXT内容进行检索
    if (iweboffice.WebSendMessage()){                    //交互OfficeServer的OPTION="SENDMESSAGE"
      alert("导出文本成功");
    }
    StatusMsg(iweboffice.Status);
}


//作用：获取文档页数
function WebDocumentPageCount(){
  var intPageTotal = iweboffice.WebObject.Application.ActiveDocument.BuiltInDocumentProperties(14);
  alert("文档页总数："+intPageTotal);
}

//作用：签章锁定文件功能
function WebSignatureAtReadonly(){
  iweboffice.WebSetProtect(false,"");                  //解除文档保护
  iweboffice.WebSetRevision(false,false,false,false);  //设置文档痕迹保留的状态  参数1:不显示痕迹  参数2:不保留痕迹  参数3:不打印时有痕迹  参数4:不显痕迹处理工具
  try{
    iweboffice.WebOpenSignature();                     //交互OfficeServer的 A签章列表OPTION="LOADMARKLIST"    B签章调出OPTION="LOADMARKIMAGE"    C确定签章OPTION="SAVESIGNATURE"    <参考技术文档>    文档中要定义标签Manager，可以自行修改标签名称
    StatusMsg(iweboffice.Status);
  }catch(e){alert(e.message);}
  iweboffice.WebSetProtect(true,"");                   //锁定文档
}

//作用：客户端和服务器端信息信息交互
function WebSendInformation(){
  var info = window.prompt("请输入要传到服务器处理页面上的内容:","参数内容");
  if (info==null){return false}

  iweboffice.WebSetMsgByName("COMMAND","SELFINFO");		//设置变量COMMAND="SELFINFO"，用来在服务器端做判断，以进入处理自定义参数传递的代码。
  iweboffice.WebSetMsgByName("TESTINFO",info);			//自定义的一个参数"TESTINFO"，将info变量的信息设置到信息包中，以便传到后台。
  if (iweboffice.WebSendMessage()){						//向后台发信息包。交互OfficeServer的OPTION="SENDMESSAGE"。
    info = iweboffice.WebGetMsgByName("RETURNINFO");		//如果交互成功，接受服务器端返回的信息。
	alert(info);
  }
  else{
    StatusMsg(iweboffice.Status);
  }
}

//判断编辑器
function GetEditer(){
  if(iweboffice.WebApplication(".doc")){     //WORD
    alert("存在WORD编辑器");
  }
  if(iweboffice.WebApplication(".xls")){     //EXCEL
    alert("存在EXCEL编辑器");
  }
  if(iweboffice.WebApplication(".wps")){     //金山WPS
    alert("存在WPS编辑器");
  }
  if(iweboffice.WebApplication(".et")){      //金山表格
    alert("存在ET编辑器");
  }
  //参数还可以是".ppt"、".vso"......
}

//设置OFFICE2007的选项卡显示
function WebSetRibbonUIXML(){
  iweboffice.RibbonUIXML = '' +
  '<customUI xmlns="http://schemas.microsoft.com/office/2006/01/customui">' +
  '  <ribbon startFromScratch="false">'+                    //不显示所有选项卡控制 false显示选项卡；true不显示选项卡
  '    <tabs>'+
  '      <tab idMso="TabReviewWord" visible="false">' +     //关闭视图工具栏
  '      </tab>'+
  '      <tab idMso="TabInsert" visible="false">' +         //关闭插入工具栏
  '      </tab>'+
  '      <tab idMso="TabHome" visible="false">' +           //关闭开始工具栏
  '      </tab>'+
  '    </tabs>' +
  '  </ribbon>' +
  '</customUI>';

/*
    最常用的内置选项卡名称
    选项卡名称      idMso（Excel）      idMso（Word）       idMso（Access）
    开始            TabHome             TabHome             TabHomeAccess
    插入            TabInsert           TabInsert           （none）
    页面布局        TabPageLayoutExcel  TabPageLayoutWord   （none）
    公式            TabFormulas         （none）            （none）
    数据            TabData             （none）            （none）
    视图            TabReview           TabReviewWord       （none）
    创建            （none）            （none）            TabCreate
    外部数据        （none）            （none）            TabExternalData
    数据库工具      （none）            （none）            TabDatabaseTools
*/

/*
    iWebOffice控件的RibbonUIXML属性，是基于OFFICE2007的RibbonX的应用。关于RibbonX的相关资料，需要自己另行查询。
*/
}

//读取注册表（十进制）
function WebReadRegString(){
  try{
    iweboffice.WebOpenKey('HKEY_CURRENT_USER', 'Software\\Microsoft\\Office\\12.0\\Common\\Toolbars');    //打开注册表
    var Content = iweboffice.WebReadString('AddNewString');                                          //读取注册表
    iweboffice.WebCloseKey();                                                                        //关闭注册表
    alert(Content);
  }
  catch(e){
    alert(e.message);
    iweboffice.WebCloseKey();
  } 
} 

//写入注册表（十进制）
function WebWriteRegString(){
  try{
    iweboffice.WebOpenKey('HKEY_CURRENT_USER', 'Software\\Microsoft\\Office\\12.0\\Common\\Toolbars');    //打开注册表
    var result = iweboffice.WebWriteString('AddNewString','1234');                                   //写入注册表
    iweboffice.WebCloseKey();                                                                        //关闭注册表
    if (result) {
      alert("写入注册表成功！");
    }else{
      alert("写入注册表失败！");
    }
  }
  catch(e){
    alert("写入注册表失败！原因："+e.message);
    iweboffice.WebCloseKey();
  } 
} 

//读取注册表（十六进制）
function WebReadRegInteger(){
  try{
    iweboffice.WebOpenKey('HKEY_CURRENT_USER', 'Software\\Microsoft\\Office\\12.0\\Common\\Toolbars');    //打开注册表
    var Content = iweboffice.WebReadInteger('AddNewInteger');                                        //读取注册表
    iweboffice.WebCloseKey();                                                                        //关闭注册表
    alert(Content);
  }
  catch(e){
    alert(e.message);
    iweboffice.WebCloseKey();
  } 
}

//写入注册表（十六进制）
function WebWriteRegInteger(){
  try{
    iweboffice.WebOpenKey('HKEY_CURRENT_USER', 'Software\\Microsoft\\Office\\12.0\\Common\\Toolbars');    //打开注册表
    var result = iweboffice.WebWriteInteger('AddNewInteger',5678);                                   //写入注册表
    iweboffice.WebCloseKey();                                                                        //关闭注册表
    if (result) {
      alert("写入注册表成功！");
    }else{
      alert("写入注册表失败！");
    }
  }
  catch(e){
    alert(e.message);
    iweboffice.WebCloseKey();
  } 
} 

//接受文档中全部痕迹
function WebAcceptAllRevisions(){
  iweboffice.WebObject.Application.ActiveDocument.AcceptAllRevisions();
  var mCount = iweboffice.WebObject.Application.ActiveDocument.Revisions.Count;
  if(mCount>0){
    return false;
  }else{
    return true;
  }
}

//打开的服务器上的文档并修复
function WebOpenAndRepair(){
  iweboffice.WebRepairMode = true;   //打开修复模式
  iweboffice.WebOpen();              //重调刚才打开的服务器上的文档
  StatusMsg(iweboffice.Status);
  iweboffice.WebRepairMode = false;  //关闭修复模式
}

//打开本机上的文档并修复
function WebOpenLocalAndRepair(){
  iweboffice.WebRepairMode = true;   //打开修复模式
  iweboffice.WebOpenLocal();         //打开本机上的文档
  StatusMsg(iweboffice.Status);
  iweboffice.WebRepairMode = false;  //关闭修复模式
}
</script>