package com.human.service;

import java.util.List;

import com.human.VO.CafeVO;

public interface IF_CafeService {
	public List<CafeVO> cafeList(String cate)throws Exception;
	public CafeVO cafeInfo(String cname)throws Exception;
	public void cntUpdate(String cno)throws Exception;
	public List<CafeVO> cafe_search(String cname) throws Exception;
}
