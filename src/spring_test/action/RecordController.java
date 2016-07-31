package spring_test.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

import spring_test.entity.Record;
import spring_test.service.StaticService;

@Controller
@RequestMapping("/record")
public class RecordController  extends ActionSupport{
	@Resource
	private StaticService staticSer;
	
	@RequestMapping("/delete.do")
	public ModelAndView delete(String id)
	  {
		 staticSer.deleteRecordById(id);
		 return  new ModelAndView("records/static");
	  }
	

	@RequestMapping("/addOrUpdate.do")
	public ModelAndView addOrUpdate(HttpServletRequest request,String id,String holdername,ModelMap model){
		  if(id!=null&&id.length()>0){
			 Record record=staticSer.findById(id);
			 model.addAttribute("record", record);
		  }
		  model.addAttribute("holdername", holdername);
		  return  new ModelAndView("records/editOrUpdateRecord"); 
	  }
	
	@RequestMapping("/addOrEditSava.do")
	public ModelAndView addOrEditSava(Record record,ModelMap model){
		  //修改保存功能
		  if(record.getId()!=null&&record.getId().length()>0){
			  staticSer.updateRecord(record); 
		  }else{
			  staticSer.saveRecord(record); 
		  }
		  return  new ModelAndView("records/static");
	  }
	
	@RequestMapping("/getRecords.do")
    @ResponseBody
    public Map<String,Object> getRecords(String username) {
        Map<String,Object> map = new HashMap<String, Object>();
        List<Record> list=new ArrayList<Record>();
        list=staticSer.getCurrentRecordTest(username, 10);
        map.put("data",list) ;
        map.put("total", list.size());
        return map;
    }
}
