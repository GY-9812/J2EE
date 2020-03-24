package com.inspur.cmis.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.cmis.pojo.Study;
import com.inspur.cmis.service.StudyService;

@Controller
public class StudyController {
	@Autowired
	private StudyService studyService;
	
	@RequestMapping("/studyList")
	public String studyList(Model model, HttpServletRequest request,@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		//获取页面中传递过来的参数
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("type", type);
		
		//配置每页5条
		PageHelper.startPage(pn, 5);
		List<Study> studylist = studyService.getStudyList(map);
		PageInfo<Study> pageInfo = new PageInfo<Study>(studylist,studylist.size());
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("name", name);
		model.addAttribute("type", type);
		return "/user/studyMgr.jsp";
	}
	
	@RequestMapping("/addStudy")
	public String  addStudy(Study study ,Model model,HttpServletRequest request,HttpSession session) {
		Date today=new Date();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		String date=format.format(today);
		
		study.setDate(date);
		String uper=(String)session.getAttribute("username");
		study.setUper(uper);
		
		model.addAttribute("success", "添加学习资料成功！");
		model.addAttribute("member", study);
		model.addAttribute("flag", "1");
		studyService.addStudy(study);
		return "/user/studyMgrAdd.jsp";
	}
	
	@RequestMapping("/modifyStudy")
	public String modifyStudy(String key,Model model) {
		int key1=Integer.parseInt(key);
		Study study =studyService.getStudyBykey(key1);
		model.addAttribute("member", study);
		return "user/studyMgrUpdate.jsp";
	}
	
	@RequestMapping("/updateStudy")
	public String updateStudy(Study study ,Model model) {
		//获取当前时间
		Date today=new Date();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		String time=format.format(today);
		study.setDate(time);
		
		studyService.updateStudy(study);
		System.out.print(study);
		model.addAttribute("success", "修改学习资料成功！");
		model.addAttribute("member", study);
		model.addAttribute("flag", "1");
		
		return "/user/studyMgrUpdate.jsp";
	}
	
	@RequestMapping("/deleteStudy")
	public String deleteStudy(String keys) {
		String key[]=keys.split(",");
		int key1[]=new int[key.length];
		for(int i=0;i<key.length;i++) {
			key1[i]=Integer.parseInt(key[i]);
		}
		studyService.deleteStudy(key1);

		//删完数据后要重新查询一次
		return "redirect:studyList";
	}
}