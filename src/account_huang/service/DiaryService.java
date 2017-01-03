package account_huang.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import account_huang.entity.Diary;
import account_huang.utils.Constants;
import account_huang.utils.PageCoral;


@Service
public class DiaryService {
	@Resource
    private SqlSessionTemplate template;
	@Resource
	private CodeService codeService;
	@Resource
	private CommonService commonService;
	
	
	public List<Diary> getAllDiaryByPageAndSumTotal(PageCoral page,String username) {
		 int pageNumber=page.getP_pageNumber();
		 int pageSize=page.getP_pagesize();
		 Map<String, Object> params =new HashMap<String, Object>();
		 params.put("startNumber",(pageNumber-1)*pageSize+1);
		 params.put("endNumber", pageNumber*pageSize+1);
		 params.put("username",username);
		 params.put("tableName",Constants.TABLENAME_DIARY);
		 int  total= template.selectOne("account_huang.dao.CommonDao.queryCount",params);
		 page.setTotal(total);
		 List<Diary> list = template.selectList("account_huang.dao.DiaryMapper.findAllPage",params);
		 return list;
	}
	
	public Diary findById(String id) {
		 return template.selectOne("account_huang.dao.DiaryMapper.findById",id);
	}
	
	
	@Transactional
	public void saveDiary(Diary diary){
	     template.insert("account_huang.dao.DiaryMapper.save", diary);
	    }
	
	@Transactional
	public void updateDiary(Diary diary){
		 template.update("account_huang.dao.DiaryMapper.update", diary);
	}
	
	@Transactional
   public void deleteDiary(String ids){
		commonService.deleteById(Constants.TABLENAME_SLEEP,ids);
	  }
}

