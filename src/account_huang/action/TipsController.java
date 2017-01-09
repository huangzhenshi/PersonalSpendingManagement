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

import account_huang.entity.Code;
import account_huang.entity.Tips;
import account_huang.service.CodeService;
import account_huang.service.TipsService;
import account_huang.utils.Constants;
import account_huang.utils.PageCoral;
import account_huang.utils.Utils;


@Controller
@RequestMapping("/tips")
public class TipsController{
	@Resource
	private TipsService tipsService;
	
	@Resource
	private CodeService codeService;
	@RequestMapping("/toMainTipsPage.do")
	public String toMainTipsPage(){
		return  "tips/tipsIndex";
	}
	

	@RequestMapping("/getTipsGrid.do")
    @ResponseBody
    public Map<String,Object> getTipsGrid(PageCoral page,Tips tips) {
        Map<String,Object> map = new HashMap<String, Object>();
       List<Tips> list=tipsService.getAllTipsByPageAndSumTotal(page, tips);
        map.put("data",list) ;
        Utils.setPageElementMap(map, page);
        return map;
    }
	
	
	
	
	//异步新增和修改
		@RequestMapping("/addOrEditTipsSava.do")
	    @ResponseBody
		public Map<String,Object> addOrEditTipsSava(Tips tips){
			 Map<String,Object> map = new HashMap<String, Object>();
			 Boolean message=true;
			 try{
				  //修改保存功能
				  if(tips.getId()!=null&&tips.getId().length()>0){
					  tipsService.updateTips(tips); 
				  }else{
					  tipsService.saveTips(tips); 
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
					tipsService.deleteTips(id);
				}
			   catch (Exception e) {  
				   message=false;
				   e.printStackTrace();
			 }
			 map.put("msg",message);
			return map;
		  }
	
}
