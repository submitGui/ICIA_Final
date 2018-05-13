package com.dFrag.weddingHub.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dFrag.weddingHub.model.board.dto.ReplyDTO;

public interface ReplyService {

	public List<ReplyDTO> list(int bno, int start, int end,HttpSession session);
	public int count(int bno);
	public void create(ReplyDTO dto);
	public void delete(int rno);
	
}











