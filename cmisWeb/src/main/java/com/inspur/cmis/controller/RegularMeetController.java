package com.inspur.cmis.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.cmis.pojo.Meet;
import com.inspur.cmis.pojo.Study;
import com.inspur.cmis.service.RegularMeetService;

@Controller
public class RegularMeetController {
	@Autowired
	private RegularMeetService regularMeetService;

	@RequestMapping("/regularMeetList")
	public String getRegularMeetList(Model model,HttpServletRequest request,@RequestParam(value="pn",defaultValue="1") Integer pn) {
		//获取页面中传递过来的key
		String cmid=request.getParameter("cmid");
		String date=request.getParameter("date");
		String theme=request.getParameter("theme");
		Map<String,String> map=new HashMap<String,String>();
		map.put("cmid", cmid);
		map.put("date", date);
		map.put("theme", theme);
		
		//配置每页5条
		PageHelper.startPage(pn, 5);
		List<Meet> meetList=regularMeetService.getMeetList(map);
		for (int i = 0; i < meetList.size(); i++) {
			String cmname=regularMeetService.getUserName(meetList.get(i).getCmid());
			meetList.get(i).setCmname(cmname);
		}

		PageInfo<Meet> pageInfo = new PageInfo<Meet>(meetList,meetList.size());
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("cmid", cmid);
		model.addAttribute("date", date);
		model.addAttribute("theme", theme);

		return "/user/regularMeeting.jsp";
	}

	@RequestMapping("/downLoadFile")
	public ResponseEntity<byte[]> downFile(String fileName,HttpServletRequest req) throws IOException {
		String url = req.getSession().getServletContext().getRealPath("/upload/meet");
		File file = new File(url + "/" + fileName);
		HttpHeaders headers = new HttpHeaders();
		// 下载显示的文件名，解决中文名称乱码问题
		String downloadFielName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");
		// 通知浏览器以attachment（下载格式）打开
		headers.setContentDispositionFormData("attachment", downloadFielName);
		// application/octet-stream
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED);
	}

	@RequestMapping("/regularMeetAdd")
	public String regularMeetAdd(Meet meet,Model model,MultipartFile upload,HttpServletRequest request) {
		String fileName = "";
		try {// 原始文件名称
			if (upload != null) {
				fileName = upload.getOriginalFilename();
				//上传物理路径
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
		meet.setAttachment(fileName);
		
		model.addAttribute("success", "添加例会成功！");
		model.addAttribute("member", meet);
		model.addAttribute("flag", "1");
		regularMeetService.addMeeting(meet);
		
		return "/user/regularMeetingAdd.jsp";
	}
	
	
	@RequestMapping("/modifyMeet")
	public String modifyMeet(String key,Model model) {
		int key1=Integer.parseInt(key);
		Meet meet=regularMeetService.getMeetBykey(key1);
		model.addAttribute("member", meet);
		return "user/regularMeetingUpdate.jsp";
	}
	
	@RequestMapping("/updateMeet")
	public String updateMeet(Meet meet ,Model model,MultipartFile upload, HttpServletRequest request) {
		String fileName = "";
		try {// 原始文件名称
			if (upload != null) {
				fileName = upload.getOriginalFilename();
				// 上传物理路径
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
			meet.setAttachment(fileName);
		}
		
		regularMeetService.updateMeet(meet);
		model.addAttribute("success", "修改例会信息成功！");
		model.addAttribute("member", meet);
		model.addAttribute("flag", "1");
		
		return "/user/regularMeetingUpdate.jsp";
	}
	
	@RequestMapping("/deleteMeet")
	public String deleteMeet(String keys) {
		String key[]=keys.split(",");
		int key1[]=new int[key.length];
		for(int i=0;i<key.length;i++) {
			key1[i]=Integer.parseInt(key[i]);
		}
		regularMeetService.deleteMeet(key1);

		//删完数据后要重新查询一次
		return "redirect:regularMeetList";
	}
}