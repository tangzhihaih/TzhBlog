package com.chinasofti.framework.ssmdemo.service;

import com.chinasofti.framework.ssmdemo.model.User;

public interface UserService {

	void add(User user);
    User select(String username);
    int updateLogin(int can_login);
    int findLoginCount();
}
