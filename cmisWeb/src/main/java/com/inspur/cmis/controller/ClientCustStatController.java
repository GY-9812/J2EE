package com.inspur.cmis.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inspur.cmis.pojo.ClientCustExt;
import com.inspur.cmis.service.ClientCustService;

@Controller
public class ClientCustStatController {
	
	@Autowired
	private ClientCustService clientCustService;
	
	@RequestMapping("/cientCustStat")
	@ResponseBody
	public List<ClientCustExt> cientCustStat() {
		List<ClientCustExt> statList = clientCustService.finceStatByMgr();
		return statList;
	}
}