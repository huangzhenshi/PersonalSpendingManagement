package account_huang.dao;

import java.util.List;
import java.util.Map;

import account_huang.annotation.MyBatisRepository;
import account_huang.entity.Record;
@MyBatisRepository
public interface RecordDao {
	public List<Record> findRecordByHoldernameAndCount(Map map);
	public void deleteById(int id);
}
