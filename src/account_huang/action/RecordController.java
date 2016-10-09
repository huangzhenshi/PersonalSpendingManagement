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
import account_huang.utils.PageCoral;
import account_huang.utils.SearchEntity;
import account_huang.utils.Utils;

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
		if(rec!=null){
			model.addAttribute("costAll", rec.getCostThisMonth());
			model.addAttribute("profitAll", rec.getProfitThisMonth());
		}
		
		return  new ModelAndView("records/static");
	}
	@RequestMapping("/getRecordReview.do")
	public ModelAndView getRecordReview(){
		/*开始用 grid reload来重新加载列表
		 * List<Record> list=staticSer.getRecordByDate(search,page);
		String qssj=search.getQssj();
		String jssj=search.getJssj();
		Gson gs=new Gson();
		model.addAttribute("records", gs.toJson(list));
		if(StringUtils.isNotEmpty(qssj)&&StringUtils.isNotEmpty(jssj)){
			model.addAttribute("qssj",qssj);
			model.addAttribute("jssj",jssj);
		}*/
		return  new ModelAndView("records/reviewRecords");
	}
	
	@RequestMapping("/getRecordReviewGrid.do")
    @ResponseBody
    public Map<String,Object> getRecordReviewGrid(SearchEntity search,PageCoral page) {
        Map<String,Object> map = new HashMap<String, Object>();
        List<Record> list=staticSer.getRecordByDate(search,page);
        map.put("data",list) ;
        Utils.setPageElementMap(map, page);
        return map;
    }
	
	
	@RequestMapping("/delete.do")
	public ModelAndView delete(String id,ModelMap model,String username)
	  {
		 staticSer.deleteRecordById(id);
		 staticSer.setAutoFill(model,username);
		 Record rec=staticSer.getTotalByDate(username);
			model.addAttribute("costAll", rec.getCostThisMonth());
			model.addAttribute("profitAll", rec.getProfitThisMonth());
		 return  new ModelAndView("records/static");
	  }

	
	
	//异步新增和修改
	@RequestMapping("/addOrEditRecordSava.do")
    @ResponseBody
	public Map<String,Object> addOrEditRecordSava(Record record) throws Exception{
		  //修改保存功能
		  if(record.getId()!=null&&record.getId().length()>0){
			  staticSer.updateRecord(record); 
		  }else{
			  staticSer.saveRecord(record); 
		  }
		  Map<String,Object> map = new HashMap<String, Object>();
		  map.put("msg","Operation Success!");
		  Record rec=staticSer.getTotalByDate(record.getHolderName());
		  map.put("costAll", rec.getCostThisMonth());
		  map.put("profitAll", rec.getProfitThisMonth());
		  return map;
	  }
	
	
	@RequestMapping("/getRecordByDate.do")
    @ResponseBody
    public Map<String,Object> getRecordByDate(SearchEntity search,PageCoral page) {
        Map<String,Object> map = new HashMap<String, Object>();
        List<Record> list=staticSer.getRecordByDate(search,page);
        map.put("data",list) ;
        Utils.setPageElementMap(map, page);
        return map;
    }
	
	
/*	@RequestMapping("/addOrEditRecordSava.do")
	public ModelAndView addOrEditRecordSava(Record record,ModelMap model) throws Exception{
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
	  }*/
	//全部刷新
/*	@RequestMapping("/addOrEditRecordSava.do")
	public ModelAndView addOrEditRecordSava(Record record,ModelMap model) throws Exception{
		  //修改保存功能
		  if(record.getId()!=null&&record.getId().length()>0){
			  staticSer.updateRecord(record); 
		  }else{
			  staticSer.saveRecord(record); 
		  }
		  	Record rec=staticSer.getTotalByDate(record.getHolderName());
			model.addAttribute("costAll", rec.getCostThisMonth());
			model.addAttribute("profitAll", rec.getProfitThisMonth());
			model.addAttribute("navTag","account");
			model.addAttribute("menuTag","doRecordNav");
		  return  new ModelAndView("main/index");
	  }*/
	
}
