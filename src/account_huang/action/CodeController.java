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
	/**
	 * 修改码表值的时候不能修改holdername所以前台不需要传递 holdername参数，但是新增的时候必须塞给code
	 * @return
	 */
	@RequestMapping("/addOrEditCodeSava.do")
	public ModelAndView addOrEditCodeSava(Code code,ModelMap model,String holderName){
		  //修改保存功能
		  if(code.getId()!=null&&code.getId().length()>0){
			  codeSer.updateCode(code); 
		  }else{
			  code.setHolderName(holderName);
			  codeSer.saveCode(code); 
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