package com.inspur.cmis.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.cmis.pojo.User;
import com.inspur.cmis.pojo.UserExt;
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

	@RequestMapping("/deleteUser")
	public String deleteUsers(String userIds) {
		String usersId[]=userIds.split(",");
		int user_ids[] = new int[usersId.length];
		for (int i = 0; i < usersId.length; i++) {
			user_ids[i]=Integer.parseInt(usersId[i]);
		}
		userService.deleteUser(user_ids);
		
		//删完数据后要重新查询一次
		return "redirect:userInfoList";
	}

	@RequestMapping("/openUser")
	public String openUsers(String userIds) {
		String usersId[]=userIds.split(",");
		int user_ids[] = new int[usersId.length];
		for (int i = 0; i < usersId.length; i++) {
			user_ids[i]=Integer.parseInt(usersId[i]);
		}
		userService.openUser(user_ids);
		
		//启用完数据后要重新查询一次
		return "redirect:userInfoList";
	}

	@RequestMapping("/closeUser")
	public String closeUser(String userIds) {
		String usersId[]=userIds.split(",");
		int user_ids[] = new int[usersId.length];
		for (int i = 0; i < usersId.length; i++) {
			user_ids[i]=Integer.parseInt(usersId[i]);
		}
		userService.closeUser(user_ids);
		
		//禁用完数据后要重新查询一次
		return "redirect:userInfoList";
	}
	@RequestMapping("/resetPass")
	public String resetPass(String userIds) {
		String usersId[]=userIds.split(",");
		int user_ids[] = new int[usersId.length];
		for (int i = 0; i < usersId.length; i++) {
			user_ids[i]=Integer.parseInt(usersId[i]);
		}
		userService.resetPass(user_ids);
		
		//重置密码完数据后要重新查询一次
		return "redirect:userInfoList";
	}
	
	@RequestMapping("/addUserInfo")
	public String addUserInfo(User user,Model model){		
		//处理用户信息中页面未维护的要素
		//获取当前时间
		Date today=new Date();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		String time=format.format(today);
		
		user.setRegisterTime(time);
		user.setLastTime(time);
		user.setIsEnable("T");
		user.setAnswer(user.getPassword());
		
		userService.addUserInfo(user);

		model.addAttribute("success", "添加用户成功！");
		model.addAttribute("member", user);
		model.addAttribute("flag", "1");
		
		return "/user/userInfoAdd.jsp";
	}
	
	@RequestMapping("/checkUser")
	@ResponseBody
	public Map checkUser(String username) {
		System.out.println("前台Ajax传递过来的参数: " +username);
		List<User> selectUser = userService.getUserByUserName(username);
		Map map = new HashMap();
		map.put("selectUser", selectUser);
		if (selectUser.size() >= 1) {
			map.put("msg", "该用户名已存在！");
		}
		System.out.println("map==="+map);
		return map;
	}
	
	@RequestMapping("/modifyUser")
	public String modifyUser(String userId,Model model){
		int user_id=Integer.parseInt(userId);
		User user=userService.getUserByUserId(user_id);
		model.addAttribute("member", user);
		return "/user/userInfoUpdate.jsp";
	}
	
	@RequestMapping("/updateUserInfo")
	public String updateUserInfo(User user,Model model){
		//处理用户信息中页面未维护的要素
		//获取当前时间
		Date today=new Date();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		String time=format.format(today);
		user.setLastTime(time);

		userService.updateUserInfo(user);
		
		model.addAttribute("success", "修改用户成功！");
		model.addAttribute("member", user);
		model.addAttribute("flag", "1");
		
		return "/user/userInfoUpdate.jsp";
	}

	@RequestMapping("/userStat")	
	@ResponseBody
	public List<UserExt> userStat(){
		List<UserExt> userList= userService.userStat();
		return userList;
	}
}