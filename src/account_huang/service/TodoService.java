package account_huang.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import account_huang.entity.Todo;
import account_huang.utils.Constants;
@Service
public class TodoService {
	@Resource
    private SqlSessionTemplate template;
	
	@Resource
	private StaticService sSerice;

	public List<Todo> getAllTodo(String holderName) {
		 List<String> list=sSerice.getTodoRecords(holderName,Constants.ToDoDays_Record);
		 List<Todo> result=convertStingToEntity(list,Constants.ToDoType_Record);
		return result;
	}
	
	public List<Todo> convertStingToEntity(List<String> list,String type){
		List<Todo> result=new ArrayList<Todo>();
		
			for(int i=0;i<list.size();i++){
				Todo todo=new Todo();
				todo.setType(type);
				todo.setTimes(list.get(i));
				result.add(todo);
			}
		return result;
	}

}
