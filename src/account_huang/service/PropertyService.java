package account_huang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import account_huang.entity.Property;
@Service
public class PropertyService {

	@Resource
    private SqlSessionTemplate template;
	
	public List<Property> getAllProperty(String holderName) {
		 List<Property> list=template.selectList("account_huang.dao.PropertyDao.getAllPropertyInfoByHoldername",holderName);
		return list;
	}

	public Property findById(String id) {
		Property property=template.selectOne("account_huang.dao.PropertyDao.findById", id);
		return property;
	}
	@Transactional
	public void updateProperty(Property property) {
		template.update("account_huang.dao.PropertyDao.update", property);
		Integer id=template.selectOne("account_huang.dao.PropertyDao.getMaxKey");
		Integer updateId=Integer.parseInt(property.getId());
		if(id==updateId){
			synchronCards(property);
		}
		template.update("account_huang.dao.PropertyDao.updateTotal", property);
	}
	@Transactional
	public void saveProperty(Property property) {
		
		template.insert("account_huang.dao.PropertyDao.save", property);
		synchronCards(property);
		template.update("account_huang.dao.PropertyDao.updateTotal", property.getTimes());
	}
	@Transactional
	public void deletePropertyById(String id) {
		String[] ids=id.split(",");
		template.delete("account_huang.dao.PropertyDao.deleteById",ids);
	}
	@Transactional
	public void synchronCards(Property property){
		
		Map<String,Object> params=new HashMap<String,Object>();
		if(property.getCard1()!=null){
			//更新第一张银行卡
			params.put("balance",property.getCard1());
			params.put("cardNum","card1");
			template.update("account_huang.dao.PropertyDao.updateCards", params);
		}
		
		if(property.getCard2()!=null){
		//更新第二张银行卡
		params.put("balance",property.getCard2());
		params.put("cardNum","card2");
		template.update("account_huang.dao.PropertyDao.updateCards", params);
		}
		
		if(property.getHousingFund()!=null){
		//更新住房公积金
		params.put("balance",property.getHousingFund());
		params.put("cardNum","housingfund");
		template.update("account_huang.dao.PropertyDao.updateCards", params);
		}
		
		if(property.getCreditCard()!=null){
		//更新信用卡
		params.put("balance",property.getCreditCard());
		params.put("cardNum","creditCard");
		template.update("account_huang.dao.PropertyDao.updateCards", params);
		}
		
		if(property.getAlipay()!=null){
		//更新支付宝
		params.put("balance",property.getAlipay());
		params.put("cardNum","alipay");
		template.update("account_huang.dao.PropertyDao.updateCards", params);
		}
	}
	
	public void updateTotal(Property property){
		template.update("account_huang.dao.PropertyDao.updateTotal");
	}

}
