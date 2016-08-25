package account_huang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import account_huang.entity.ElseDetail;

@Service
public class ElseDetailService {
	@Resource
    private SqlSessionTemplate template;

	
	@Transactional
	public void deleteByTimes(String times) {
		String[] arr=times.split(",");
		template.delete("account_huang.dao.ElseDetailDao.deleteByTimes",arr);
		
	}

	@Transactional
	public void saveElseDetail(ElseDetail elseDetail) {
		template.insert("account_huang.dao.ElseDetailDao.save", elseDetail);
		
	}
	
	public String getTop10ElseName(String holdername){
		  Map<String, Object> params =new HashMap<String, Object>();
	        params.put("holderName", holdername);
	        params.put("rowmuns", " where rownum<11");
		ElseDetail elseDetail=template.selectOne("account_huang.dao.ElseDetailDao.getTop10ElseName",params);
		return elseDetail==null?"":"常用备注名前缀:  "+elseDetail.getSpecialCol();
	}
}
