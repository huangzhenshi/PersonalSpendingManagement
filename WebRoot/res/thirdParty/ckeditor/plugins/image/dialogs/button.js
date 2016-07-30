var isAddButton = false;
function addUploadButton(basePath,uploadUrl){
	if(isAddButton)return;
	isAddButton = true;
	CKEDITOR.on('dialogDefinition', function( ev ){
		var dialogName = ev.data.name;
		var dialogDefinition = ev.data.definition;
		if ( dialogName == 'image' ){
			var infoTab = dialogDefinition.getContents( 'info' );
			infoTab.add({
				type : 'button',
				id : 'upload_image',
				style: "display:inline-block;margin-top:14px;",
				align : 'center',
				label : '选择文件',
				onClick : function( evt ){
					debugger;
					var thisDialog = this.getDialog();
					var txtUrlObj = thisDialog.getContentElement('info', 'txtUrl');
					var txtUrlId = txtUrlObj.getInputElement().$.id;
					addUploadImage(basePath,txtUrlId,uploadUrl);
				}
			}, 'browse'); //place front of the browser button
		}
	});
}

function addUploadImage(basePath,theURLElementId,uploadUrl){
	dialog(
			"#uploadFileDialogForCkeditor",
			{
				url:uploadUrl,
				width : 630,
				height:500,
				title : "上传"
				
			},
			{
				"确定" : function() {
					var data = uploadConfirm();
					var filePath = data.url;
					if(data.sourceType != "2"){//不是来源网络
						var as = data.uploadFiles;
						if(as != null && as.length>0){
							var fileObj = as[0];
							filePath = fileObj.filePath;
						}
					}
					if(filePath != ""){
						var showUrl = basePath+"/preview/"+filePath;
						var urlObj = document.getElementById(theURLElementId);
						urlObj.value = showUrl;
						if( urlObj.attachEvent ){
						    //为IE以及IE内核的浏览器（1）
							urlObj.fireEvent("onchange"); //触发url文本框的onchange事件，以便预览图片
						}else if( urlObj.addEventListener){
						     //为FF以及NS内核的浏览器（2）
							var e=document.createEvent("Events");
							e.initEvent("change",true,false);
							urlObj.dispatchEvent(e);
						 }
						
					}
					$(this).dialog("close");
				},
				"关闭" : function() {
					$(this).dialog("close");
				}
			}).dialog("open");
}
