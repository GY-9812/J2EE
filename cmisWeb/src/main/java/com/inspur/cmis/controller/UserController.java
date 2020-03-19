package com.inspur.cmis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.inspur.cmis.pojo.User;
import com.inspur.cmis.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/userInfoList")
	public String userInfoList(Model model,HttpServletRequest request){
		//获取页面中传递过来的id
		String userId=request.getParameter("userId");
		String username=request.getParameter("username");
		Map<String,String> map=new HashMap<String,String>();
		map.put("userId", userId);
		map.put("username", username);
		
		List<User> userList = userService.getUserList(map);
		model.addAttribute("userList", userList);
		return "user/userInfo.jsp";
	}

}