package com.human.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.VO.BoardVO;
import com.human.VO.PageVO;
import com.human.dao.IF_BoardDAO;

@Service
public class BoardServiceImpl implements IF_BoardService{

	@Inject
	private IF_BoardDAO boarddao;
	
	@Override
	public List<BoardVO> listAll(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.listAll(pageVO);
	}

	@Override
	public void del_board(int delno) throws Exception {
		// TODO Auto-generated method stub
		boarddao.delBoard(delno);
	}

	@Override
	public BoardVO mod_board(int bno) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.modBoard(bno);
	}

	@Override
	public int totalCnt(String bword) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.totalCnt(bword);
	}

	@Override
	public BoardVO viewDetail(int num) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.viewDetail(num);
	}

	@Override
	public void boardWrite(BoardVO bvo) throws Exception {
		boarddao.boardWrite(bvo);
		
	}

	@Override
	public void modBoard_pro(BoardVO bvo) throws Exception {
		boarddao.modBoard_pro(bvo);
		
	}

	
}
