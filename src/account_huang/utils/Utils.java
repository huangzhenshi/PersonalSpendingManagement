package account_huang.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

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
}
