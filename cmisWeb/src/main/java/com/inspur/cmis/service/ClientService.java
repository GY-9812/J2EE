package com.inspur.cmis.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.inspur.cmis.pojo.Client;
@Resource
public interface ClientService {
	public List<Client> getClientList(Map<String,String> map);
	public String getUserName(int cmid);
}
