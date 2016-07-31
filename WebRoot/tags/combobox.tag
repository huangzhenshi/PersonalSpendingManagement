<%@ attribute name="id" %><%@ attribute name="onClick" %><%@ attribute name="autoWidth" type="java.lang.Boolean"%><%@ attribute name="showOnFocus" type="java.lang.Boolean"%><%@ attribute name="style" %><%@ attribute name="buttons" %><%@ attribute name="labelField" %><%@ attribute name="iframePanel" type="java.lang.Boolean" %><%@ attribute name="starBefore" type="java.lang.Boolean" %><%@ attribute name="enableSearch" type="java.lang.Boolean" %><%@ attribute name="enablePinyin" type="java.lang.Boolean" %><%@ attribute name="enableHighlight" type="java.lang.Boolean" %><%@ attribute name="placeholder" %><%@ attribute name="name" %><%@ attribute name="cls" %><%@ attribute name="componentCls" %><%@ attribute name="panelComponentCls" %><%@ attribute name="forceSelection" type="java.lang.Boolean" %><%@ attribute name="rendered" type="java.lang.Boolean" %><%@ attribute name="authorized" %><%@ attribute name="readonlyInput" type="java.lang.Boolean" %><%@ attribute name="formatter" %><%@ attribute name="itemattr" %><%@ attribute name="onShowPanel" %><%@ attribute name="onHidePanel" %><%@ attribute name="panelRenderOnShow" type="java.lang.Boolean" %><%@ attribute name="readonly" type="java.lang.Boolean" %><%@ attribute name="required" type="java.lang.Boolean" %><%@ attribute name="showStar" type="java.lang.Boolean"%><%@ attribute name="showRequiredMark"%><%@ attribute name="hideRequiredMark"%><%@ attribute name="errMsg" %><%@ attribute name="errMsgPosition" %><%@ attribute name="valueField" %><%@ attribute name="textField" %><%@ attribute name="width" type="java.lang.Integer" %><%@ attribute name="height" type="java.lang.Integer" %><%@ attribute name="panelWidth" type="java.lang.Integer" %><%@ attribute name="maxPanelHeight" type="java.lang.String" %><%@ attribute name="panelHeight" type="java.lang.String" %><%@ attribute name="multiple" type="java.lang.Boolean" %><%@ attribute name="separator" %><%@ attribute name="editable" type="java.lang.Boolean" %><%@ attribute name="isLabel" type="java.lang.Boolean" %><%@ attribute name="hasArrow" type="java.lang.Boolean" %><%@ attribute name="disabled" type="java.lang.Boolean" %><%@ attribute name="hasDownArrow" type="java.lang.Boolean" %><%@ attribute name="value" %><%@ attribute name="emptyText" %><%@ attribute name="showClose" type="java.lang.Boolean" %><%@ attribute name="showDirection"%><%@ attribute name="enableFilter" type="java.lang.Boolean" %><%@ attribute name="delay" type="java.lang.Integer" %><%@ attribute name="url" %><%@ attribute name="method" %><%@ attribute name="postMode" %><%@ attribute name="data" %><%@ attribute name="onValidError" %><%@ attribute name="onValidSuccess" %><%@ attribute name="onCreate" type="java.lang.String" %><%@ attribute name="onChange" type="java.lang.String" %><%@ attribute name="onLoad" type="java.lang.String" %><%@ attribute name="beforeSelect" %><%@ attribute name="onKeyUp" %><%@ attribute name="onKeyDown" %><%@ attribute name="onUnSelect" %><%@ attribute name="onSelect" type="java.lang.String" %><%@ attribute name="triggers"%><%@ attribute name="excluded" type="java.lang.Boolean"%><%@ attribute name="onBlur" type="java.lang.Boolean"%><%@ include file="TagUtil.jsp" %><% 
id = tagUtil.getClientId( id );
String dataOption = tagUtil.add("name", name)
.add("id", id)
.add("cls", cls)
.add("onClick",onClick)
.add("showOnFocus",showOnFocus)
.add("triggers", triggers)
.add("excluded", excluded)
.add("buttons",buttons)
.add("autoWidth",autoWidth)
.add("iframePanel",iframePanel)
.add("labelField", labelField)
.add("starBefore", starBefore)
.add("enableSearch", enableSearch)
.add("enablePinyin", enablePinyin)
.add("enableHighlight", enableHighlight)
.add("componentCls", componentCls)
.add("panelComponentCls", panelComponentCls)
.add("forceSelection", forceSelection)
.add("rendered", rendered).add("authorized", authorized)
.add("onShowPanel", onShowPanel)
.add("onHidePanel", onHidePanel)
.add("formatter", formatter)
.add("itemattr", itemattr)
.add("panelRenderOnShow", panelRenderOnShow)
.add("required", required)
.add("showStar", showStar).add("showRequiredMark", showRequiredMark).add("hideRequiredMark", hideRequiredMark)
.add("errMsg", errMsg)
.add("errMsgPosition", errMsgPosition)
.add("valueField", valueField)
.add("textField", textField)
.add("height", height)
.add("width", width)
.add("panelWidth", panelWidth)
.add("placeholder", placeholder)
.add("maxPanelHeight", maxPanelHeight)
.add("panelHeight", panelHeight)
.add("multiple", multiple)
.add("separator", separator)
.add("editable", editable)
.add("readonlyInput", readonlyInput)
.add("readonly", readonly)
.add("disabled", disabled)
.add("isLabel", isLabel)
.add("hasArrow", hasArrow)
.add("hasDownArrow", hasDownArrow)
.add("value", value)
.add("emptyText", emptyText)
.add("showClose", showClose)
.add("showDirection", showDirection)
.add("enableFilter", enableFilter)
.add("delay", delay)
.add("url", url)
.add("method", method)
.add("postMode", postMode)
.add("data", data)

.add("onCreate", onCreate)
.add("onBlur", onBlur)
.add("onValidSuccess", onValidSuccess)
.add("onValidError", onValidError)
.add("onChange", onChange)
.add("onLoad", onLoad)
.add("beforeSelect", beforeSelect)
.add("onKeyUp", onKeyUp)
.add("onKeyDown", onKeyDown)
.add("onUnSelect", onUnSelect)
.add("onSelect", onSelect).toString();
%><input id="<%=id %>" class="<%=cls==null?"":cls%>" style="<%=style==null?"":style%>" data-options="<%=dataOption %>" ><jsp:doBody/>
<script <%= "id=" + id + "_s" %>>
Coral.cc("combobox", "<%= id%>");
</script>