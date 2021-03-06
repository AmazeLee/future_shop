package com.sh.web.filter;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sh.domain.User;
import com.sh.service.UserService;
/**
 * 自动登录过滤器
 * @author Administrator
 *
 */
public class AutoLoginFilter implements Filter{

	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		//获取Cookie中用户名和密码
		//定义cookie_stuid cookie_loginpwd
		String cookie_username = null;
		String cookie_password = null;
		
		//获得Cookie
		Cookie[] cookies = req.getCookies();
		if(cookies!=null) {
			for (Cookie cookie : cookies) {
				//获取名字是cookie_stuid cookie_loginpwd
				if("cookie_username".equals(cookie.getName())) {
					cookie_username = cookie.getValue();
				}
				if("cookie_password".equals(cookie.getName())) {
					cookie_password = cookie.getValue();
				}
			}
		}
		
		//判断cookie_username cookie_password是否是null
		if(cookie_username!=null&&cookie_password!=null) {
			UserService service = new UserService();
			User user = null;
			try {
				//向service层发出请求，进行登录操作
				user = service.login(cookie_username,cookie_password);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			session.setAttribute("user", user);
			//System.out.println(user);
		}
		//放行
		chain.doFilter(req, resp);
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}


	@Override
	public void destroy() {
		
	}

}
