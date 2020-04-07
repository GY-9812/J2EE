package com.inspur.cmis.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.User;
import com.inspur.cmis.pojo.UserExt;
@Resource
public interface UserService {
   public User getUser(User user);
   public List<User> getUserList(Map<String,String> map);
   public void deleteUser(int userIds[]);
   public void openUser(int userIds[]);
   public void closeUser(int userIds[]);
   public void resetPass(int userIds[]);
   public void addUserInfo(User user);
   public List<User> getUserByUserName(String username);
   public User getUserByUserId(int userId);
   public void updateUserInfo(User user);
   public void updateLastTime(User user);
   public List<UserExt> userStat();
}