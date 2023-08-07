package com.human.dao;

import java.util.List;

import com.human.VO.ReviewVO;

public interface IF_ReviewDAO {
	public void insertReview(ReviewVO rvo) throws Exception;
	public List<ReviewVO> reviewList(String cno) throws Exception;
	public void delReview(int rno) throws Exception;
}

