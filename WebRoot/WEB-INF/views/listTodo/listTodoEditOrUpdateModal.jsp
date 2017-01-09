 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade " id="addOrEditListTodoModal" data-backdrop="static">
			<div class="modal-dialog modal-lg" >
				<div class="modal-content">
				
					<div class="modal-header">
						<h3 class="modal-title text-center" id="listTodoModalDescription">Create ListTodo</h3>
					</div>
					
					<form  role="form" id="addOrEditListTodoForm">
								<input type="text"  hidden="true" name="id" id="listTodoId" />
								<input type="text"  hidden="true" name="holdername" value="${username}"  id="listTodoHolderName"  />
								<input type="text"  hidden="true" name="recordTime"   id="listTodoRecordTime"  />
					    <div class="modal-body">
									<div class="form-group">
										 <label >Description:</label>
										 <input  class="form-control required" name="description" id="listTodoDescription" />
								     </div>
							      
									<div class="form-group">
										<label for="txtUserName">Status:</label>
										<select id="listTodoStatus"   name="status" class="form-control required">
											<option value="0" >待办</option>
											<option value="1" >已办</option>
										</select>
									</div>
									
									<div class="form-group">
										<label>Priority:</label>
										<select id="listTodoPriority"   name="priority" class="form-control required">
											<option value="0" >Urgent</option>
											<option value="1" >Normal</option>
										</select>
									</div>
						</div>
						<div class="modal-footer">
							<span onclick="submitListTodo();" class="btn btn-lg" style="background-color:#3686E8;color:white">保存</span>
							<span onclick="closeListTodo();" class="btn btn-lg" style="background-color:#3686E8;color:white">取消</span>
						</div>
					</form>	
				</div>
			</div>
		</div>
		<script>
		function closeListTodo(){
			$("#addOrEditListTodoModal").modal("hide");
		}

		//异步新增和修改
		function submitListTodo(){
			if($("#addOrEditListTodoForm").valid()){
				$.ajax({
					type : 'post',
					url : ctx + '/listTodo/addOrEditListTodoSava.do',
					data : $("#addOrEditListTodoForm").serialize(),
					success : function(data) {
						debugger;
						if(data.msg){
							$("#addOrEditListTodoModal").modal("hide");
							message("Operation Success!");
							$("#listTodoGrid${idSuffix}").grid("reload");
							$("#listdoGrid${idSuffix}").grid("reload");
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
		$('.form_date').datetimepicker({
		    language:  'zh-CN',
		    weekStart: 1,
		    todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
		});
		
			$().ready(function() {
					$("#addOrEditListTodoForm").validate();
				});
		
		</script>