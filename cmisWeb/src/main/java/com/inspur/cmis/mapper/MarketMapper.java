package com.inspur.cmis.mapper;

import java.util.List;
import java.util.Map;

import com.inspur.cmis.pojo.Client;
import com.inspur.cmis.pojo.Market;

public interface MarketMapper {
	 public List<Market> getMarketList(Map<String, String> map);
	 public int getCidByCname(String clientname);
	 public void addMarket(Market market);
	 public List<Client> getClientByClientName(String clientname);
	 public Market getMarketBykey(int key);
	 public void updateMarket(Market market);
	 public void deleteMarket(int keys[]);
}
