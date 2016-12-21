package account_huang.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import account_huang.entity.Record;
import account_huang.entity.Todo;
import account_huang.entity.User;
import account_huang.service.LoginService;
import account_huang.service.StaticService;
import account_huang.service.TodoService;



@Controller
@RequestMapping("/login")
public class LoginController
{
	@Resource
	private LoginService logSer;
	@Resource
	private StaticService staticSer;
	@Resource
	private TodoService todoSer;
	//只开放通过   http://localhost:8080/PersonalSpendingManagement/ 

	@RequestMapping("/login.do")
	public ModelAndView login(HttpServletRequest request){
			HttpSession session=request.getSession();
			session.removeAttribute("loginUser");
		   return new ModelAndView("login");  
	  }
	/**
	 * 校验用户名和密码
	 * 先校验有没有待办事项，如果有待办事项则第一个展示的是 待办事项的jsp，否则就进入我要记账界面
	 * 
	 */
	@RequestMapping("/check.do")
	  public ModelAndView check(HttpSession httpSession,HttpServletRequest request,User user,ModelMap model)
	  {
		 HttpSession session=request.getSession();
		  User userIn=logSer.getUserByMybatis(user);
		  if(userIn!=null&&userIn.getUsername().length()>0){
			  httpSession.setAttribute("username",user.getUsername());
			  httpSession.setAttribute("loginUser",userIn);
			  String username=userIn.getUsername();
			  /*List<Todo> todoList=todoSer.getAllTodo(username);
				  if(todoList!=null&&todoList.size()>0){
					  return new ModelAndView("todo/index");
				  }else{*/
					    Record rec=staticSer.getTotalByDate(username);
					    staticSer.setAutoFill(model,username);
					    String totalCostThisMonth="0";
					    String totalProfitThisMonth="0";
					    if(rec!=null){
					    	totalCostThisMonth= rec.getCostThisMonth();
					    	totalProfitThisMonth=rec.getProfitThisMonth();
					    }
						model.addAttribute("costAll",totalCostThisMonth);
						model.addAttribute("profitAll",totalProfitThisMonth );
					  return new ModelAndView("main/index");
				/*  }  */
		  }
		  return new ModelAndView("login");
	  }
	
}