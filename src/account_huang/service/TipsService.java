package account_huang.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;






import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import org.springframework.util.StringUtils;

import account_huang.annotation.Mylog;
import account_huang.entity.Tips;
import account_huang.utils.Constants;
import account_huang.utils.PageCoral;


@Service
public class TipsService {
	@Resource
    private SqlSessionTemplate template;
	@Resource
	private CodeService codeService;
	@Resource
	private CommonService commonService;
	
	public List<Tips> getAllTipsByPageAndSumTotal(PageCoral page,Tips tips) {
		 int pageNumber=page.getP_pageNumber();
		 int pageSize=page.getP_pagesize();
		 Map<String, Object> params =new HashMap<String, Object>();
		 params.put("startNumber",(pageNumber-1)*pageSize+1);
		 params.put("endNumber", pageNumber*pageSize+1);
		 params.put("username",tips.getHoldername());
		 params.put("tableName",Constants.TABLENAME_TIPS);
		 int  total= template.selectOne("account_huang.dao.CommonDao.queryCount",params);
		 page.setTotal(total);
		 List<Tips> list = template.selectList("account_huang.dao.TipsMapper.findAllPage",params);
		 return list;
	}
	
	public Tips findById(String id) {
		 return template.selectOne("account_huang.dao.TipsMapper.findById",id);
	}
	
	
	@Transactional
	@Mylog(operate="add",moduleName="Tips")
	public Boolean saveTips(Tips tips){
	     template.insert("account_huang.dao.TipsMapper.save", tips);
	     return true;
	    }
	
	@Transactional
	@Mylog(operate="update",moduleName="Tips",detail="修改tips的id:${id}")
	public Boolean updateTips(Tips tips){
		 template.update("account_huang.dao.TipsMapper.update", tips);
		 return true;
	}
	
	@Transactional
	@Mylog(operate="delete",moduleName="Tips",detail="删除tips的ids:${id}")
    public Boolean deleteTips(String ids){
		commonService.deleteById(Constants.TABLENAME_TIPS,ids);
		return true;
	  }

}

