package spring_test.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import spring_test.entity.Card;
import spring_test.entity.Record;

@Service
public class CardService {
	@Resource
    private SqlSessionTemplate template;

	public List<Card> getAllCard(String holderName) {
		 List<Card> list=template.selectList("spring_test.dao.CardDao.getAllCardInfoByHoldername",holderName);
		return list;
	}

	public void deleteCardById(String id) {
		String[] ids=id.split(",");
		template.delete("spring_test.dao.CardDao.deleteById",ids);
		
	}

	public Card findById(String id) {
		Card card=template.selectOne("spring_test.dao.CardDao.findById", id);
		return card;
	}
	@Transactional
	public void updateCard(Card card) {
		template.update("spring_test.dao.CardDao.update", card);
	}
	@Transactional
	public void saveCard(Card card) {
		template.insert("spring_test.dao.CardDao.save", card);
		
	}
}
