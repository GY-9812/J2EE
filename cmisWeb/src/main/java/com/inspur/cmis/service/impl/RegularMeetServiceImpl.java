package com.inspur.cmis.service.impl;

import java.util.Map;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.RegularMeetMapper;
import com.inspur.cmis.pojo.Meet;
import com.inspur.cmis.service.RegularMeetService;


@Service("regularMeetService")
public class RegularMeetServiceImpl implements RegularMeetService{
	@Autowired
	private RegularMeetMapper regularMeetMapper;

	@Override
	public List<Meet> getMeetList(Map<String, String> map) {
		return regularMeetMapper.getMeetList(map);
	}

	@Override
	public String getUserName(int cmid) {
		return regularMeetMapper.getUserName(cmid);
	}

	@Override
	public void addMeeting(Meet meet) {
		regularMeetMapper.addMeeting(meet);
	}

	@Override
	public Meet getMeetBykey(int key) {
		return regularMeetMapper.getMeetBykey(key);
	}

	@Override
	public void updateMeet(Meet meet) {
		regularMeetMapper.updateMeet(meet);
	}

	@Override
	public void deleteMeet(int[] keys) {
		regularMeetMapper.deleteMeet(keys);
	}
	

}