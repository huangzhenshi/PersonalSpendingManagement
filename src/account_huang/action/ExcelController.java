package account_huang.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import account_huang.service.CommonService;
import account_huang.service.ExcelService;

@Controller
@RequestMapping("/excel")
public class ExcelController {
	@Resource
	private ExcelService excelService;
	
	@RequestMapping("/toMainExcelPage.do")
	public ModelAndView toMainExcelPage(){
		return  new ModelAndView("excel/indexExcel");
	}
	
	@RequestMapping("/downloadAccount.do")
	public void downloadAccount(HttpServletResponse response,String username){
		excelService.downloadExpense(username, response);
	}
	
	
	
	
}
