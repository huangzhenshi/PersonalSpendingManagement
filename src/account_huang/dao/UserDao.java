package account_huang.dao;

import account_huang.annotation.MyBatisRepository;
import account_huang.entity.User;
@MyBatisRepository
public interface UserDao {
	public User findUserByUsernameAndPassword(User user1);
}
