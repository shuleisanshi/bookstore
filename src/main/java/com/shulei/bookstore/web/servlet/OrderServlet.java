package com.shulei.bookstore.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shulei.bookstore.model.Order;
import com.shulei.bookstore.model.User;
import com.shulei.bookstore.service.OrderService;

/**
 * 订单模块
 * @author shulei
 *
 */
@WebServlet("/order")
public class OrderServlet extends BaseServlet{
	
	
	/**
	 * 通过用户id查找他所属定单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void findOrderById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//1.获取用户的id
		User user = (User) request.getSession().getAttribute("user");
		if(user == null){
			response.getWriter().write("非法访问..");
			return;
		}
		
		//2.调用service
		OrderService os = new OrderService();
		List<Order> orders =  os.findOrdersByUserId(user.getId()+"");
		
		//3.存数据在request
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("/orderlist.jsp").forward(request, response);
	}
}
