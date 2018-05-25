package com.shulei.bookstore.service;

import java.sql.SQLException;
import java.util.List;

import com.shulei.bookstore.dao.OrderDao;
import com.shulei.bookstore.dao.OrderItemDao;
import com.shulei.bookstore.dao.ProductDao;
import com.shulei.bookstore.model.Order;
import com.shulei.bookstore.model.OrderItem;
import com.shulei.bookstore.utils.ManagerThreadLocal;

public class OrderService {

	/*public void createOrder(Order order,List<OrderItem> items){
		
	}*/
	
	/**
	 * 添加定单业务方法
	 * @param order
	 */
	
	private OrderDao orderDao = new OrderDao();
	private OrderItemDao orderItemDao = new OrderItemDao();
	private ProductDao productDao = new ProductDao();
	public void createOrder(Order order){
		try {
			//开启事务
			ManagerThreadLocal.beginTransaction();
			//1.插入定单表
			orderDao.add(order);
			
			//2插入定单详情表
			orderItemDao.addOrderItems(order.getItems());
			
			//3.减Store
			for(OrderItem item : order.getItems()){
				productDao.updatePNum(item.getProduct().getId(), item.getBuynum());
			}
			
			//结束事务
			ManagerThreadLocal.commitTransaction();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			//事务回滚
			ManagerThreadLocal.rollbackTransaction();
		}
		
	}
	
	public List<Order> findOrdersByUserId(String userid){
		try {
			return orderDao.findOrdersByUserId(userid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 通过订单id找Order
	 * @param orderid
	 * @return
	 */
	public Order findOrderByOrderId(String orderId){
		try {
			return orderDao.findOrderByOrderId(orderId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
