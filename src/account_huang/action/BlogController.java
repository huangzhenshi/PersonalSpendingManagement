package account_huang.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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

import org.apache.commons.io.FileUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

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
			String attachment=blog.getAttachment();
			if(!StringUtils.isEmpty(attachment)){
				attachment=attachment.replace("\\", "/");
			}
			blog.setAttachment(attachment);
			if(!StringUtils.isEmpty(blog.getCode())){
				model.addAttribute("code", "code");
			}
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
	
	@RequestMapping("/import.do")
    @ResponseBody
    public String importFile(HttpServletRequest request,@RequestParam(value = "file")MultipartFile file) throws Exception{
		String currentTime=Utils.getCurrentTimeString();
		String path = request.getSession().getServletContext().getRealPath("/upload");
        String fileName = file.getOriginalFilename();
        fileName=currentTime+fileName;
        File targetFile = new File(path, fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
            try {
				file.transferTo(targetFile);
				
			}catch (IOException e) {
				e.printStackTrace();
			}   
           return path+"\\"+currentTime; 
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
					  map.put("newId",blog.getId());
				  }else{
					  String uuid=UUID.randomUUID().toString().trim().replaceAll("-", "");
					  blog.setId(uuid);
					  blogService.saveBlog(blog); 
					  map.put("newId",uuid);
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
	    public List<String> findAllNextleverCategory(String username,String category) {
	        return hierarchyService.findAllNextLevelTypeByHoldernameAndParentType(username, category);
	    }
		
		
		@RequestMapping("/downAttachment.do")
		public void downAttachment(HttpServletResponse response,String path) throws Exception{
			path=path.replace("/", "\\");
			String[] filePathArr=path.split("\\\\");
			String fileName = filePathArr[filePathArr.length - 1]; 
			response.setHeader("Content-Type","application/force-download");
	        response.setContentType("multipart/form-data");   
	        response.setHeader( "Content-Disposition", "attachment;filename=" + new String( fileName.getBytes("gb2312"), "ISO8859-1" ) ); 
	        InputStream in = new FileInputStream(path); 
       	 	byte[] buffer = new byte[512];  
       	 	OutputStream out = response.getOutputStream(); 
	        try {
	        	int count = 0;
	        	while ((count = in.read(buffer)) > 0) {
	        				out.write(buffer, 0, count);
	        				}

	        	}catch (Exception e) {
		        	e.printStackTrace();
	        	}finally{
	        		if(out != null){
	        			out.flush();
	        			out.close();
	        		}
	        		if(in != null){
	        			in.close();
	        		}
	        	}		
		}
		
		
		@RequestMapping("/deleteAttachment.do")
	    @ResponseBody
	    public Boolean deleteAttachment(String path) {
			path=path.replace("/", "\\");
			String[] filePathArr=path.split("\\\\");
			String fileName = filePathArr[filePathArr.length - 1]; 
	        return Utils.deleteFile(path);
	    }
	
}
