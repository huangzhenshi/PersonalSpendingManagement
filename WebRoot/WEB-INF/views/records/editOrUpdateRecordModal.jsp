 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade " id="addOrEditRecordModal" data-backdrop="static">
			<div class="modal-dialog modal-lg" >
				<div class="modal-content">
				
					<div class="modal-header">
						<h3 class="modal-title text-center" id="recordModalDescription">新增记账记录</h3>
					</div>
					
					<form  role="form" id="addOrEditRecordForm">
								<input type="text"  hidden="true" name="id" id="recordId" />
								<input type="text"  hidden="true" name="holderName" value="${username}"  id="recordHolderName"  />
					    <div class="modal-body">
									<div class="form-group">
										 <label >日期:</label>
									     <input type="text" class="form-control date form_date required" id="recordTimes" name="times"
										         	 data-date="" data-date-format="yyyy-mm-dd" />
								     </div>
							      
									<div class="form-group">
										<label for="txtUserName">工资:</label>
										<input type="isInteger" class="form-control" name="incomeTotal" id="recordIncomeTotal" />
									</div>
									
									<div class="form-group">
										<label for="txtUserName">饮食:</label>
										<input type="isInteger" class="form-control" name="eating" id="recordEating" />
									</div>
									
									<div class="form-group">
										<label for="txtUserName">超市:</label>
										<input type="isInteger" class="form-control" name="supermarket" id="recordSupermarket" />
									</div>
									
									<!-- <div class="form-group">
										<label for="txtUserName">聚餐:</label>
										<input type="isInteger" class="form-control" name="party" id="recordParty" />
									</div> -->
									
									<div class="form-group">
										<label for="txtUserName">Rent:</label>
										<input type="isInteger" class="form-control" name="rent" id="recordRent" />
									</div>
									
									<div class="form-group">
										<label for="txtUserName">买书:</label>
										<input type="isInteger" class="form-control" name="book" id="recordBook" />
									</div>
									
									<div class="form-group">
										<label for="txtUserName">买衣服:</label>
										<input type="isInteger" class="form-control" name="clothes" id="recordClothes" />
									</div>
									
									<div class="form-group">
										<label for="txtUserName">交通:</label>
										<input type="isInteger" class="form-control" name="traffic" id="recordTraffic" />
									</div>
									
									<div class="form-group">
										<label for="txtUserName">其他:</label>
										<input type="text" class="form-control" name="remark" id="recordRemark" />
										<span id="top10ElseName"></span>
									</div>
						</div>
						
						<div class="modal-footer">
							<span onclick="submitRecord();" class="btn btn-lg" style="background-color:#3686E8;color:white">保存</span>
							<span onclick="closeRecord();" class="btn btn-lg" style="background-color:#3686E8;color:white">取消</span>
						</div>
					</form>	
				</div>
			</div>
		</div>
		<script>
		function closeRecord(){
			$("#addOrEditRecordModal").modal("hide")
		}

		//异步新增和修改
		function submitRecord(){
			var recordGrid=$("#recordGrid${idSuffix}");
			if($("#addOrEditRecordForm").valid()){
				$.ajax({
					type : 'post',
					url : ctx + '/record/addOrEditRecordSava.do',
					data : $("#addOrEditRecordForm").serialize(),
					success : function(data) {
						debugger;
						if(data.msg){
							$("#addOrEditRecordModal").modal("hide")
							refreshCenter('${ctx}/record/toMainRecordPage.do?username=${username}&message='+"add Success!");
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
					$("#addOrEditRecordForm").validate();
				});
		
		</script>