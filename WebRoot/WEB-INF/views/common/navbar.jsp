 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <nav class="navbar navbar-default navbar-top" role="navigation">  
  <div class="container-fluid">  
    <!-- 屏幕小到一定的尺寸时候导航栏发生的变化 -->  
    <div class="navbar-header">  
        <button class="navbar-toggle collapsed" data-target="#navigation-list" data-toggle="collapse" type="button">  
            <span class="sr-only">Toggle navigation</span>  
            <span class="icon-bar"></span>  
            <span class="icon-bar"></span>  
            <span class="icon-bar"></span>  
        </button>  
        <a class="navbar-brand" href="${ctx}/record/toMainRecordPage.do">MainPage</a>  
    </div>  
    <!-- 正常尺寸下的导航拦 -->  
     <div class="collapse navbar-collapse" id="navigation-list">  
      <ul class="nav navbar-nav">  
        <li class="active"><a href="${ctx}/record/toMainRecordPage.do">历史回顾</a></li>  
        <li><a href="http://phalcon.framework.dev/Index/touch">智能分析</a></li>  
        <li><a href="http://phalcon.framework.dev/List">excel导入导出</a></li>  
        <li><a href="#" data-target="#about" data-toggle="modal">系统配置</a></li>  
      </ul>    
    </div>  
  </div>  
</nav> 
	
<script type="text/javascript">
</script>