package com.inspur.cmis.controller;

import java.awt.Checkbox;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.inspur.cmis.pojo.User;
import com.inspur.cmis.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;

	/**
	 * 登录方法
	 * @param username
	 * @param password
	 * @return
	 */
	//1.方法名字 方法的参数 方法的返回类型
	@RequestMapping("/loginController")
	public ModelAndView login(User user,HttpSession session){
		ModelAndView mv=new ModelAndView();
		User checkUser=null;
		if(null!=user){
			checkUser=userService.getUser(user);
		}
		if(null!=checkUser){
			mv.addObject("success","恭喜，登录成功!");
			//mv.addObject("user",checkUser);
			session.setAttribute("user", checkUser);
			mv.setViewName("main.jsp");
		}else{
			mv.addObject("error","用户名密码错误，请重新登录！");
			mv.setViewName("login.jsp");
		}
		//判断时间
		GregorianCalendar ca = new GregorianCalendar();  
		if(ca.get(GregorianCalendar.AM_PM)==0) {
			session.setAttribute("time", "上午好");  
		} else {
			session.setAttribute("time", "下午好");
		}
		return mv;
	}
}
