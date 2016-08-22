package account_huang.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import account_huang.entity.Record;
import account_huang.entity.User;
import account_huang.service.StaticService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@RequestMapping("/record")
public class RecordController  extends ActionSupport{
	@Resource
	private StaticService staticSer;
	@RequestMapping("/toMainRecordPage.do")
	public ModelAndView toMainRecordPage(ModelMap model,String username){
		Record rec=staticSer.getTotalByDate(username);
		staticSer.setAutoFill(model,username);
		model.addAttribute("costAll", rec.getCostThisMonth());
		model.addAttribute("profitAll", rec.getProfitThisMonth());
		return  new ModelAndView("records/static");
	}
	@RequestMapping("/getRecordReview.do")
	public ModelAndView getRecordReview(ModelMap model,String qssj,String jssj,String username){
		List<Record> list=staticSer.getRecordByDate(username,qssj,jssj);
		Gson gs=new Gson();
		model.addAttribute("records", gs.toJson(list));
		if(StringUtils.isNotEmpty(qssj)&&StringUtils.isNotEmpty(jssj)){
			model.addAttribute("qssj",qssj);
			model.addAttribute("jssj",jssj);
		}
		
		
		return  new ModelAndView("records/reviewRecords");
	}
	
	@RequestMapping("/delete.do")
	public ModelAndView delete(String id,ModelMap model,String username)
	  {
		 staticSer.deleteRecordById(id);
		 Record rec=staticSer.getTotalByDate(username);
			model.addAttribute("costAll", rec.getCostThisMonth());
			model.addAttribute("profitAll", rec.getProfitThisMonth());
		 return  new ModelAndView("records/static");
	  }
	
	@RequestMapping("/addOrEditRecordSava.do")
	public ModelAndView addOrEditRecordSava(Record record,ModelMap model){
		  //修改保存功能
		  if(record.getId()!=null&&record.getId().length()>0){
			  staticSer.updateRecord(record); 
		  }else{
			  staticSer.saveRecord(record); 
		  }
		  	Record rec=staticSer.getTotalByDate(record.getHolderName());
			model.addAttribute("costAll", rec.getCostThisMonth());
			model.addAttribute("profitAll", rec.getProfitThisMonth());
		  return  new ModelAndView("records/static");
	  }
	
	@RequestMapping("/getRecordByDate.do")
    @ResponseBody
    public Map<String,Object> getRecordByDate(String username,String qssj,String jssj) {
        Map<String,Object> map = new HashMap<String, Object>();
        List<Record> list=new ArrayList<Record>();
        list=staticSer.getRecordByDate(username,qssj,jssj);
        map.put("data",list) ;
        map.put("total", list.size());
        return map;
    }
	
}
