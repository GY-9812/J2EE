package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.Study;

public interface StudyMapper {
	public List<Study> getStudyList(Map<String, String> map);
	public void addStudy(Study study);
	public Study getStudyBykey(int key);
	public void updateStudy(Study study);
	public void deleteStudy(int keys[]);

}
