 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade " id="addOrEditCashFlowModal" data-backdrop="static">
			<div class="modal-dialog modal-lg" >
				<div class="modal-content">
				
					<div class="modal-header">
						<h3 class="modal-title text-center" id="cashFlowModalDescription">Record new cashFlow</h3>
					</div>
					
					<form  role="form" id="addOrEditCashFlowForm">
								<input type="text"  hidden="true" name="id" id="cashFlowId" />
								<input type="text"  hidden="true" name="holderName" value="${username}"  id="cashFlowHolderName"  />
					    <div class="modal-body">
									<div class="form-group">
										 <label >flow date:</label>
									     <input type="text" class="form-control date form_date required" id="cashFlowTimes" name="times"
										         	 data-date="" data-date-format="yyyy-mm-dd" />
								     </div>
							      
									<div class="form-group">
										<label >category:</label>
										<input  class="form-control required" name="item" id="cashFlowItem" />
									</div>
									
									<div class="form-group">
										<label>amount:</label>
										<input  class="form-control required" name="money" id="cashFlowMoney" />
									</div>
									
									<div class="form-group">
										<label>remark:</label>
										<input type="text" class="form-control" name="remark" id="cashFlowRemark"/>
									</div>
						</div>
						<div class="modal-footer">
							<span onclick="submitCashFlow();" class="btn btn-lg" style="background-color:#3686E8;color:white">保存</span>
							<span onclick="closeCashFlow();" class="btn btn-lg" style="background-color:#3686E8;color:white">取消</span>
						</div>
					</form>	
				</div>
			</div>
		</div>
		<script>
		function closeCashFlow(){
			$("#addOrEditCashFlowModal").modal("hide")
		}

		//异步新增和修改
		function submitCashFlow(){
			debugger;
			if($("#addOrEditCashFlowForm").valid()){
				$.ajax({
					type : 'post',
					url : ctx + '/cashFlow/addOrEditCashFlowSava.do',
					data : $("#addOrEditCashFlowForm").serialize(),
					success : function(data) {
						debugger;
						if(data.msg){
							$("#addOrEditCashFlowModal").modal("hide");
							message("Operation Success!");
							$("#yearIncomeTotal").html('收入明细('+data.total+')')
							$("#incomeCashFlowGrid${idSuffix}").grid("reload");
							$("#cashFlowGrid${idSuffix}").grid("reload");
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
					$("#addOrEditCashFlowForm").validate();
				});
		
		</script>