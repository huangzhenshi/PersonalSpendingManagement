package account_huang.utils;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import account_huang.entity.Record;

public class Utils {
	//利用反射原理，遍历参数对象的属性，如果类型是Integer的参数值是null或者为“”，则转换为0
	public static  Object mathConvertToZero(Object obj) throws Exception{
		Class<?> classType=obj.getClass();
		Field[] fields=classType.getDeclaredFields();
		for(Field field:fields){
				if("Integer".equals(field.getType().getSimpleName())){
					String fieldName=field.getName();
					String getMethodName="get"+StringUtils.capitalize(fieldName);
					Method getMethod=classType.getMethod(getMethodName, new Class[]{});
					Object value=getMethod.invoke(obj,new Object[]{});
					if(value==null||StringUtils.isEmpty(value.toString())){
						value=Integer.parseInt("0");
						String setMethodName="set"+StringUtils.capitalize(fieldName);
						Method setMethod=classType.getMethod(setMethodName, new Class[]{Integer.class});
						setMethod.invoke(obj,new Object[]{value});
					}	
				}
		}
		return obj;
	}
	
	/**
	 * 根据传入一个天数，返回从今天开始到之前N天的日期的list  格式2016-08-31，不含今天
	 * @return
	 */
	public static List<String> getDaysBefore(int days){
		Calendar theCa = Calendar.getInstance();
		 theCa.setTime(new Date());
		 theCa.add(theCa.DATE, -days);
		 Date date = theCa.getTime();
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		List<String> list=new ArrayList<String>();
		 for(int i=1;i<days;i++){
			list.add(dateFormat.format(date.getTime()));
			theCa.setTime(date);
			theCa.add(Calendar.DATE, 1);
			date = theCa.getTime();
		 }
		return list;
	}
	/**
	 * 获取距离今天N天前的String格式的日期
	 */
	public static String getDateToString(int days){
		Calendar theCa = Calendar.getInstance();
		 theCa.setTime(new Date());
		 theCa.add(theCa.DATE, -days);
		 Date date = theCa.getTime();
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 String result=dateFormat.format(date.getTime());
		 return result;
	}
	
	public static void  setPageElementMap(Map<String,Object> map,PageCoral page){
		//如果不做分页
		if(page==null||page.getP_pagesize()==null){
			return;
		}
		int total=page.getTotal();
		int pageSize=page.getP_pagesize();
        map.put("pageNumber",page.getP_pageNumber());
        map.put("pageSize", pageSize);
        map.put("total", total);
        if(page.getTotal()%page.getP_pagesize()==0){
        	  map.put("totalPages",total/pageSize);
        }else{
        	 map.put("totalPages",(total/pageSize)+1);
        }
	}
	
	public static String getCurrentDate(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(new Date());
	}
	
	public static String getCurrentTime(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(new Date());
	}
	public static String getCurrentTimeString(){
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		return df.format(new Date());
	}
	
	/**
	 * 根据分割符将字符串进行分割.
	 * 例：<pre>
	 * StringUtils.split(null,"${","}")  = null
	 * StringUtils.split("","${","}")  = null
	 * StringUtils.split("你好","${","}")  = String[]{"你好","",""}
	 * StringUtils.split("你好${吗？","${","}")  = String[]{"你好${吗？","",""}
	 * StringUtils.split("你好}吗？","${","}")  = String[]{"你好}吗？","",""}
	 * StringUtils.split("你好${userName}:你所在组织为${orgName}.","${","}")  = String[]{"你好","userName",":你所在组织为${orgName}."}
	 * </pre>
	 */
	
	public static String[] split(String str, String separatorChars, String separatorEndChars) {
		if (str == null) return null;
		
		int pos = str.indexOf(separatorChars);
		int ePos = str.indexOf(separatorEndChars);
		
		if (pos == -1 || ePos == -1) return new String[]{str,"",""};
		return new String[]{str.substring(0,pos),str.substring(pos+separatorChars.length(),ePos),str.substring(ePos+separatorEndChars.length())};
	}
	
	public static boolean deleteFile(String filePath) {  
	 Boolean  flag = false;  
	 try{ 
			File file = new File(filePath);  
		    // 路径为文件且不为空则进行删除  
		    if (file.isFile() && file.exists()) {  
		        file.delete();  
		        flag = true;  
		    }  
	    }catch(Exception e){
	    	System.out.println("file delete fail!");
	    }
	    return flag;  
	} 
}
