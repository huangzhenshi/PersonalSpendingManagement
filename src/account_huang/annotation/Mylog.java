/**
 * 
 */
package account_huang.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Documented
public @interface Mylog{
	
	/** 模块名称 */
	String moduleName() default "";
	
	/** 操作动作 */
	String operate() default "";
	
	/** 操作内容 */
	String result() default "";
	
	/** 操作详细信息 */
	String detail() default "";
	
	/** 是否是登录日志,默认false。  */
	boolean isLogin() default false;
}
