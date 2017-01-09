package account_huang.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;




import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import org.springframework.util.StringUtils;

import account_huang.entity.ListTodo;
import account_huang.utils.Constants;
import account_huang.utils.PageCoral;


@Service
public class ListTodoService {
	@Resource
    private SqlSessionTemplate template;
	@Resource
	private CommonService commonService;
	
	
	public List<ListTodo> getAllListTodoByPageAndSumTotal(PageCoral page,ListTodo listTodo) {
		 int pageNumber=page.getP_pageNumber();
		 int pageSize=page.getP_pagesize();
		 Map<String, Object> params =new HashMap<String, Object>();
		 params.put("startNumber",(pageNumber-1)*pageSize+1);
		 params.put("endNumber", pageNumber*pageSize+1);
		 params.put("username",listTodo.getHoldername());
		 params.put("status",listTodo.getStatus());
		 params.put("tableName",Constants.TABLENAME_LIST_TODO);
		 params.put("column","STATUS");
		 params.put("value",listTodo.getStatus());
		 int  total= template.selectOne("account_huang.dao.CommonDao.queryCount",params);
		 page.setTotal(total);
		 List<ListTodo> list = template.selectList("account_huang.dao.ListTodoMapper.findAllPage",params);
		 return list;
	}
	
	public ListTodo findById(String id) {
		 return template.selectOne("account_huang.dao.ListTodoMapper.findById",id);
	}
	
	
	@Transactional
	public void saveListTodo(ListTodo listTodo){
	     template.insert("account_huang.dao.ListTodoMapper.save", listTodo);
	    }
	
	@Transactional
	public void updateListTodo(ListTodo listTodo){
		 template.update("account_huang.dao.ListTodoMapper.update", listTodo);
	}
	
	@Transactional
   public void deleteListTodo(String ids){
		commonService.deleteById(Constants.TABLENAME_LIST_TODO,ids);
	  }
	
	@Transactional
	public void switchStatus(String ids,String status){
		 Map<String, Object> params =new HashMap<String, Object>();
   		 params.put("status",status);
   		 params.put("ids",ids);
		 template.update("account_huang.dao.ListTodoMapper.switchStatus", params);
	}
}

