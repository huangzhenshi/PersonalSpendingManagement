package spring_test.service;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
	public void deleteRecordById(String id) {
		String[] ids=id.split(",");
		template.delete("spring_test.dao.RecordDao.deleteById",ids);
	}
	
	/**
	 * 根据日期获取对应的记账记录
	 *qssj和jssj都为空，则获取当前系统月份的所有记录
	 *qssj不为空，jssj为空，获取指定月份的记录
	 *qssj和jssj都不为空，获取指定日期间的记录
	 */
	public List<Record> getRecordByDate(String username, String qssj, String jssj)
	  {
		        Map<String, Object> params =new HashMap<String, Object>();
		        params.put("holdername", username);
		        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        //如果是当前月
		        if(qssj==null||qssj.length()==0){
		        	Calendar c = Calendar.getInstance();    
			        c.add(Calendar.MONTH, 0);
			        c.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
			        qssj = format.format(c.getTime());  
			        c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));  
			        jssj = format.format(c.getTime());
		        }else if(jssj==null||jssj.length()==0){
		        	String[] result=qssj.split("-");
		            Calendar cal = Calendar.getInstance();
		            cal.set(Calendar.YEAR,Integer.parseInt(result[0]));
		            cal.set(Calendar.MONTH, Integer.parseInt(result[1]));
		            cal.set(Calendar.DAY_OF_MONTH, 1);
		            cal.add(Calendar.DAY_OF_MONTH, -1);
		            jssj=format.format(cal.getTime());
		        }
		        params.put("qssj", qssj);
	        	params.put("jssj", jssj);
		      
		        List<Record> list=template.selectList("spring_test.dao.RecordDao.getRecordByDate",params);
			 return list;
			 
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

