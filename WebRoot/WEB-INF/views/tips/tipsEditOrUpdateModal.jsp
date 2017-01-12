 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade " id="tipsAddOrEditModal" data-backdrop="static">
			<div class="modal-dialog modal-lg" >
				<div class="modal-content">
				
					<div class="modal-header">
						<h3 class="modal-title text-center" id="tipsModalDescription">Create Tips</h3>
					</div>
					
					<form  role="form" id="addOrEditTipsForm">
								<input type="text"  hidden="true" name="id" id="tipsId" />
								<input type="text"  hidden="true" name="holdername" value="${username}"  id="tipsHolderName"  />
								<input type="text"  hidden="true" name="orderNo"   id="tipsOrderNo"  />
					    <div class="modal-body">
						    		<div class="form-group">
											 <label >Tips:</label>
											 <input  class="form-control required" name="content" id="tipsContent" />
									 </div>
									 
							      
									<div class="form-group">
										<label for="txtUserName">置顶:</label>
										<select id="tipsTopNo"   name="topNo" class="form-control required">
											<option value="1">否</option>
											<option value="0">置顶</option>
										</select>
									</div>
						</div>
						<div class="modal-footer">
							<span onclick="submitTips();" class="btn btn-lg" style="background-color:#3686E8;color:white">保存</span>
							<span onclick="closeTips();" class="btn btn-lg" style="background-color:#3686E8;color:white">取消</span>
						</div>
					</form>	
				</div>
			</div>
		</div>
		<script>
		function closeTips(){
			$("#tipsAddOrEditModal").modal("hide");
		}

		//异步新增和修改
		function submitTips(){
			if($("#addOrEditTipsForm").valid()){
				$.ajax({
					type : 'post',
					url : ctx + '/tips/addOrEditTipsSava.do',
					data : $("#addOrEditTipsForm").serialize(),
					success : function(data) {
						debugger;
						if(data.msg){
							$("#tipsAddOrEditModal").modal("hide");
							message("Operation Success!");
							$("#tipsGrid${idSuffix}").grid("reload");
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
					$("#addOrEditTipsForm").validate();
				});
		
		</script>