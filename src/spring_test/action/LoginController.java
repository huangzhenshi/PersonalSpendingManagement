package spring_test.action;

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

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;

import spring_test.entity.Record;
import spring_test.entity.User;
import spring_test.service.LoginService;
import spring_test.service.StaticService;


@Controller
public class LoginController
{
	@Resource
	private LoginService logSer;
	@Resource
	private StaticService staticSer;
	private ActionContext actionContext = ActionContext.getContext();
	
	
	 //定义实体对象属性，接收表单参数：用户名、密码
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
	}

	public String login()
	  {
				  Map session = actionContext.getSession();
				  session.remove("message");
		  return "loginPage";  
	  }
	  public String check()
	  {
				  User userIn=logSer.getUserByMybatis(user);
				  
				  if(userIn!=null&&userIn.getUsername().length()>0){
					  owner=userIn.getUsername();
					   records=staticSer.getCurrentRecord(userIn.getUsername(), 10);
						 return "static";  
				  }
				  message="4";
				  return "loginPage"; 
		 
	  }
}