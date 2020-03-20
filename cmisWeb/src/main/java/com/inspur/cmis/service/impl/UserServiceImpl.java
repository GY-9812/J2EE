package com.inspur.cmis.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.UserMapper;
import com.inspur.cmis.pojo.User;
import com.inspur.cmis.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	/**
	 * 用户登录查询
	 */
	public User getUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.getUser(user);
	}

	/**
	 * 用户的默认查询
	 */
	public List<User> getUserList(Map<String,String> map) {
		return userMapper.getUserList(map);
	}

	/**
	 * 用户的删除操作
	 */
	public void deleteUser(int[] userIds) {
		userMapper.deleteUser(userIds);
	}

	/**
	 * 用户的启用操作
	 */
	public void openUser(int[] userIds) {
		userMapper.openUser(userIds);
	}

	/**
	 * 用户的禁用操作
	 */
	public void closeUser(int[] userIds) {
		userMapper.closeUser(userIds);
	}

	/**
	 * 密码的重置操作
	 */
	public void resetPass(int[] userIds) {
		userMapper.resetPass(userIds);
	}

}