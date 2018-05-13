package com.dFrag.weddingHub.model.shop.dto;

import java.util.Date;

public class ProductReplyDTO {
	private int rno; //댓글 번호
	private int product_id; //게시물 번호
	private String replytext; //댓글 내용
	private String replyer; //댓글 작성자 id
	private String name; //댓글 작성자 이름
	private Date regdate; //java.util.Date, 작성일자
	private Date updatedate; //수정일자
	private String secret_reply; //비밀댓글 여부
	private String writer; //member 테이블의 id
	//getter,setter,toString()
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getSecret_reply() {
		return secret_reply;
	}
	public void setSecret_reply(String secret_reply) {
		this.secret_reply = secret_reply;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "ProductReplyDTO [rno=" + rno + ", product_id=" + product_id + ", replytext=" + replytext + ", replyer="
				+ replyer + ", name=" + name + ", regdate=" + regdate + ", updatedate=" + updatedate + ", secret_reply="
				+ secret_reply + ", writer=" + writer + "]";
	}
	
}





