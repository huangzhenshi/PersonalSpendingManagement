package account_huang.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import account_huang.entity.Todo;
import account_huang.service.TodoService;

@Controller
@RequestMapping("/todo")
public class TodoController {
	@Resource
	private TodoService TodoSer;
	
	@RequestMapping("/toTodoMainPage.do")
	public ModelAndView toMainTodoPage(){
		
		return  new ModelAndView("todo/index");
	}
	
	
	
	@RequestMapping("/getAllTodo.do")
    @ResponseBody
    public Map<String,Object> getAllTodo(String username){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Todo> list=new ArrayList<Todo>();
        list=TodoSer.getAllTodo(username);
        map.put("data",list) ;
        map.put("total", list.size());
        return map;
    }
	/*
	
	@RequestMapping("/editOrUpdateTodo.do")
	public ModelAndView editOrUpdateTodo(String id,String holderName,ModelMap model){
		String message="新增银行卡信息";  
		if(id!=null&&id.length()>0){
			 Todo Todo=TodoSer.findById(id);
			 model.addAttribute("Todo", Todo);
			 message="修改银行卡信息";
		  }
		  model.addAttribute("holderName", holderName);
		  model.addAttribute("message", message);
		  return  new ModelAndView("Todos/editOrUpdateTodo"); 
	  }
	
	@RequestMapping("/addOrEditTodoSava.do")
	public ModelAndView addOrEditTodoSava(Todo Todo,ModelMap model,String holderName){
		  //修改保存功能
		  if(Todo.getId()!=null&&Todo.getId().length()>0){
			  TodoSer.updateTodo(Todo); 
		  }else{
			  Todo.setHolderName(holderName);
			  TodoSer.saveTodo(Todo); 
		  }
		  return  new ModelAndView("Todos/index");
	  }
	
	
	@RequestMapping("/delete.do")
	public ModelAndView delete(String id)
	  {
		TodoSer.deleteTodoById(id);
		 return  new ModelAndView("Todos/index");
	  }*/
	
}
