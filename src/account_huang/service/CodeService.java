package account_huang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import account_huang.entity.Code;

@Service
public class CodeService {
	@Resource
    private SqlSessionTemplate template;

/*	public List<Code> getAllCode(String holderName) {
		 List<Code> list=template.selectList("account_huang.dao.CodeDao.getAllCodeInfoByHoldername",holderName);
		return list;
	}*/
	@Transactional
	public void deleteCodeById(String id) {
		String[] ids=id.split(",");
		template.delete("account_huang.dao.CodeDao.deleteById",ids);
		
	}

	public Code findById(String id) {
		Code Code=template.selectOne("account_huang.dao.CodeDao.findById", id);
		return Code;
	}
	@Transactional
	public void updateCode(Code Code) {
		template.update("account_huang.dao.CodeDao.update", Code);
	}
	@Transactional
	public void saveCode(Code Code) {
		template.insert("account_huang.dao.CodeDao.save", Code);
		
	}
	
	public List<Code> getAllCodes(String username, String index) {
		Map<String,Object> params=new HashMap<String,Object>();
			params.put("holdername", username);
			//如果搜索框有输入值，则对 type和 描述进行like查询
			if(index!=null&&index.length()>0){
				params.put("type", "%"+index+"%");
				params.put("description","%"+index+"%");
			}
		List<Code> list=template.selectList("account_huang.dao.CodeDao.getAllCodeInfoByHoldername",params);
		return list;
	}
}