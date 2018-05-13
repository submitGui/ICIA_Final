package com.dFrag.weddingHub.model.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dFrag.weddingHub.model.shop.dto.ProductReplyDTO;

@Repository //dao bean
public class ProductReplyDAOImpl implements ProductReplyDAO {
	@Inject //의존관계 주입
	SqlSession sqlSession;

	//댓글 목록
	@Override
	public List<ProductReplyDTO> list(int product_id, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("product_id", product_id);
		return sqlSession.selectList("Productreply.listReply", map);
	}
	
	@Override
	public int count(int product_id) {
		return sqlSession.selectOne("Productreply.count",product_id);
	}
//댓글 추가	
	@Override
	public void create(ProductReplyDTO dto) {
		System.out.println("DAO"+dto);
		sqlSession.insert("Productreply.insertReply", dto); 
	}
	
	@Override
	public void delete(int rno) {
		sqlSession.delete("Productreply.deleteReply", rno);
	}
	
}













