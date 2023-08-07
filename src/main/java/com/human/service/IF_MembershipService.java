package com.human.service;

import java.util.HashMap;

import com.human.VO.MemberVO;

public interface IF_MembershipService {
	public void insertMember (MemberVO mvo) throws Exception; //회원가입
	public int idCheck(String id) throws Exception; //아이디 중복체크
	public MemberVO loginChk(HashMap<String,String> map) throws Exception;
	public MemberVO userInfo(String id) throws Exception;
	public void delMember(String id) throws Exception ;
	public void mod_pro(MemberVO mvo) throws Exception;
	public int chk_info(HashMap<String, String> map) throws Exception;
}
