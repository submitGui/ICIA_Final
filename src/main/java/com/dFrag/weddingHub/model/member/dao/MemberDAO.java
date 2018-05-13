package com.dFrag.weddingHub.model.member.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dFrag.weddingHub.model.member.dto.MemberDTO;

public interface MemberDAO {

	// 회원 아이디 체크
	public int check_id(String userid) throws Exception;

	// 회원 이메일 체크
	public int check_email(String email) throws Exception;

	// 회원 가입처리 프로세스
	public int join_member(MemberDTO member) throws Exception;
	
	// 기업회원 가입처리 프로세스
	public int business_member(MemberDTO member) throws Exception;

	// 회원 인증 메일 프로세스
	public int approval_member(MemberDTO member) throws Exception;

	// 로그인 프로세스
	public MemberDTO search_id_from_db(String userid) throws Exception;

	// 로그인 체크
	public boolean loginCheck(MemberDTO member);

	// 로그인 시 접속일자 수정 프로세스
	public int update_log(String userid) throws Exception;

	// 회원 아이디 찾기 프로세스
	public String find_id(String email) throws Exception;

	// 비밀번호 변경 프로세스
	public int update_pw(MemberDTO member) throws Exception;

	// 회원정보 수정 포르세스
	public int update_mypage(MemberDTO member) throws Exception;

	// 관리자가 회원목록 열람시
	public MemberDTO viewMember(String userid) throws Exception;

	// 회원탈퇴 프로세스
	public int withdrawal(MemberDTO member) throws Exception;


	public MemberDTO memberPoint(String userid);

	public int addPoint(MemberDTO member);

	public List<MemberDTO> memberList(HttpSession session, MemberDTO member);
}
