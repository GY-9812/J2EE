package com.inspur.cmis.service;

import javax.annotation.Resource;
import com.inspur.cmis.pojo.User;

@Resource
public interface UserService {
	public User getUser(User user);
}
