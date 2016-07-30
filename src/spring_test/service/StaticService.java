package spring_test.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;






import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import spring_test.dao.RecordDao;
import spring_test.entity.Record;
import spring_test.entity.User;

@Service
public class StaticService {
	@Resource
    private SqlSessionTemplate template;
	@Transactional
	public String deleteRecordById(String id) {
		String message="false";
		String[] ids=id.split(",");
     	Integer delNum=template.delete("spring_test.dao.RecordDao.deleteById",ids);
        if(delNum!=null&&delNum>0){
        	message="true";
        } 
		return message;
	}
	public String getCurrentRecord(String username,int count)
	  {
		        Map<String, Object> params =new HashMap<String, Object>();
		        params.put("holderName", username);
		        params.put("count",count);
		        List<Record> list=template.selectList("spring_test.dao.RecordDao.findRecordByHoldernameAndCount",params);
			  Gson gson=new Gson();
			 return gson.toJson(list);
			 
	  }
	public Record findById(String id) {
		Record record=template.selectOne("spring_test.dao.RecordDao.findById", id);
		return record;
	}
	@Transactional
	public void updateRecord(Record record) {
		template.update("spring_test.dao.RecordDao.update", record);
	}
	@Transactional
	public void saveRecord(Record record) {
		template.insert("spring_test.dao.RecordDao.save", record);
		
	}
	
}

