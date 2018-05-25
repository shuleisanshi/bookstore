package com.shulei.bookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.shulei.bookstore.model.Order;
import com.shulei.bookstore.model.OrderItem;
import com.shulei.bookstore.model.Product;
import com.shulei.bookstore.utils.C3P0Utils;
import com.shulei.bookstore.utils.ManagerThreadLocal;
import com.sun.org.apache.xpath.internal.operations.Or;

public class OrderDao {

	/**
	 * 添加一张定单
	 * @param order
	 * @throws SQLException 
	 */
	public void add(Order order) throws SQLException{
		//1.sql语句
		String sql = "insert into orders values(?,?,?,?,?,?,?,?)";
		
		//2.参数
		List<Object> params = new ArrayList<Object>();
		params.add(order.getId());
		params.add(order.getMoney());
		params.add(order.getReceiverAddress());
		params.add(order.getReceiverName());
		params.add(order.getReceiverPhone());
		params.add(order.getPaystate());
		params.add(order.getOrdertime());
		params.add(order.getUser().getId());
		
		//3.执行
		/*QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		qr.update(sql,params.toArray());*/
		
		QueryRunner qr = new QueryRunner();
		qr.update(ManagerThreadLocal.getConnection(),sql,params.toArray());
		
	}
	
	/**
	 * 通过用户id查找他的所有定单
	 * @param userid
	 * @return
	 * @throws SQLException
	 */
	public List<Order> findOrdersByUserId(String userid) throws SQLException{
		String sql = "select * from orders where user_id = ?";
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		return qr.query(sql, new BeanListHandler<Order>(Order.class),userid);
	}
	
	
	/**
	 * 通过订单id查询Order数据
	 * @param orderId
	 * @return
	 * @throws SQLException 
	 * 
	 * 如果模型里模型，这个的话需要自己封装数据
	 */
	public Order findOrderByOrderId(String orderId) throws SQLException{
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		
		//1.查询Order表,把数据封装到Order对象
		String sql1 = "select * from orders where id = ?";
		Order order = qr.query(sql1, new BeanHandler<Order>(Order.class),orderId);
		
		//2.查询OrderItem表，把数据封装到Order的items属性
	/*	OrderItem item = new OrderItem();
		item.setBuynum(buynum);
		item.setProduct(product);//商品的话，只需要名称和价格的字段
		*/
		String sql2 = "SELECT o.*,p.name,p.price FROM orderitem o,products p WHERE o.product_id = p.id and order_id=?";
		//自己封装数据
		List<OrderItem> mItems = qr.query(sql2, new ResultSetHandler<List<OrderItem>>(){

			@Override
			public List<OrderItem> handle(ResultSet rs) throws SQLException {
				//1.创建集合对象
				List<OrderItem> items = new ArrayList<OrderItem>();
				
				//2.遍历
				while (rs.next()) {
					//创建OrderItem对象
					OrderItem item = new OrderItem();
					item.setBuynum(rs.getInt("buynum"));
					
					//创建Product对象
					Product p = new Product();
					p.setId(rs.getInt("product_id"));
					p.setName(rs.getString("name"));
					p.setPrice(rs.getDouble("price"));
					
					//把product放在item
					item.setProduct(p);
					
					//把item放在items去
					items.add(item);
				}
				return items;
			}
		},orderId);
		
		
		//把items放在order里面
		order.setItems(mItems);
		return order;
	}
	

}
