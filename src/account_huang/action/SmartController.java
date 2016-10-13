package account_huang.action;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import account_huang.entity.ElseDetail;
import account_huang.entity.Record;
import account_huang.entity.EchartEntity;
import account_huang.service.SmartService;
import account_huang.service.StaticService;
import account_huang.utils.PageCoral;
import account_huang.utils.SearchEntity;
import account_huang.utils.Utils;

@Controller
@RequestMapping("/smart")
public class SmartController {
	
	@Resource
	private SmartService smartSer;
	
	@RequestMapping("/getMonthMainPage.do")
	public  ModelAndView getMonthMainPage(SearchEntity search,ModelMap model){
		List<EchartEntity> list=smartSer.getNetAssertByMonth(search);
		smartSer.setEchartLineValues(model,list);
		return new  ModelAndView("smart/accountMonth");
	}
	

	@RequestMapping("/getSmartByMonthGrid.do")
    @ResponseBody
    public Map<String,Object> getSmartByMonthGrid(SearchEntity search) {
        Map<String,Object> map = new HashMap<String, Object>();
        List<Record> list=smartSer.getMonth(search);
        map.put("data",list) ;
        return map;
    }
	  @RequestMapping(value = "/gotoDetail.do")
	    public ModelAndView gotoDetail(SearchEntity search,ModelMap model) throws Exception {
		  Gson gs=new Gson();
		  List<Record> listRecord=smartSer.getMonth(search);
		  List<String> names=new ArrayList<String>();
		  List<String> values=new ArrayList<String>();
		  List<ElseDetail> listByGroup=smartSer.getDetailByDateAndAmount(search);
		 if(listRecord!=null){ 
			 smartSer.processFilterValuesToShowByRecordAndElseDetail(model,listRecord.get(0),listByGroup);
			 model.addAttribute("all", listRecord.get(0).getCostDaily());
				
		 }
		  	model.addAttribute("times", search.getQssj());
		  	model.addAttribute("month", search.getTimes());
		  	
			model.addAttribute("elseTotal", search.getUtil());
			model.addAttribute("names", names);
			model.addAttribute("values", values);
	        return new ModelAndView("smart/smartDetail");
	    }
	  
	    @RequestMapping("/getElseDetailGrid.do")
	    @ResponseBody
	    public Map<String,Object> getElseDetailGrid(SearchEntity search) {
	        Map<String,Object> map = new HashMap<String, Object>();
	        List<ElseDetail> list=smartSer.getDetailByDate(search);
	        map.put("data",list) ;
	        return map;
	    }
	
}
