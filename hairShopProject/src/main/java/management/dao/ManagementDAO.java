package management.dao;

import java.util.List;
import java.util.Map;

import member.bean.MemberDTO;

public interface ManagementDAO {

	public List<MemberDTO> getHairShopDesigner(String string);
	
	//개인유저 마이페이지
	public void userDelete(Map<String, String> map);
	public void reservationCancel(String email);
	public List<Map<String, Object>> getReservationList(String email);
	public List<Map<String, Object>> getUsageDetailsInfo(String email);
	public void updateInfo(MemberDTO memberDTO);
	public Map<String, String> checkReservationList(Map<String, String> map);

	public Map<String, String> getHomepageLink(String memEmail);
	public boolean isExistId(String hairShopId);
	public List<Map<String, String>> heartList(String memEmail);

}
