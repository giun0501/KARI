package com.human.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.CafeVO;

@Repository
public class CafeDAO implements IF_CafeDAO {

	private static String mapperQuery = "com.human.dao.IF_CafeDAO";

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<CafeVO> cafeList(String cate) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(cate);
		return sqlSession.selectList(mapperQuery + ".cafeList", cate);
	}

	@Override
	public CafeVO cafeInfo(String cname) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery + ".cafeInfo", cname);
	}

	@Override
	public void cntUpdate(String cno) throws Exception {
		
		sqlSession.update(mapperQuery +".cntUpdate" , cno);
		
	}
	
	@Override
	public List<CafeVO> cafe_search(String cname) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery + ".cafe_search", cname);
	}

}
