package account_huang.action;

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

import account_huang.entity.Property;
import account_huang.entity.User;
import account_huang.service.PropertyService;

@Controller
@RequestMapping("/property")
public class PropertyController {
	@Resource
	private PropertyService propertySer;
	
	@RequestMapping("/toPropertyMainPage.do")
	public ModelAndView toMainPropertyPage(){
		return  new ModelAndView("property/index");
	}
	
	@RequestMapping("/getAllProperty.do")
    @ResponseBody
    public Map<String,Object> getAllProperty(String username){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Property> list=new ArrayList<Property>();
	        list=propertySer.getAllProperty(username);
	        map.put("data",list) ;
	        map.put("total", list.size());
        return map;
    }
	
	@RequestMapping("/editOrUpdateProperty.do")
	public ModelAndView editOrUpdateProperty(String id,String holderName,ModelMap model){
		String message="新增资产信息条目";  
		if(id!=null&&id.length()>0){
			 Property property=propertySer.findById(id);
			 model.addAttribute("property", property);
			 message="修改资产信息条目";
		  }
		  model.addAttribute("holderName", holderName);
		  model.addAttribute("message", message);
		  return  new ModelAndView("property/editOrUpdateProperty"); 
	  }
	
	@RequestMapping("/addOrEditPropertySava.do")
	public ModelAndView addOrEditPropertySava(Property property,ModelMap model){
		  //修改保存功能
		  if(property.getId()!=null&&property.getId().length()>0){
			  propertySer.updateProperty(property); 
		  }else{
			  propertySer.saveProperty(property); 
		  }
		  model.addAttribute("navTag","account");
		  model.addAttribute("menuTag","propertyNav");
		  return  new ModelAndView("main/index");
	  }
	
	
	@RequestMapping("/delete.do")
	public ModelAndView delete(String id)
	  {
		propertySer.deletePropertyById(id);
		 return  new ModelAndView("property/index");
	  }
}
