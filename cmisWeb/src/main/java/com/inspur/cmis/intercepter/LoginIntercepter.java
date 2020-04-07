package com.inspur.cmis.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.inspur.cmis.pojo.User;

public class LoginIntercepter implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		boolean flag = false;
		//拦截未登录的用户请求-依据session中是否存在user对象
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(null == user){
			//如果获取不到用户信息，强制跳转到登录页面
			session.setAttribute("message", "未获取到登录用户信息，请重新登录！");
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}else{
			flag = true;
		}
		return flag;
	}

	@Override
	public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
		System.out.println("postHandle...................");
	}

	@Override
	public void afterCompletion(HttpServletRequest request,HttpServletResponse response, Object handler, Exception ex) throws Exception {
		System.out.println("afterCompletion.........................");
	}

}