 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade " id="wordsAddOrEditModal" data-backdrop="static">
			<div class="modal-dialog modal-lg" >
				<div class="modal-content">
				
					<div class="modal-header">
						<h3 class="modal-title text-center" id="wordsModalDescription">Create Words</h3>
					</div>
					
					<form  role="form" id="addOrEditWordsForm">
								<input type="text"  hidden="true" name="id" id="wordsId" />
								<input type="text"  hidden="true" name="holdername" value="${username}"  id="wordsHolderName"  />
								<input type="text"  hidden="true" name="orderNo"   id="wordsOrderNo"  />
					    <div class="modal-body">
						    		<div class="form-group">
											 <label >Words:</label>
											 <input  class="form-control required" name="content" id="wordsContent" />
									 </div>
									 
									<div class="form-group">
										 <label >Description:</label>
										 <input  class="form-control" name="description" id="wordsDescription" />
								     </div>
							      
									<div class="form-group">
										<label for="txtUserName">置顶:</label>
										<select id="wordsTopNo"   name="topNo" class="form-control required">
											<option value="1">否</option>
											<option value="0">置顶</option>
										</select>
									</div>
						</div>
						<div class="modal-footer">
							<span onclick="submitWords();" class="btn btn-lg" style="background-color:#3686E8;color:white">保存</span>
							<span onclick="closeWords();" class="btn btn-lg" style="background-color:#3686E8;color:white">取消</span>
						</div>
					</form>	
				</div>
			</div>
		</div>
		<script>
		function closeWords(){
			$("#wordsAddOrEditModal").modal("hide");
		}

		//异步新增和修改
		function submitWords(){
			if($("#addOrEditWordsForm").valid()){
				$.ajax({
					type : 'post',
					url : ctx + '/words/addOrEditWordsSava.do',
					data : $("#addOrEditWordsForm").serialize(),
					success : function(data) {
						debugger;
						if(data.msg){
							$("#wordsAddOrEditModal").modal("hide");
							message("Operation Success!");
							$("#wordsGrid${idSuffix}").grid("reload");
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
					$("#addOrEditWordsForm").validate();
				});
		
		</script>