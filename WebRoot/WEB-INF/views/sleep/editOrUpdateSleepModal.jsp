 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade " id="addOrEditSleepModal" data-backdrop="static">
			<div class="modal-dialog modal-lg" >
				<div class="modal-content">
				
					<div class="modal-header">
						<h3 class="modal-title text-center" id="sleepModalDescription">Record sleep time</h3>
					</div>
					
					<form  role="form" id="addOrEditSleepForm"  class="form-horizontal" role="form" >
								<input type="text"  hidden="true" name="id" id="sleepId" />
								<input type="text"  hidden="true" name="holderName" value="${username}"  id="sleepHolderName"  />
					    <div class="modal-body">
									<div class="form-group">
										 <label  class="col-sm-2 control-label">日期:</label>
									     <div class="col-sm-8">
									     	<input type="text" class="form-control date form_date required" id="sleepTimes" name="times"
										         	 data-date="" data-date-format="yyyy-mm-dd" />
										  </div>
								     </div>
							      
									 <div class="form-group">
										<label  class="col-sm-2 control-label">起床时间:</label>
										<div class="col-sm-8">
											<input  class="form-control" name="getUp" id="sleepGetUp" />
										</div>
									</div>
									
									<div class="form-group">
										<label  class="col-sm-2 control-label">上床时间:</label>
										<div class="col-sm-8">
											<input  class="form-control" name="getSleep" id="sleepGetSleep" />
										</div>
									</div>
									
									<div class="form-group">
										<label  class="col-sm-2 control-label">Breakfast:</label>
										<div class="col-sm-8">
											<input  class="form-control" name="breakfast" id="sleepBreakfast" />
										</div>
									</div>
									
									<div class="form-group">
										<label  class="col-sm-2 control-label">Lunch:</label>
										<div class="col-sm-8">
											<input  class="form-control" name="lunch" id="sleepLunch" />
										</div>
									</div>
									
									<div class="form-group">
										<label  class="col-sm-2 control-label">Dinner:</label>
										<div class="col-sm-8">
											<input  class="form-control" name="dinner" id="sleepDinner" />
										</div>
									</div>
									
									<div class="form-group">
										<label  class="col-sm-2 control-label">Remark:</label>
										<div class="col-sm-8">
											<textarea type="text" class="form-control" id="sleepRemark" name="remark" rows="3" value="${sleep.remark}">${sleep.remark}</textarea>
										</div>
									</div>
						</div>
						<div class="modal-footer">
							<span onclick="submitSleep();" class="btn btn-lg" style="background-color:#3686E8;color:white">Save</span>
							<span onclick="closeSleep();" class="btn btn-lg" style="background-color:#3686E8;color:white">Cancel</span>
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