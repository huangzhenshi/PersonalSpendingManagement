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

import account_huang.dao.RecordDao;
import account_huang.entity.Code;
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
	public List<Record> getMonth(String username){
		List<Record> list=template.selectList("account_huang.dao.SmartDao.getMonth",username);
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
	
	
	
}

