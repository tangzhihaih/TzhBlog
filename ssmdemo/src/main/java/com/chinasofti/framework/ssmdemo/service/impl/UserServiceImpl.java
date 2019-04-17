package com.chinasofti.framework.ssmdemo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.framework.ssmdemo.dao.UserDAO;
import com.chinasofti.framework.ssmdemo.model.User;
import com.chinasofti.framework.ssmdemo.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public void add(User user) {
		userDAO.insert(user);
	}

	@Override
	public User select(String username) {
		User user=userDAO.find(username);
		System.out.println(user);
		return user;
	}
	@Override
	public  int updateLogin(int can_login){
		return  userDAO.updateLogin(can_login);
	}
	@Override
	public int findLoginCount(){
		return userDAO.findLoginCount();
	}

}
