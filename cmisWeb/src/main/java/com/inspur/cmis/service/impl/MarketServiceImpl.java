package com.inspur.cmis.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.cmis.mapper.MarketMapper;
import com.inspur.cmis.pojo.Client;
import com.inspur.cmis.pojo.Market;
import com.inspur.cmis.service.MarketService;

@Service("marketService")
public class MarketServiceImpl implements MarketService{
	@Autowired
	private MarketMapper marketMapper;

	@Override
	public List<Market> getMarketList(Map<String, String> map) {
		return marketMapper.getMarketList(map);
	}

	@Override
	public int getCidByCname(String clientname) {
		return marketMapper.getCidByCname(clientname);
	}

	@Override
	public void addMarket(Market market) {
		marketMapper.addMarket(market);
	}

	@Override
	public List<Client> getClientByClientName(String clientname) {
		return marketMapper.getClientByClientName(clientname);
	}

	@Override
	public Market getMarketBykey(int key) {
		return marketMapper.getMarketBykey(key);
	}

	@Override
	public void updateMarket(Market market) {
		marketMapper.updateMarket(market);
	}

	@Override
	public void deleteMarket(int[] keys) {
		marketMapper.deleteMarket(keys);
	}
}
