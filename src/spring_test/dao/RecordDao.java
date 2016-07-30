package spring_test.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import spring_test.annotation.MyBatisRepository;
import spring_test.entity.Record;
@MyBatisRepository
public interface RecordDao {
	public List<Record> findRecordByHoldernameAndCount(Map map);
	public void deleteById(int id);
}
