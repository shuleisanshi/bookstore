package com.shulei.bookstore.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shulei.bookstore.model.Order;
import com.shulei.bookstore.service.OrderService;

/**
 * 定单详情的Servlet
 * @author shulei
 *
 */
@WebServlet("/findOrderByOrderId")
public class FindOrderByOrderIdServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//1.获取orderId
		String orderId = request.getParameter("orderId");
		
		//2.调用service
		OrderService os = new OrderService();
		Order order = os.findOrderByOrderId(orderId);
		
		//3.转发到orderInfo.jsp【显示数据】
		request.setAttribute("order", order);
		request.getRequestDispatcher("/orderInfo.jsp").forward(request, response);
		
	}
	
}
