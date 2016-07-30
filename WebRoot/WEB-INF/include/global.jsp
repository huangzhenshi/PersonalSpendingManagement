<%@page import="com.ces.utils.StringUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cui" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="elfn" uri="/WEB-INF/tld/elutil.tld"%>
<%@page import="com.ces.infoplat.common.utils.*" %>
<%@page import="com.ces.utils.*" %>
<%@page import="com.ces.infoplat.common.global.*" %>
<%@page import="java.util.*" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<%
	String idSuffix = request.getParameter("idSuffix");
	if(idSuffix==null||idSuffix.equals(""))
		idSuffix = "_"+DateUtil.getDateNoUnderlined();
	request.setAttribute("idSuffix", idSuffix);
	request.setAttribute("imageSize", SystemConfigGlobal.getInstance().getImageSize());
	request.setAttribute("currentDate", DateUtil.getCurrentDateTime());
	session.setAttribute("sessionId", session.getId());
	/*String siteId = (String)request.getAttribute("siteId");
	if(StringUtils.isEmpty(siteId)){
		siteId = request.getParameter("siteId");	
	}
	if(!StringUtils.isEmpty(siteId)){
		request.setAttribute("siteId", siteId);	
	}*/
%>

<script type="text/javascript">
<!--
	var GLOBAL_IMAGE_SIZE = "${imageSize}";
-->
</script>
