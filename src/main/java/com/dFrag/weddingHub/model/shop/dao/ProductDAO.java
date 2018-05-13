package com.dFrag.weddingHub.model.shop.dao;

import java.util.List;

import com.dFrag.weddingHub.model.shop.dto.ProductDTO;

public interface ProductDAO {
	List<ProductDTO> listProduct(String search_option,String keyword,int start,int end);
	ProductDTO detailProduct(int product_id);
	void updateProduct(ProductDTO dto);
	void deleteProduct(int product_id);
	void insertProduct(ProductDTO dto);
	String fileInfo(int product_id);
	int countArticle(String search_option,String keyword);
}



