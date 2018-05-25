package com.shulei.bookstore.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import com.shulei.bookstore.model.OrderItem;
import com.shulei.bookstore.utils.C3P0Utils;
import com.shulei.bookstore.utils.ManagerThreadLocal;

public class OrderItemDao {

	/**
	 * 添加定单详情
	 * @param items
	 * @throws SQLException 
	 */
	/*public void addOrderItems(List<OrderItem> items) throws SQLException{
		String sql = "insert into orderitem (order_id,product_id,buynum) values(?,?,?)";
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		for(OrderItem item : items){
			qr.update(sql,item.getOrder().getId(),item.getProduct().getId(),item.getBuynum());
		}
	}*/
	
	/**
	 * 性能更加批处理：因为只执行1条sql语句
	 * @param items
	 * @throws SQLException
	 */
	public void addOrderItems(List<OrderItem> items) throws SQLException{
		String sql = "insert into orderitem (order_id,product_id,buynum) values(?,?,?)";
		
		
		//创建二维数组
		/**
		 * {
		 * {a,b,c},
		 * {a,b,c}
		 * }
		 * 
		 * sql批处理:
		 * insert into orderitems values('1234','1','2'),('1234','1','2'),('1234','1','2')
		 * insert into orderitems values('1234','1','2')
		 * insert into orderitems values('1234','1','2')
		 * insert into orderitems values('1234','1','2')
		 */
		Object[][] params = new Object[items.size()][];
		for(int i=0;i<items.size();i++){
			OrderItem item = items.get(i);
			params[i] = new Object[]{item.getOrder().getId(),item.getProduct().getId(),item.getBuynum()};
		}
		
		//批处理执行sql语句
		//QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		//qr.batch(sql, params);
		
		QueryRunner qr = new QueryRunner();
		qr.batch(ManagerThreadLocal.getConnection(),sql, params);
	}
	
}
