<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cui" tagdir="/WEB-INF/tags"%>
<%@page import="java.util.*" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<%
	String idSuffix = request.getParameter("idSuffix");
%>

<script type="text/javascript">
<!--
	var GLOBAL_IMAGE_SIZE = "${imageSize}";
-->
</script>
