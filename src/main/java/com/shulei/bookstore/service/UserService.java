package com.shulei.bookstore.service;

import java.sql.SQLException;

import com.shulei.bookstore.dao.UserDao;
import com.shulei.bookstore.exception.UserException;
import com.shulei.bookstore.model.User;
import com.shulei.bookstore.utils.SendJMail;

public class UserService {

	
	UserDao userDao = new UserDao();
	
	public void register(User user)throws UserException{
		try {
			//往数据库添加用户
			userDao.addUser(user);
			
			/**
			 * 项目发布时，连接要改成域名www.bookstore.com
			 */
			String link = "http://localhost:8085/bookstore/active?activeCode=" + user.getActiveCode();
			
			String html = "<a href=\"" + link + "\">欢迎你注册网上书城帐号,请点击激活</a>";
			System.out.println(html);
			//发送激活邮件
			SendJMail.sendMail(user.getEmail(), html);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new UserException("注册失败，用户名重复");
		}
	}
	
	/**
	 * 激活用户
	 * 不要在try里面写throw,否则在catch 
	 */
	public void activeUser(String activeCode)throws UserException {
		try {
			//1.查询激活码的用户是否存在
			User user = userDao.findUserByActiveCode(activeCode);
			
			if(user == null){
				throw new UserException("非法激活，用户不存在");
			}
			
			if(user!=null && user.getState() == 1){
				throw new UserException("用户已经激活过了...");
			}
			//激活用户
			userDao.updateState(activeCode);
		} catch (SQLException e) {
			throw new UserException("激活失败");
		}
		

		
		
	}
	
	/*public void activeUser(String activeCode)throws UserException {
		User user = null;
		try {
			//1.查询激活码的用户是否存在
			user = userDao.findUserByActiveCode(activeCode);
		} catch (Exception e) {
			throw new UserException("激活失败");
		}
		

		if(user == null){
			throw new UserException("非法激活，用户不存在");
		}
		
		if(user!=null && user.getState() == 1){
			throw new UserException("用户已经激活过了...");
		}
		
		//2.激活用户
		try {
			userDao.updateState(activeCode);
		} catch (SQLException e) {
			throw new UserException("激活失败");
		}
	}*/
	
	public User login(String username,String password)throws UserException{
		
		
		try {
			//1.查询
			User user = userDao.findUserByUsernameAndPassword(username, password);
			
			//2.判断
			if(user == null){
				throw new UserException("用户名或者密码不正确");
			}
			
			if(user.getState() == 0){
				throw new UserException("用户未激活，请先登录邮件进行激活");
			}
			
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new UserException("登录失败");
		}
	}
	
	public User findUserById(String id)throws UserException{
		try {
			//1.查询
			User user = userDao.findUserById(id);
			//2.判断
			if(user == null){
				throw new UserException("用户名不存在");
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException("未知错误");
		}
	}
	
	public void modifyUserInfo(User user)throws UserException{
		try {
			userDao.updateUser(user);
		} catch (SQLException e) {
			throw new UserException("未知错误");
		}
	}
}

