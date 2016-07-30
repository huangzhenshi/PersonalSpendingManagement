<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<cui:dialog id="ledger_selectactivity_dialog" reLoadOnOpen="true" autoOpen="false" onLoad="dialogLoad">
	<div>
		<cui:tree id="userTreeForSelectActivity" asyncEnable="true" asyncType="post"
			asyncUrl="${ctx}/backstage/system/org-info!orgUserRootTree.json" asyncAutoParam="id,name" checkable="true">					
		</cui:tree>
	</div>
</cui:dialog>
<script type="text/javascript">
	function changeSender(){
		debugger;
		var activities = $("input[name='activities']:checked").val();
	    var nodes = $('#userTreeForSelectActivity').tree("getCheckedNodes",true);
	    var nodeId = "";
		var nodeName = "";
		for (var i=0, l=nodes.length; i<l; i++) {
			if(!nodes[i].isParent){
				nodeId+=activities+"^_^"+nodes[i].id+',';
				nodeName+=nodes[i].name+',';
			}
			if(i==l-1){
				nodeId = nodeId.substring(0, nodeId.length-1);
				nodeName = nodeName.substring(0, nodeName.length-1);
			}
		}
		$("#senderid").val(nodeId);
		$("#sender").val(nodeName);
		closeDialog();
	}
	function openDialog(){
		dialog(
				"#ledger_selectactivity_dialog",
				{
					width : 400,
					height:460,
					title : "指定提交人"
				},
				{
					"确定" : function() {
						changeSender();
					},
					"关闭" : function() {
						$(this).dialog("close");
					}
				}).dialog("open");
	}
	function closeDialog(){
		$("#ledger_selectactivity_dialog").dialog("close");
	}
</script>