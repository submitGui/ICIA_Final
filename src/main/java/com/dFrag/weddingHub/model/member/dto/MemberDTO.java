package com.dFrag.weddingHub.model.member.dto;

import java.util.Date;

//(유저아이디/패스워드/사용자이름/이메일/가입일/최근접속일/인증상태(T/F)/인증코드)
public class MemberDTO {
	private String userid;
	private String password;
	private String name;
	private String email;
	private String address;
	private Date member_reg_date;
	private Date member_log_date;
	private String approval_status;
	private String approval_key;
	private int member_point;
	private String member_type;
	private String member_busiNum;
	private String member_company_name;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getmember_reg_date() {
		return member_reg_date;
	}
	public void setmember_reg_date(Date member_reg_date) {
		this.member_reg_date = member_reg_date;
	}
	public Date getmember_log_date() {
		return member_log_date;
	}
	public void setmember_log_date(Date member_log_date) {
		this.member_log_date = member_log_date;
	}
	public String getApproval_status() {
		return approval_status;
	}
	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}
	public String getApproval_key() {
		return approval_key;
	}
	public void setApproval_key(String approval_key) {
		this.approval_key = approval_key;
	}
	public int getMember_point() {
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	public String getMember_type() {
		return member_type;
	}
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
	public String getMember_busiNum() {
		return member_busiNum;
	}
	public void setMember_busiNum(String member_busiNum) {
		this.member_busiNum = member_busiNum;
	}
	public String getMember_company_name() {
		return member_company_name;
	}
	public void setMember_company_name(String member_company_name) {
		this.member_company_name = member_company_name;
	}
	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", address=" + address + ", member_reg_date=" + member_reg_date + ", member_log_date=" + member_log_date + ", approval_status="
				+ approval_status + ", approval_key=" + approval_key + ", member_point=" + member_point
				+ ", member_type=" + member_type + ", member_busiNum=" + member_busiNum + ", member_company_name="
				+ member_company_name + "]";
	}
}
