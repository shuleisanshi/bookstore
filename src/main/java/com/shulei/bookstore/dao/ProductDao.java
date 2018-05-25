package com.shulei.bookstore.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.shulei.bookstore.model.Product;
import com.shulei.bookstore.utils.C3P0Utils;
import com.shulei.bookstore.utils.ManagerThreadLocal;

public class ProductDao {

	/**
	 * 计算总记录数
	 * @param category 如果是null,是表的所有记录数
	 * @return
	 * @throws SQLException 
	 */
	public long count(String category) throws SQLException{
		//1.定义记录数变量0
		long count = 0;
		
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		
		String sql = "select count(*) from products where 1=1";

		//等于空即显示所有书籍,不分类
		if(category != null && !"".equals(category)){
			sql += " and category = ?";
			count = (long) qr.query(sql, new ScalarHandler(),category);
		}else{
			count = (long) qr.query(sql, new ScalarHandler());
		}
		
		return count;
	}
	
	
	/**
	 * 
	 * @param category 类型
	 * @param page 当前页
	 * @param pageSize 每页显示的条数
	 * @return
	 * @throws SQLException 
	 */
	public List<Product> findBooks(String category,int page,int pageSize) throws SQLException{
		
		//拼接sql和参数
		String sql = "select * from products where 1=1";
		
		List<Object> params = new ArrayList<Object>();
		
		if(category != null && !"".equals(category)){
			sql += " and category = ?";
			params.add(category);
		}
		
		sql += " limit ?,?";
		int start = (page - 1) * pageSize;
		int length = pageSize;
		params.add(start);
		params.add(length);
		
		//执行
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		
		return qr.query(sql, new BeanListHandler<Product>(Product.class),params.toArray());
	}
	
	
	/**
	 * 通过id查找商品
	 * @throws SQLException 
	 */
	public Product findBook(String id) throws SQLException{
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from products where id=?";
		return qr.query(sql, new BeanHandler<Product>(Product.class),id);
	}
	

	/**
	 *  更新Store
	 * @param productId 商品ID
	 * @param num 减的数量
	 * @throws SQLException
	 */
	public void updatePNum(int productId,int num) throws SQLException{
		String sql = "update products set pnum = pnum - ? where id = ?";
		
		/*QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		qr.update(sql,num,productId);*/
		QueryRunner qr = new QueryRunner();
		qr.update(ManagerThreadLocal.getConnection(),sql,num,productId);
	}
}
