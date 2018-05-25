package com.shulei.bookstore.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.shulei.bookstore.model.Order;
import com.shulei.bookstore.model.OrderItem;
import com.shulei.bookstore.model.Product;
import com.shulei.bookstore.model.User;
import com.shulei.bookstore.service.OrderService;

/**
 * 生成定单
 * @author shulei
 *
 */
@WebServlet("/createOrder")
public class CreateOrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取session的user
		User user = (User) request.getSession().getAttribute("user");
		if(user == null){
			response.getWriter().write("Ilegal visit...");
			return;
		}
		
		//取购物车
		Map<Product,Integer> cart = (Map<Product, Integer>) request.getSession().getAttribute("cart");
		if(cart == null || cart.size() == 0){
			response.getWriter().write("There is no book in cart ");
			return;
		}
		
		
		//1.把数据封装好
		Order order = new Order();
		try {
			//1.1把请求参数封装成Order
			BeanUtils.populate(order, request.getParameterMap());
			
			//1.2补全Order数据
			order.setId(UUID.randomUUID().toString());
			order.setOrdertime(new Date());
			order.setUser(user);
			
			//1.3封装定单详情OrderItem【定单有n个商品】
			List<OrderItem> items = new ArrayList<OrderItem>();
			//取购物车
			double totalPrice = 0;
			for(Entry<Product, Integer> entry : cart.entrySet()){
				OrderItem item = new OrderItem();
				//设置购物数量
				item.setBuynum(entry.getValue());
				//设置商品
				item.setProduct(entry.getKey());
				//设置定单
				item.setOrder(order);
				
				totalPrice += entry.getKey().getPrice() * entry.getValue();
				
				items.add(item);
			}
			
			//设置Order中items
			order.setItems(items);
			
			//1.4设置总价格
			order.setMoney(totalPrice);
			
			
			
			//2.插入数据库
			OrderService os = new OrderService();
			os.createOrder(order);
			
			
			//3.定单成功(移除购物车数据)
			request.getSession().removeAttribute("cart");
			
			//4.响应:
			response.getWriter().write("Order success....");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
