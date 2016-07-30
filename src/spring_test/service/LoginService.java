package spring_test.service;


import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import spring_test.dao.UserDao;
import spring_test.entity.User;

@Service
public class LoginService {
	@Resource
    private SqlSessionTemplate template;
	
	public User getUserByMybatis(User userIn){
        User user=template.selectOne("spring_test.dao.UserDao.findUserByUsernameAndPassword",userIn);
        return user;
		
	}
	
}

