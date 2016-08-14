package account_huang.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import account_huang.entity.Card;
import account_huang.entity.Record;

@Service
public class CardService {
	@Resource
    private SqlSessionTemplate template;

	public List<Card> getAllCard(String holderName) {
		 List<Card> list=template.selectList("account_huang.dao.CardDao.getAllCardInfoByHoldername",holderName);
		return list;
	}
	@Transactional
	public void deleteCardById(String id) {
		String[] ids=id.split(",");
		template.delete("account_huang.dao.CardDao.deleteById",ids);
		
	}

	public Card findById(String id) {
		Card card=template.selectOne("account_huang.dao.CardDao.findById", id);
		return card;
	}
	@Transactional
	public void updateCard(Card card) {
		template.update("account_huang.dao.CardDao.update", card);
	}
	@Transactional
	public void saveCard(Card card) {
		template.insert("account_huang.dao.CardDao.save", card);
		
	}
}
