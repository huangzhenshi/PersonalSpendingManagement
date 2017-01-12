package account_huang.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import account_huang.entity.Words;
import account_huang.service.CodeService;
import account_huang.service.CommonService;
import account_huang.service.WordsService;
import account_huang.utils.Constants;
import account_huang.utils.PageCoral;
import account_huang.utils.Utils;


@Controller
@RequestMapping("/words")
public class WordsController{
	@Resource
	private WordsService wordsService;
	@Resource
	private CommonService commonService;
	
	@Resource
	private CodeService codeService;
	@RequestMapping("/toMainWordsPage.do")
	public String toMainWordsPage(){
		return  "words/wordsIndex";
	}
	

	@RequestMapping("/getWordsGrid.do")
    @ResponseBody
    public Map<String,Object> getWordsGrid(PageCoral page,Words words) {
        Map<String,Object> map = new HashMap<String, Object>();
       List<Words> list=wordsService.getAllWordsByPageAndSumTotal(page, words);
        map.put("data",list) ;
        Utils.setPageElementMap(map, page);
        return map;
    }
	
	
	
	
	//异步新增和修改
		@RequestMapping("/addOrEditWordsSava.do")
	    @ResponseBody
		public Map<String,Object> addOrEditWordsSava(Words words){
			 Map<String,Object> map = new HashMap<String, Object>();
			 Boolean message=true;
			 try{
				  //修改保存功能
				  if(words.getId()!=null&&words.getId().length()>0){
					  wordsService.updateWords(words); 
				  }else{
					  wordsService.saveWords(words); 
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
					wordsService.deleteWords(id);
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
					commonService.sort(firstNoTopOrder,sortAfterIDs,Constants.TABLENAME_WORDS);
				}
			   catch (Exception e) {  
				   message=false;
				   e.printStackTrace();
			 }
			 map.put("msg",message);
			return map;
		  }
	
}
