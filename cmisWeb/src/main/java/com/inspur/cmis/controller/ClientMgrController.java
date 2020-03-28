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
		String unit = request.getParameter("unit");
		String cmid = request.getParameter("cmid");
		String cname = request.getParameter("cname");
		String status=request.getParameter("status");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("unit", unit);
		map.put("cmid", cmid);
		map.put("cname", cname);
		
		//配置每页5条
		PageHelper.startPage(pn, 5);
		List<ClientManager> clientMgrList=clientMgrService.getClientMgrList(map);
		PageInfo<ClientManager> pageInfo = new PageInfo<ClientManager>(clientMgrList, clientMgrList.size());

		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("unit", unit);
		model.addAttribute("cmid", cmid);
		model.addAttribute("cname", cname);

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
		mgr.setStatus("1");
		mgr.setModifyDate(today);
		clientMgrService.addMgr(mgr);
		
		// 同时初始化一条用户信息
		User user = new User();
		user.setUsername(mgr.getCname());
		user.setSex(mgr.getSex());
		user.setPassword("123456");
		user.setQuestion("6位连续数字");
		user.setAnswer("123456");
		user.setIsEnable("T");
		user.setRoleId(Constant.USER_ROLEID_MANAGER);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String time = format.format(today);
		user.setRegisterTime(time);
		user.setLastTime(time);
		userService.addUserInfo(user);

		model.addAttribute("message", "添加客户经理成功！");
		model.addAttribute("flag", "1");
		model.addAttribute("mgr", mgr);
		return "/user/clientMgrAdd.jsp";
	}
	
	/**
	 * 导出excel
	 */
	@RequestMapping("/exportExcel")
	@ResponseBody
	public void exportExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<HashMap<String, Object>> clientMgrList = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 调用Service层
		String unit = request.getParameter("unit");
		String cmid = request.getParameter("cmid");
		String cname = request.getParameter("cname");
		map.put("unit", unit);
		map.put("cmid", cmid);
		map.put("cname", cname);

		clientMgrList = clientMgrService.exportExcel(map);

		//设置EXCEL的第一行的标题头
		String[] title = { "客户经理编号", "姓名", "性别", "身份证号", "出生日期", "年龄", "民族",
				"政治面貌", "籍贯", "学历", "学位", "毕业院校", "参加工作时间", "入职时间", "办公电话",
				"移动电话", "客户经理等级", "机构", "部门" };
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
		HashMap<String, Object> list = null;
		for (int i = 0; i < clientMgrList.size(); i++) {
			list = clientMgrList.get(i);
			XSSFRow nextrow = sheet.createRow(i + 1);
			XSSFCell cessk = nextrow.createCell(0);

			BigDecimal cm_id = (BigDecimal) (list.get("CMID"));
			cessk.setCellValue(cm_id.intValue());// 客户经理编号
			
			cessk = nextrow.createCell(1);
			cessk.setCellValue((String) list.get("CNAME"));// 姓名
			cessk = nextrow.createCell(2);
			cessk.setCellValue(((String) list.get("SEX")) == "F" ? "女" : "男");// 性别
			cessk = nextrow.createCell(3);
			cessk.setCellValue((String) list.get("SSN"));// 身份证号码
			cessk = nextrow.createCell(4);
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Timestamp birthday = (Timestamp) list.get("BIRTHDAY");
			if (birthday != null)
				cessk.setCellValue(format.format(birthday));// 出生日期
			else
				cessk.setCellValue("");// 出生日期

			cessk = nextrow.createCell(5);
			BigDecimal age = (BigDecimal) (list.get("AGE"));
			cessk.setCellValue(age.intValue());// 年龄
			cessk = nextrow.createCell(6);
			String nation = (String) list.get("NATION");
			Map paramMap = new HashMap<String, String>();
			paramMap.put("paramType", Constant.PARAM_TYPE_NATION);
			paramMap.put("paramCode", nation);
			String nationName = paramService.getParamName(paramMap);
			cessk.setCellValue(nationName);// 民族

			cessk = nextrow.createCell(7);
			String policeStatus = (String) list.get("POLITICAL");// 政治面貌
			paramMap.clear();
			paramMap.put("paramType", Constant.PARAM_TYPE_POLICSTATUS);
			paramMap.put("paramCode", policeStatus);
			String policeStatusName = paramService.getParamName(paramMap);
			cessk.setCellValue(policeStatusName);// 民族
			cessk = nextrow.createCell(8);// 籍贯
			cessk.setCellValue((String) list.get("HOMETOWN"));
			cessk = nextrow.createCell(9);// 学历
			String education = (String) list.get("EDUCATION");
			paramMap.clear();
			paramMap.put("paramType", Constant.PARAM_TYPE_EDUCATION);
			paramMap.put("paramCode", education);
			String educationName = paramService.getParamName(paramMap);
			cessk.setCellValue(educationName);

			cessk = nextrow.createCell(10);// 学位
			String degree = (String) list.get("DEGREE");
			paramMap.clear();
			paramMap.put("paramType", Constant.PARAM_TYPE_DEGREE);
			paramMap.put("paramCode", degree);
			String degreeName = paramService.getParamName(paramMap);
			cessk.setCellValue(degreeName);

			cessk = nextrow.createCell(11);// 毕业院校
			cessk.setCellValue((String) list.get("GRADUATION"));

			cessk = nextrow.createCell(12);
			Timestamp hireDate = (Timestamp) list.get("HIREDATE");
			if (hireDate != null)
				cessk.setCellValue(format.format(hireDate));
			else
				cessk.setCellValue("");// 参加工作时间

			cessk = nextrow.createCell(13);
			Timestamp entryDate = (Timestamp) list.get("ENTRYDATE");// 入职时间
			if (entryDate != null)
				cessk.setCellValue(format.format(entryDate));
			else
				cessk.setCellValue("");

			cessk = nextrow.createCell(14);
			cessk.setCellValue((String) list.get("TEL"));

			cessk = nextrow.createCell(15);
			cessk.setCellValue((String) list.get("MOBILE"));

			cessk = nextrow.createCell(16);
			String level = (String) list.get("LEVEL");
			String mgrlevel = "";
			paramMap.clear();
			paramMap.put("paramType", Constant.PARAM_TYPE_DEGREE);
			paramMap.put("paramCode", level);
			mgrlevel = paramService.getParamName(paramMap);
			cessk.setCellValue(mgrlevel);// 客户经理级别

			cessk = nextrow.createCell(17);
			cessk.setCellValue((String) list.get("UNIT"));// 机构
			cessk = nextrow.createCell(18);
			cessk.setCellValue((String) list.get("DEPT"));// 部门
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

	@ModelAttribute("nationParam")
	public Map<String, String> getNationList() {
		Map<String, String> nationParam = new HashMap<String, String>();
		List<Param> paramList = paramService
				.getParamList(Constant.PARAM_TYPE_NATION);
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
		List<Param> paramList = paramService
				.getParamList(Constant.PARAM_TYPE_POLICSTATUS);
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
		List<Param> paramList = paramService
				.getParamList(Constant.PARAM_TYPE_EDUCATION);
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
		List<Param> paramList = paramService
				.getParamList(Constant.PARAM_TYPE_DEGREE);
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
}