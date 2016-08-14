package account_huang.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import account_huang.entity.Card;
import account_huang.entity.User;
import account_huang.service.CardService;

@Controller
@RequestMapping("/cards")
public class CardController {
	@Resource
	private CardService cardSer;
	
	@RequestMapping("/toCardMainPage.do")
	public ModelAndView toMainCardPage(){
		return  new ModelAndView("cards/index");
	}
	
	@RequestMapping("/getAllCard.do")
    @ResponseBody
    public Map<String,Object> getAllCard(String username){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Card> list=new ArrayList<Card>();
        list=cardSer.getAllCard(username);
        map.put("data",list) ;
        map.put("total", list.size());
        return map;
    }
	
	@RequestMapping("/editOrUpdateCard.do")
	public ModelAndView editOrUpdateCard(String id,String holderName,ModelMap model){
		String message="新增银行卡信息";  
		if(id!=null&&id.length()>0){
			 Card card=cardSer.findById(id);
			 model.addAttribute("card", card);
			 message="修改银行卡信息";
		  }
		  model.addAttribute("holderName", holderName);
		  model.addAttribute("message", message);
		  return  new ModelAndView("cards/editOrUpdateCard"); 
	  }
	
	@RequestMapping("/addOrEditCardSava.do")
	public ModelAndView addOrEditCardSava(Card card,ModelMap model){
		  //修改保存功能
		  if(card.getId()!=null&&card.getId().length()>0){
			  cardSer.updateCard(card); 
		  }else{
			  cardSer.saveCard(card); 
		  }
		  return  new ModelAndView("cards/index");
	  }
	
	
	@RequestMapping("/delete.do")
	public ModelAndView delete(String id)
	  {
		cardSer.deleteCardById(id);
		 return  new ModelAndView("cards/index");
	  }
	
}
