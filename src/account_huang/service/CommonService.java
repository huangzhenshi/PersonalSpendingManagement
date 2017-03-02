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
    	//之前用的是 sql注入式删除，非数字的话必须带引号，现在改用 foreach标签，所以不需要引号了
    	ids=ids.replace("'", "");
      	 Map<String, Object> params =new HashMap<String, Object>();
   		 params.put("tableName",tableName);
   		 params.put("ids",ids.split(","));
   		 int result=template.delete("account_huang.dao.CommonDao.deleteById",params);
   		return result;
      }
    
	//排序，根据表名，第一个位置的Order，排序后的ID字符串数组
	@Transactional
	public void sort(int firstNoTopOrder,String sortAfterIDs,String tableName){
	  	Map<String, Object> params =new HashMap<String, Object>();
   		params.put("tableName",tableName);
		String[] sortIDArr=sortAfterIDs.split(",");
		for(int k=0;k<sortIDArr.length;k++){
			 params.put("id",sortIDArr[k]);
			 params.put("orderNo",firstNoTopOrder);
			template.update("account_huang.dao.CommonDao.order", params);
			firstNoTopOrder--;
		}
	}
}
