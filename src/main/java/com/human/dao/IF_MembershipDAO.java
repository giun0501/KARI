package com.human.dao;

import java.util.HashMap;

import com.human.VO.MemberVO;

public interface IF_MembershipDAO {
	public void insertMember(MemberVO mvo) throws Exception;
	public int idCheck(String id) throws Exception; //아이디 중복체크
	public MemberVO loginChk(HashMap<String,String> map) throws Exception; //로그인시 아이디 비번 확인
	public MemberVO userInfo(String id) throws Exception;
	public void delMember(String id) throws Exception;
	public void mod_pro(MemberVO mvo) throws Exception;
	public int chk_info(HashMap<String,String> map) throws Exception;
}
