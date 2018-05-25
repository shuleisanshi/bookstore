package com.shulei.bookstore.utils;

import java.sql.Connection;
import java.sql.SQLException;

public class ManagerThreadLocal {

	private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();
	
	public static Connection getConnection(){
		try {
			Connection conn = tl.get();
			
			//第一次是空
			if(conn == null){
				//从数据源取
				conn = C3P0Utils.getConnection();
				tl.set(conn);

			}else{
				//System.out.println("第n次从ThreadLocal获取connection对象");
			}
			
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 开启事务
	 */
	public static void beginTransaction(){
		try {
			getConnection().setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 回滚事务
	 */
	public static void rollbackTransaction(){
		try {
			getConnection().rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	/**
	 * 提交事务
	 */
	public static void commitTransaction(){
		try {
			getConnection().commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 关闭连接
	 */
	public static void close(){
		try {
			getConnection().close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
