package com.dFrag.weddingHub.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.dFrag.weddingHub.model.board.dao.ReplyDAO;
import com.dFrag.weddingHub.model.board.dto.ReplyDTO;

@Service //service bean
public class ReplyServiceImpl implements ReplyService {
	@Inject
	ReplyDAO replyDao;

	//댓글 목록
	@Override
	public List<ReplyDTO> list(int bno,int start, int end, HttpSession session) {
		List<ReplyDTO> items=replyDao.list(bno, start, end);
		return items;
	}
	@Override
	public int count(int bno) {
		return replyDao.count(bno);
	}
//댓글 쓰기	
	@Override
	public void create(ReplyDTO dto) {
		replyDao.create(dto);
	}
	@Override
	public void delete(int rno) {
		System.out.println(rno+"SERVICE");
		replyDao.delete(rno);
	}
	
	
}










