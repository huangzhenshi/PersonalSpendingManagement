package account_huang.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import account_huang.entity.CashFlow;
import account_huang.entity.Sleep;
import account_huang.service.CashFlowService;

@Controller
@RequestMapping("/cashFlow")
public class CashFlowController {
	@Resource
	private CashFlowService cashSer;
	
	@RequestMapping("/toCashFlowMainPage.do")
	public ModelAndView toMainCashFlowPage(String username,String year,ModelMap model,String message){
		if(!StringUtils.isEmpty(message)){
			model.addAttribute("message", message);
		}
		String total=cashSer.getTotalIncomeByYear(username,year);
		model.addAttribute("total",year+"年工资累计收入"+total+"元");
		return  new ModelAndView("cashFlow/cashFlowIndex");
	}
	
	@RequestMapping("/getAllCashFlow.do")
    @ResponseBody
    public Map<String,Object> getAllCashFlow(String username,String type){
        Map<String,Object> map = new HashMap<String, Object>();
        List<CashFlow> list=new ArrayList<CashFlow>();
        list=cashSer.getAllCashFlowByType(username,type);
        map.put("data",list) ;
        map.put("total", list.size());
        return map;
    }
	
	//异步新增和修改
			@RequestMapping("/addOrEditCashFlowSava.do")
		    @ResponseBody
			public Map<String,Object> addOrEditCashFlowSava(CashFlow cashFlow){
				 Map<String,Object> map = new HashMap<String, Object>();
				 Boolean message=true;
				 try{
					  //修改保存功能
					  if(cashFlow.getId()!=null&&cashFlow.getId().length()>0){
						  cashSer.updateCashFlow(cashFlow); 
					  }else{
						  cashSer.saveCashFlow(cashFlow); 
					  }
					  String total=cashSer.getTotalIncomeByYear(cashFlow.getHolderName(),"2016");
					  map.put("total","2016年工资累计收入"+total+"元");
				 }
				   catch (Exception e) {  
					   message=false;
					  e.printStackTrace();
				 }
				  map.put("msg",message);
				  return map;
			  }

	/**
	  * 异步的删除
	  */
	@RequestMapping("/delete.do")
	@ResponseBody
	public  Map<String,Object>  delete(String id,String holderName){
		 Map<String,Object> map = new HashMap<String, Object>();
		 Boolean message=true;
		try{
			 cashSer.deleteCashFlowById(id);
			 String total=cashSer.getTotalIncomeByYear(holderName,"2016");
			 map.put("total","2016年工资累计收入"+total+"元");
			}
		   catch (Exception e) {  
			   message=false;
			   e.printStackTrace();
		 }
		 map.put("msg",message);
		return map;
	  }
	
}
