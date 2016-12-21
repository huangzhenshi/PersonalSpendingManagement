package account_huang.service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import account_huang.utils.ReadExcel;


@Service
public class CommonService {
	@Resource
    private SqlSessionTemplate template;
    public List<String> findAllColumnByTableNameWithoutID(String tableName){
    	return template.selectList("account_huang.dao.CommonDao.findAllColumnByTableNameWithoutID",tableName);
    }
}
