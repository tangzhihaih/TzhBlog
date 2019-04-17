package com.chinasofti.framework.ssmdemo.dao;

import com.chinasofti.framework.ssmdemo.model.User;

public interface UserDAO {

	void insert(User user);
	User find(String username);
	int updateLogin(int can_login);
	int findLoginCount();
}
