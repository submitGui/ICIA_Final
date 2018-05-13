package com.dFrag.weddingHub.service.shop;

import java.util.List;

import com.dFrag.weddingHub.model.shop.dto.ProductDTO;

public interface ProductService {
	List<ProductDTO> listProduct(String search_option,String keyword,int start,int end);
	ProductDTO detailProduct(int product_id);
	String fileInfo(int product_id);
	void updateProduct(ProductDTO dto);
	void deleteProduct(int product_id);
	void insertProduct(ProductDTO dto);
	int countArticle(String search_option,String keyword);
}

