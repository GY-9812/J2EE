package com.inspur.cmis.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import com.inspur.cmis.pojo.MgrCertificate;
import com.inspur.cmis.pojo.MgrRpr;
import com.inspur.cmis.pojo.MgrWorkHistory;
import com.inspur.cmis.pojo.MgrWorkResult;
import com.inspur.cmis.pojo.Param;
import com.inspur.cmis.pojo.User;
import com.inspur.cmis.service.MgrCertificateService;
import com.inspur.cmis.service.MgrRprService;
import com.inspur.cmis.service.MgrWorkHistoryService;
import com.inspur.cmis.service.MgrWorkResultService;
import com.inspur.cmis.service.ParamService;

@Controller
public class MgrOtherInfoController {
	@Autowired
	private MgrWorkResultService mgrWorkResultService;
	@Autowired
	private MgrCertificateService mgrCertificateService;
	@Autowired
	private MgrRprService mgrRprService;
	@Autowired
	private MgrWorkHistoryService mgrWorkHistoryService;
	@Autowired
	private ParamService paramService;

	/*
	 * 跳转到信息维护页面并默认显示年度工作业绩列表
	 */
	@RequestMapping("/clientMgrInfoOther")
	public ModelAndView getAllInfoOtherByPage(int pageNum,HttpServletRequest requset) {
		String mgrId = requset.getParameter("mgrId");
		ModelAndView mv = new ModelAndView();
		
		//获取登录人的角色，如果是客户经理，则将mgrId赋值为此客户经理的id，使其只能看到自己的信息
		User user=(User)requset.getSession().getAttribute("user");
		String roleId=user.getRoleId();
		if (roleId.equals("2")) {
			mgrId=user.getUserId()+"";
		}
		
		if (pageNum == 1) {// 默认查询第一个page页的数据
			String cmWorkYear = requset.getParameter("cmWorkYear");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("mgrId", mgrId);
			map.put("cmWorkYear", cmWorkYear);
			List<MgrWorkResult> resultList = mgrWorkResultService.getWorkResultList(map);
			mv.addObject("resultList", resultList);
		}
		if (pageNum == 2) {
			String certType = requset.getParameter("certType");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("mgrId", mgrId);
			map.put("certType", certType);
			List<MgrCertificate> certList = mgrCertificateService.getMgrCertList(map);
			mv.addObject("certList", certList);
		}
		if (pageNum == 3) {
			String type = requset.getParameter("type");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("mgrId", mgrId);
			map.put("type", type);
			List<MgrRpr> rprList = mgrRprService.getMgrRprList(map);
			mv.addObject("rprList", rprList);
		}
		if (pageNum == 7) {
			String cmPostion = requset.getParameter("cmPostion");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("mgrId", mgrId);
			map.put("cmPostion", cmPostion);
			List<MgrWorkHistory> workList = mgrWorkHistoryService.getMgrWorkList(map);
			mv.addObject("workList", workList);
		}
		mv.addObject("mgrId", mgrId);
		mv.addObject("pageNum", pageNum);
		mv.setViewName("/user/clientMgrInfoOther.jsp");
		return mv;
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * 1.添加年度工作业绩
	 */
	@RequestMapping("/mgrResultAdd")
	public String mgrResultAdd(MgrWorkResult work,Model model,MultipartFile upload,HttpServletRequest request) {
		String fileName = "";
		try {// 原始文件名称
			if (upload != null) {
				fileName = upload.getOriginalFilename();
				// 上传图片物理路径
				String url = request.getSession().getServletContext().getRealPath("/upload/meet");
				File uploadfile = new java.io.File(url + "/" + fileName);
				if (!uploadfile.exists()) {
					uploadfile.mkdirs();
				}
				upload.transferTo(uploadfile);
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		work.setCmAttach(fileName);
		//获取当前时间
		Date today = new Date();
		work.setModifyDate(today);
		mgrWorkResultService.workResultAdd(work);
		return "redirect:clientMgrInfoOther?pageNum=1&mgrId="+work.getMgrId();
	}

	/*
	 * 1.根据cmKey查询年度工作业绩
	 */
	@RequestMapping("/modifyMgrResult")
	public @ResponseBody List<MgrWorkResult> getWorkResult(int cmKey) {
		List<MgrWorkResult> resultList = mgrWorkResultService.getResultByKey(cmKey);
		return resultList;
	}
	
	/*
	 * 1.修改年度工作业绩
	 */
	@RequestMapping("/updateWorkResult")
	public String updateWorkResult(MgrWorkResult work, Model model,MultipartFile upload,HttpServletRequest request) {
		String fileName = "";
		try {// 原始文件名称
			if (upload != null) {
				fileName = upload.getOriginalFilename();
				// 上传图片物理路径
				String url = request.getSession().getServletContext().getRealPath("/upload/meet");
				File uploadfile = new java.io.File(url + "/" + fileName);
				if (!uploadfile.exists()) {
					uploadfile.mkdirs();
				}
				upload.transferTo(uploadfile);
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (fileName!="") {
			work.setCmAttach(fileName);
		}
		// 1.获取当前时间
		Date today = new Date();
		work.setModifyDate(today);
		mgrWorkResultService.updateWorkResult(work);
		return "redirect:clientMgrInfoOther?pageNum=1&mgrId="+work.getMgrId();
	}
	
	/*
	 * 1.删除年度工作业绩
	 */
	@RequestMapping("/deleteMgrResult")
	public String deleteMgrResult(String keys,int mgrId) {
		String key[]=keys.split(",");
		int key1[]=new int[key.length];
		for(int i=0;i<key.length;i++) {
			key1[i]=Integer.parseInt(key[i]);
		}
		mgrWorkResultService.deleteMgrResult(key1);
		return "redirect:clientMgrInfoOther?pageNum=1&mgrId="+mgrId;
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * 2.添加证照信息
	 */
	@RequestMapping("/addMgrCert")
	public String addMgrCert(MgrCertificate cert, Model model,MultipartFile upload,HttpServletRequest request,Date end) {
		String fileName = "";
		try {// 原始文件名称
			if (upload != null) {
				fileName = upload.getOriginalFilename();
				// 上传图片物理路径
				String url = request.getSession().getServletContext().getRealPath("/upload/meet");
				File uploadfile = new java.io.File(url + "/" + fileName);
				if (!uploadfile.exists()) {
					uploadfile.mkdirs();
				}
				upload.transferTo(uploadfile);
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cert.setCertUrl(fileName);
		//获取当前时间
		Date today = new Date();
		cert.setModifyDate(today);
		//检验证书是否已失效
		if(!end.equals("")){
			int i=today.compareTo(end);
			if (i>0) {
				cert.setPeriod("F");
				cert.setInvalid("已作废");
			}else 
				cert.setPeriod("T");
		}
		mgrCertificateService.addMgrCert(cert);
		return "redirect:clientMgrInfoOther?pageNum=2&mgrId="+cert.getMgrId();
	}
	
	/*
	 * 2.根据cmKey查询证照信息
	 */
	@RequestMapping("/modifyMgrCert")
	public @ResponseBody List<MgrCertificate> getCertByKey(int cmKey) {
		List<MgrCertificate> certList = mgrCertificateService.getCertByKey(cmKey);
		return certList;
	}
	
	/*
	 * 2.修改证照信息
	 */
	@RequestMapping("/updateMgrCert")
	public String updateMgrCert(MgrCertificate cert, Model model,MultipartFile upload,HttpServletRequest request,Date end) {
		String fileName = "";
		try {// 原始文件名称
			if (upload != null) {
				fileName = upload.getOriginalFilename();
				// 上传图片物理路径
				String url = request.getSession().getServletContext().getRealPath("/upload/meet");
				File uploadfile = new java.io.File(url + "/" + fileName);
				if (!uploadfile.exists()) {
					uploadfile.mkdirs();
				}
				upload.transferTo(uploadfile);
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (fileName!="") {
			cert.setCertUrl(fileName);
		}
		// 1.获取当前时间
		Date today = new Date();
		cert.setModifyDate(today);
		//检验证书是否已失效
		if(!end.equals("")){
			int i=today.compareTo(end);
			if (i>0) {
				cert.setPeriod("F");
				cert.setInvalid("已作废");
			}else 
				cert.setPeriod("T");
		}
		mgrCertificateService.updateMgrCert(cert);
		return "redirect:clientMgrInfoOther?pageNum=2&mgrId="+cert.getMgrId();
	}
	
	/*
	 * 2.删除证照信息
	 */
	@RequestMapping("/deleteMgrCert")
	public String deleteMgrCert(String keys,int mgrId) {
		String key[]=keys.split(",");
		int key1[]=new int[key.length];
		for(int i=0;i<key.length;i++) {
			key1[i]=Integer.parseInt(key[i]);
		}
		mgrCertificateService.deleteMgrCert(key1);
		return "redirect:clientMgrInfoOther?pageNum=2&mgrId="+mgrId;
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//3.查询审批人姓名是否存在
	@RequestMapping("/checkaPerson")
	@ResponseBody
	public Map checkaPerson(String aPerson) {
		String userId = mgrRprService.getUserByName(aPerson);
		Map map = new HashMap();
		if (userId==null) {
			map.put("msg", "该客户经理不存在，请输入正确的审批人姓名！");
		}
		return map;
	}
		
	/*
	 * 3.添加奖惩记录
	 */
	@RequestMapping("/addMgrRpr")
	public String addMgrRpr(MgrRpr rpr,Model model,MultipartFile upload,HttpServletRequest request,String aPerson) {
		String fileName = "";
		try {// 原始文件名称
			if (upload != null) {
				fileName = upload.getOriginalFilename();
				// 上传图片物理路径
				String url = request.getSession().getServletContext().getRealPath("/upload/meet");
				File uploadfile = new java.io.File(url + "/" + fileName);
				if (!uploadfile.exists()) {
					uploadfile.mkdirs();
				}
				upload.transferTo(uploadfile);
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("================"+fileName+"--------------");
		rpr.setAttach(fileName);
		//获取当前时间
		Date today = new Date();
		rpr.setModifyDate(today);
		//获取审批人的id
		String userId=mgrRprService.getUserByName(aPerson);
		if (userId!=null) {
			rpr.setaPerson(userId);
		}
		mgrRprService.addMgrRpr(rpr);
		return "redirect:clientMgrInfoOther?pageNum=3&mgrId="+rpr.getMgrId();
	}
	
	/*
	 * 3.根据cmKey查询奖惩记录
	 */
	@RequestMapping("/modifyMgrRpr")
	public @ResponseBody List<MgrRpr> getRprByKey(int cmKey) {
		List<MgrRpr> rprList = mgrRprService.getRprByKey(cmKey);
		System.out.println(rprList);
		return rprList;
	}
	
	/*
	 * 3.修改奖惩记录
	 */
	@RequestMapping("/updateMgrRpr")
	public String updateMgrRpr(MgrRpr rpr, Model model,MultipartFile upload,HttpServletRequest request,String aPerson) {
		String fileName = "";
		try {// 原始文件名称
			if (upload != null) {
				fileName = upload.getOriginalFilename();
				// 上传图片物理路径
				String url = request.getSession().getServletContext().getRealPath("/upload/meet");
				File uploadfile = new java.io.File(url + "/" + fileName);
				if (!uploadfile.exists()) {
					uploadfile.mkdirs();
				}
				upload.transferTo(uploadfile);
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (fileName!="") {
			rpr.setAttach(fileName);
		}
		// 1.获取当前时间
		Date today = new Date();
		rpr.setModifyDate(today);
		//获取审批人的id
		String userId=mgrRprService.getUserByName(aPerson);
		if (userId!=null) {
			rpr.setaPerson(userId);
		}
		mgrRprService.updateMgrRpr(rpr);
		return "redirect:clientMgrInfoOther?pageNum=3&mgrId="+rpr.getMgrId();
	}
	
	/*
	 * 3.删除奖惩记录
	 */
	@RequestMapping("/deleteMgrRpr")
	public String deleteMgrRpr(String keys,int mgrId) {
		String key[]=keys.split(",");
		int key1[]=new int[key.length];
		for(int i=0;i<key.length;i++) {
			key1[i]=Integer.parseInt(key[i]);
		}
		mgrRprService.deleteMgrRpr(key1);
		return "redirect:clientMgrInfoOther?pageNum=3&mgrId="+mgrId;
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * 4.添加
	 */
	
	
	/*
	 * 4.根据cmKey查询
	 */
	
	
	/*
	 * 4.修改
	 */
	
	
	/*
	 * 4.删除
	 */
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * 5.添加
	 */
	
	
	/*
	 * 5.根据cmKey查询
	 */
	
	
	/*
	 * 5.修改
	 */
	
	
	/*
	 * 5.删除
	 */
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * 6.添加
	 */
	
	
	/*
	 * 6.根据cmKey查询
	 */
	
	
	/*
	 * 6.修改
	 */
	
	
	/*
	 * 6.删除
	 */
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	 * 7.添加工作经历
	 */
	@RequestMapping("/addWorkHist")
	public String addWorkHist(MgrWorkHistory hist, Model model,MultipartFile upload, HttpServletRequest request) {
		String fileName = "";
		try {// 原始文件名称
			if (upload != null) {
				fileName = upload.getOriginalFilename();
				// 上传图片物理路径
				String url = request.getSession().getServletContext().getRealPath("/upload/meet");
				File uploadfile = new java.io.File(url + "/" + fileName);
				if (!uploadfile.exists()) {
					uploadfile.mkdirs();
				}
				upload.transferTo(uploadfile);
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		hist.setCmAttach(fileName);
		//获取当前时间
		Date today = new Date();
		hist.setModifyDate(today);
		mgrWorkHistoryService.addWorkHist(hist);
		return "redirect:clientMgrInfoOther?pageNum=7&mgrId="+hist.getMgrId();
	}
	
	/*
	 * 7.根据cmKey查询工作经历
	 */
	@RequestMapping("/modifyMgrWork")
	public @ResponseBody List<MgrWorkHistory> getWorkHistory(int cmKey) {
		List<MgrWorkHistory> workList = mgrWorkHistoryService.getWorkByKey(cmKey);
		return workList;
	}
	
	/*
	 * 7.修改工作经历
	 */
	@RequestMapping("/updateWorkHistory")
	public String updateWorkHistory(MgrWorkHistory hist,Model model,MultipartFile upload,HttpServletRequest request) {
		String fileName = "";
		try {// 原始文件名称
			if (upload != null) {
				fileName = upload.getOriginalFilename();
				// 上传图片物理路径
				String url = request.getSession().getServletContext().getRealPath("/upload/meet");
				File uploadfile = new java.io.File(url + "/" + fileName);
				if (!uploadfile.exists()) {
					uploadfile.mkdirs();
				}
				upload.transferTo(uploadfile);
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (fileName!="") {
			hist.setCmAttach(fileName);
		}
		// 1.获取当前时间
		Date today = new Date();
		hist.setModifyDate(today);
		mgrWorkHistoryService.updateWorkHist(hist);
		return "redirect:clientMgrInfoOther?pageNum=7&mgrId="+hist.getMgrId();
	}
	
	/*
	 * 7.删除工作经历
	 */
	@RequestMapping("/deleteWorkHist")
	public String deleteWorkHist(String keys,int mgrId) {
		String key[]=keys.split(",");
		int key1[]=new int[key.length];
		for(int i=0;i<key.length;i++) {
			key1[i]=Integer.parseInt(key[i]);
		}
		mgrWorkHistoryService.deleteWorkHist(key1);
		return "redirect:clientMgrInfoOther?pageNum=7&mgrId="+mgrId;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@ModelAttribute("mgrLevel")
	public Map<String, String> getMgrLevelList() {
		Map<String, String> levelParam = new HashMap<String, String>();
		List<Param> paramList = paramService.getParamList(Constant.PARAM_TYPE_MGRLEVEL);
		if (paramList != null && paramList.size() > 0) {
			for (int i = 0; i < paramList.size(); i++) {
				Param param = paramList.get(i);
				levelParam.put(param.getParamCode(), param.getParamName());
			}
		}
		return levelParam;
	}
}