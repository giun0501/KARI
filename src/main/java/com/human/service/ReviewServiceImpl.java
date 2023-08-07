package com.human.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.VO.ReviewVO;
import com.human.dao.IF_ReviewDAO;


@Service
public class ReviewServiceImpl implements IF_ReviewService{

	@Inject
	private IF_ReviewDAO reviewdao;

	@Override
	public void insertReview(ReviewVO rvo) throws Exception {
		

		reviewdao.insertReview(rvo);
	}

	@Override
	public List<ReviewVO> reviewList(String cno) throws Exception {
		return reviewdao.reviewList(cno);
	}

	@Override
	public void delReview(int rno) throws Exception {
		reviewdao.delReview(rno);
		
	}
	
}
