package com.dFrag.weddingHub.service.shop;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dFrag.weddingHub.model.shop.dao.ProductDAO;
import com.dFrag.weddingHub.model.shop.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	ProductDAO productDao;
	
	@Override
	public List<ProductDTO> listProduct(String search_option,String keyword,int start,int end) {
		return productDao.listProduct(search_option,keyword,start,end); 
	}

	@Override
	public ProductDTO detailProduct(int product_id) {
		return productDao.detailProduct(product_id); 
	}
//첨부파일의 이름 리턴
	@Override
	public String fileInfo(int product_id) {
		return productDao.fileInfo(product_id); 
	}
//상품정보 수정
	@Override
	public void updateProduct(ProductDTO dto) {
		productDao.updateProduct(dto); 
	}
//상품 레코드 삭제
	@Override
	public void deleteProduct(int product_id) {
		productDao.deleteProduct(product_id); 
	}

	@Override
	public void insertProduct(ProductDTO dto) {
		System.out.println(dto.getProduct_Start());
		System.out.println(dto.getProduct_end());
		productDao.insertProduct(dto); 	
	}
	@Override
	public int countArticle(String search_option,String keyword) {
		return productDao.countArticle(search_option,keyword);
	}

}










