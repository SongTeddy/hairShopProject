package management.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;

@Component
@Transactional
public class ManagementDAOMybatis implements ManagementDAO {
	@Autowired
	private SqlSession sqlSession;

// 마이페이지(관리자)=================================================================================
	
	@Override
	public List<MemberDTO> getHairShopDesigner(String type) {
		return sqlSession.selectList("managementSQL.getHairShopDesigner", type);
	}
	
// 마이페이지(개인)=================================================================================

	//개인회원 정보 수정
	@Override
	public void updateInfo(MemberDTO memberDTO) {
		sqlSession.selectOne("memberSQL.updateInfo", memberDTO);
	}
	
	//회원탈퇴
	@Override
	public void userDelete(Map<String,String> map) {
		sqlSession.delete("memberSQL.userDelete", map);
	}
	
	//이용내역 정보
	@Override
	public List<Map<String, Object>> getUsageDetailsInfo(String email) {
		return sqlSession.selectList("memberSQL.getUsageDetailsInfo", email);
	}
	
	//예약현황 리스트
	@Override
	public List<Map<String, Object>> getReservationList(String email) {
		return sqlSession.selectList("memberSQL.getReservationList", email);
	}
	
	//예약취소
	@Override
	public void reservationCancel(String email) {
		sqlSession.delete("memberSQL.reservationCancel", email);
	}
	
	//리뷰 글을 쓸때 필요한 데이터 받아오기
	@Override
	public Map<String, String> checkReservationList(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.checkReservationList", map);
	}
	
	@Override
	public Map<String, String> getHomepageLink(String memEmail) {
		return sqlSession.selectOne("memberSQL.getHomepageLink", memEmail);
	}

	@Override
	public boolean isExistId(String hairShopId) {
		System.out.println(hairShopId + "여긴 DAO");
		if(sqlSession.selectOne("memberSQL.isExistId", hairShopId) != null)
			return true;
		else		
			return false;
	}

	@Override
	public List<Map<String, String>> heartList(String memEmail) {
		return sqlSession.selectList("memberSQL.heartList", memEmail);
	}
}
