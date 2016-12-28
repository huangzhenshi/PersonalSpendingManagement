package account_huang.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import account_huang.utils.ReadExcel;


@Service
public class CommonService {
	@Resource
    private SqlSessionTemplate template;
    public List<String> findAllColumnByTableNameWithoutID(String tableName){
    	return template.selectList("account_huang.dao.CommonDao.findAllColumnByTableNameWithoutID",tableName);
    }
    
    @Transactional
    public int deleteById(String tableName,String ids){
      	 Map<String, Object> params =new HashMap<String, Object>();
   		 params.put("tableName",tableName);
   		 params.put("ids",ids);
   		 int result=template.delete("account_huang.dao.CommonDao.deleteById",params);
   		return result;
      }
}
