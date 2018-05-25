package com.shulei.bookstore.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.shulei.bookstore.model.User;
import com.shulei.bookstore.service.UserService;

@WebServlet("/modifyUserInfo")
public class ModifyUserInfoServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//1.获取表单的参数
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());

			//2.修改
			UserService us = new UserService();
			us.modifyUserInfo(user);
			
			//3.跳转
			response.sendRedirect(request.getContextPath() + "/modifyUserInfoSuccess.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().write(e.getMessage());
		}
		
		//2........
		
	}
}