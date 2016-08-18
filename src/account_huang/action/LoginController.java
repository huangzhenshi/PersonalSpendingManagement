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
import account_huang.entity.User;
import account_huang.service.LoginService;
import account_huang.service.StaticService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;


@Controller
@RequestMapping("/login")
public class LoginController
{
	@Resource
	private LoginService logSer;
	@Resource
	private StaticService staticSer;
	private ActionContext actionContext = ActionContext.getContext();
	

	@RequestMapping("/login.do")
	public ModelAndView login(HttpServletRequest request){
			HttpSession session=request.getSession();
			session.removeAttribute("loginUser");
		   return new ModelAndView("login");  
	  }
	@RequestMapping("/check.do")
	  public ModelAndView check(HttpServletRequest request,User user,ModelMap model)
	  {
		 HttpSession session=request.getSession();
		  User userIn=logSer.getUserByMybatis(user);
		  if(userIn!=null&&userIn.getUsername().length()>0){
			  session.setAttribute("loginUser", userIn);
			  return new ModelAndView("records/static");  
		  }
		  return new ModelAndView("login");
	  }
	
	
	/* //定义实体对象属性，接收表单参数：用户名、密码
   private User user;
   public void setUser(User user) {
       this.user = user;
   }
   
   public User getUser() {
       return this.user;
   }
   private String records;
   public String getRecords() {
		return records;
	}

	public void setRecords(String records) {
		this.records = records;
	}
	private String message;

	private String owner;

	public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}*/
}