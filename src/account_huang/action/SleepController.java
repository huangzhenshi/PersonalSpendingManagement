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

import account_huang.entity.Sleep;
import account_huang.entity.User;
import account_huang.service.SleepService;
import account_huang.service.StaticService;
import account_huang.utils.PageCoral;
import account_huang.utils.SearchEntity;
import account_huang.utils.Utils;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@RequestMapping("/sleep")
public class SleepController  extends ActionSupport{
	@Resource
	private SleepService sleepSer;
	@RequestMapping("/toMainSleepPage.do")
	public ModelAndView toMainSleepPage(ModelMap model,String username,String message){
		if(!StringUtils.isEmpty(message)){
			model.addAttribute("message", message);
		}
		return  new ModelAndView("sleep/sleepIndex");
	}

	@RequestMapping("/getSleepGrid.do")
    @ResponseBody
    public Map<String,Object> getSleepGrid(String username,PageCoral page) {
        Map<String,Object> map = new HashMap<String, Object>();
       List<Sleep> list=sleepSer.getAllSleepByPageAndSumTotal(page, username);
        map.put("data",list) ;
        Utils.setPageElementMap(map, page);
        return map;
    }
	
	//异步新增和修改
		@RequestMapping("/addOrEditSleepSava.do")
	    @ResponseBody
		public Map<String,Object> addOrEditSleepSava(Sleep sleep){
			 Map<String,Object> map = new HashMap<String, Object>();
			 Boolean message=true;
			 try{
				  //修改保存功能
				  if(sleep.getId()!=null&&sleep.getId().length()>0){
					  sleepSer.updateSleep(sleep); 
				  }else{
					  sleepSer.saveSleep(sleep); 
				  }
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
		public  Map<String,Object>  delete(String id){
			 Map<String,Object> map = new HashMap<String, Object>();
			 Boolean message=true;
			try{
					sleepSer.deleteSleep(id);
				}
			   catch (Exception e) {  
				   message=false;
				   e.printStackTrace();
			 }
			 map.put("msg",message);
			return map;
		  }
	
}
