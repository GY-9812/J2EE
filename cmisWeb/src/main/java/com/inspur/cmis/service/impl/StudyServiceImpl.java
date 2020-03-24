package com.inspur.cmis.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.StudyMapper;
import com.inspur.cmis.pojo.Study;
import com.inspur.cmis.service.StudyService;
@Service("studyService")
public class StudyServiceImpl implements StudyService{
	@Autowired
	private StudyMapper studyMapper;

	@Override
	public List<Study> getStudyList(Map<String, String> map) {
		return studyMapper.getStudyList(map);
	}

	@Override
	public void addStudy(Study study) {
		studyMapper.addStudy(study);
	}

	@Override
	public Study getStudyBykey(int key) {
		return studyMapper.getStudyBykey(key);
	}

	@Override
	public void updateStudy(Study study) {
		studyMapper.updateStudy(study);
	}

	@Override
	public void deleteStudy(int[] keys) {
		studyMapper.deleteStudy(keys);
	}

}
