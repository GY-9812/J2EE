package com.inspur.cmis.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.Study;
@Resource
public interface StudyService {
	public List<Study> getStudyList(Map<String, String> map);
	public void addStudy(Study study);
	public Study getStudyBykey(int key);
	public void updateStudy(Study study);
	public void deleteStudy(int keys[]);
}