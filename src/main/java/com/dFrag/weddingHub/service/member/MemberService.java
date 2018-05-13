package com.dFrag.weddingHub.service.member;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;

import com.dFrag.weddingHub.model.member.dto.MemberDTO;

public interface MemberService {
	
	public boolean loginCheck(MemberDTO dto, HttpSession session) throws Exception;//로그인되면 session값을 보냄
	
	public void logout(HttpSession session);
	
	public MemberDTO viewMember(String userid) throws Exception;
	
	public void check_id(String userid, HttpServletResponse response) throws Exception;

	public void check_email(String email, HttpServletResponse response) throws Exception;

	public int join_member(MemberDTO member, HttpServletResponse response) throws Exception;
	
	public int business_member(MemberDTO member, HttpServletResponse response) throws Exception;

	public String create_key() throws Exception;

	public void approval_member(MemberDTO member, HttpServletResponse response) throws Exception;

	public MemberDTO login(MemberDTO member, HttpServletResponse response) throws Exception;

	public void logout(HttpServletResponse response) throws Exception;

	public String find_id(HttpServletResponse response, String email) throws Exception;

	public void send_mail(MemberDTO member, String div) throws Exception;

	public void find_pw(HttpServletResponse response, MemberDTO member) throws Exception;

	public MemberDTO update_mypage(MemberDTO member) throws Exception;

	public MemberDTO update_pw(MemberDTO member, String old_password, HttpServletResponse response) throws Exception;

	public boolean withdrawal(MemberDTO member, HttpServletResponse response) throws Exception;

	public MemberDTO memberPoint(@RequestParam("userid")String userid);

	public ModelAndView addPoint(MemberDTO member);

	public ModelAndView memberList(HttpSession session, MemberDTO member);
	
	
	
}