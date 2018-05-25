package com.shulei.bookstore.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shulei.bookstore.model.PageResult;
import com.shulei.bookstore.model.Product;
import com.shulei.bookstore.service.ProductService;

@WebServlet("/showProductByPage")
public class ShowProductByPageServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.获取参数
		String category = request.getParameter("category");
		String pageStr = request.getParameter("page");
		int page = 1;
		if(pageStr != null && !"".equals(pageStr)){
			//把字符串转成int
			page = Integer.parseInt(pageStr);
		}
		
		//2.调用service
		ProductService ps = new ProductService();
		PageResult<Product> pageResult = ps.findBooks(category, page);
		
		//3.存在request
		request.setAttribute("pageResult", pageResult);
		request.setAttribute("category", category);
		
		//4.跳转页面
		request.getRequestDispatcher("/product_list.jsp").forward(request, response);
				
	
	}
}
