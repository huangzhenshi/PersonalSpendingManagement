<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/global.jsp"%>

<div class="F-left" style="width:100%;">
	<div class="PanelLeft F-left">
    	<div class="BoxLeft">
        	<img src="${ctx}/res/resource/style/images/icon01Hit.png" width="40" height="38" alt="" />
            <h4><b>功能组件</b></h4>
        </div>
        <div class="clear"></div>
        <div class="menuLeftFirst">
			<ul>
					<li onclick="refreshCenter('${ctx}/backstage/component/ad-position');">
						<img src="${ctx}/res/resource/style/css/images/iconsmall/icongg.png"><span>广告管理</span>
					</li>
					<li onclick="refreshCenter('${ctx}/backstage/component/friend-link-category?siteId='+currentSiteId);">
						<img src="${ctx}/res/resource/style/css/images/iconsmall/iconyq.png"><span>友情链接管理</span>
					</li>
					<li id="messageClick" onclick="refreshCenter('${ctx}/backstage/component/message-category');"><img src="${ctx}/res/resource/style/css/images/iconsmall/iconly.png"><span>留言分类</span></li>
					<li  onclick="refreshCenter('${ctx}/backstage/component/custom-block');"><img src="${ctx}/res/resource/style/css/images/iconsmall/iconself.png"><span>自定义模块</span></li>
			</ul>
		</div>
		 <div class="menuLeftSecond">
			<div class="menuLeftSecondHead clearfix">
				<div class="menuLeftSecondHead2">
					<div class="BackFirst">返回</div>
					<div class="firstName">频道管理</div>
				</div>
				
			</div>
		 <!-- 二级树beigin -->
			<div class="treebox">
				<div class="leftTree">
					<div no="0">
						<div class="margin5 se-searchall">
							<cui:input placeholder="搜索" type="text" onEnter="component_channelTreeSearch" id="left_channelTree_searchText${idSuffix}"></cui:input>
							<span class="icon icon-search3 search-Click" onclick="component_channelTreeSearch()"> </span>
						</div>
						<cui:tree id="channelTree${idSuffix}" asyncEnable="true" asyncType="post"
							asyncUrl="" asyncAutoParam="id,name,access" onClick="comment_asyncClick" onLoad="treeAsyncExpandnode">					
						</cui:tree>
					</div>
				</div>
			</div>
			<!-- 二级树end -->
    	</div>
	</div>
</div>
<script>
function comment_channelMenuClick(){
	var tree = $("#channelTree${idSuffix}");
	tree.tree("option","asyncUrl","${ctx}/backstage/website/channel!getChannelTree.json?siteId="+currentSiteId);
	tree.tree("reload");
	refreshCenter('${ctx}/backstage/component/comment');
}

</script>
