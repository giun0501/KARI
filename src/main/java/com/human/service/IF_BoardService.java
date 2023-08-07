package com.human.service;

import java.util.List;

import com.human.VO.BoardVO;
import com.human.VO.PageVO;

public interface IF_BoardService {
	public List<BoardVO> listAll(PageVO pageVO) throws Exception;
	public void del_board(int delno) throws Exception;
	public BoardVO mod_board(int bno) throws Exception;
	public void modBoard_pro(BoardVO bvo) throws Exception;
	public int totalCnt(String bword) throws Exception;
	public BoardVO viewDetail(int num) throws Exception;
	public void boardWrite(BoardVO bvo) throws Exception;
}
