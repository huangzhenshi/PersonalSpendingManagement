package account_huang.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;







import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import org.springframework.util.StringUtils;

import account_huang.entity.Hierarchy;
import account_huang.entity.SelectUtilEntity;
import account_huang.utils.Constants;
import account_huang.utils.PageCoral;


@Service
public class HierarchyService {
	@Resource
    private SqlSessionTemplate template;
	@Resource
	private CodeService codeService;
	@Resource
	private CommonService commonService;
	
	
	public List<Hierarchy> getAllHierarchyByPageAndSumTotal(PageCoral page,String username) {
		 int pageNumber=page.getP_pageNumber();
		 int pageSize=page.getP_pagesize();
		 Map<String, Object> params =new HashMap<String, Object>();
		 params.put("startNumber",(pageNumber-1)*pageSize+1);
		 params.put("endNumber", pageNumber*pageSize+1);
		 params.put("username",username);
		 params.put("tableName",Constants.TABLENAME_HIERARCHY);
		 int  total= template.selectOne("account_huang.dao.CommonDao.queryCount",params);
		 page.setTotal(total);
		 List<Hierarchy> list = template.selectList("account_huang.dao.HierarchyMapper.findAllPage",params);
		 return list;
	}
	
	public Hierarchy findById(String id) {
		 return template.selectOne("account_huang.dao.HierarchyMapper.findById",id);
	}
	
	public List<SelectUtilEntity> findAllType(String username){
		return template.selectList("account_huang.dao.HierarchyMapper.findAllType",username);
	}
	
	
	@Transactional
	public void saveHierarchy(Hierarchy hierarchy){
	     template.insert("account_huang.dao.HierarchyMapper.save", hierarchy);
	    }
	
	@Transactional
	public void updateHierarchy(Hierarchy hierarchy){
		 template.update("account_huang.dao.HierarchyMapper.update", hierarchy);
	}
	
	@Transactional
   public void deleteHierarchy(String ids){
		 Map<String, Object> params =new HashMap<String, Object>();
   		 params.put("ids",ids);
		template.delete("account_huang.dao.HierarchyMapper.deleteCascaded", params);
	  }

}

