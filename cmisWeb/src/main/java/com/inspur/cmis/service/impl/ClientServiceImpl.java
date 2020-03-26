package com.inspur.cmis.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.ClientMapper;
import com.inspur.cmis.pojo.Client;
import com.inspur.cmis.service.ClientService;

@Service("clientService")
public class ClientServiceImpl implements ClientService{
	@Autowired
	private ClientMapper clientMapper;
	@Override
	public List<Client> getClientList(Map<String, String> map) {
		return clientMapper.getClientList(map);
	}
	@Override
	public String getUserName(int cmid) {
		return clientMapper.getUserName(cmid);
	}
	@Override
	public void addClient(Client client) {
		clientMapper.addClient(client);
	}
	@Override
	public List<Client> getClientBySsn(String ssn) {
		return clientMapper.getClientBySsn(ssn);
	}
	@Override
	public Client getClientBykey(int key) {
		return clientMapper.getClientBykey(key);
	}
	@Override
	public void updateClient(Client client) {
		clientMapper.updateClient(client);
	}
	@Override
	public void deleteClient(int[] keys) {
		clientMapper.deleteClient(keys);
	}
}
