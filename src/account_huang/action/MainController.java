package account_huang.action;



import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/main")
public class MainController {
	
	  @RequestMapping(value = "{module}/getLeftMenu.do")
	    public ModelAndView getLeftMenu(@PathVariable("module")String module,String menuTag,ModelMap model) {
    		model.addAttribute("menuTag", menuTag);
	        return new ModelAndView("main/left-"+module);
	    }
	
}
