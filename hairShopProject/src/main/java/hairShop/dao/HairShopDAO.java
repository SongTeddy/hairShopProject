package hairShop.dao;

import java.util.List;
import java.util.Map;

public interface HairShopDAO {
	public List<Map<String, Object>> getSearchList(Map<String, String> map);
	public Map<String, Object> getHairShopInfo(String hairShopId);
	public List<Map<String, Object>> getDesignerSchedule(Map<String, String> map);
	public List<Map<String, Object>> timeBtnCheck(Map<String, Object> designerMap);
	public List<Map<String, Object>> getServiceList(Map<String, String> map);
	public List<Map<String, Object>> getDesignerInfo(String hairShopId);
	public int confirmedReservation(Map<String, String> map);
}
