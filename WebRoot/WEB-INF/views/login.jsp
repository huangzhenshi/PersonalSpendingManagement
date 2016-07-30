<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<%@taglib prefix="cui" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<div style="display: none;">login</div>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="cache-control" content="no-store, must-revalidate"> 
<meta http-equiv="expires" content="Thu, 01 Jan 1970 00:00:01 GMT"> 
<meta http-equiv="expires" content="0">


<%@ include file="../include/headerForCUI.jsp"%>
<title>黄大大财务管理软件-登录</title>
<script src="${ctx}/res/resource/style/js/md5.min.js"></script>
<script src="${ctx}/res/resource/style/js/sha1.js"></script>
<script src="${ctx}/res/thirdParty/jqfloat.min.js"></script>
<link href="${ctx}/res/resource/style/css/inforGlobal.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/res/resource/style/css/login.css" type="text/css" rel="stylesheet" />
<style type="text/css">
	body{
	overflow: hidden;
	}
</style>
</head>
<body style="text-align:center;">
	<script>
		/*function relocation(){
			var loginError="${param.login_error}";
			if(loginError=='2'){
				alert("登录过期，请重新登录！");
				location.href="${ctx}";
			}
		}
		relocation();*/
	</script>
	<script type="text/javascript">
		$(function(){
			$("#cloud1").jqFloat({
				width: 800,
				height: 300,
				speed: 10000
			});
			$("#cloud2").jqFloat({
				width: 300,
				height: 100,
				speed: 7000
			});
			$("#cloud3").jqFloat({
				width: 800,
				height: 300,
				speed: 10000
			});
			$("#cloud4").jqFloat({
				width: 800,
				height: 300,
				speed: 10000
			});
			if(${not empty param.login_error}){
				$("#mesBox").show();
			}
		});

	</script>

<div id="cloud1" class="cloud1"></div>
<div id="cloud2" class="cloud"></div>
<div id="cloud3" class="cloud2"></div>
<div id="cloud4" class="cloud"></div>
<div class="loginbg">
  <div class="loginbg2"></div>
  <div class="loginbg3">
    <div class="logo-login"></div>
    <%--判断用户名、密码、验证码是否为空，以及根据服务器返回的error码来反馈相应的错误信息 --%>
    <div class="loginbox">
    	<cui:form id="loginForm"  action="${ctx}/login/check" method="POST">
    		<div class="exitmessage">
				<div id="mesBox">
					<span>
						<c:if test="${not empty message}">
						<span><img src='${ctx}/res/resource/style/images/login/fail.png'/></span>
						</c:if>
					</span>
				</div>
    	  	</div>
    	  	<span>
						<c:if test="${message=='4'}">
						<span><img src='${ctx}/res/resource/style/images/login/fail.png'/>用户名密码不正确</span>
							<%-- <c:choose>
							    <c:when test="${message == '4'}">用户无效</c:when>
							    <c:when test="${param.login_error == '3'}">用户已在其他地方登录，用户被踢出</c:when>
							    <c:when test="${param.login_error == '2'}">用户登录超时退出</c:when>
							    <c:when test="${param.login_error == '1'}">
							    <span><img src='${ctx}/res/resource/style/images/login/fail.png'/></span>
							      	<c:choose>
									    <c:when test="${not empty SPRING_SECURITY_LAST_EXCEPTION.message && '验证码错误！' eq SPRING_SECURITY_LAST_EXCEPTION.message}">验证码不正确</c:when>
									    <c:otherwise>用户名密码不正确</c:otherwise>
									</c:choose>
							    </c:when>
							    <c:when test="${param.login_error == '0'}">用户主动退出</c:when>
							   <c:otherwise>未知原因</c:otherwise>
							</c:choose> --%>
						</c:if>
					</span>
	      <div class="paddingt55">
	        <div class="labelbox user">
	          <label>用户名：</label>
	          <input type="text" id="username" name="user.username">
	        </div>
	        <div class="labelbox pwd">
	          <label>密&emsp;码：</label>
	          <input type="password" autocomplete="off" id="password" name="user.password">
	          <input type="hidden" name="targetUrl" value="/backstage/ledger" >
	        </div>
	        <!-- <div class="labelbox identify">
	          <label>验证码：</label>
	          <input type="text" name="validateCode" id="validateCode">
	          <span class="identifyIMg"><img id="code" title="点击刷新" alt="验证码" /></span>
	        </div> -->
	        <div class="rember clearfix">
	          <span>
	            <input id="_spring_security_remember_me" name="_spring_security_remember_me" type="checkbox" value="true"/>
	            <label>下次自动登录</label>
	          </span>
	        </div>
	      </div>
	      <div class="loginbtnteam">
	        <span class="loginBtnOk"><a id="loginBtn" href="javascript:login();">登录系统</a></span>
	      </div>
      </cui:form>
    </div>
  </div>
</div>
</body>
</html>
<script type="text/javascript">
	$(function(){
		/* var code = document.getElementById("code");
		code.src="${ctx}/reception/login/code!validateCodeLogin?width=72&height=30&fontSize=24&tm="+Math.random();
		code.onclick=function(){
			this.src="${ctx}/reception/login/code!validateCodeLogin?width=72&height=30&fontSize=24&tm="+Math.random();
		}
 */
		//绑定回车登陆
		$("body").keydown(function(event) {
		    if (event.keyCode == "13") {//keyCode=13是回车键
		    	$("#loginBtn").text("登录中...");
		    	if(!login()){
		    		$("#loginBtn").text("登录系统");
		    	};
		    }
		});
	})
	function login(){
			$("#mesBox").hide().empty();
			if(!$("#username").val()){
				$("#mesBox").append("<span><img src='"+ctx+"/res/resource/style/images/login/fail.png'/></span><span>用户名不能为空！</span>").show();
				return;
			}

			if(!$("#password").val()){
				$("#mesBox").append("<span><img src='"+ctx+"/res/resource/style/images/login/fail.png'/></span><span>密码不能为空！</span>").show();
				return;
			}
			$('#loginForm').submit();

		}
</script>