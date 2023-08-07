package com.human.dao;

import java.util.List;

import com.human.VO.BoardVO;
import com.human.VO.PageVO;

public interface IF_BoardDAO {
	public List<BoardVO> listAll(PageVO pagevo) throws Exception;
	public void delBoard(int delno) throws Exception;
	public BoardVO modBoard(int bno) throws Exception;
	public void modBoard_pro(BoardVO bvo) throws Exception;
	public int totalCnt(String bword) throws Exception;
	public BoardVO viewDetail(int num) throws Exception;
	public void boardWrite(BoardVO bvo) throws Exception;
}
