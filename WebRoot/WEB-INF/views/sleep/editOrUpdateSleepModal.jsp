 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade " id="addOrEditSleepModal" data-backdrop="static">
			<div class="modal-dialog modal-lg" >
				<div class="modal-content">
				
					<div class="modal-header">
						<h3 class="modal-title text-center" id="sleepModalDescription">Record sleep time</h3>
					</div>
					
					<form  role="form" id="addOrEditSleepForm">
								<input type="text"  hidden="true" name="id" id="sleepId" />
								<input type="text"  hidden="true" name="holderName" value="${username}"  id="sleepHolderName"  />
					    <div class="modal-body">
									<div class="form-group">
										 <label >日期:</label>
									     <input type="text" class="form-control date form_date required" id="sleepTimes" name="times"
										         	 data-date="" data-date-format="yyyy-mm-dd" />
								     </div>
							      
									<div class="form-group">
										<label for="txtUserName">起床时间:</label>
										<input  class="form-control" name="getUp" id="sleepGetUp" />
									</div>
									
									<div class="form-group">
										<label for="txtUserName">上床时间:</label>
										<input  class="form-control" name="getSleep" id="sleepGetSleep" />
									</div>
									
									<div class="form-group">
										<label for="txtUserName">备注:</label>
										<textarea type="text" class="form-control" id="sleepRemark" name="remark" rows="3" value="${sleep.remark}">${sleep.remark}</textarea>
									</div>
						</div>
						<div class="modal-footer">
							<span onclick="submitSleep();" class="btn btn-lg" style="background-color:#3686E8;color:white">保存</span>
							<span onclick="closeSleep();" class="btn btn-lg" style="background-color:#3686E8;color:white">取消</span>
						</div>
					</form>	
				</div>
			</div>
		</div>
		<script>
		function closeSleep(){
			$("#addOrEditSleepModal").modal("hide")
		}

		//异步新增和修改
		function submitSleep(){
			if($("#addOrEditSleepForm").valid()){
				$.ajax({
					type : 'post',
					url : ctx + '/sleep/addOrEditSleepSava.do',
					data : $("#addOrEditSleepForm").serialize(),
					success : function(data) {
						debugger;
						if(data.msg){
							$("#addOrEditSleepModal").modal("hide");
							message("Operation Success!");
							$("#sleepGrid${idSuffix}").grid("reload");
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
					$("#addOrEditSleepForm").validate();
				});
		
		</script>