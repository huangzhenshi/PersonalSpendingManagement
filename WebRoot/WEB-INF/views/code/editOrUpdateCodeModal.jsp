 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade " id="addOrEditCodeModal" data-backdrop="static">
			<div class="modal-dialog modal-lg" >
				<div class="modal-content">
				
					<div class="modal-header">
						<h3 class="modal-title text-center" id="modalDescription">新增码表值</h3>
					</div>
					
					<form  role="form" id="addOrEditCodeForm">
						<input type="text"  hidden="true" name="id" id="codeId" />
						<div class="modal-body">
							<div class="form-group">
								<label for="txtUserName">码表类型</label>
								<input type="text" class="form-control" name="type" id="codeType" required/>
							</div>
							
							<div class="form-group">
								<label for="txtPassWord">code值</label>
								<input type="text" class="form-control" name="code" id="code" required/>
							</div>
							
							<div class="form-group">
								<label for="txtPassWord">码值</label>
								<input type="text" class="form-control" name="value" id="codeValue" required/>
							</div>
							
							<div class="form-group">
								<label for="txtPassWord">码值描述</label>
								<input type="text" class="form-control" name="description" id="description"/>
							</div>
							
							<div class="form-group">
								<label for="txtPassWord">是否通用码值 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label>
								<!-- isAll 0为通用码值，1为个人码值 -->
									<input type="radio"  name="isAll" id="isAll" value="0"/>是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio"  name="isAll" id="isAll" checked="checked"  value="1"/>否
								</label>
						    </div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary"   data-dismiss="modal" onclick="submitAddOrEditCode()">
								保存
							</button>
							<button class="btn btn-primary" data-dismiss="modal">
								取消
							</button>
						</div>
					</form>	
				</div>
			</div>
		</div>
		<script>
			$().ready(function() {
					$("#addOrEditCodeForm").validate();
				});
			
			function submitAddOrEditCode(){			
				$.ajax({
					type : 'post',
					url : ctx + '/code/addOrEditCodeSava.do',
					dataType : "json",
					data : {
						id : $("#codeId").val(),
						holderName : $("#username").val(),
						type: $("#codeType").val(),
						code: $("#code").val(),
						value: $("#codeValue").val(),
						description: $("#description").val(),
						isAll: $("#isAll").val()
					},
					success : function(data) {
						$("#addOrEditCodeModal").modal('hide');
						message(data);
						$("#codeGrid${idSuffix}").grid("reload"); 
					},
					error : function(e) {
						$("#addOrEditCodeModal").modal('hide');
						message("操作失败!");
						$("#codeGrid${idSuffix}").grid("reload"); 
					}
				}); 
			}
		</script>