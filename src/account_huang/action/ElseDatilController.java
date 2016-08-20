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

import account_huang.entity.ElseDetail;
import account_huang.entity.User;
import account_huang.service.ElseDetailService;

@Controller
@RequestMapping("/elseDetail")
public class ElseDatilController {
	@Resource
	private ElseDetailService elseSer;
	/*
	@RequestMapping("/addOrEditElseDetailSava.do")
	public ModelAndView addOrEditElseDetailSava(ElseDetail card,ModelMap model){
		  //修改保存功能
		  if(card.getId()!=null&&card.getId().length()>0){
			  elseSer.updateElseDetail(card); 
		  }else{
			  elseSer.saveElseDetail(card); 
		  }
		  return  new ModelAndView("cards/index");
	  }*/
	
	
	@RequestMapping("/delete.do")
	public ModelAndView delete(String id)
	  {
		elseSer.deleteByTimes(id);
		 return  new ModelAndView("cards/index");
	  }
	

/*
	
	@RequestMapping("/editOrUpdateElseDetail.do")
	public ModelAndView editOrUpdateElseDetail(String id,String holderName,ModelMap model){
		String message="新增银行卡信息";  
		if(id!=null&&id.length()>0){
			 ElseDetail card=elseSer.findById(id);
			 model.addAttribute("card", card);
			 message="修改银行卡信息";
		  }
		  model.addAttribute("holderName", holderName);
		  model.addAttribute("message", message);
		  return  new ModelAndView("cards/editOrUpdateElseDetail"); 
	  }*/
	
}
