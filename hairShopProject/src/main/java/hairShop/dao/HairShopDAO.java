package hairShop.dao;

import java.util.List;
import java.util.Map;

import hairShop.bean.HairShopReviewDTO;

public interface HairShopDAO {
	public List<Map<String, Object>> getSearchListOrderByDistance(Map<String, Object> map);
	public List<Map<String, Object>> getSearchListOrderByStar(Map<String, Object> map);
	public Map<String, Object> getHairShopInfo(String hairShopId);
	public List<Map<String, Object>> getDesignerSchedule(Map<String, String> map);
	public List<Map<String, Object>> timeBtnCheck(Map<String, Object> designerMap);
	public List<Map<String, Object>> getServiceList(Map<String, String> map);
	public List<Map<String, Object>> getDesignerInfo(String hairShopId);
	public List<Map<String, String>> noConflict(Map<String, String> map);
	public int confirmedReservation(Map<String, String> map);
	public Map<String, Object> getTel(String memEmail);
	//리뷰작성
	public void hairShopReviewWrite(Map<String, String> map);
	
	//좋아요 버튼
	public Map<String, Object> getHeartBtn(Map<String, String> map);
	public void insertHeart(Map<String, String> map);
	public void deleteHeart(Map<String, String> map);
	public List<Map<String, Object>> getSearchHairShopList(String hairShopName);
	
	//리뷰 리스트 띄우기
	public List<HairShopReviewDTO> hairShopReviewList(String hairShopId);
	public List<HairShopReviewDTO> randomReviewList();
}
