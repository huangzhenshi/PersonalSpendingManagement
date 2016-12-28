package account_huang.service;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;





























import javassist.bytecode.analysis.Util;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import account_huang.entity.Code;
import account_huang.entity.EchartEntity;
import account_huang.entity.ElseDetail;
import account_huang.entity.Record;
import account_huang.entity.Todo;
import account_huang.entity.User;
import account_huang.utils.PageCoral;
import account_huang.utils.SearchEntity;
import account_huang.utils.Utils;

import com.google.gson.Gson;

@Service
public class SmartService {
	@Resource
    private SqlSessionTemplate template;
	
	@Resource
	private ElseDetailService elseService;
	/*
	 * 根据用户名获取月度的sum求和数据
	 */
	public List<Record> getMonth(SearchEntity search){
		 Map<String, Object> params =new HashMap<String, Object>();
		 params.put("holdername", search.getUsername());
		 params.put("times", search.getTimes());
		List<Record> list=template.selectList("account_huang.dao.SmartDao.getMonth",params);
		return list;
	}
	
	/*
	 * 根据 qssj来获取当月的else 分组之后的所有的记录
	 */
	public List<ElseDetail> getDetailByDate(SearchEntity search){
		String qssj=search.getQssj();
		String jssj=search.getJssj();
		 Map<String, Object> params =new HashMap<String, Object>();
	     params.put("holdername", search.getUsername());
	     SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	     String[] result=qssj.split("-");
         Calendar cal = Calendar.getInstance();
         cal.set(Calendar.YEAR,Integer.parseInt(result[0]));
         cal.set(Calendar.MONTH, Integer.parseInt(result[1]));
         cal.set(Calendar.DAY_OF_MONTH, 1);
         cal.add(Calendar.DAY_OF_MONTH, -1);
         jssj=format.format(cal.getTime());
         params.put("qssj", qssj);
       	 params.put("jssj", jssj);
		 List<ElseDetail> list=template.selectList("account_huang.dao.SmartDao.getDetailByDate",params);
		 return list;
	}
	
	public List<ElseDetail> getDetailByDateAndAmount(SearchEntity search){
		 Map<String, Object> params =new HashMap<String, Object>();
		 params.put("holdername", search.getUsername());
		 params.put("times", search.getTimes());
		 List<ElseDetail> list=template.selectList("account_huang.dao.SmartDao.getDetailByDateAndAmount",params);
		 return list;
	}
	
	public List<EchartEntity> getNetAssertByMonth(SearchEntity search){
		 List<EchartEntity> list=template.selectList("account_huang.dao.SmartDao.getNetAssertByMonth",search.getUsername());
		 return list;
	}
	public void	setEchartLineValues(ModelMap model,List<EchartEntity> list){
		Gson gs=new Gson();
		List<String> times=new ArrayList<String>();
		List<Integer> values=new ArrayList<Integer>();
		for(int i=0;i<list.size();i++){
			times.add(list.get(i).getName());
			values.add(list.get(i).getValue());
		}
		model.addAttribute("times", gs.toJson(times));
		model.addAttribute("values", gs.toJson(values));
	}
	/**
	 * 1）通过查询出当月的 求和的开销实体类 record，过滤掉为0的开销，给前台的 echart展示
	 * 2）把分组后的其他开销，取前3个开销加到 names 和values里面给前台单独展示出来
	 * @throws Exception 
	 */
	public void processFilterValuesToShowByRecordAndElseDetail(ModelMap model,Record record,List<ElseDetail> list) throws Exception{
		List<EchartEntity> echartlist=new ArrayList<EchartEntity>();
		List<String> details=new ArrayList<String>();
		int all=record.getCostDaily();
		Record target=(Record) Utils.mathConvertToZero(record);
		 if(target.getEating()>0){
			 EchartEntity echart=new EchartEntity();
			 echart.setName("吃饭购物:"+target.getEating());
			 echart.setValue(target.getEating());
			 echartlist.add(echart);
			 details.add("吃饭购物:"+target.getEating());
			 all=all-echart.getValue();
		 }
		 if(target.getRent()>0){
			 EchartEntity echart=new EchartEntity();
			 echart.setName("房租:"+target.getRent());
			 details.add("房租:"+target.getRent());
			  echart.setValue(target.getRent() );
			  echartlist.add(echart);
			  all=all-echart.getValue();
		 }
		 if(target.getTraffic()>0){
			 EchartEntity echart=new EchartEntity();
			 echart.setName("交通:"+target.getTraffic());
			 details.add("交通:"+target.getTraffic());
			  echart.setValue(target.getTraffic() );
			  echartlist.add(echart);
			  all=all-echart.getValue();
		 }
		 if(target.getClothes()>0){
			 EchartEntity echart=new EchartEntity();
			 echart.setName("买衣服:"+target.getClothes());
			 details.add("买衣服:"+target.getClothes());
			  echart.setValue(target.getClothes());
			  echartlist.add(echart);
			  all=all-echart.getValue();
		 }
		 if(target.getBook()>0){
			 EchartEntity echart=new EchartEntity();
			 echart.setName("买书:"+target.getBook());
			 details.add("买书:"+target.getBook());
			  echart.setValue(target.getBook() );
			  echartlist.add(echart);
			  all=all-echart.getValue();
		 }
		 int index=0;
		 for (ElseDetail detail : list) {  
				 if(index<3){
					EchartEntity echart=new EchartEntity();
				    echart.setName(detail.getColumnName()+":"+detail.getValue());
				    details.add(detail.getColumnName()+":"+detail.getValue());
				    echart.setValue(detail.getValue());
				    echartlist.add(echart);
				    all=all-echart.getValue();
				 }
				 index++;
			} 
		 if(all>0){
				 EchartEntity echart=new EchartEntity();
				 echart.setName("其他:"+all);
				 details.add("其他:"+all);
			     echart.setValue(all);
			     echartlist.add(echart);
			 }
		  Gson gs=new Gson();
		  List<String> orderList=orderByValue(details);
		  model.addAttribute("echartList", gs.toJson(echartlist));
		   model.addAttribute("details",gs.toJson(orderList));
	}
	
	public List<String> orderByValue(List<String> list){
		int size=list.size();
		for(int i=0;i<size;i++){
			String[] target=list.get(i).split(":");
			int max=Integer.parseInt(target[target.length-1]);
			for(int j=i+1;j<size;j++){
				int value2=Integer.parseInt(list.get(j).split(":")[target.length-1]);
				if(max<value2){
					max=value2;
					String store=list.set(i, list.get(j));
					list.set(j, store);
				}
			}
		}
		return list;
		
	}
	
}

