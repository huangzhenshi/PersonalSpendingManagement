package account_huang.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;




import account_huang.entity.Code;
import account_huang.service.CodeService;
import account_huang.utils.SearchEntity;

@Controller
@RequestMapping("/code")
public class CodeController {
	@Resource
	private CodeService codeSer;
	
	@RequestMapping("/toMainRecordPage.do")
	public ModelAndView getAllCodes(String message,ModelMap model){
		model.addAttribute("message",message);
		return new ModelAndView("code/index");
	}
	
	@RequestMapping("/getCodeGrid.do")
    @ResponseBody
    public Map<String,Object> getCodeGrid(SearchEntity search) {
        Map<String,Object> map = new HashMap<String, Object>();
        List<Code> list=codeSer.getAllCodes(search);
        map.put("data",list) ;
        return map;
    }
	
	
	/**
	 * 修改码表值的时候不能修改holdername所以前台不需要传递 holdername参数，但是新增的时候必须塞给code
	 * @return
	 */
	@RequestMapping("/addOrEditCodeSava.do")
	@ResponseBody
	public Map<String,Object> addOrEditCodeSava(Code code){
			String message="";
		  //修改保存功能
		  if(code.getId()!=null&&code.getId().length()>0){
			  message="Update Success!";
			  int result= codeSer.updateCode(code); 
			  if(result<1){
					message="Update Fail!";
				}
		  }else{
			  message="Add Success!";
			  int result=codeSer.saveCode(code); 
			  if(result<1){
					message="Add Fail!";
				}
		  }
		  Map<String,Object> map = new HashMap<String, Object>();
		  map.put("message",message);
		  return map;
	  }
	
	
	@RequestMapping("/delete.do")
	public ModelAndView delete(ModelMap model,String id)
	  {
		String message="delete fail!";
		 int result=codeSer.deleteCodeById(id);
		 if(result>0){
			 message="delete Success!";
		 }
		 return new ModelAndView("redirect:/code/toMainRecordPage.do?message="+message);
	  }
	
	
}