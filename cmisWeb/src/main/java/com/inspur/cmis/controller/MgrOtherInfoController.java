package com.inspur.cmis.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.inspur.cmis.constant.Constant;
import com.inspur.cmis.pojo.MgrWorkHistory;
import com.inspur.cmis.pojo.MgrWorkResult;
import com.inspur.cmis.pojo.Param;
import com.inspur.cmis.service.MgrWorkHistoryService;
import com.inspur.cmis.service.MgrWorkResultService;
import com.inspur.cmis.service.ParamService;

@Controller
public class MgrOtherInfoController {
	@Autowired
	private MgrWorkResultService mgrWorkResultService;
	@Autowired
	private MgrWorkHistoryService mgrWorkHistoryService;
	@Autowired
	private ParamService paramService;

	@RequestMapping("/clientMgrInfoOther")
	public ModelAndView getAllInfoOtherByPage(int pageNum,HttpServletRequest req) {
		String mgrId = req.getParameter("mgrId");
		ModelAndView mv = new ModelAndView();
		List<MgrWorkResult> resultList = new ArrayList<MgrWorkResult>();
		List<MgrWorkHistory> workList = new ArrayList<MgrWorkHistory>();
		if (pageNum == 1) {// 默认查询第一个page页的数据
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("mgrId", mgrId);
			resultList = mgrWorkResultService.getWorkResultList(map);
			mv.addObject("resultList", resultList);
		} else if (pageNum == 7) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("mgrId", mgrId);
			workList = mgrWorkHistoryService.getWorkList(map);
			mv.addObject("workList", workList);
		}
		mv.addObject("mgrId", mgrId);
		mv.addObject("pageNum", pageNum);
		mv.setViewName("/user/clientMgrInfoOther.jsp");
		return mv;
	}

	@ModelAttribute("mgrLevel")
	public Map<String, String> getMgrLevelList() {
		Map<String, String> levelParam = new HashMap<String, String>();
		List<Param> paramList = paramService
				.getParamList(Constant.PARAM_TYPE_MGRLEVEL);
		if (paramList != null && paramList.size() > 0) {
			for (int i = 0; i < paramList.size(); i++) {
				Param param = paramList.get(i);
				levelParam.put(param.getParamCode(), param.getParamName());
			}
		}
		return levelParam;
	}

	@RequestMapping("/modifyMgrWork")
	public @ResponseBody List<MgrWorkHistory> getWorkHistory(String cmKey) {
		List<MgrWorkHistory> workList = mgrWorkHistoryService.getWorkByKey(cmKey);
		return workList;
	}
	
	@RequestMapping("/updateWorkHistory")
	public String updateWorkHistory(MgrWorkHistory hist, Model model,MultipartFile upload,HttpServletRequest req) {
		String uploadFile_name = "";
		String newFileName = "";
		try {// 原始文件名称
			if (upload != null) {
				uploadFile_name = upload.getOriginalFilename();
				// 新文件名称
				if (!"".equals(uploadFile_name))
					newFileName = UUID.randomUUID().toString()
							+ uploadFile_name.substring(uploadFile_name
									.lastIndexOf("."));
				// 上传图片物理路径
				String url = req.getSession().getServletContext()
						.getRealPath("/mgrWorkHist/upload");
				File uploadfile = new java.io.File(url + "/" + newFileName);
				if (!uploadfile.exists()) {
					uploadfile.mkdirs();
				}
				upload.transferTo(uploadfile);
				hist.setCmAttach(newFileName);
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 1.获取当前时间
		Date today = new Date();
		hist.setModifyDate(today);
		mgrWorkHistoryService.updateWorkHist(hist);
		return "redirect:clientMgrInfoOther?pageNum=7&mgrId="+hist.getMgrId();
	}

	@RequestMapping("/mgrResultAdd")
	public String mgrResultAdd(MgrWorkResult work, Model model) {
		// 1.获取当前时间
		Date today = new Date();
		work.setModifyDate(today);
		mgrWorkResultService.workResultAdd(work);
		return "redirect:clientMgrInfoOther?pageNum=1&mgrId="+work.getMgrId();
	}

}