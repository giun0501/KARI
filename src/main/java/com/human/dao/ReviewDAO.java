package com.human.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.ReviewVO;

@Repository
public class ReviewDAO implements IF_ReviewDAO{

	private static String mapperQuery = "com.human.dao.IF_ReviewDAO";

	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertReview(ReviewVO rvo) throws Exception {
		
		sqlSession.insert(mapperQuery+".insert" , rvo);
	}
	
	@Override
	public List<ReviewVO> reviewList(String cno) throws Exception {
		
		return sqlSession.selectList(mapperQuery+".reviewList" , cno);
	}

	@Override
	public void delReview(int rno) throws Exception {
		sqlSession.delete(mapperQuery +".delreview", rno);
		
	}
	
	
	
	
}
