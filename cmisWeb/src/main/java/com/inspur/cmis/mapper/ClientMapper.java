package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.Client;

public interface ClientMapper {
	public List<Client> getClientList(Map<String,String> map);
	public String getUserName(int cmid);
}
