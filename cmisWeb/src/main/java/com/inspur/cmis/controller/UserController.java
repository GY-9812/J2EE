package com.inspur.cmis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.cmis.pojo.User;
import com.inspur.cmis.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/userInfoList")
	public String userInfoList(Model model,HttpServletRequest request,@RequestParam(value="pn",defaultValue="1") Integer pn){
		//获取页面中传递过来的id
		String userId=request.getParameter("userId");
		String username=request.getParameter("username");
		Map<String,String> map=new HashMap<String,String>();
		map.put("userId", userId);
		map.put("username", username);
		
		//配置每页5条
		PageHelper.startPage(pn, 5);
		List<User> userList = userService.getUserList(map);
		PageInfo<User> pageInfo=new PageInfo<User>(userList,userList.size());
		
		//model.addAttribute("userList", userList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("userId", userId);
		model.addAttribute("username", username);
		return "user/userInfo.jsp";
	}

}