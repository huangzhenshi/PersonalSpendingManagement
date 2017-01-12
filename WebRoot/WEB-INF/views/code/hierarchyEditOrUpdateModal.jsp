 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade " id="hierarchyAddOrEditModal" data-backdrop="static">
			<div class="modal-dialog modal-lg" >
				<div class="modal-content">
				
					<div class="modal-header">
						<h3 class="modal-title text-center" id="hierarchyModalDescription">Create Hierarchy</h3>
					</div>
					
					<form  role="form" id="addOrEditHierarchyForm">
								<input type="text"  hidden="true" name="id" id="hierarchyId" />
								<input type="text"  hidden="true" name="holdername" value="${username}"  id="hierarchyHolderName"  />
					    <div class="modal-body">
					    
						    		<div class="form-group">
										<label for="txtUserName">Category:</label>
										<select id="hierarchyCategory"   name="category" class="form-control required">
										</select>
									</div>
									
						    		<div class="form-group">
											 <label >Type:</label>
											 <input  class="form-control required" name="type" id="hierarchyType" />
									 </div>
									 
							      
									<div class="form-group">
										<label for="txtUserName">Parent_Type:</label>
										<select id="hierarchyParentType"   name="parentId" class="form-control">
										</select>
									</div>
									
						</div>
						<div class="modal-footer">
							<span onclick="submitHierarchy();" class="btn btn-lg" style="background-color:#3686E8;color:white">SAVE</span>
							<span onclick="$('#hierarchyAddOrEditModal').modal('hide');" class="btn btn-lg" style="background-color:#3686E8;color:white">CANCEL</span>
						</div>
					</form>	
				</div>
			</div>
		</div>
		<script>
		//异步新增和修改
		function submitHierarchy(){
			if($("#addOrEditHierarchyForm").valid()){
				$.ajax({
					type : 'post',
					url : ctx + '/hierarchy/addOrEditHierarchySava.do',
					data : $("#addOrEditHierarchyForm").serialize(),
					success : function(data) {
						debugger;
						if(data.msg){
							$("#hierarchyAddOrEditModal").modal("hide");
							refreshCenter('${ctx}/hierarchy/toMainHierarchyPage.do?username=${username}');
							
						}else{
							alert("操作失败!主键冲突或者程序异常");
						}
					},
					error : function(e) {
						message(e.msg);
						error(e);
					}
				});
			}
		}
		
			$().ready(function() {
					$("#addOrEditHierarchyForm").validate();
				});
		
		</script>