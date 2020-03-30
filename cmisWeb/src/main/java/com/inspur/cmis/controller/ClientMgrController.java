package com.inspur.cmis.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.cmis.constant.Constant;
import com.inspur.cmis.pojo.ClientManager;
import com.inspur.cmis.pojo.Param;
import com.inspur.cmis.pojo.User;
import com.inspur.cmis.service.ClientMgrService;
import com.inspur.cmis.service.ParamService;
import com.inspur.cmis.service.UserService;

@Controller
public class ClientMgrController {
	@Autowired
	private ClientMgrService clientMgrService;
	@Autowired
	private ParamService paramService;
	@Autowired
	private UserService userService;
    
	/**
	 * 客户经理默认查询及条件查询
	 */
	@RequestMapping("/clientMgrList")
	public String clientMgrList(Model model,@RequestParam(value = "pn", defaultValue = "1") Integer pn,HttpServletRequest request) {
		//获取页面中传递过来的参数
		String unit=request.getParameter("unit");
		String cmid=request.getParameter("cmid");
		String cname=request.getParameter("cname");
		String status=request.getParameter("status");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("unit", unit);
		map.put("cmid", cmid);
		map.put("cname", cname);
		map.put("status", status);
		
		//配置每页5条
		PageHelper.startPage(pn, 5);
		List<ClientManager> clientMgrList=clientMgrService.getClientMgrList(map);
		
		PageInfo<ClientManager> pageInfo = new PageInfo<ClientManager>(clientMgrList, clientMgrList.size());
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("unit", unit);
		model.addAttribute("cmid", cmid);
		model.addAttribute("cname", cname);
		model.addAttribute("status", status);

		return "/user/clientMgr.jsp";
	}
	
    /**
     * 查询客户经理的详细信息
     */
	@RequestMapping("/clientMgr")
	public String clientMgr(String cmid, Model model) {
		ClientManager clientMgr = clientMgrService.getClientMgr(cmid);
		model.addAttribute("cmid", cmid);
		model.addAttribute("mgr", clientMgr);
		return "/user/clientMgrInfoDetail.jsp";
	}
	
    /**
     * 客户经理删除
     */
	@RequestMapping("/deleteMgr")
	public String deleteMgr(String cmid[]) {
		clientMgrService.deleteMgr(cmid);
		return "redirect:clientMgrList";
	}
	
    /**
     * 跳转到新增页面，为了获取下拉列表数据
     */
	@RequestMapping("/toMgrAdd")
	public ModelAndView toMgrAdd(Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/clientMgrAdd.jsp");
		return mv;
	}
	
	/**
	 * 添加客户经理
	 */
	@RequestMapping("/addMgr")
	public String addMgr(ClientManager mgr, MultipartFile pic,HttpServletRequest req, Model model) {
		String uploadFile_name = "";
		String newFileName = "";
		try {// 原始文件名称
			if (pic != null) {
				uploadFile_name = pic.getOriginalFilename();
				// 新文件名称
				if (!"".equals(uploadFile_name))
					newFileName = UUID.randomUUID().toString()
							+ uploadFile_name.substring(uploadFile_name
									.lastIndexOf("."));
				// 上传图片物理路径
				String url = req.getSession().getServletContext()
						.getRealPath("/images/upload");
				File uploadfile = new java.io.File(url + "/" + newFileName);
				if (!uploadfile.exists()) {
					uploadfile.mkdirs();
				}
				pic.transferTo(uploadfile);
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mgr.setPhoto(newFileName);
		
		//获取当前时间
		Date today = new Date();
		mgr.setStatus("T");
		mgr.setModifyDate(today);
		clientMgrService.addMgr(mgr);
		
		//同时初始化一条用户信息
		User user = new User();
		user.setUsername(mgr.getCname());
		user.setSex(mgr.getSex());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String birthday = format.format(mgr.getBirthday());
		user.setBirthday(birthday);
		user.setPassword("123456");
		user.setQuestion("6位连续数字");
		user.setAnswer("123456");
		user.setIsEnable("T");
		user.setRoleId(Constant.USER_ROLEID_MANAGER);
		String time = format.format(today);
		user.setRegisterTime(time);
		user.setLastTime(time);
		userService.addUserInfo(user);

		model.addAttribute("success", "添加客户经理成功！");
		model.addAttribute("flag", "1");
		model.addAttribute("mgr", mgr);
		return "/user/clientMgrAdd.jsp";
	}
	
	@ModelAttribute("nationParam")
	public Map<String, String> getNationList() {
		Map<String, String> nationParam = new HashMap<String, String>();
		List<Param> paramList = paramService.getParamList(Constant.PARAM_TYPE_NATION);
		if (paramList != null && paramList.size() > 0) {
			for (int i = 0; i < paramList.size(); i++) {
				Param param = paramList.get(i);
				nationParam.put(param.getParamCode(), param.getParamName());
			}
		}
		return nationParam;
	}

	@ModelAttribute("policeStatus")
	public Map<String, String> getPoliceStatusList() {
		Map<String, String> policeParam = new HashMap<String, String>();
		List<Param> paramList = paramService.getParamList(Constant.PARAM_TYPE_POLICSTATUS);
		if (paramList != null && paramList.size() > 0) {
			for (int i = 0; i < paramList.size(); i++) {
				Param param = paramList.get(i);
				policeParam.put(param.getParamCode(), param.getParamName());
			}
		}
		return policeParam;
	}

	@ModelAttribute("education")
	public Map<String, String> getEducationList() {
		Map<String, String> educationParam = new HashMap<String, String>();
		List<Param> paramList = paramService.getParamList(Constant.PARAM_TYPE_EDUCATION);
		if (paramList != null && paramList.size() > 0) {
			for (int i = 0; i < paramList.size(); i++) {
				Param param = paramList.get(i);
				educationParam.put(param.getParamCode(), param.getParamName());
			}
		}
		return educationParam;
	}

	@ModelAttribute("degree")
	public Map<String, String> getDegreeList() {
		Map<String, String> degreeParam = new HashMap<String, String>();
		List<Param> paramList = paramService.getParamList(Constant.PARAM_TYPE_DEGREE);
		if (paramList != null && paramList.size() > 0) {
			for (int i = 0; i < paramList.size(); i++) {
				Param param = paramList.get(i);
				degreeParam.put(param.getParamCode(), param.getParamName());
			}
		}
		return degreeParam;
	}

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
	
	/**
	 * 导出excel
	 */
	@RequestMapping("/exportExcel")
	@ResponseBody
	public void exportExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//获取页面中传递过来的参数
		String unit=request.getParameter("unit");
		String cmid=request.getParameter("cmid");
		String cname=request.getParameter("cname");
		String status=request.getParameter("status");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("unit", unit);
		map.put("cmid", cmid);
		map.put("cname", cname);
		map.put("status", status);

		List<ClientManager> clientMgrList = clientMgrService.getClientMgrList(map);

		String[] title = { "客户经理编号", "姓名", "性别", "身份证号", "出生日期", "年龄", "民族",
				"政治面貌", "籍贯", "学历", "学位", "毕业院校", "参加工作时间", "入职时间", "办公电话",
				"移动电话", "客户经理等级", "机构", "部门" };// 设置EXCEL的第一行的标题头（改）
		// 创建excel工作薄
		XSSFWorkbook workbook = new XSSFWorkbook();
		// 创建一个工作表sheet
		XSSFSheet sheet = workbook.createSheet();
		// 创建第一行
		XSSFRow row = sheet.createRow(0);
		XSSFCell cell = null;

		// 插入第一行数据 id 地区名称
		for (int i = 0; i < title.length; i++) {

			cell = row.createCell(i);
			// 赋值
			cell.setCellValue(title[i]);
		}
		
		// 追加数据行数
		int j = 1;
		for (int i = 0; i < clientMgrList.size(); i++) {
			ClientManager list = clientMgrList.get(i);
			XSSFRow nextrow = sheet.createRow(i + 1);
			
			XSSFCell cessk = nextrow.createCell(0);
			cessk.setCellValue(list.getCmid());// 客户经理编号
			cessk = nextrow.createCell(1);
			cessk.setCellValue(list.getCname());// 姓名
			cessk = nextrow.createCell(2);
			cessk.setCellValue((list.getSex()).equals("F") ? "女" : "男");
			cessk = nextrow.createCell(3);
			cessk.setCellValue((String) list.getSsn());// 身份证号码
			
			cessk = nextrow.createCell(4);
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date birthday = list.getBirthday();
			if (birthday != null)
				cessk.setCellValue(format.format(birthday));
			else
				cessk.setCellValue("");// 出生日期
			
			cessk = nextrow.createCell(5);
			cessk.setCellValue(list.getAge());// 年龄
			
			cessk = nextrow.createCell(6);
			String nation=list.getNation();
			Map paramMap = new HashMap<String, String>();
			paramMap.put("paramType", Constant.PARAM_TYPE_NATION);
			paramMap.put("paramCode", nation);
			String nationName = paramService.getParamName(paramMap);
			cessk.setCellValue(nationName);// 民族

			cessk = nextrow.createCell(7);
			String political=list.getPolitical();
			paramMap.clear();
			paramMap.put("paramType", Constant.PARAM_TYPE_POLICSTATUS);
			paramMap.put("paramCode", political);
			String policeStatusName = paramService.getParamName(paramMap);
			cessk.setCellValue(policeStatusName);// 政治面貌
			
			cessk = nextrow.createCell(8);
			cessk.setCellValue(list.getHomeTown());// 籍贯
			
			cessk = nextrow.createCell(9);
			String education = list.getEducation();
			paramMap.clear();
			paramMap.put("paramType", Constant.PARAM_TYPE_EDUCATION);
			paramMap.put("paramCode", education);
			String educationName = paramService.getParamName(paramMap);
			cessk.setCellValue(educationName);// 学历

			cessk = nextrow.createCell(10);
			String degree = list.getDegree();
			paramMap.clear();
			paramMap.put("paramType", Constant.PARAM_TYPE_DEGREE);
			paramMap.put("paramCode", degree);
			String degreeName = paramService.getParamName(paramMap);
			cessk.setCellValue(degreeName);// 学位

			cessk = nextrow.createCell(11);
			cessk.setCellValue(list.getGraduation());// 毕业院校

			cessk = nextrow.createCell(12);
			Date hireDate = list.getHireDate();
			if (hireDate != null)
				cessk.setCellValue(format.format(hireDate));
			else
				cessk.setCellValue("");// 参加工作时间
			
			cessk = nextrow.createCell(13);
			Date entryDate = list.getEntryDate();
			if (entryDate != null)
				cessk.setCellValue(format.format(entryDate));
			else
				cessk.setCellValue("");// 入职时间

			cessk = nextrow.createCell(14);
			cessk.setCellValue(list.getTel());// 办公电话

			cessk = nextrow.createCell(15);
			cessk.setCellValue(list.getMobile());// 移动电话

			cessk = nextrow.createCell(16);
			String level = list.getLevel();
			String epLevel = "";
			paramMap.clear();
			paramMap.put("paramType", Constant.PARAM_TYPE_MGRLEVEL);
			paramMap.put("paramCode", level);
			epLevel = paramService.getParamName(paramMap);
			cessk.setCellValue(epLevel);// 客户经理级别

			cessk = nextrow.createCell(17);
			cessk.setCellValue(list.getUnit());// 机构
			cessk = nextrow.createCell(18);
			cessk.setCellValue(list.getDept());// 部门
			j++;
		}
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String("客户经理信息.xlsx".getBytes(), "iso-8859-1"));
		OutputStream ouputStream;
		try {
			ouputStream = response.getOutputStream();
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
		} catch (IOException e) {
		} finally {
			//workbook.();
		}
	}
	
	/**
	 * 通过客户经理id获取客户经理信息
	 */
	@RequestMapping("/modifyClientMgr")
	public String modifyClientMgr(String key,Model model){
		int key1=Integer.parseInt(key);
		ClientManager mgr=clientMgrService.getClientMgrByCmid(key1);
		model.addAttribute("mgr", mgr);
		return "user/clientMgrUpdate.jsp";
	}
	
	/**
	 * 修改客户经理信息
	 */
	@RequestMapping("/updateClientMgr")
	public String updateClientMgr(ClientManager mgr, MultipartFile pic,HttpServletRequest req, Model model) {
		String uploadFile_name = "";
		String newFileName = "";
		try {// 原始文件名称
			if (pic != null) {
				uploadFile_name = pic.getOriginalFilename();
				// 新文件名称
				if (!"".equals(uploadFile_name))
					newFileName = UUID.randomUUID().toString()
							+ uploadFile_name.substring(uploadFile_name
									.lastIndexOf("."));
				// 上传图片物理路径
				String url = req.getSession().getServletContext()
						.getRealPath("/images/upload");
				File uploadfile = new java.io.File(url + "/" + newFileName);
				if (!uploadfile.exists()) {
					uploadfile.mkdirs();
				}
				pic.transferTo(uploadfile);
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(newFileName!=""){
			mgr.setPhoto(newFileName);
		}
		Date today=new Date();
		mgr.setModifyDate(today);
		
		clientMgrService.updateClientMgr(mgr);
		
		//同时修改一条用户信息
		User user = userService.getUserByUserId(mgr.getCmid());
		if (mgr.getCname()!=""&&mgr.getCname()!=null) {
			user.setUsername(mgr.getCname());
		}
		if (mgr.getSex()!=""&&mgr.getSex()!=null) {
			user.setSex(mgr.getSex());
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String birthday = format.format(mgr.getBirthday());
		if (birthday!=""&&birthday!=null) {
			user.setBirthday(birthday);
		}
		if (mgr.getStatus()!=""&&mgr.getStatus()!=null) {
			user.setIsEnable("T");
		}
		String time = format.format(today);
		user.setLastTime(time);
		user.setRoleId(Constant.USER_ROLEID_MANAGER);
		userService.updateUserInfo(user);
		
		model.addAttribute("success", "修改客户成功！");
		model.addAttribute("mgr", mgr);
		model.addAttribute("flag", "1");
		
		return "/user/clientMgrUpdate.jsp";
	}
	
	
	/**
	 * 报表的默认查询及条件查询
	 */
	@RequestMapping("/statList")
	public String statList(Model model,@RequestParam(value = "pn", defaultValue = "1") Integer pn,HttpServletRequest request) {
		//获取页面中传递过来的参数
		String unit=request.getParameter("unit");
		String status=request.getParameter("status");
		String sex=request.getParameter("sex");
		String education=request.getParameter("education");
		String professional=request.getParameter("professional");
		String level=request.getParameter("level");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("unit", unit);
		map.put("status", status);
		map.put("sex", sex);
		map.put("education", education);
		map.put("professional", professional);
		map.put("level", level);
		
		//配置每页5条
		PageHelper.startPage(pn, 5);
		List<ClientManager> clientMgrList=clientMgrService.getStatList(map);
		
		PageInfo<ClientManager> pageInfo = new PageInfo<ClientManager>(clientMgrList, clientMgrList.size());
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("unit", unit);
		model.addAttribute("status", status);
		model.addAttribute("sex", sex);
		model.addAttribute("educat", education);
		model.addAttribute("professional", professional);
		model.addAttribute("lev", level);

		return "/user/clientMgrStat.jsp";
	}
	
    /**
     * 跳转到新增页面，为了获取下拉列表数据
     */
	@RequestMapping("/toStatList")
	public ModelAndView toStatList(Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/clientMgrStat.jsp");
		return mv;
	}
	
	
	/**
	 * 导出报表excel
	 */
	@RequestMapping("/exportStatExcel")
	@ResponseBody
	public void exportStatExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//获取页面中传递过来的参数
		String unit=request.getParameter("unit");
		String status=request.getParameter("status");
		String sex=request.getParameter("sex");
		String education=request.getParameter("education");
		String professional=request.getParameter("professional");
		String level=request.getParameter("level");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("unit", unit);
		map.put("status", status);
		map.put("sex", sex);
		map.put("education", education);
		map.put("professional", professional);
		map.put("level", level);

		List<ClientManager> clientMgrList = clientMgrService.getStatList(map);

		String[] title = { "客户经理编号", "姓名", "性别", "客户经理等级", "机构", "部门", "业务条线", 
			"职务", "客户经理从业年限", "联系电话", "在职情况", "年龄", "学历", "专业职称"};// 设置EXCEL的第一行的标题头（改）
		// 创建excel工作薄
		XSSFWorkbook workbook = new XSSFWorkbook();
		// 创建一个工作表sheet
		XSSFSheet sheet = workbook.createSheet();
		// 创建第一行
		XSSFRow row = sheet.createRow(0);
		XSSFCell cell = null;

		// 插入第一行数据 id 地区名称
		for (int i = 0; i < title.length; i++) {
			cell = row.createCell(i);
			// 赋值
			cell.setCellValue(title[i]);
		}
		
		// 追加数据行数
		int j = 1;
		for (int i = 0; i < clientMgrList.size(); i++) {
			ClientManager list = clientMgrList.get(i);
			XSSFRow nextrow = sheet.createRow(i + 1);
			
			XSSFCell cessk = nextrow.createCell(0);
			cessk.setCellValue(list.getCmid());// 客户经理编号
			cessk = nextrow.createCell(1);
			cessk.setCellValue(list.getCname());// 姓名
			cessk = nextrow.createCell(2);
			cessk.setCellValue((list.getSex()).equals("F") ? "女" : "男");
			
			cessk = nextrow.createCell(3);
			Map paramMap = new HashMap<String, String>();
			String lev = list.getLevel();
			String epLevel = "";
			paramMap.clear();
			paramMap.put("paramType", Constant.PARAM_TYPE_MGRLEVEL);
			paramMap.put("paramCode", lev);
			epLevel = paramService.getParamName(paramMap);
			cessk.setCellValue(epLevel);// 客户经理级别

			cessk = nextrow.createCell(4);
			cessk.setCellValue(list.getUnit());// 机构
			cessk = nextrow.createCell(5);
			cessk.setCellValue(list.getDept());// 部门
			cessk = nextrow.createCell(6);
			cessk.setCellValue(list.getLine());// 业务条线
			cessk = nextrow.createCell(7);
			cessk.setCellValue(list.getPosition());// 职务
			cessk = nextrow.createCell(8);
			cessk.setCellValue(list.getWorkYears());// 客户经理从业年限
			cessk = nextrow.createCell(9);
			cessk.setCellValue(list.getTel());// 联系电话
			cessk = nextrow.createCell(10);
			cessk.setCellValue(list.getStatus());// 在职情况
			cessk = nextrow.createCell(11);
			cessk.setCellValue(list.getAge());// 年龄
			
			cessk = nextrow.createCell(12);// 学历
			String edu = list.getEducation();
			paramMap.clear();
			paramMap.put("paramType", Constant.PARAM_TYPE_EDUCATION);
			paramMap.put("paramCode", edu);
			String educationName = paramService.getParamName(paramMap);
			cessk.setCellValue(educationName);
			
			cessk = nextrow.createCell(13);
			cessk.setCellValue(list.getProfessional());// 专业职称
			j++;
		}
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String("客户经理信息报表.xlsx".getBytes(), "iso-8859-1"));
		OutputStream ouputStream;
		try {
			ouputStream = response.getOutputStream();
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
		} catch (IOException e) {
		} finally {
			//workbook.();
		}
	}
}