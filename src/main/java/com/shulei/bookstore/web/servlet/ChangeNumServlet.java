package com.shulei.bookstore.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shulei.bookstore.model.Product;
import com.shulei.bookstore.service.ProductService;

/**
 * 更新购物车数量
 * @author shulei
 *
 */
@WebServlet("/changeNum")
public class ChangeNumServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//1.获取参数
		String id = req.getParameter("id");//商品ID
		String num = req.getParameter("num");//购物数量
		
		//2.更新购物车数据
		//2.1 通过id查找商品
		ProductService ps = new ProductService();
		Product p = ps.findBook(id);
		
		//to-do.....
		//判断购物的数据与Store的数量...
		
		//2.2 通过商品更新session数据
		@SuppressWarnings("unchecked")
		Map<Product,Integer> cart = (Map<Product, Integer>) req.getSession().getAttribute("cart");
	
		//替换
		if(cart.containsKey(p)){//判断是否有这个商品
			if("0".equals(num)){//移除商品
				cart.remove(p);
			}else{
				cart.put(p, Integer.parseInt(num));
			}
		}
		
		//重新保存到session
		req.getSession().setAttribute("cart", cart);
		
		//回到购物车页面
		resp.sendRedirect(req.getContextPath() + "/cart.jsp");
	}
}
