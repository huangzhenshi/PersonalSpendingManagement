<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String headerForCUI = request.getContextPath()+"/res";
	//String headerForCUI = "http://192.10.33.120:8080/Coral4.0/";
	String version = "4.0.2";
	String themeFolder = "base";//null == (String)session.getAttribute("theme") ? "base" : (String)session.getAttribute("theme");
	String min="min.";
	String minFolder="mini/";
%>
<%--
<link href="<%=headerForCUI %>/jquery-cui/<%=version%>/dev/themes/<%=themeFolder %>/cui.all.css" rel="stylesheet"/>
<script src="<%=headerForCUI %>/jquery-cui/<%=version %>/js/jquery.coral.js" type="text/javascript"></script>
<script src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/jquery.coral.layout.js"/></script>
--%>
<link href="<%=headerForCUI %>/icon-font/style.css" rel="stylesheet"/>
<link href="<%=headerForCUI %>/jquery-cui/<%=version %>/css/jquery.coral.css" rel="stylesheet"/>
<!-- common resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery-1.9.1.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.core.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.component.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.parser.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.validate.<%=min %>js"></script>

<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.mouse.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.sortable.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.draggable.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.droppable.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.resizable.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.selectable.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.position.<%=min %>js"></script>

<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.control.<%=min %>js"></script>

<!-- grid resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.grid.locale-cn.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.grid.common.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.grid.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.grid.celledit.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.grid.inlinedit.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.fmatter.<%=min %>js"></script>

<!-- textbox resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.textbox.<%=min %>js"></script>

<!-- toolbar resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.toolbar.<%=min %>js"></script>

<!-- button resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.button.<%=min %>js"></script>

<!-- splitbutton resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.splitbutton.<%=min %>js"></script>

<!-- menubutton resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.menubutton.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.treebutton.<%=min %>js"></script>

<!-- subfield resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.subfield.<%=min %>js"></script>

<!-- combo resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.panel.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.combo.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.combobox.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.combotree.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.combogrid.<%=min %>js"></script>
<!-- datepicker resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.datepicker.<%=min %>js"></script>
<!-- checkbox resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.checkbox.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.checkboxlist.<%=min %>js"></script>
<!-- radio resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.radio.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.radiolist.<%=min %>js"></script>

<!-- progressbar resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.progressbar.<%=min %>js"></script>

<!-- accordion resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.accordion.<%=min %>js"></script>

<!-- dialog resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.dialog.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.messager.<%=min %>js"></script>

<!-- form resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.form.<%=min %>js"></script>

<!-- tabs resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.tabs.<%=min %>js"></script>

<!-- tree resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.tree.<%=min %>js"></script>

<!-- layout resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.layout.<%=min %>js"></script>

<!-- menu resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.menu.<%=min %>js"></script>

<!-- easing resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.easing.<%=min %>js"></script>

<!-- uploadify resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.uploadify.<%=min %>js"></script>

<!-- uploader resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.uploader.<%=min %>js"></script>

<!-- tooltip resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.tooltip.<%=min %>js"></script>

<script type="text/javascript" src="<%=headerForCUI %>/thirdParty/cesupload/js/swfobject.js"></script>
<!-- spinner resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.spinner.<%=min %>js"></script>
<!-- slider resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.slider.<%=min %>js"></script>

<!-- autocomplete resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.autocomplete.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.autocompletetree.<%=min %>js"></script>
<!-- pinyin resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.pinyinData.<%=min %>js"></script>
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.pinyinEngine.<%=min %>js"></script>
<!-- loading resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.coral.loading.<%=min %>js"></script>
<!-- config resources -->
<script type="text/javascript" src="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/ui/<%=minFolder %>jquery.config.<%=min %>js"></script>
<div id="linkCSS">
	<link href="<%=headerForCUI %>/jquery-cui/<%=version %>/dev/themes/<%=themeFolder %>/cui.theme.css" rel="stylesheet"/>
</div>


<script type="text/javascript" src="${ctx}/res/thirdParty/jquery.base64.js"></script>
<script type="text/javascript" src="${ctx }/res/resource/style/js/sessionCheck.js"></script>
<script type="text/javascript">
	var ctx = "${ctx}";
</script>