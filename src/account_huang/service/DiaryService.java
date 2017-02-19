package account_huang.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;



import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import org.springframework.util.StringUtils;

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
	
	
	public List<Diary> getAllDiaryByPageAndSumTotal(PageCoral page,Diary diary) {
		 int pageNumber=page.getP_pageNumber();
		 int pageSize=page.getP_pagesize();
		 Map<String, Object> params =new HashMap<String, Object>();
		 params.put("startNumber",(pageNumber-1)*pageSize+1);
		 params.put("endNumber", pageNumber*pageSize+1);
		 params.put("username",diary.getHoldername());
		 if(!StringUtils.isEmpty(diary.getType())){
			 params.put("type",diary.getType());
			 if(!StringUtils.isEmpty(diary.getTitle())){
				 params.put("title",diary.getTitle()); 
			 }else{
				 params.put("title",""); 
			 }
		 }
		 int  total= template.selectOne("account_huang.dao.DiaryMapper.queryCount",params);
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
		commonService.deleteById(Constants.TABLENAME_ARTICLE,ids);
	  }
}

