package spring_test.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

import spring_test.entity.Record;
import spring_test.entity.User;
import spring_test.service.StaticService;

@Controller
@RequestMapping("/record")
public class RecordController  extends ActionSupport{
	@Resource
	private StaticService staticSer;
	@RequestMapping("/toMainRecordPage.do")
	public ModelAndView toMainRecordPage(){
		return  new ModelAndView("records/static");
	}
	@RequestMapping("/getRecordReview.do")
	public ModelAndView getRecordReview(HttpServletRequest request,ModelMap model,String qssj,String jssj){
		HttpSession session=request.getSession();
		User userInsession=(User) session.getAttribute("loginUser");
		List<Record> list=staticSer.getRecordByDate(userInsession.getUsername(),qssj,jssj);
		Gson gs=new Gson();
		model.addAttribute("records", gs.toJson(list));
		return  new ModelAndView("records/reviewRecords");
	}
	
	@RequestMapping("/delete.do")
	public ModelAndView delete(String id)
	  {
		 staticSer.deleteRecordById(id);
		 return  new ModelAndView("records/static");
	  }
	

	@RequestMapping("/addOrUpdate.do")
	public ModelAndView addOrUpdate(String id,String holderName,ModelMap model){
		String message="新增记录";  
		if(id!=null&&id.length()>0){
			 Record record=staticSer.findById(id);
			 model.addAttribute("record", record);
			 message="修改记录";
		  }
		  model.addAttribute("holderName", holderName);
		  model.addAttribute("message", message);
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
