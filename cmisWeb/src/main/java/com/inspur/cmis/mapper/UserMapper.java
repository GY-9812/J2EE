package com.inspur.cmis.mapper;

import java.util.Map;
import java.util.List;

import com.inspur.cmis.pojo.User;
import com.inspur.cmis.pojo.UserExt;

public interface UserMapper {
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