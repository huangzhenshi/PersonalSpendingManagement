package account_huang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import account_huang.entity.CashFlow;
import account_huang.entity.Record;

@Service
public class CashFlowService {
	@Resource
    private SqlSessionTemplate template;

	public List<CashFlow> getAllCashFlowByType(String holderName, String type) {
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("holdername",holderName);
		if(!StringUtils.isEmpty(type)){
			params.put("type",type);
		} 
		return template.selectList("account_huang.dao.CashFlowDao.getAllCashFlowInfoByHoldername",params);
	}
	
	@Transactional
	public void deleteCashFlowById(String id) {
		String[] ids=id.split(",");
		template.delete("account_huang.dao.CashFlowDao.deleteById",ids);
		
	}

	public CashFlow findById(String id) {
		CashFlow cashFlow=template.selectOne("account_huang.dao.CashFlowDao.findById", id);
		return cashFlow;
	}
	@Transactional
	public void updateCashFlow(CashFlow cashFlow) {
		template.update("account_huang.dao.CashFlowDao.update", cashFlow);
	}
	@Transactional
	public void saveCashFlow(CashFlow cashFlow) {
		template.insert("account_huang.dao.CashFlowDao.save", cashFlow);
		
	}
	
	public String getTotalIncomeByYear(String username, String year) {
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("holdername",username);
		params.put("year",year);
		CashFlow cashFlow=template.selectOne("account_huang.dao.CashFlowDao.getTotalIncomeByYear", params);
		if(cashFlow==null){
			return "0";
		}
		return cashFlow.getMoney()+"";
	}
}
