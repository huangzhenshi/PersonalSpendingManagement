package account_huang.filter;

import java.io.IOException;



import javax.servlet.Filter;

import javax.servlet.FilterChain;

import javax.servlet.FilterConfig;

import javax.servlet.ServletException;

import javax.servlet.ServletRequest;

import javax.servlet.ServletResponse;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpServletResponseWrapper;

public class SessionFilter implements Filter{
	public FilterConfig config;

    

    public void destroy() {
        this.config = null;
    }

    

    public static boolean isContains(String container, String regx) {
            if (container.indexOf(regx) != -1) {
                return true;
            }
        return false;

    }

 
/**
 * 允许直接进入后台的请求才调用  chain.doFilter(request, response); 否则直接wrapper.sendRedirect(redirectPath); 重定向到 redirectPath，一般都是登录页面
 * 过滤掉 登录页面  ：1）进入登录页面  2）校验登陆的request  这个可以在 web.xml的init-param 里面配置logonStrings
 */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest hrequest = (HttpServletRequest)request;
        HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper((HttpServletResponse) response);
        String logonStrings = config.getInitParameter("logonStrings");        // 登录登陆页面
        String redirectPath = hrequest.getContextPath() + config.getInitParameter("redirectPath");// 没有登陆转向页面
        String includeStrings = config.getInitParameter("includeStrings"); 
        String test=hrequest.getRequestURI();
        if (!this.isContains(hrequest.getRequestURI(), includeStrings)) {// 只对指定过滤参数后缀进行过滤
            chain.doFilter(request, response);
            return;
        }
        if (this.isContains(hrequest.getRequestURI(), logonStrings)) {// 对登录页面不进行过滤
            chain.doFilter(request, response);
            return;
        }
       

        String username = ( String ) hrequest.getSession().getAttribute("username");//判断用户是否登录
        if (username == null) {
            wrapper.sendRedirect(redirectPath);
            return;
        }else {
            chain.doFilter(request, response);
            return;
        }
    }

 

    public void init(FilterConfig filterConfig) throws ServletException {
        config = filterConfig;
    }

}