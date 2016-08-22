 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade " id="addOrEditCardModal" data-backdrop="static">
			<div class="modal-dialog modal-lg" >
				<div class="modal-content">
				
					<div class="modal-header">
						<h3 class="modal-title text-center" id="modalDescription">新增银行卡</h3>
					</div>
					
					<form  role="form" id="addOrEditCardForm" action="${ctx}/card/addOrEditCardSava.do?holderName=${loginUser.username}" method="post">
						<input type="text"  hidden="true" name="id" id="cardId" />
						<div class="modal-body">
							<div class="form-group">
								<label for="txtUserName">银行名称:</label>
								<input type="text" class="form-control" name="bankName" id="cardBankName" required/>
							</div>
							
							<div class="form-group">
								<label for="txtPassWord">卡号:</label>
								<input type="text" class="form-control" name="accountNumber" id="cardAccountNumber"/>
							</div>
							
							<div class="form-group">
								<label for="txtPassWord">余额:</label>
								<input type="text" class="form-control" name="balance" id="cardBalance" required/>
							</div>
							
							<div class="form-group">
								<label for="txtPassWord">归属地:</label>
								<input type="text" class="form-control" name="location" id="cardLocation"/>
							</div>
							
							<div class="form-group">
								<label for="txtPassWord">Hint:</label>
								<input type="text" class="form-control" name="password" id="cardPassword"/>
							</div>
							
							<div class="form-group">
								<label for="txtPassWord">更新日期:</label>
								<input type="text" class="form-control date form_date required" name="updateTime" id="cardUpdateTime"
									 data-date="" data-date-format="yyyy-mm-dd"/>
							</div>
							
							<div class="form-group">
								<label for="txtPassWord">备注:</label>
								<input type="text" class="form-control" name="remark" id="cardRemark"/>
							</div>
							
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary" type="submit">
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
					$("#addOrEditCardForm").validate();
				});
</script>