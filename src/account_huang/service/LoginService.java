package account_huang.service;


import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import account_huang.dao.UserDao;
import account_huang.entity.User;

@Service
public class LoginService {
	@Resource
    private SqlSessionTemplate template;
	
	public User getUserByMybatis(User userIn){
        User user=template.selectOne("account_huang.dao.UserDao.findUserByUsernameAndPassword",userIn);
        return user;
		
	}
	
}

