package com.dFrag.weddingHub.service.shop;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dFrag.weddingHub.model.shop.dto.ProductReplyDTO;


public interface ProductReplyService {

	public List<ProductReplyDTO> list(int product_id,int start, int end,HttpSession session);
	public int count(int product_id);
	public void create(ProductReplyDTO dto);
	public void delete(int rno);
	
}










