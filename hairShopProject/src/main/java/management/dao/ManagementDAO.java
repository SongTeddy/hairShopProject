
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
	public List<ReservationDTO> getAllReservation();
	public List<ReservationDTO> getReservationList(int startNum, int endNum);
	public int getListTotalA();
	public List<ReservationDTO> reservationSearch(Map<String, String> map);
	public int getSearchReservationTotalA(Map<String, String> map);
	
	// 헤어샵 페이지
	public String getMemberType(String email);
	public String getCompanyType(String email);
	public String getTotalReservation(String hairshopid);
	public List<String> getTotalReservePrice(String hairshopId);
	public List<ReservationDTO> getReservation(String designerid);
	public List<ReservationDTO> getCommingReservation(String designerid);
	public List<DesignerDTO> getDesignerInfo(String hairshopId);
	public String getDesignerReserve(String designerId);
	public void designerCheckedDelete(List<String> list);
	public void designerAdd(Map<String, String> map);
	public void designerModify(Map<String, String> map);
	public void designerModifyExceptImg(Map<String, String> map);
	public List<MemberDTO> getMemberInfo(String hairshopId);
	public List<String> getHairShopDesigner(String hairshopId);
  
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
	
	//배너 관련
	public void bannerResister(String a);
	public List<Map<String, Object>> getBannerList();
	
	
	public Map<String, String> getCoupon(int seq);
	public void couponDownExpire(Map<String, String> map);
	public void couponDownTerm(Map<String, String> map);
	public int couponCheckDuplication(Map<String, String> map);
	public List<Map<String, Object>> getCouponList(String memEmail);
	public List<Map<String, Object>> getEndCouponList(String memEmail);
	public void usedCoupon(Map<String, String> map);

  
	//스타일 찾기
	public List<Map<String, String>> getStylebookImage(String hairShopId);
	public void deleteEvent(List<Integer> list);
	public Map<String, Object> getTargetEvent(String seq);
	public void updateEvent(Map<String, String> map);
	public void stylebookManagementModify(Map<String, String> map);
	public void stylebookDelete(String seq);
	public void stylebookManagementInsert(Map<String, String> map);
	
	// 스케줄 등록
	public List<Map<String, String>> getInfoForScheduling(String memEmail);
	public void totalHairShopSchedule(Map<String, Object> map);
	public int vacationDesignerSchedule(Map<String, Object> map);
	public void overworkDesignerSchedule(Map<String, Object> map);
	
	// 서비스 관련
	public List<Map<String, Object>> getServices(Map<String, String> map);
	public void deleteService(Map<String, String> map);
	public void serviceRegister(Map<String, String> map);
	public void bannerDelete();
	public List<Map<String, Object>> recommendList();
	public void recommendHairShopDelete();
	public void recommendHairShopRegist(String value);
}
