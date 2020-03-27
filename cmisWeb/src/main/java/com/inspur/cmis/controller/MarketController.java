package com.inspur.cmis.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.inspur.cmis.pojo.Client;
import com.inspur.cmis.pojo.Market;
import com.inspur.cmis.service.MarketService;

@Controller
public class MarketController {
	@Autowired
	private MarketService marketService;
	
	@RequestMapping("/marketList")
	public String getMarketList(Model model,HttpServletRequest request,@RequestParam(value="pn",defaultValue="1") Integer pn) {
		//获取页面中传递过来的参数
		String cmid=request.getParameter("cmid");
		String clientname=request.getParameter("clientname");
		Map<String,String> map=new HashMap<String,String>();
		map.put("cmid", cmid);
		map.put("clientname", clientname);
		
		//配置每页5条
		PageHelper.startPage(pn, 5);
		List<Market> marketList=marketService.getMarketList(map);
		PageInfo<Market> pageInfo = new PageInfo<Market>(marketList,marketList.size());
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("cmid", cmid);
		model.addAttribute("clientname", clientname);

		return "/user/marketRecord.jsp";
	}

	@RequestMapping("/downLoadMarketFile")
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

	@RequestMapping("/addMarket")
	public String addMarket(Market market,Model model,MultipartFile upload1,MultipartFile upload2,
			MultipartFile upload3,HttpServletRequest request,String clientname) {
		String fileName1 = "";
		String fileName2 = "";
		String fileName3 = "";
		try {// 原始文件名称
			if (upload1 != null&&upload2 != null&&upload3 != null) {
				fileName1 = upload1.getOriginalFilename();
				fileName2 = upload2.getOriginalFilename();
				fileName3 = upload3.getOriginalFilename();
				//上传物理路径
				String url = request.getSession().getServletContext().getRealPath("/upload/meet");
				File uploadfile1 = new java.io.File(url + "/" + fileName1);
				File uploadfile2 = new java.io.File(url + "/" + fileName2);
				File uploadfile3 = new java.io.File(url + "/" + fileName3);
				if (!uploadfile1.exists()&&!uploadfile2.exists()&&!uploadfile3.exists()) {
					uploadfile1.mkdirs();
					uploadfile2.mkdirs();
					uploadfile3.mkdirs();
				}
				upload1.transferTo(uploadfile1);
				upload2.transferTo(uploadfile2);
				upload3.transferTo(uploadfile3);
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		market.setReport(fileName1);
		market.setTest(fileName2);
		market.setEval(fileName3);
		
		int cid=marketService.getCidByCname(clientname);
		market.setCid(cid);
		
		model.addAttribute("success", "添加营销记录成功！");
		model.addAttribute("member", market);
		model.addAttribute("flag", "1");
		marketService.addMarket(market);
		
		return "/user/marketRecordAdd.jsp";
	}
	
	@RequestMapping("/checkClientName")
	@ResponseBody
	public Map checkClientName(String clientname) {
		List<Client> selectClient = marketService.getClientByClientName(clientname);
		Map map = new HashMap();
		map.put("selectClient", selectClient);
		if (selectClient.size() == 0) {
			map.put("msg", "该客户不存在，请输入已有的客户名！");
		}
		return map;
	}
	
	@RequestMapping("/modifyMarket")
	public String modifyMarket(String key,Model model){
		int key1=Integer.parseInt(key);
		Market market=marketService.getMarketBykey(key1);
		model.addAttribute("member", market);
		return "user/marketRecordUpdate.jsp";
	}
	
	@RequestMapping("/updateMarket")
	public String updateMarket(Market market,Model model,MultipartFile upload1,MultipartFile upload2,
			MultipartFile upload3,HttpServletRequest request,String clientname){
		String fileName1 = "";
		String fileName2 = "";
		String fileName3 = "";
		try {// 原始文件名称
			if (upload1 != null&&upload2 != null&&upload3 != null) {
				fileName1 = upload1.getOriginalFilename();
				fileName2 = upload2.getOriginalFilename();
				fileName3 = upload3.getOriginalFilename();
				//上传物理路径
				String url = request.getSession().getServletContext().getRealPath("/upload/meet");
				File uploadfile1 = new java.io.File(url + "/" + fileName1);
				File uploadfile2 = new java.io.File(url + "/" + fileName2);
				File uploadfile3 = new java.io.File(url + "/" + fileName3);
				if (!uploadfile1.exists()&&!uploadfile2.exists()&&!uploadfile3.exists()) {
					uploadfile1.mkdirs();
					uploadfile2.mkdirs();
					uploadfile3.mkdirs();
				}
				upload1.transferTo(uploadfile1);
				upload2.transferTo(uploadfile2);
				upload3.transferTo(uploadfile3);
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (fileName1!="") {
			market.setReport(fileName1);
		}
		if (fileName2!="") {
			market.setTest(fileName2);
		}
		if (fileName3!="") {
			market.setEval(fileName3);
		}
		
		int cid=marketService.getCidByCname(clientname);
		market.setCid(cid);
		
		marketService.updateMarket(market);
		model.addAttribute("success", "修改营销记录成功！");
		model.addAttribute("member", market);
		model.addAttribute("flag", "1");
		
		return "/user/marketRecordUpdate.jsp";
	}
	
	@RequestMapping("/deleteMarket")
	public String deleteMarket(String keys) {
		String key[]=keys.split(",");
		int key1[]=new int[key.length];
		for(int i=0;i<key.length;i++) {
			key1[i]=Integer.parseInt(key[i]);
		}
		marketService.deleteMarket(key1);

		//删完数据后要重新查询一次
		return "redirect:marketList";
	}
}
