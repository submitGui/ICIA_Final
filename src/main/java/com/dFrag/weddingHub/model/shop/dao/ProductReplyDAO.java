package com.dFrag.weddingHub.model.shop.dao;

import java.util.List;

import com.dFrag.weddingHub.model.shop.dto.ProductReplyDTO;


public interface ProductReplyDAO {
	public List<ProductReplyDTO> list(int product_id, int start, int end);
	public int count(int product_id);
	public void create(ProductReplyDTO dto);
	public void delete(int rno);
}
