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
import account_huang.entity.Diary;
import account_huang.service.CodeService;
import account_huang.service.DiaryService;
import account_huang.utils.Constants;
import account_huang.utils.PageCoral;
import account_huang.utils.Utils;


@Controller
@RequestMapping("/diary")
public class DiaryController{
	@Resource
	private DiaryService diaryService;
	
	@Resource
	private CodeService codeService;
	@RequestMapping("/toMainDiaryPage.do")
	public ModelAndView toMainDiaryPage(ModelMap model,String username,String message){
		List<Code> codeList=codeService.findByType(username, Constants.CODETYPE_ARTICLE);
		model.addAttribute("codeList", codeList);
		return  new ModelAndView("diary/diaryIndex");
	}
	
	@RequestMapping("/toCkeditorPage.do")
	public ModelAndView toCkeditorPage(ModelMap model,String id,String username){
		List<Code> codeList=codeService.findByType(username, Constants.CODETYPE_ARTICLE);
		model.addAttribute("codeList", codeList);
		
		if(!StringUtils.isEmpty(id)){
			Diary diary=diaryService.findById(id);
			diary.setContent(diary.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;"));
			model.addAttribute("diary", diary);
		}
		
		return  new ModelAndView("diary/diaryCkeditorPage");
	}

	@RequestMapping("/getDiaryGrid.do")
    @ResponseBody
    public Map<String,Object> getDiaryGrid(PageCoral page,Diary diary) {
        Map<String,Object> map = new HashMap<String, Object>();
       List<Diary> list=diaryService.getAllDiaryByPageAndSumTotal(page, diary);
        map.put("data",list) ;
        Utils.setPageElementMap(map, page);
        return map;
    }
	
	
	
	
	//异步新增和修改
		@RequestMapping("/addOrEditDiarySava.do")
	    @ResponseBody
		public Map<String,Object> addOrEditDiarySava(Diary diary){
			diary.setLastTime(Utils.getCurrentTime());
			 Map<String,Object> map = new HashMap<String, Object>();
			 Boolean message=true;
			 try{
				  //修改保存功能
				  if(diary.getId()!=null&&diary.getId().length()>0){
					  diaryService.updateDiary(diary); 
				  }else{
					  diaryService.saveDiary(diary); 
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
					diaryService.deleteDiary(id);
				}
			   catch (Exception e) {  
				   message=false;
				   e.printStackTrace();
			 }
			 map.put("msg",message);
			return map;
		  }
	
}
