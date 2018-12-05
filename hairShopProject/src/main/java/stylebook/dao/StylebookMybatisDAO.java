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
	public List<Map<String, String>> getPermImage() {
		return sqlSession.selectList("stylebookSQL.getPermImage");
	}
}
