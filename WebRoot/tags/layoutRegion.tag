<%@attribute name="region"%><%@attribute name="split" type="java.lang.Boolean"%><%@attribute name="onLoad"%><%@attribute name="collapsed" type="java.lang.Boolean"%><%@attribute name="title"%><%@attribute name="style"%><%@attribute name="minWidth" type="java.lang.Integer"%><%@attribute name="maxWidth" type="java.lang.Integer"%><%@attribute name="minHeight" type="java.lang.Integer"%><%@attribute name="maxHeight" type="java.lang.Integer"%><%@attribute name="cls"%><%@attribute name="onResize"%><%@attribute name="beforeCollapse"%><%@attribute name="url"%><%@attribute name="beforeExpand"%><%@include file="TagUtil.jsp" %>
<% 
String dataOption = tagUtil.add("region", region)
.add("split", split)
.add("url", url)
.add("collapsed", collapsed)
.add("title", title)
.add("minWidth", minWidth)
.add("maxWidth", maxWidth)
.add("minHeight", minHeight)
.add("maxHeight", maxHeight)
.add("onResize", onResize)
.add("onLoad", onLoad)
.add("beforeCollapse", beforeCollapse)
.add("beforeExpand", beforeExpand).toString();

%>
<div data-options="<%=dataOption %>" <%=(cls == null ? "" : "class="+cls) %> <%=(style == null ? "" : "style="+style) %> ><jsp:doBody /></div>

