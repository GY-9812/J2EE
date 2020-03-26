package com.inspur.cmis.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.cmis.pojo.Work;
import com.inspur.cmis.service.WorkService;

@Controller
public class WorkController {
	@Autowired
	private WorkService workService;
	
	@RequestMapping("/workList")
	public String workList(Model model,HttpServletRequest request,@RequestParam(value="pn",defaultValue="1") Integer pn) {
		//获取页面中传递过来的参数
		String cmid=request.getParameter("cmid");
		String date=request.getParameter("date");
		Map<String,String> map=new HashMap<String,String>();
		map.put("cmid", cmid);
		map.put("date", date);
		
		//配置每页5条
		PageHelper.startPage(pn, 5);
		List<Work> workList=workService.getWorkList(map);
		
		PageInfo<Work> pageInfo = new PageInfo<Work>(workList,workList.size());
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("cmid", cmid);
		model.addAttribute("date", date);

		return "/user/workMgr.jsp";
	}

	@RequestMapping("/addWork")
	public String addWork(Work work,Model model) {
		Date date=new Date();
		work.setDate(date);
		
		workService.addWork(work);
		model.addAttribute("success", "添加工作信息成功！");
		model.addAttribute("member", work);
		model.addAttribute("flag", "1");
		
		return "/user/workMgrAdd.jsp";
	}
	
	
	@RequestMapping("/modifyWork")
	public String modifyWork(String key,Model model) {
		int key1=Integer.parseInt(key);
		Work work=workService.getWorkByKey(key1);
		model.addAttribute("member", work);
		return "user/workMgrUpdate.jsp";
	}
	
	@RequestMapping("/updateWork")
	public String updateWork(Work work ,Model model) {
		Date date=new Date();
		work.setDate(date);
		
		workService.updateWork(work);
		model.addAttribute("success", "修改工作信息成功！");
		model.addAttribute("member", work);
		model.addAttribute("flag", "1");
		
		return "/user/workMgrUpdate.jsp";
	}
	
	@RequestMapping("/deleteWork")
	public String deleteWork(String keys) {
		String key[]=keys.split(",");
		int key1[]=new int[key.length];
		for(int i=0;i<key.length;i++) {
			key1[i]=Integer.parseInt(key[i]);
		}
		workService.deleteWork(key1);

		//删完数据后要重新查询一次
		return "redirect:workList";
	}
}
