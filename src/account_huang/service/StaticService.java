package account_huang.service;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;















import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import account_huang.dao.RecordDao;
import account_huang.entity.ElseDetail;
import account_huang.entity.Record;
import account_huang.entity.User;

import com.google.gson.Gson;

@Service
public class StaticService {
	@Resource
    private SqlSessionTemplate template;
	
	@Resource
	private ElseDetailService elseService;
	
	@Transactional
	public void deleteRecordById(String id) {
		String[] ids=id.split(",");
		template.delete("account_huang.dao.RecordDao.deleteById",ids);
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
	        	params.put("count"," and rownum <20");
		      
		        List<Record> list=template.selectList("account_huang.dao.RecordDao.getRecordByDate",params);
			 return list;
			 
	  }
	public Record findById(String id) {
		Record record=template.selectOne("account_huang.dao.RecordDao.findById", id);
		return record;
	}
	
	/**
	 * 如果修改后的record不为
	 * 1开始为空 改为空  2开始为空 改为值  3开始不为空改为空  4开始不为空改为别的值
	 * 操作A删掉当天所有的elseDetail 然后按照新增处理
	 * 
	 * @param record
	 */
	@Transactional
	public void updateRecord(Record record) {
		elseService.deleteByTimes(record.getTimes());
		String remarks="";
		int elseAll=0;
		if(record.getRemark()!=null||record.getRemark().trim().length()>0){
			String remarkss=record.getRemark().trim();
			String[] arr=remarkss.split(" ");
			
			ElseDetail detail=new ElseDetail();
			detail.setHolderName(record.getHolderName());
			detail.setTimes(record.getTimes());
			for(int i=0;i<arr.length;i++){
				//如果trim后有值且满足 **-**格式，则放入list当中;
				if(arr[i].trim().length()>0){
					remarks+=arr[i].trim()+" ";
					String[] detailFormat=arr[i].trim().split("-");
						if(detailFormat.length==2&&StringUtils.isNumeric(detailFormat[1])){
							detail.setColumnName(detailFormat[0]);
							detail.setValue(Integer.parseInt(detailFormat[1]));
							elseService.saveElseDetail(detail);
							elseAll+=Integer.parseInt(detailFormat[1]);
						}
				}
				
			}
		}
		record.setRemark(remarks==""?remarks:remarks.substring(0,remarks.length()-1));
		record.setElseCost(elseAll);
		template.update("account_huang.dao.RecordDao.update", record);
		template.update("account_huang.dao.RecordDao.updateTotal", record.getTimes());
	}
	/**
	 * 先处理elseDetail的值，保存在else表中，并计算else的总值
	 * 存入expense表中一条记录含else，然后update 日开销和日结余和日
	 */
	@Transactional
	public void saveRecord(Record record) {
		String remarks="";
		int elseAll=0;
			//如果remark不为空且有值
			if(record.getRemark()!=null||record.getRemark().trim().length()>0){
				String remarkss=record.getRemark().trim();
				String[] arr=remarkss.split(" ");
				
				ElseDetail detail=new ElseDetail();
				detail.setHolderName(record.getHolderName());
				detail.setTimes(record.getTimes());
				for(int i=0;i<arr.length;i++){
					//如果trim后有值且满足 **-**格式，则放入list当中;
					if(arr[i].trim().length()>0){
						remarks+=arr[i].trim()+",";
						String[] detailFormat=arr[i].trim().split("-");
							if(detailFormat.length==2&&StringUtils.isNumeric(detailFormat[1])){
								detail.setColumnName(detailFormat[0]);
								detail.setValue(Integer.parseInt(detailFormat[1]));
								elseService.saveElseDetail(detail);
								elseAll+=Integer.parseInt(detailFormat[1]);
							}
					}
					
				}
			}
		
		record.setRemark(remarks==""?remarks:remarks.substring(0,remarks.length()-1));
		if(elseAll!=+0){
			record.setElseCost(elseAll);
		}
		template.insert("account_huang.dao.RecordDao.save", record);
		template.update("account_huang.dao.RecordDao.updateTotal", record.getTimes());
		
		
	}
	
}

