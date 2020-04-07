package com.inspur.cmis.controller;

import java.awt.Checkbox;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public ModelAndView login(User user,HttpSession session,HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv=new ModelAndView();
		User checkUser=null;
		if(null!=user){
			checkUser=userService.getUser(user);
		}
		if(null!=checkUser){
			//将登录的user名和user对象放到session里
			String uname=checkUser.getUsername();
			session.setAttribute("uname", uname);
			session.setAttribute("user", checkUser);
			mv.setViewName("main.jsp");
			
			//修改此用户的最后登录时间
			Date today=new Date();
			SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
			String lastTime=format.format(today);
			user.setLastTime(lastTime);
			userService.updateLastTime(user);
			
			//是否记住密码
			String rem=request.getParameter("rem");
			Cookie cookie=new Cookie("user", uname+"#"+user.getPassword());
			if(rem!=null&&rem.equals("1")) {
				cookie.setMaxAge(60*60*24*7);
			}else {
				cookie.setMaxAge(0);
			}
			response.addCookie(cookie);
		}
		else{
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
