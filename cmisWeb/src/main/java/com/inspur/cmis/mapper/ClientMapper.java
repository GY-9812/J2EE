package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.Client;

public interface ClientMapper {
	public List<Client> getClientList(Map<String,String> map);
	public String getUserName(int cmid);
	public void addClient(Client client);
	public List<Client> getClientBySsn(String ssn);
	public Client getClientBykey(int key);
	public void updateClient(Client client);
	public void deleteClient(int keys[]);
}
