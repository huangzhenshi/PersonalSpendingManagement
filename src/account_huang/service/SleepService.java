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
import account_huang.entity.ElseDetail;
import account_huang.entity.Record;
import account_huang.entity.Sleep;
import account_huang.entity.Todo;
import account_huang.entity.User;
import account_huang.utils.Constants;
import account_huang.utils.PageCoral;
import account_huang.utils.SearchEntity;
import account_huang.utils.Utils;


@Service
public class SleepService {
	@Resource
    private SqlSessionTemplate template;
	@Resource
	private CodeService codeService;
	@Resource
	private CommonService commonService;
	
	
	public List<Sleep> getAllSleepByPageAndSumTotal(PageCoral page,String username) {
		 int pageNumber=page.getP_pageNumber();
		 int pageSize=page.getP_pagesize();
		 Map<String, Object> params =new HashMap<String, Object>();
		 params.put("startNumber",(pageNumber-1)*pageSize+1);
		 params.put("endNumber", pageNumber*pageSize+1);
		 params.put("username",username);
		 params.put("tableName",Constants.TABLENAME_SLEEP);
		 int  total= template.selectOne("account_huang.dao.CommonDao.queryCount",params);
		 page.setTotal(total);
		 List<Sleep> list = template.selectList("account_huang.dao.SleepMapper.findAllPage",params);
		 return list;
	}
	
	@Transactional
	public void saveSleep(Sleep sleep){
	     template.insert("account_huang.dao.SleepMapper.save", sleep);
	    }
	
	@Transactional
	public void updateSleep(Sleep sleep){
		 template.update("account_huang.dao.SleepMapper.update", sleep);
	}
	
	@Transactional
   public void deleteSleep(String ids){
		commonService.deleteById(Constants.TABLENAME_SLEEP,ids);
	  }
}

