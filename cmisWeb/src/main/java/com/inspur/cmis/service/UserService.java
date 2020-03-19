package com.inspur.cmis.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.User;
@Resource
public interface UserService {
   public User getUser(User user);
   public List<User> getUserList(Map<String,String> map);
}