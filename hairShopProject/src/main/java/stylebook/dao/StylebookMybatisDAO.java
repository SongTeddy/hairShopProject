package stylebook.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional
public class StylebookMybatisDAO implements StylebookDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String, String>> getPermImage(String perm) {
		return sqlSession.selectList("stylebookSQL.getPermImage", perm);
	}

	@Override
	public List<Map<String, String>> getCutImage(String cut) {
		return sqlSession.selectList("stylebookSQL.getCutImage", cut);
	}

	@Override
	public List<Map<String, String>> getStyleImage(String style) {
		return sqlSession.selectList("stylebookSQL.getStyleImage", style);
	}

	@Override
	public List<Map<String, String>> getDyeImage(String dyeing) {
		return sqlSession.selectList("stylebookSQL.getDyeImage", dyeing);
	}
}
