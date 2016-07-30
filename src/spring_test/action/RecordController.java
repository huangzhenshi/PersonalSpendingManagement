package spring_test.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

import spring_test.entity.Record;
import spring_test.service.StaticService;

@Controller
public class RecordController  extends ActionSupport{
	@Resource
	private StaticService staticSer;
	
	private String records;
	private Record record;
	private String owner;
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public Record getRecord() {
		return record;
	}

	public void setRecord(Record record) {
		this.record = record;
	}

	public String getRecords() {
		return records;
	}

	public void setRecords(String records) {
		this.records = records;
	}
	private String id;
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String delete()
	  {
		staticSer.deleteRecordById(id);
		records=staticSer.getCurrentRecord("huang", 10);
		 return "static";
	  }
	  public String edit()
	  {
		  records=staticSer.getCurrentRecord("huang", 10);
		return "static";
	  }
	  public String getGridData(){
		  staticSer.deleteRecordById(id);
		  records=staticSer.getCurrentRecord("huang", 10);    
	    return SUCCESS; 
	  }
	  
	  public String addOrUpdate(){
		  if(id!=null&&id.length()>0){
			  record=staticSer.findById(id);
		  }
		  
	    return "addOrUpdate"; 
	  }
	  public String addOrEditSava(){
		  //修改保存功能
		  if(id!=null&&id.length()>0){
			  staticSer.updateRecord(record); 
		  }else{
			  staticSer.saveRecord(record); 
		  }
		  records=staticSer.getCurrentRecord("huang", 10);
		  return "static";
	  }
	
	

}
