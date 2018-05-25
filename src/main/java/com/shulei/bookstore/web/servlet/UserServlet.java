package com.shulei.bookstore.web.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.shulei.bookstore.exception.UserException;
import com.shulei.bookstore.model.User;
import com.shulei.bookstore.service.UserService;

/**
 * 用户模块
 * @author shulei
 *
 */
@WebServlet("/user")
public class UserServlet extends BaseServlet{
	
	public void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		request.setCharacterEncoding("UTF-8");
		
		//检验验证码
		//获取表单的验证码
		String checkcode_client = request.getParameter("checkcode");
		String checkcode_session = (String) request.getSession().getAttribute("checkcode_session");

		if(!checkcode_client.equals(checkcode_session)){
			//客户端提交的验证和服务器不一样,跳回注册页面
			request.setAttribute("checkcode_err", "验证不一至");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		
		//1.把参数转成Bean，model
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());

			
			//给无数据的属性赋值
			user.setActiveCode(UUID.randomUUID().toString());//激活码
			user.setRole("普通用户");//角色
			user.setRegistTime(new Date());

			
			//2.注册
			UserService us = new UserService();
			us.register(user);
			
			//3.返回结果
			//3.1成功-进入成功界面
			request.getRequestDispatcher("/registersuccess.jsp").forward(request, response);
		}catch (UserException e) {
			e.printStackTrace();
			//3.2失败-回到注册页面
			request.setAttribute("register_err", e.getMessage());
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("参数转模型失败....");
		} 
	}

	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}

	
	/**
	 * 处理登录
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//1.获取请求参数
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//2.调用service
		UserService us = new UserService();
		try {
			User user = us.login(username, password);
			//把user保存到session
			request.getSession().setAttribute("user", user);
			
			if("管理员".equals(user.getRole())){//进入后台界面
				response.sendRedirect(request.getContextPath() + "/admin/login/home.jsp");
			}else{//登录成功，回到首页index.jsp
				response.sendRedirect(request.getContextPath() + "/index.jsp");
			}
			
		} catch (UserException e) {
			e.printStackTrace();
			//登录失败，回到登录页面
			request.setAttribute("login_msg", e.getMessage());
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}
	
	public void delete() throws ServletException, IOException {
		
	}
}
