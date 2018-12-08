
package management.dao;

import java.util.List;
import java.util.Map;

import hairShop.bean.ReservationDTO;
import member.bean.DesignerDTO;
import member.bean.MemberDTO;

public interface ManagementDAO {	
	// 개인유저 페이지
	public void userDelete(Map<String, String> map);
	public void reservationCancel(String email);
	public List<Map<String, Object>> getReservationList(String email);
	public List<Map<String, Object>> getUsageDetailsInfo(String email);
	public void updateInfo(MemberDTO memberDTO);
	public Map<String, String> checkReservationList(Map<String, String> map);

	public boolean isExistId(String hairShopId);
	public List<Map<String, String>> heartList(String memEmail);
	
	// 관리자 페이지
	public List<MemberDTO> getHairShopList(String hairShopName);
	public void memberDelete(String email);
	public void memberPwdModify(String email, String modifyPwd);
	public String getMemberTotal();
	public List<String> getHairShopName();
	public List<MemberDTO> getMemberByType(String type);
	public String getTotalHairShop();
	public void hairShopDelete(String email);
	public void hairShopPwdModify(String email, String modifyPwd);
	public int eventRegister(Map<String, String> map);
	
	// 헤어샵 페이지
	public String getMemberType(String email);
	public String getCompanyType(String email);
	public String getTotalReservation(String hairshopid);
	public List<String> getTotalReservePrice(String hairshopId);
	public List<ReservationDTO> getReservation(String designername);
	public List<DesignerDTO> getDesignerInfo(String hairshopId);
	public String getDesignerReserve(String designerId);
	public void designerDelete(String seq);
	public void designerCheckedDelete(List<Integer> list);
	public void designerAdd(DesignerDTO designerDTO);
	public void designerModify(DesignerDTO designerDTO);
	public List<MemberDTO> getMemberInfo(String hairshopId);
	public List<String> getHairShopDesigner(String hairshopId);
  
  //스타일 찾기
  public List<Map<String, String>> getStylebookImage(String hairShopId);
	
	// 헤어샵 정보 등록 관련
	public Map<String, String> getHairShopInfo(String memEmail);
	public boolean isExistLicense(Map<String, String> map);
	public int hairShopInfoUpdate(Map<String, Object> map);
	public int hairShopInfoUpdateExceptImg(Map<String, Object> map);

	// 이벤트 관련
	public List<Map<String, Object>> getEventList();
	public List<Map<String, Object>> getEndEventList();
	
	public List<Map<String, Object>> getCurrentEventAndCouponList();
	public List<Map<String, Object>> getPastEventAndCouponList();
	public Map<String,String> getEventImageName(int seq);
	public Map<String, String> getEndEventImageName(int seq);
	public void deleteEvent(List<Integer> list);
	public Map<String, Object> getTargetEvent(String seq);
	public void updateEvent(Map<String, String> map);
	public void stylebookManagementModify(Map<String, String> map);
	public void stylebookDelete(String seq);
	public void stylebookManagementInsert(Map<String, String> map);
}
