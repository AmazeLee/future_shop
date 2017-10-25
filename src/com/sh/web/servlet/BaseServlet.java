package com.sh.web.servlet;

import java.io.IOException;
import java.lang.reflect.Method;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     @Override
    protected void service(HttpServletRequest reg, HttpServletResponse resp) throws ServletException, IOException { 
    	 try {
    		 // 同过反射拿到类
    		 Class<? extends BaseServlet> clazz = this.getClass();
    		 // 获取参数
    		 String md = reg.getParameter("method");
    		 
    		 if(md==null) {
    			 md="index.jsp";
    		 }

    		 // 通过反射拿到方法
    		 Method method = clazz.getMethod(md, HttpServletRequest.class,HttpServletResponse.class);
    		 // 调用方法
    		 String path=(String) method.invoke(this, reg, resp);
    		 // 转发
    		 if(path!=null) {
    			 reg.getRequestDispatcher(path).forward(reg, resp);
    		 }
    		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	 
    	 
    }
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//this.doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
	}
}
