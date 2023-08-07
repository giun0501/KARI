package com.human.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.VO.CafeVO;
import com.human.dao.IF_CafeDAO;

@Service
public class CafeServiceImpl implements IF_CafeService{

	
	@Inject
	private IF_CafeDAO cafedao;

	@Override
	public List<CafeVO> cafeList(String cate) throws Exception {
		// TODO Auto-generated method stub
		return cafedao.cafeList(cate);
	}

	@Override
	public CafeVO cafeInfo(String cname) throws Exception {
		// TODO Auto-generated method stub
		return cafedao.cafeInfo(cname);
	}

	@Override
	public void cntUpdate(String cno) throws Exception {
		
		cafedao.cntUpdate(cno);
		
	}

	@Override
	public List<CafeVO> cafe_search(String cname) throws Exception {
		// TODO Auto-generated method stub
		return cafedao.cafe_search(cname);
	}
	
	
	
	
}
