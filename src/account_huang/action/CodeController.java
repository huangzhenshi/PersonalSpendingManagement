package account_huang.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import account_huang.entity.Code;
import account_huang.service.CodeService;

@Controller
@RequestMapping("/code")
public class CodeController {
	@Resource
	private CodeService codeSer;
	
	@RequestMapping("/getAllCodes.do")
	public ModelAndView getAllCodes(ModelMap model,String index,String username){
		List<Code> list=codeSer.getAllCodes(username,index);
		model.addAttribute("codes", new Gson().toJson(list));
		return  new ModelAndView("code/index");
	}
	
	@RequestMapping("/addOrEditCodeSava.do")
	public ModelAndView addOrEditCodeSava(Code Code,ModelMap model,String holderName){
		  //修改保存功能
		  if(Code.getId()!=null&&Code.getId().length()>0){
			  codeSer.updateCode(Code); 
		  }else{
			  codeSer.saveCode(Code); 
		  }
		  List<Code> list=codeSer.getAllCodes(holderName,"");
		  model.addAttribute("codes", new Gson().toJson(list));
		  return  new ModelAndView("code/index");
	  }
	
	
	@RequestMapping("/delete.do")
	public ModelAndView delete(ModelMap model,String id,String holderName)
	  {
		  codeSer.deleteCodeById(id);
		  List<Code> list=codeSer.getAllCodes(holderName,"");
		  model.addAttribute("codes", new Gson().toJson(list));
		 return  new ModelAndView("code/index");
	  }
	
}