package com.dFrag.weddingHub.model.auction.dto;

public class AuctionDTO {
	private int product_id;
	private String userid;
	private int member_point;
	private String day;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getMember_point() {
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	@Override
	public String toString() {
		return "AuctionDTO [product_id=" + product_id + ", userid=" + userid + ", member_point=" + member_point
				+ ", day=" + day + "]";
	}
}