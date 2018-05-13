package com.dFrag.weddingHub.service.shop;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.dFrag.weddingHub.model.shop.dao.ProductReplyDAO;
import com.dFrag.weddingHub.model.shop.dto.ProductReplyDTO;

@Service //service bean
public class ProductReplyServiceImpl implements ProductReplyService {
	@Inject
	ProductReplyDAO replyDao;

	//댓글 목록
	@Override
	public List<ProductReplyDTO> list(int product_id,int start, int end,HttpSession session) {
		List<ProductReplyDTO> items=replyDao.list(product_id, start, end);
		System.out.println(product_id);
		return items;
	}
	@Override
	public int count(int product_id) {
		return replyDao.count(product_id);
	}
//댓글 쓰기	
	@Override
	public void create(ProductReplyDTO dto) {
		System.out.println("SERVICE"+dto);
		replyDao.create(dto);
	}
	@Override
	public void delete(int rno) {
		System.out.println(rno+"SERVICE");
		replyDao.delete(rno);
	}
	
	
}











