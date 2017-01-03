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
	  config.height = document.body.clientHeight-240; //高度 
	 // config.skin = 'v2'; //编辑器皮肤样式 
	 // 取消 “拖拽以改变尺寸”功能 
	 // config.resize_enabled = false; 
	 // 使用基础工具栏 
	 // config.toolbar = "Basic"; 
	 // 使用全能工具栏 
	 config.toolbar = "Full"; 
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
	 config.filebrowserBrowseUrl = 'ckfinder/ckfinder.html',
	 config.filebrowserImageBrowseUrl = 'ckfinder/ckfinder.html?type=Images',
	 config.filebrowserFlashBrowseUrl = 'ckfinder/ckfinder.html?type=Flash',
	 config.filebrowserUploadUrl = 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
	 config.filebrowserImageUploadUrl = 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
	 config.filebrowserFlashUploadUrl = 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash',
	 config.filebrowserWindowWidth = '1000',
	 config.filebrowserWindowHeight = '700'
};
