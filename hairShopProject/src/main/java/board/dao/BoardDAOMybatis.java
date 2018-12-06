package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;

@Component
@Transactional
public class BoardDAOMybatis implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	public void boardWrite(Map<String, String> map) {
		sqlSession.insert("boardSQL.boardWrite", map);
	}

	@Override
	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("boardSQL.getBoardList", map);
	}

	@Override
	public int getBoardTotalA() {
		return sqlSession.selectOne("boardSQL.getBoardTotalA");
	}

	@Override
	public List<BoardDTO> boardSearch(Map<String, String> map) {
		return sqlSession.selectList("boardSQL.boardSearch", map);
	}

	@Override
	public int getBoardSearchTotalA(Map<String, String> map) {
		return sqlSession.selectOne("boardSQL.getBoardSearchTotalA", map);
	}

	@Override
	public BoardDTO boardView(int seq) {
		return sqlSession.selectOne("boardSQL.boardView", seq);
	}

	@Override
	public void boardModify(Map<String, String> map) {
		sqlSession.update("boardSQL.boardModify", map);
	}

	@Override
	public void BoardDelete(int seq) {
		sqlSession.delete("boardSQL.boardDelete", seq);
	}
}