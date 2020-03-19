package com.inspur.cmis.mapper;

import java.util.List;

import com.inspur.cmis.pojo.User;

public interface UserMapper {
	public User getUser(User user);
	public List<User> getUserList();
}