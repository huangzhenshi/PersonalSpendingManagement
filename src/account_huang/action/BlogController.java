package account_huang.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import account_huang.entity.Code;
import account_huang.entity.Blog;
import account_huang.service.CodeService;
import account_huang.service.BlogService;
import account_huang.service.HierarchyService;
import account_huang.utils.Constants;
import account_huang.utils.PageCoral;
import account_huang.utils.Utils;


@Controller
@RequestMapping("/blog")
public class BlogController{
	@Resource
	private BlogService blogService;
	
	@Resource
	private HierarchyService hierarchyService;
	@RequestMapping("/toMainBlogPage.do")
	public ModelAndView toMainBlogPage(ModelMap model,String username){
		List<String> mainTypeList=hierarchyService.findAllMainTypeByHoldernameAndCategory(username);
		model.addAttribute("mainTypeList", mainTypeList);
		return  new ModelAndView("blog/blogIndex");
	}
	
	@RequestMapping("/toCkeditorPage.do")
	public ModelAndView toCkeditorPage(ModelMap model,String id,String username){
		List<String> mainTypeList=hierarchyService.findAllMainTypeByHoldernameAndCategory(username);
		model.addAttribute("mainTypeList", mainTypeList);
	
		if(!StringUtils.isEmpty(id)){
			Blog blog=blogService.findById(id);
			String category=blog.getCategory();
			List<String> nextCategoryList=hierarchyService.findAllNextLevelTypeByHoldernameAndParentType(username, category);
			model.addAttribute("nextCategoryList", nextCategoryList);
			blog.setContent(blog.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;"));
			model.addAttribute("blog", blog);
		}
		
		return  new ModelAndView("blog/blogCkeditorPage");
	}

	@RequestMapping("/getBlogGrid.do")
    @ResponseBody
    public Map<String,Object> getBlogGrid(PageCoral page,Blog blog) {
        Map<String,Object> map = new HashMap<String, Object>();
       List<Blog> list=blogService.getAllBlogByPageAndSumTotal(page, blog);
        map.put("data",list) ;
        Utils.setPageElementMap(map, page);
        return map;
    }
	
	
	
	
	//异步新增和修改
		@RequestMapping("/addOrEditBlogSava.do")
	    @ResponseBody
		public Map<String,Object> addOrEditBlogSava(Blog blog){
			blog.setLastTime(Utils.getCurrentTime());
			 Map<String,Object> map = new HashMap<String, Object>();
			 Boolean message=true;
			 try{
				  //修改保存功能
				  if(blog.getId()!=null&&blog.getId().length()>0){
					  blogService.updateBlog(blog); 
				  }else{
					  blog.setId(UUID.randomUUID().toString().trim().replaceAll("-", ""));
					  blogService.saveBlog(blog); 
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
					blogService.deleteBlog(id);
				}
			   catch (Exception e) {  
				   message=false;
				   e.printStackTrace();
			 }
			 map.put("msg",message);
			return map;
		  }
		
		
		@RequestMapping("/findAllNextleverCategory.do")
	    @ResponseBody
	    public Map<String,Object> findAllNextleverCategory(String username,String category) {
	        Map<String,Object> map = new HashMap<String, Object>();
	       List<String> list=hierarchyService.findAllNextLevelTypeByHoldernameAndParentType(username, category);
	        map.put("typeList",list) ;
	        return map;
	    }
	
}
