package com.shulei.bookstore.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet{


	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("接收到请求:" + request.getMethod());
		//1.获取action参数
		String action = request.getParameter("action");
				
		//2.通过反射来调用方法
		//2.1获取Class
		Class clz = this.getClass();
		System.out.println(clz);
		
		//2.2通过class获取方法
		try {
			Method method = clz.getMethod(action, HttpServletRequest.class,HttpServletResponse.class);
			
			//2.3调用方法
			method.invoke(this, request,response);
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
			response.getWriter().write("NoSuchMethodException");
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().write("SecurityException");
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().write("IllegalAccessException");
		} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.getWriter().write("IllegalArgumentException");
		} catch (InvocationTargetException e) {
				response.getWriter().write("InvocationTargetException");
		}
	}
}
