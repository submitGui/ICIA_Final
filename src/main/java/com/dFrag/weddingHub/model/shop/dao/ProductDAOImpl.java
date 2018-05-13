package com.dFrag.weddingHub.model.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dFrag.weddingHub.model.shop.dto.ProductDTO;

@Repository 
public class ProductDAOImpl implements ProductDAO {

	@Inject //의존관계 주입
	SqlSession sqlSession;
	
	@Override
	public List<ProductDTO> listProduct(String search_option,String keyword,int start,int end) {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);//맵에 자료 저장
		map.put("end", end);
		//mapper에는 2개 이상의 값을 전달할 수 없음(dto또는 map사용)
		return sqlSession.selectList("product.product_list",map); 
	}

	@Override
	public ProductDTO detailProduct(int product_id) {
		return sqlSession.selectOne(
				"product.detail_product", product_id);  
	}
//상품정보 수정
	@Override
	public void updateProduct(ProductDTO dto) {
		sqlSession.update("product.update_product", dto); 
	}
//상품 레코드 삭제
	@Override
	public void deleteProduct(int product_id) {
		sqlSession.delete("product.product_delete", product_id); 
	}
//상품 등록
	@Override
	public void insertProduct(ProductDTO dto) {
		System.out.println(dto.getProduct_Start());
		System.out.println(dto.getProduct_end());
		sqlSession.insert("product.insert", dto); 
	}
//첨부파일 이름 리턴
	@Override
	public String fileInfo(int product_id) { 
		return sqlSession.selectOne(
				"product.fileInfo", product_id);
	}
	//레코드 갯수 계산
	@Override
	public int countArticle(String search_option,String keyword) {
		Map<String,String> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("product.countArticle", map);
	}

}




