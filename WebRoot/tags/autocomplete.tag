<%@ tag language="java" pageEncoding="UTF-8"%><%@ attribute name="cls" %><%@ attribute name="maxLabelWidth" %><%@ attribute name="componentCls" %><%@ attribute name="rendered" type="java.lang.Boolean" %><%@ attribute name="authorized" %><%@ attribute name="multiple" type="java.lang.Boolean" %><%@ attribute name="multiLineLabel" type="java.lang.Boolean" %><%@ attribute name="requiredMsg"%><%@ attribute name="valid"%><%@ attribute name="validType"%><%@ attribute name="readonly" type="java.lang.Boolean"%><%@ attribute name="iframePanel" type="java.lang.Boolean"%><%@ attribute name="itemattr"%><%@ attribute name="formatter"%><%@ attribute name="isLabel" type="java.lang.Boolean"%><%@ attribute name="defaultValue"%><%@ attribute name="onValidSuccess"%><%@ attribute name="onValidError"%><%@ attribute name="postMode"%><%@ attribute name="errMsg" %><%@ attribute name="errMsgPosition" %><%@ attribute name="required" type="java.lang.Boolean"%><%@ attribute name="showStar" type="java.lang.Boolean"%><%@ attribute name="showRequiredMark"%><%@ attribute name="hideRequiredMark"%><%@ attribute name="id" %><%@ attribute name="name" %><%@ attribute name="value" %><%@ attribute name="text" %><%@ attribute name="appendTo" %><%@ attribute name="delay" type="java.lang.Integer" %><%@ attribute name="autoFocus" type="java.lang.Boolean" %><%@ attribute name="minLength" type="java.lang.Integer" %><%@ attribute name="minHeight" type="java.lang.Integer" %><%@ attribute name="height" type="java.lang.Integer" %><%@ attribute name="source" %><%@ attribute name="valueField" %><%@ attribute name="textField" %><%@ attribute name="searchField" %><%@ attribute name="buttons" %><%@ attribute name="onBlur" %><%@ attribute name="onChange" %><%@ attribute name="onKeyUp" %><%@ attribute name="onKeyDown" %><%@ attribute name="onClose" %><%@ attribute name="onFocus" %><%@ attribute name="onOpen" %><%@ attribute name="onResponse" %><%@ attribute name="onSearch" %><%@ attribute name="onSelect" %><%@ attribute name="triggers"%><%@ attribute name="excluded" type="java.lang.Boolean"%><%@ attribute name="dataCustom"%><%@ include file="TagUtil.jsp" %><% 	
id = tagUtil.getClientId( id );
String dataOption = tagUtil.add("id", id)
.add("name", name)
.add("cls", cls)
.add("triggers", triggers)
.add("excluded", excluded)
.add("dataCustom", dataCustom)
.add("componentCls", componentCls)
.add("rendered", rendered).add("authorized", authorized)
.add("multiple", multiple)
.add("multiLineLabel", multiLineLabel)
.add("postMode", postMode)
.add("requiredMsg", requiredMsg)
.add("valid", valid)
.add("validType", validType)
.add("maxLabelWidth", maxLabelWidth)
.add("value", value)
.add("text", text)
.add("iframePanel", iframePanel)
.add("itemattr", itemattr)
.add("formatter", formatter)
.add("isLabel", isLabel)
.add("readonly", readonly)
.add("defaultValue", defaultValue)
.add("required", required)
.add("showStar", showStar).add("showRequiredMark", showRequiredMark).add("hideRequiredMark", hideRequiredMark)
.add("errMsg", errMsg)
.add("errMsgPosition", errMsgPosition)
.add("appendTo", appendTo)
.add("delay", delay)
.add("autoFocus", autoFocus)
.add("minLength", minLength)
.add("minHeight", minHeight)
.add("height", height)
.add("source", source)
.add("valueField", valueField)
.add("textField", textField)
.add("searchField", searchField)
.add("buttons", buttons)
.add("onValidError", onValidError)
.add("onValidSuccess", onValidSuccess)
.add("onChange", onChange)
.add("onKeyUp", onKeyUp)
.add("onKeyDown", onKeyDown)
.add("onBlur", onBlur)
.add("onClose", onClose)
.add("onFocus", onFocus)
.add("onOpen", onOpen)
.add("onResponse", onResponse)
.add("onSearch", onSearch)
.add("onSelect", onSelect).toString();
%><input type="text" id="<%=id %>" <%=(name == null ? "" : "name=" + name) %> class="<%=cls==null?"":cls%>" data-options="<%=dataOption %>"/>
<script <%= "id=" + id + "_s" %>>
Coral.cc("autocomplete", "<%= id%>");
</script>