package com.shulei.bookstore.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shulei.bookstore.model.User;

/**
 * 结帐的功能
 * @author shulei
 *
 */
@WebServlet("/settleAccount")
public class SettleAccountServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		判断当前浏览器是否有登录
		User user = (User) req.getSession().getAttribute("user");
//		如果有登录进行定单页面
		if(user != null){
			resp.sendRedirect(req.getContextPath() + "/order.jsp");
		}else{
//			如果没有登录，先进行登录			
			resp.sendRedirect(req.getContextPath() + "/login.jsp");
		}

	}
}
