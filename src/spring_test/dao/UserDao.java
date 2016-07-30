package spring_test.dao;

import spring_test.annotation.MyBatisRepository;
import spring_test.entity.User;
@MyBatisRepository
public interface UserDao {
	public User findUserByUsernameAndPassword(User user1);
}
