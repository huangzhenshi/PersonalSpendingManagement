package account_huang.service;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.spi.http.HttpContext;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import account_huang.entity.Card;
import account_huang.entity.CashFlow;
import account_huang.entity.Property;
import account_huang.entity.Record;
import account_huang.utils.ReadExcel;

@Service
public class ExcelService {
	@Resource
    private SqlSessionTemplate template;
	@Resource
    private StaticService staticService;
	@Resource
    private PropertyService propertyService;
	@Resource
    private CardService cardService;
	@Resource
    private CashFlowService cashFlowService;
	@Resource
    private CommonService commonService;
    @Resource
	private ReadExcel readExcel;
    public void downloadAccount(String username,HttpServletResponse response,String items){
    	List<List<List<String>>> list=new ArrayList<List<List<String>>>();
    	List<String> sheetNames=new ArrayList<String>();
    	String[] itemArr=items.split(",");
    	for(int i=0;i<itemArr.length;i++){
    		if(itemArr[i].equals("expense")){
    			downloadExpense(list,sheetNames,username);
    		}
    		if(itemArr[i].equals("property")){
    			downloadProperty(list,sheetNames,username);
    		}
    		if(itemArr[i].equals("card")){
    			downloadCard(list,sheetNames,username);
    		}
    		if(itemArr[i].equals("cashflow")){
    			downloadCashFlow(list,sheetNames,username);
    		}
    	}
		
		
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");//可以方便地修改日期格式
		String today = dateFormat.format( now ); 
		readExcel.setDownloadResponseSheets(list, sheetNames,response, "BackUp"+username+today);
    }
	
	public void downloadExpense(List<List<List<String>>> list,List<String> sheetNames,String username){
		
		List<Record> data=staticService.getAllRecordByUserName(username);
		List<String> columns=commonService.findAllColumnByTableNameWithoutID("expense");
		List<List<String>> recordList=new ArrayList<List<String>>();
		//添加首行  不含ID的列title
		recordList.add(columns);
		for(int i=0;i<data.size();i++){
			Record record=data.get(i);
			List<String> sheetList=new ArrayList<String>();
			sheetList.add(record.getTimes());
			sheetList.add(record.getIncomeTotal()+"");
			sheetList.add(record.getProfit()+"");
			sheetList.add(record.getCostDaily()+"");
			sheetList.add(record.getEating()+"");
			
			
			sheetList.add(record.getSupermarket()+"");
			sheetList.add(record.getParty()+"");
			sheetList.add(record.getRent()+"");
			sheetList.add(record.getTraffic()+"");
			sheetList.add(record.getElseCost()+"");
			sheetList.add(record.getRemark());
			sheetList.add(record.getClothes()+"");
			sheetList.add(record.getBook()+"");
			sheetList.add(username);
			
			recordList.add(sheetList);
		}
		sheetNames.add("开销");
		list.add(recordList);
	}
	
		public void downloadProperty(List<List<List<String>>> list,List<String> sheetNames,String username){
			
			List<Property> data=propertyService.getAllProperty(username);
			
			String[] propertyColumn="日期,合计,招商银行,中国银行,浦发银行,现金,支付宝,信用卡,按揭,公积金,房租,别人欠我,欠款,备注,holdername".split(",");
			List<String> columns = new ArrayList<String>();
			Collections.addAll(columns, propertyColumn);
			
			List<List<String>> sheetList=new ArrayList<List<String>>();
			//添加首行  不含ID的列title
			sheetList.add(columns);
			for(int i=0;i<data.size();i++){
				Property entity=data.get(i);
				List<String> rowList=new ArrayList<String>();
				rowList.add(entity.getTimes());
				rowList.add(entity.getTotal()+"");
				rowList.add(entity.getCard1()+"");
				rowList.add(entity.getCard2()+"");
				rowList.add(entity.getCard3()+"");
				rowList.add(entity.getCash()+"");
				rowList.add(entity.getAlipay()+"");
				rowList.add(entity.getCreditCard()+"");
				rowList.add(entity.getMortgage()+"");
				rowList.add(entity.getHousingFund()+"");
				rowList.add(entity.getRent()+"");
				rowList.add(entity.getLoan1()+"");
				rowList.add(entity.getLoan2()+"");
				rowList.add(entity.getRemark());
				rowList.add(username);
				sheetList.add(rowList);
			}
			sheetNames.add("资产");
			list.add(sheetList);
		}
		
		public void downloadCard(List<List<List<String>>> list,List<String> sheetNames,String username){
			List<Card> data=cardService.getAllCard(username);
			String[] propertyColumn="银行名称,卡号,余额,归属地,Hint,更新时间,备注,用户名".split(",");
			List<String> columns = new ArrayList<String>();
			Collections.addAll(columns, propertyColumn);
			
			List<List<String>> sheetList=new ArrayList<List<String>>();
			//添加首行  不含ID的列title
			sheetList.add(columns);
			for(int i=0;i<data.size();i++){
				Card entity=data.get(i);
				List<String> rowList=new ArrayList<String>();
				rowList.add(entity.getBankName());
				rowList.add(entity.getAccountNumber());
				rowList.add(entity.getBalance()+"");
				rowList.add(entity.getLocation());
				rowList.add(entity.getPassword());
				rowList.add(entity.getUpdateTime());
				rowList.add(entity.getRemark());
				rowList.add(username);
				sheetList.add(rowList);
			}
			sheetNames.add("银行卡");
			list.add(sheetList);
		}
		
		public void downloadCashFlow(List<List<List<String>>> list,List<String> sheetNames,String username){
			List<CashFlow> data=cashFlowService.getAllCashFlowByType(username,null);
			List<String> columns=commonService.findAllColumnByTableNameWithoutID("cashflow");
			columns.remove("TYPE");
			List<List<String>> sheetList=new ArrayList<List<String>>();
			//添加首行  不含ID的列title
			sheetList.add(columns);
			for(int i=0;i<data.size();i++){
				CashFlow entity=data.get(i);
				List<String> rowList=new ArrayList<String>();
				rowList.add(entity.getTimes());
				rowList.add(entity.getItem());
				rowList.add(entity.getMoney()+"");
				rowList.add(entity.getRemark());
				rowList.add(username);
				sheetList.add(rowList);
			}
			sheetNames.add("资金流动");
			list.add(sheetList);
		}

}
