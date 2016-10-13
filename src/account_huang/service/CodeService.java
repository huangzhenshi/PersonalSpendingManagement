package account_huang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import account_huang.entity.Code;
import account_huang.utils.SearchEntity;

@Service
public class CodeService {
	@Resource
    private SqlSessionTemplate template;

/*	public List<Code> getAllCode(String holderName) {
		 List<Code> list=template.selectList("account_huang.dao.CodeDao.getAllCodeInfoByHoldername",holderName);
		return list;
	}*/
	@Transactional
	public int deleteCodeById(String id) {
		String[] ids=id.split(",");
		int result=template.delete("account_huang.dao.CodeDao.deleteById",ids);
		return result;
	}

	public Code findById(String id) {
		Code Code=template.selectOne("account_huang.dao.CodeDao.findById", id);
		return Code;
	}
	
	public List<Code> findByType(String username,String type) {
		Map<String,Object> params=new HashMap<String,Object>();
			params.put("holdername", username);
			params.put("type", type);
		List<Code> list=template.selectList("account_huang.dao.CodeDao.findByType",params);
		return list;
	}
	
	@Transactional
	public int updateCode(Code Code) {
		int result=template.update("account_huang.dao.CodeDao.update", Code);
		return result;
	}
	@Transactional
	public int saveCode(Code Code) {
		int result=template.insert("account_huang.dao.CodeDao.save", Code);
		return result;
	}
	
	public List<Code> getAllCodes(SearchEntity search) {
		Map<String,Object> params=new HashMap<String,Object>();
			params.put("holdername", search.getUsername());
			String text=search.getText();
			//如果搜索框有输入值，则对 type和 描述进行like查询
			if(text!=null&&text.length()>0){
				params.put("type", "%"+text+"%");
				params.put("description","%"+text+"%");
			}
		List<Code> list=template.selectList("account_huang.dao.CodeDao.getAllCodeInfoByHoldername",params);
		return list;
	}
}