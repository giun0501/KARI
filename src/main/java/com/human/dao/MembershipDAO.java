package com.human.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.MemberVO;

@Repository
public class MembershipDAO implements IF_MembershipDAO {

	private static String mapperQuery = "com.human.dao.IF_MembershipDAO";

	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberVO mvo) throws Exception {

		sqlSession.insert(mapperQuery + ".insert", mvo);

	}

	@Override
	public int idCheck(String id) throws Exception {

		return sqlSession.selectOne(mapperQuery + ".idchk", id);
	}

	@Override
	public MemberVO loginChk(HashMap<String, String> map) throws Exception {

		return sqlSession.selectOne(mapperQuery + ".loginchk", map);
	}

	@Override
	public MemberVO userInfo(String id) throws Exception {

		return sqlSession.selectOne(mapperQuery + ".userinfo", id);
	}

	@Override
	public void delMember(String id) throws Exception {
		sqlSession.delete(mapperQuery + ".delMember", id);

	}

	@Override
	public void mod_pro(MemberVO mvo) throws Exception {
		sqlSession.update(mapperQuery + ".mod_pro", mvo);

	}

	@Override
	public int chk_info(HashMap<String, String> map) throws Exception {
		
		return sqlSession.selectOne(mapperQuery+".chk_info" , map);
	}

}
