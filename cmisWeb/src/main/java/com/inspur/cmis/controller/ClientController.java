package com.inspur.cmis.controller;

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
import com.inspur.cmis.pojo.Client;
import com.inspur.cmis.service.ClientService;

@Controller
public class ClientController {
	@Autowired
	private ClientService clientService;
	
	@RequestMapping("/clientInfoList")
	public String clientInfoList(Model model,HttpServletRequest request,@RequestParam(value="pn",defaultValue="1") Integer pn){
		//获取页面中传递过来的key
		String cmid=request.getParameter("cmid");
		String clientname=request.getParameter("clientname");
		String ssn=request.getParameter("ssn");
		Map<String,String> map=new HashMap<String,String>();
		map.put("cmid", cmid);
		map.put("clientname", clientname);
		map.put("ssn", ssn);

		//配置每页5条
		PageHelper.startPage(pn, 5);
		List<Client> clientList = clientService.getClientList(map);
		for (int i = 0; i < clientList.size(); i++) {
			String cmname=clientService.getUserName(clientList.get(i).getCmid());
			clientList.get(i).setCmname(cmname);
		}

		PageInfo<Client> pageInfo=new PageInfo<Client>(clientList,clientList.size());
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("cmid", cmid);
		model.addAttribute("clientname", clientname);
		model.addAttribute("ssn", ssn);
		return "user/clientInfo.jsp";
	}
}
