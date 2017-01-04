/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	//配置默认配置 
	 config.language = 'zh-cn'; //配置语言 
	 // config.uiColor = '#FFF'; //背景颜色 
	  config.width =document.body.clientWidth-30; //宽度 
	  config.height = document.body.clientHeight-160; //高度 
	 // config.skin = 'v2'; //编辑器皮肤样式 
	 // 取消 “拖拽以改变尺寸”功能 
	 // config.resize_enabled = false; 
	 // 使用基础工具栏 
	 // config.toolbar = "Basic"; 
	 // 使用全能工具栏 
	//  config.toolbar = "Full"; 
	 
	  config.toolbar_Full =
		    [
		    ['Save','RemoveFormat'],
		    ['FontSize','Styles','Font','TextColor','BGColor'],
		    ['Maximize', 'Bold','Underline','Strike','-','Subscript','Superscript'],
		    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
		    ['Link','Unlink','Anchor'],
		    ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar','Format']
		    ];
	  config.smiley_images = ['1.gif','2.gif','3.gif','4.gif','5.gif','6.gif','7.gif','8.gif','9.gif','10.gif',
	                          '11.gif','12.gif','13.gif','14.gif','15.gif','16.gif','17.gif','18.gif','19.gif','20.gif',
	                          '21.gif','22.gif','23.gif','24.gif','25.gif','26.gif','27.gif','28.gif','29.gif','30.gif',
	                          '33.gif','36.gif','38.gif','44.gif','50.gif','64.gif','71.gif','72.gif','73.gif','74.gif','82.gif'
	                          ];
	 
	 
	 //使用自定义工具栏 
	 // config.toolbar = 
	 // [ 
	 // ['Source', 'Preview', '-'], 
	 // ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', ], 
	 // ['Undo', 'Redo', '-', 'Find', 'Replace', '-', 'SelectAll', 'RemoveFormat'], 
	 // ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', SpecialChar','PageBreak'], 
	 // '/', 
	 // ['Bold', 'Italic', 'Underline', '-', 'Subscript', 'Superscript'], 
	 // ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote'], 
	 // ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'], 
	 // ['Link', 'Unlink', 'Anchor'], 
	 // '/', 
	 // ['Format', 'Font', 'FontSize'], 
	 // ['TextColor', 'BGColor'], 
	 // ['Maximize', 'ShowBlocks', '-', 'About'] 
	 // ];
	 // 在 CKEditor 中集成 CKFinder，注意 ckfinder 的路径选择要正确。 
	 config.filebrowserBrowseUrl = '../ckfinder/ckfinder.html',
	 config.filebrowserImageBrowseUrl = '../ckfinder/ckfinder.html?type=Images',
	 config.filebrowserFlashBrowseUrl = '../ckfinder/ckfinder.html?type=Flash',
	 config.filebrowserUploadUrl = '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
	 config.filebrowserImageUploadUrl = '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
	 config.filebrowserFlashUploadUrl = '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash',
	 config.filebrowserWindowWidth = '1000',
	 config.filebrowserWindowHeight = '700'
};
