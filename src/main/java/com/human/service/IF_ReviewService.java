package com.human.service;

import java.util.List;

import com.human.VO.ReviewVO;

public interface IF_ReviewService {

	
	public void insertReview(ReviewVO rvo) throws Exception;
	public List<ReviewVO> reviewList(String cno) throws Exception;
	public void delReview(int rno) throws Exception;
}
