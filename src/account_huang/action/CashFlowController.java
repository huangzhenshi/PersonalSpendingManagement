package account_huang.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import account_huang.entity.CashFlow;
import account_huang.service.CashFlowService;

@Controller
@RequestMapping("/cashFlow")
public class CashFlowController {
	@Resource
	private CashFlowService cashSer;
	
	@RequestMapping("/toCashFlowMainPage.do")
	public ModelAndView toMainCashFlowPage(String username,String year,ModelMap model){
		String total=cashSer.getTotalIncomeByYear(username,year);
		model.addAttribute("total",year+"年工资累计收入"+total+"元");
		return  new ModelAndView("cashFlow/index");
	}
	
	@RequestMapping("/getAllCashFlow.do")
    @ResponseBody
    public Map<String,Object> getAllCashFlow(String username,String type){
        Map<String,Object> map = new HashMap<String, Object>();
        List<CashFlow> list=new ArrayList<CashFlow>();
        list=cashSer.getAllCashFlow(username,type);
        map.put("data",list) ;
        map.put("total", list.size());
        return map;
    }
	
	@RequestMapping("/editOrUpdateCashFlow.do")
	public ModelAndView editOrUpdateCashFlow(String id,String holderName,ModelMap model){
		String message="新增资金流转信息";  
		if(id!=null&&id.length()>0){
			 CashFlow cash=cashSer.findById(id);
			 model.addAttribute("cashFlow", cash);
			 message="修改资金流转信息";
		  }
		  model.addAttribute("holderName", holderName);
		  model.addAttribute("message", message);
		  return  new ModelAndView("cashFlow/editOrUpdateCashFlow"); 
	  }
	
	@RequestMapping("/addOrEditCashFlowSava.do")
	public ModelAndView addOrEditCashFlowSava(CashFlow cash,ModelMap model){
		  //修改保存功能
		  if(cash.getId()!=null&&cash.getId().length()>0){
			  cashSer.updateCashFlow(cash); 
		  }else{
			  cashSer.saveCashFlow(cash); 
		  }
		  
		  String total=cashSer.getTotalIncomeByYear(cash.getHolderName(),"2016");
			model.addAttribute("total","2016年工资累计收入"+total+"元");
		  return  new ModelAndView("cashFlow/index");
	  }
	
	
	@RequestMapping("/delete.do")
	public ModelAndView delete(String id,ModelMap model,String holderName)
	  {
		cashSer.deleteCashFlowById(id);
		  String total=cashSer.getTotalIncomeByYear(holderName,"2016");
			model.addAttribute("total","2016年工资累计收入"+total+"元");
		 return  new ModelAndView("cashFlow/index");
	  }
	
}
