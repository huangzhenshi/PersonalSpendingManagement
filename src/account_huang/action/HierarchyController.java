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

import com.google.gson.Gson;

import account_huang.entity.Code;
import account_huang.entity.Hierarchy;
import account_huang.service.CodeService;
import account_huang.service.CommonService;
import account_huang.service.HierarchyService;
import account_huang.utils.Constants;
import account_huang.utils.PageCoral;
import account_huang.utils.Utils;


@Controller
@RequestMapping("/hierarchy")
public class HierarchyController{
	@Resource
	private HierarchyService hierarchyService;
	@Resource
	private CommonService commonService;
	
	@Resource
	private CodeService codeService;
	@RequestMapping("/toMainHierarchyPage.do")
	public ModelAndView toMainHierarchyPage(ModelMap model,String username){
			model.addAttribute("typeList",new Gson().toJson(hierarchyService.findAllType(username)));
			List<Code> categoryList=codeService.findByType(username, Constants.CODETYPE_HIERARCHY);
			model.addAttribute("categoryList",new Gson().toJson(categoryList));
		return  new ModelAndView("code/hierarchyIndex");
	}
	

	@RequestMapping("/getHierarchyGrid.do")
    @ResponseBody
    public Map<String,Object> getHierarchyGrid(PageCoral page,String username) {
        Map<String,Object> map = new HashMap<String, Object>();
       List<Hierarchy> list=hierarchyService.getAllHierarchyByPageAndSumTotal(page, username);
        map.put("data",list) ;
        Utils.setPageElementMap(map, page);
        return map;
    }
	
	
	
	
	//异步新增和修改
		@RequestMapping("/addOrEditHierarchySava.do")
	    @ResponseBody
		public Map<String,Object> addOrEditHierarchySava(Hierarchy hierarchy){
			 Map<String,Object> map = new HashMap<String, Object>();
			 Boolean message=true;
			 try{
				  //修改保存功能
				  if(hierarchy.getId()!=null&&hierarchy.getId().length()>0){
					  hierarchyService.updateHierarchy(hierarchy); 
				  }else{
					  hierarchyService.saveHierarchy(hierarchy); 
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
					hierarchyService.deleteHierarchy(id);
				}
			   catch (Exception e) {  
				   message=false;
				   e.printStackTrace();
			 }
			 map.put("msg",message);
			return map;
		  }
		
		
		@RequestMapping("/sort.do")
		@ResponseBody
		public  Map<String,Object>  sort(int firstNoTopOrder,String sortAfterIDs){
			 Map<String,Object> map = new HashMap<String, Object>();
			 Boolean message=true;
			try{
					commonService.sort(firstNoTopOrder,sortAfterIDs,Constants.TABLENAME_TIPS);
				}
			   catch (Exception e) {  
				   message=false;
				   e.printStackTrace();
			 }
			 map.put("msg",message);
			return map;
		  }
	
}
