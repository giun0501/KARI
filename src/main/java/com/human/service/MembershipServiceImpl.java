package com.human.service;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.VO.MemberVO;
import com.human.dao.IF_MembershipDAO;


@Service
public class MembershipServiceImpl implements IF_MembershipService{

	@Inject
	private IF_MembershipDAO membershipdao;
	
	@Override
	public void insertMember(MemberVO mvo) throws Exception {
	
		membershipdao.insertMember(mvo);
	}

	@Override
	public int idCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return membershipdao.idCheck(id);
	}

	@Override
	public MemberVO loginChk(HashMap<String,String> map) throws Exception {
		// TODO Auto-generated method stub
		return membershipdao.loginChk(map);
	}

	@Override
	public MemberVO userInfo(String id) throws Exception {
		// TODO Auto-generated method stub
		return membershipdao.userInfo(id);
	}

	@Override
	public void delMember(String id) throws Exception {
		
		membershipdao.delMember(id);
		
	}

	@Override
	public void mod_pro(MemberVO mvo) throws Exception {
		membershipdao.mod_pro(mvo);
	}

	@Override
	public int chk_info(HashMap<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return membershipdao.chk_info(map);
	}

	
	
}
