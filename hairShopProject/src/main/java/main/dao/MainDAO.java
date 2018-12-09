package main.dao;

import java.util.List;
import java.util.Map;

public interface MainDAO {
	public List<Map<String, Object>> getRecommendView();

	public List<Map<String, Object>> getHairShopStarScopeAvg();

	public List<Map<String, Object>> getHairShopPrice();
}
