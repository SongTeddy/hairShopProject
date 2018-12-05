package management.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import hairShop.bean.ReservationDTO;
import member.bean.DesignerDTO;
import member.bean.MemberDTO;

@Component
@Transactional
public class ManagementDAOMybatis implements ManagementDAO {
	@Autowired
	private SqlSession sqlSession;

// 페이지 이동=================================================================================
	
	// 마이페이지 구분
	@Override
	public String getMemberType(String email) {
		return sqlSession.selectOne("managementSQL.getMemberType", email);
	}

	@Override
	public String getCompanyType(String email) {
		return sqlSession.selectOne("managementSQL.getCompanyType", email);
	}

// 마이페이지(관리자)=================================================================================
	
	//------------------------------- 헤어샵 관리 메뉴 -------------------------------//
	
	// 헤어샵 이름 조회
	@Override
	public List<String> getHairShopName() {
		return sqlSession.selectList("managementSQL.getHairShopName");
	}
	
	@Override
	public List<MemberDTO> getHairShopList(String hairShopName) {
		return sqlSession.selectList("managementSQL.getHairShopList", hairShopName);
	}
	
	//------------------------------- 회원 관리 메뉴 -------------------------------//
	
	// type에 의한 멤버 조회
	@Override
	public List<MemberDTO> getMemberByType(String type) {
		return sqlSession.selectList("managementSQL.getMemberByType", type);
	}
	
	@Override
	public String getMemberTotal() {
		return sqlSession.selectOne("managementSQL.getMemberTotal");
	}
	
	// 개인회원 삭제
	@Override
	public void memberDelete(String email) {
		sqlSession.delete("managementSQL.memberDelete", email);
	}
	
	// 개인회원 비밀번호 수정
	@Override
	public void memberPwdModify(String email, String modifyPwd) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("email", email);
		map.put("modifyPwd", modifyPwd);
		
		sqlSession.update("managementSQL.memberPwdModify", map);	
	}
	
// 마이페이지(개인)=================================================================================

	//개인회원 정보 수정
	@Override
	public void updateInfo(MemberDTO memberDTO) {
		sqlSession.selectOne("managementSQL.updateInfo", memberDTO);
	}
	
	//회원탈퇴
	@Override
	public void userDelete(Map<String,String> map) {
		sqlSession.delete("managementSQL.userDelete", map);
	}
	
	//이용내역 정보
	@Override
	public List<Map<String, Object>> getUsageDetailsInfo(String email) {
		return sqlSession.selectList("managementSQL.getUsageDetailsInfo", email);
	}
	
	//예약현황 리스트
	@Override
	public List<Map<String, Object>> getReservationList(String email) {
		return sqlSession.selectList("managementSQL.getReservationList", email);
	}
	
	//예약취소
	@Override
	public void reservationCancel(String email) {
		sqlSession.delete("managementSQL.reservationCancel", email);
	}
	
	//리뷰 글을 쓸때 필요한 데이터 받아오기
	@Override
	public Map<String, String> checkReservationList(Map<String, String> map) {
		return sqlSession.selectOne("managementSQL.checkReservationList", map);
	}

	@Override
	public List<Map<String, String>> heartList(String memEmail) {
		return sqlSession.selectList("managementSQL.heartList", memEmail);
	}
	
// 마이페이지(헤어샵)=================================================================================

	//------------------------------- 예약 현황 메뉴 -------------------------------//

	// 예약 현황 조회
	@Override
	public String getTotalReservation(String hairshopid) {
		return sqlSession.selectOne("managementSQL.getTotalReservation", hairshopid);
	}

	// 총 예약 금액
	@Override
	public List<String> getTotalReservePrice(String hairshopId) {
		return sqlSession.selectList("managementSQL.getTotalReservePrice", hairshopId);
	}

	// 한명의 예약 정보 조회
	@Override
	public List<ReservationDTO> getReservation(String designername) {
		return sqlSession.selectList("managementSQL.getReservation", designername);
	}

	//------------------------------- 디자이너 관리 메뉴 -------------------------------//

	// 디자이너 정보 조회
	@Override
	public List<DesignerDTO> getDesignerInfo(String hairshopId) {
		return sqlSession.selectList("managementSQL.getDesignerInfo", hairshopId);
	}

	// 디자이너 아이디로 예약 조회
	@Override
	public String getDesignerReserve(String designerId) {
		return sqlSession.selectOne("managementSQL.getDesignerReserve", designerId);
	}

	// 디자이너 삭제
	@Override
	public void designerDelete(String seq) {
		sqlSession.delete("managementSQL.designerDelete", seq);
	}

	// 선택된 디자이너 삭제
	@Override
	public void designerCheckedDelete(List<Integer> list) {
		sqlSession.delete("managementSQL.designerCheckedDelete", list);
	}

	// 디자이너 추가
	@Override
	public void designerAdd(DesignerDTO designerDTO) {
		sqlSession.insert("managementSQL.designerAdd", designerDTO);
	}

	// 디자이너 정보 수정
	@Override
	public void designerModify(DesignerDTO designerDTO) {
		sqlSession.update("managementSQL.designerModify", designerDTO);
	}

	// 멤버 정보 조회
	@Override
	public List<MemberDTO> getMemberInfo(String hairshopId) {
		return sqlSession.selectList("managementSQL.getMemberInfo", hairshopId);
	}

	@Override
	public List<String> getHairShopDesigner(String hairshopId) {
		return sqlSession.selectList("managementSQL.getHairShopDesigner", hairshopId);
	}
	
	//------------------------------- 헤어샵 정보 등록(수정) 메뉴 -------------------------------//
	
	   
	   @Override
	   public Map<String, String> getHairShopInfo(String memEmail) {
	      return sqlSession.selectOne("managementSQL.getHairShopInfo", memEmail);
	   }

	   @Override
	   public boolean isExistId(String hairShopId) {
	      System.out.println(hairShopId + "여긴 DAO");
	      if (sqlSession.selectOne("managementSQL.isExistId", hairShopId) != null)
	         return true;
	      else
	         return false;
	   }

	   @Override
	   public boolean isExistLicense(Map<String, String> map) {
	      if (sqlSession.selectOne("managementSQL.isExistLicense", map) != null)
	         return true;
	      else
	         return false;
	   }

	   @Override
	   public int hairShopInfoUpdate(Map<String, Object> map) {
	      return sqlSession.update("managementSQL.hairShopInfoUpdate", map);
	   }
	   
	   @Override
	   public int hairShopInfoUpdateExceptImg(Map<String, Object> map) {
	      return sqlSession.update("managementSQL.hairShopInfoUpdateExceptImg", map);
	   }
}