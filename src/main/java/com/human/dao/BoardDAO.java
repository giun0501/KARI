package com.human.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.BoardVO;
import com.human.VO.PageVO;

@Repository
public class BoardDAO implements IF_BoardDAO {
	private static String mapperQuery = "com.human.dao.IF_BoardDAO";

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<BoardVO> listAll(PageVO pagevo) throws Exception {
		return sqlSession.selectList(mapperQuery + ".selectall", pagevo);
	}

	@Override
	public void delBoard(int delno) throws Exception {
		sqlSession.delete(mapperQuery + ".delBoard", delno);
	}

	@Override
	public BoardVO modBoard(int bno) throws Exception {
		return sqlSession.selectOne(mapperQuery + ".modBoard", bno);
	}

	@Override
	public int totalCnt(String bword) throws Exception {
		return sqlSession.selectOne(mapperQuery + ".totalCount", bword);
	}

	@Override
	public BoardVO viewDetail(int num) throws Exception {
		return sqlSession.selectOne(mapperQuery + ".viewDetail", num);
	}

	@Override
	public void boardWrite(BoardVO bvo) throws Exception {
		sqlSession.insert(mapperQuery + ".boardWrite", bvo);

	}

	@Override
	public void modBoard_pro(BoardVO bvo) throws Exception {
		sqlSession.update(mapperQuery + ".modpro", bvo);
	}

}
