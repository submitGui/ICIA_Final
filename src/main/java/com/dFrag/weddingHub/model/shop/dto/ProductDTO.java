package com.dFrag.weddingHub.model.shop.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private int product_id;
	private String product_name;
	private int price;
	private String description;
	private String picture_url;
	private String product_Start;
	private String product_end;
	private MultipartFile file1; //첨부파일
	//getter,setter,toString() 
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_Start() {
		return product_Start;
	}
	public void setProduct_Start(String product_Start) {
		this.product_Start = product_Start;
	}
	public String getProduct_end() {
		return product_end;
	}
	public void setProduct_end(String product_end) {
		this.product_end = product_end;
	}
	/*public String getStrDate() {
		return strDate;
	}
	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}*/
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", product_name=" + product_name + ", product_Start="
				+ product_Start + ", product_end=" + product_end + ", price=" + price + ", description=" + description
				+ ", picture_url=" + picture_url + ", file1=" + file1 + "]";
	}
	
}






