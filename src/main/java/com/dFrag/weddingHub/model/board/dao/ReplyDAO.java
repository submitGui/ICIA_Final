package com.dFrag.weddingHub.model.board.dao;

import java.util.List;

import com.dFrag.weddingHub.model.board.dto.ReplyDTO;

public interface ReplyDAO {
	public List<ReplyDTO> list(int bno, int start, int end);
	public int count(int bno);
	public void create(ReplyDTO dto);
	public void delete(int rno);
}
