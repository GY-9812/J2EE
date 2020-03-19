package com.inspur.cmis.controller;

import java.util.List;

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
	public String userInfoList(Model model){
		List<User> userList = userService.getUserList();
		model.addAttribute("userList", userList);
		return "user/userInfo.jsp";
	}

}