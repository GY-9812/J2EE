package com.inspur.cmis.mapper;

import java.util.Map;
import java.util.List;

import com.inspur.cmis.pojo.Meet;

public interface RegularMeetMapper {
	 public List<Meet> getMeetList(Map<String, String> map);
	 public String getUserName(int cmid);
	 public void addMeeting(Meet meet);
	 public Meet getMeetBykey(int key);
	 public void updateMeet(Meet meet);
	 public void deleteMeet(int keys[]);
}