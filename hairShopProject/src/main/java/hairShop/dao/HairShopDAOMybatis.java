package hairShop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Component
public class HairShopDAOMybatis implements HairShopDAO {
	@Autowired
	private SqlSession sqlSession;
   
	@Override
	public List<Map<String, Object>> getSearchList(Map<String, String> map) {
		System.out.println("search DAO 들어왔어용!");
		return sqlSession.selectList("hairShopSQL.getSearchList", map);
	}

	@Override
	public Map<String, Object> getHairShopInfo(String hairShopId) {
		System.out.println("DAO mybatis"+hairShopId);
		
		return sqlSession.selectOne("hairShopSQL.getHairShopInfo", hairShopId);
	}
	@Override
	public List<Map<String, Object>> getDesignerSchedule(Map<String, String> map) {		
		return sqlSession.selectList("hairShopSQL.getDesignerSchedule", map);
	}

	@Override
	public List<Map<String, Object>> timeBtnCheck(Map<String, Object> map) {
		return sqlSession.selectList("hairShopSQL.timeBtnCheck", map);
	}
   @Override
   public List<Map<String, Object>> getServiceList(Map<String, String> map) {
      return sqlSession.selectList("hairShopSQL.getServiceList", map);
   }
   @Override
	public List<Map<String, Object>> getDesignerInfo(String hairShopId) {
		System.out.println("DAO mybatis"+hairShopId);
		return sqlSession.selectList("hairShopSQL.getDesignerInfo", hairShopId);
	}

	@Override
	public int confirmedReservation(Map<String, String> map) {
		return sqlSession.insert("hairShopSQL.confirmedReservation", map);
	}
}