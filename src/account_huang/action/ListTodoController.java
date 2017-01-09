package account_huang.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import account_huang.entity.ListTodo;
import account_huang.service.ListTodoService;
import account_huang.utils.PageCoral;
import account_huang.utils.Utils;


@Controller
@RequestMapping("/listTodo")
public class ListTodoController{
	@Resource
	private ListTodoService listTodoService;
	
	@RequestMapping("/toListTodoMainPage.do")
	public String toMainListTodoPage(){
		return  "listTodo/listTodoIndex";
	}
	
	@RequestMapping("/getListTodoGrid.do")
    @ResponseBody
    public Map<String,Object> getListTodoGrid(PageCoral page,ListTodo listTodo) {
        Map<String,Object> map = new HashMap<String, Object>();
        List<ListTodo> list=listTodoService.getAllListTodoByPageAndSumTotal(page, listTodo);
        map.put("data",list) ;
        Utils.setPageElementMap(map, page);
        return map;
    }
	
	//异步新增和修改
	@RequestMapping("/addOrEditListTodoSava.do")
    @ResponseBody
	public Map<String,Object> addOrEditListTodoSava(ListTodo listTodo){
		 Map<String,Object> map = new HashMap<String, Object>();
		 Boolean message=true;
		 try{
			  //修改保存功能
			  if(listTodo.getId()!=null&&listTodo.getId().length()>0){
				  listTodoService.updateListTodo(listTodo); 
			  }else{
				  listTodo.setRecordTime(Utils.getCurrentDate());
				  listTodoService.saveListTodo(listTodo); 
			  }
		 }
		   catch (Exception e) {  
			   message=false;
			  e.printStackTrace();
		 }
		  map.put("msg",message);
		  return map;
	  }
	@RequestMapping("/switchStatus.do")
	@ResponseBody
	public  Map<String,Object>  switchStatus(String ids,String status){
		 Map<String,Object> map = new HashMap<String, Object>();
		 Boolean message=true;
		try{
				listTodoService.switchStatus(ids,status);
			}
		   catch (Exception e) {  
			   message=false;
			   e.printStackTrace();
		 }
		 map.put("msg",message);
		return map;
	}

	/**
	  * 异步的删除
	  */
	@RequestMapping("/delete.do")
	@ResponseBody
	public  Map<String,Object>  delete(String id){
		 Map<String,Object> map = new HashMap<String, Object>();
		 Boolean message=true;
		try{
				listTodoService.deleteListTodo(id);
			}
		   catch (Exception e) {  
			   message=false;
			   e.printStackTrace();
		 }
		 map.put("msg",message);
		return map;
	  }
	
}
