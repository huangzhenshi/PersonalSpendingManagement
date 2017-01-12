package account_huang.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;




import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import org.springframework.util.StringUtils;

import account_huang.entity.Words;
import account_huang.utils.Constants;
import account_huang.utils.PageCoral;


@Service
public class WordsService {
	@Resource
    private SqlSessionTemplate template;
	@Resource
	private CodeService codeService;
	@Resource
	private CommonService commonService;
	
	
	public List<Words> getAllWordsByPageAndSumTotal(PageCoral page,Words words) {
		 int pageNumber=page.getP_pageNumber();
		 int pageSize=page.getP_pagesize();
		 Map<String, Object> params =new HashMap<String, Object>();
		 params.put("startNumber",(pageNumber-1)*pageSize+1);
		 params.put("endNumber", pageNumber*pageSize+1);
		 params.put("username",words.getHoldername());
		 params.put("tableName",Constants.TABLENAME_WORDS);
		 int  total= template.selectOne("account_huang.dao.CommonDao.queryCount",params);
		 page.setTotal(total);
		 List<Words> list = template.selectList("account_huang.dao.WordsMapper.findAllPage",params);
		 return list;
	}
	
	public Words findById(String id) {
		 return template.selectOne("account_huang.dao.WordsMapper.findById",id);
	}
	
	
	@Transactional
	public void saveWords(Words words){
	     template.insert("account_huang.dao.WordsMapper.save", words);
	    }
	
	@Transactional
	public void updateWords(Words words){
		 template.update("account_huang.dao.WordsMapper.update", words);
	}
	
	@Transactional
   public void deleteWords(String ids){
		commonService.deleteById(Constants.TABLENAME_WORDS,ids);
	  }

}

