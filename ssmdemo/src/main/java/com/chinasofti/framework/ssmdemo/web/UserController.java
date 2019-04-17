package com.chinasofti.framework.ssmdemo.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chinasofti.framework.ssmdemo.model.User;
import com.chinasofti.framework.ssmdemo.service.UserService;

@Controller
@RequestMapping("user")

public class UserController {
	int default_login=3;

	@Autowired
	private UserService userService;
	
	@RequestMapping("regist")
	public String addUser(HttpServletRequest req, HttpServletResponse resp) {
		String username=req.getParameter("username");
        String pwd=req.getParameter("password");
        String uphone=req.getParameter("uphone");
        String  uqq=req.getParameter("uqq");
        
		User user = new User(username,pwd,uphone,uqq);
		
		userService.add(user);
		
		return "login";
	}
	     
	     @RequestMapping("login")
	     public String login(HttpServletRequest req){
			int canlogin=userService.findLoginCount();
			if (canlogin>0){
				HttpSession session=req.getSession();
				String uname=req.getParameter("username");
				String pwd=req.getParameter("password");
				session.setAttribute("username",uname);
				System.out.println(uname);
				User user = new User();
				user=userService.select(uname);
				System.out.println(user);
				if(user!=null && user.getPassword().equals(pwd)){
					return "page";
					}
				else
					{
						userService.updateLogin(canlogin-1);
					}
			}
			else {
				return "flogin";
			}
	         return "login";
	     }
	     @RequestMapping("toAddSort")
		public String toAddSort(){
	     	return "add";
		     }
	
}
