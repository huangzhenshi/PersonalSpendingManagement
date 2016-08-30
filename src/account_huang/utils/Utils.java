package account_huang.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

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
}
