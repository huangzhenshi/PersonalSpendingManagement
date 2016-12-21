package account_huang.service;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
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
import account_huang.entity.Record;
import account_huang.utils.ReadExcel;

@Service
public class ExcelService {
	@Resource
    private SqlSessionTemplate template;
	@Resource
    private StaticService staticService;
	@Resource
    private CommonService commonService;
    @Resource
	private ReadExcel readExcel;
	
	public void downloadExpense(String username,HttpServletResponse response){
		List<Record> data=staticService.getAllRecordByUserName(username);
		List<String> columns=commonService.findAllColumnByTableNameWithoutID("expense");
		List<List<String>> list=new ArrayList<List<String>>();
		//添加首行  不含ID的列title
		list.add(columns);
		for(int i=0;i<data.size();i++){
			Record record=data.get(i);
			List<String> recordDataList=new ArrayList<String>();
			recordDataList.add(record.getTimes());
			recordDataList.add(record.getIncomeTotal()+"");
			recordDataList.add(record.getProfit()+"");
			recordDataList.add(record.getCostDaily()+"");
			recordDataList.add(record.getEating()+"");
			
			list.add(recordDataList);
		}
		
		readExcel.setDownloadResponse(list, response, "OnlyExpense");
		
	}

}
