<%@attribute name="id"%><%@ attribute name="cls" %><%@ attribute name="componentCls" %><%@ attribute name="rendered" type="java.lang.Boolean" %><%@ attribute name="authorized" %><%@attribute name="loadonce" type="java.lang.Boolean"%><%@attribute name="name"%><%@attribute name="destroyAllonActive" type="java.lang.Boolean"%><%@attribute name="disabled" type="java.lang.Boolean"%><%@attribute name="collapsible" type="java.lang.Boolean"%><%@attribute name="url"%><%@attribute name="method"%><%@attribute name="newbtn" type="java.lang.Boolean"%><%@attribute name="heightStyle"%><%@attribute name="onActivate"%><%@attribute name="beforeActivate"%><%@attribute name="beforeLoad"%><%@attribute name="onCreate"%><%@attribute name="onLoad"%><%@attribute name="onTabNew"%><%@attribute name="beforeTabClose"%><%@attribute name="onTabClose"%><%@include file="TagUtil.jsp" %><%
id = tagUtil.getClientId( id );
String dataOption = tagUtil.add("collapsible", collapsible)
.add("id", id)
.add("cls", cls)
.add("componentCls", componentCls)
.add("rendered", rendered).add("authorized", authorized)
.add("loadonce", loadonce)
.add("destroyAllonActive", destroyAllonActive)
.add("disabled", disabled)
.add("method", method)
.add("newbtn", newbtn)
.add("disabled", disabled)
.add("heightStyle", heightStyle)
.add("id", id)
.add("url", url)
.add("name", name)
.add("onActivate", onActivate)
.add("beforeActivate", beforeActivate)
.add("beforeLoad", beforeLoad)
.add("onCreate", onCreate)
.add("onTabNew", onTabNew)
.add("onLoad", onLoad)
.add("beforeTabClose", beforeTabClose)
.add("onTabClose", onTabClose).toString();
%><div <%=(id == null ? "" : "id="+id) %> class="<%=cls==null?"":cls%>" data-options="<%=dataOption %>">
<jsp:doBody />
</div>
<script <%= "id=" + id + "_s" %>>
Coral.cc("tabs", "<%= id%>");
</script>