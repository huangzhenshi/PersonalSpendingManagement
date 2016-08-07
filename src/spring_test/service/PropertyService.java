package spring_test.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import spring_test.entity.Property;
@Service
public class PropertyService {

	@Resource
    private SqlSessionTemplate template;
	
	public List<Property> getAllProperty(String holderName) {
		 List<Property> list=template.selectList("spring_test.dao.PropertyDao.getAllPropertyInfoByHoldername",holderName);
		return list;
	}

	public Property findById(String id) {
		Property property=template.selectOne("spring_test.dao.PropertyDao.findById", id);
		return property;
	}
	@Transactional
	public void updateProperty(Property property) {
		template.update("spring_test.dao.PropertyDao.update", property);
	}
	@Transactional
	public void saveProperty(Property property) {
		template.insert("spring_test.dao.PropertyDao.save", property);
	}
	@Transactional
	public void deletePropertyById(String id) {
		String[] ids=id.split(",");
		template.delete("spring_test.dao.PropertyDao.deleteById",ids);
	}
	

}
