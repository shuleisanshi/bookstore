package com.shulei.bookstore.web.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shulei.bookstore.model.Product;
import com.shulei.bookstore.service.ProductService;

/**
 * 添加购物车
 * @author shulei
 * 难点：如何判断你当前买的书在购物车已经存在?
 * 技巧：重写Product的equals方法，根据id判断就可以
 */
@WebServlet("/addCart")
public class AddCartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//1.获取id
		String id = request.getParameter("id");
		
		//2.通过id查询数据库对应商品
		ProductService ps = new ProductService();
		Product p = ps.findBook(id);
		
		//3.把购买商品放在购物车Map
		//3.1先从session获取购物车数据[cart]
		Map<Product,Integer> cart = (Map<Product, Integer>) request.getSession().getAttribute("cart");
		
		//3.2如果没有购物车数据，就创建一个map对象
		if(cart == null){
			cart = new HashMap<Product, Integer>();
			cart.put(p, 1);
		}else{
			
			//3.3 判断map里面是否有当前想购物商品
			if(cart.containsKey(p)){
				cart.put(p, cart.get(p) + 1);
			}else{
				cart.put(p, 1);
			}
		}
		
		//4.打印购物车数据
		for(Entry<Product, Integer> entry : cart.entrySet()){
			System.out.println(entry.getKey() + "Count" + entry.getValue());
		}
		
		//5.存session
		request.getSession().setAttribute("cart", cart);
		
		//6.响应客户端面
		//继续购物，查看购物车
		String a1 = "<a href=\"" + request.getContextPath()+"/showProductByPage\">Buy others</a>";
		String a2 = "&nbsp;&nbsp;<a href=\"" + request.getContextPath()+"/cart.jsp\">Check your cart</a>";
		response.getWriter().write(a1);
		response.getWriter().write(a2);
	}


	

}
