package account_huang.service;

import java.util.List;

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
}
