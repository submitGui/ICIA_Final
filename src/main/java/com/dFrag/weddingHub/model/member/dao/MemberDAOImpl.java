package com.dFrag.weddingHub.model.member.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.dFrag.weddingHub.model.member.dto.MemberDTO;

@Repository // Spring에서 관리하는 dao bean으로 설정
public class MemberDAOImpl implements MemberDAO {

	@Inject // mybatis 실행을 위한 SqlSession 객체를 주입시킴
	SqlSession sqlSession;
	MemberDAO memberDao;

	// 회원 아이디 체크
	public int check_id(String userid) throws Exception {
		return sqlSession.selectOne("member.check_id", userid);
	}

	// 회원 이메일 체크
	public int check_email(String email) throws Exception {
		return sqlSession.selectOne("member.check_email", email);
	}

	// 회원 가입처리 프로세스
	@Transactional
	public int join_member(MemberDTO member) throws Exception {
		return sqlSession.insert("member.join_member", member);
	}

	// 기업회원 가입처리 프로세스
	@Transactional
	public int business_member(MemberDTO member) throws Exception {
		return sqlSession.insert("member.business_member", member);
	}

	// 회원 인증 메일 프로세스
	@Transactional
	public int approval_member(MemberDTO member) throws Exception {
		return sqlSession.update("member.approval_member", member);
	}

	// 로그인 시 DB에 아이디 조회 프로세스
	public MemberDTO search_id_from_db(String userid) throws Exception {
		return sqlSession.selectOne("member.search_id_from_db", userid);
	}

	// 로그인 체크
	@Override
	public boolean loginCheck(MemberDTO member) {
		String name = sqlSession.selectOne("member.login_member", member);
		// 조건식 ? true일 때의 값 : false일 때의 값
		// 아이디 값을 가져와서 저장되어 있으면 펄스, 없으면 트루.
		return (name == null) ? false : true;
	}

	// 로그인 시 접속일자 수정 프로세스
	@Transactional
	public int update_log(String userid) throws Exception {
		return sqlSession.update("member.update_log", userid);
	}

	// 회원 아이디 찾기 프로세스
	public String find_id(String email) throws Exception {
		return sqlSession.selectOne("member.find_id", email);
	}

	// 비밀번호 변경 프로세스
	@Transactional
	public int update_pw(MemberDTO member) throws Exception {
		return sqlSession.update("member.update_pw", member);
	}

	// 회원정보 수정 포르세스
	@Transactional
	public int update_mypage(MemberDTO member) throws Exception {
		return sqlSession.update("member.update_mypage", member);
	}

	// 관리자가 회원목록 열람시
	@Override
	public MemberDTO viewMember(String userid) {
		return sqlSession.selectOne("member.viewMember", userid);
	}

	// 회원탈퇴 프로세스
	@Transactional
	public int withdrawal(MemberDTO member) throws Exception {
		return sqlSession.delete("member.withdrawal", member);
	}

	@Override
	public MemberDTO memberPoint(String userid) {
		return sqlSession.selectOne("member.memberpoint", userid);
	}

	/* 이후로 회원 포인트 관리용 */
	
	// 관리자가 일반 회원 포인트 목록 조회
	@Override
	// 회원 목록
	public List<MemberDTO> memberList(HttpSession session, @ModelAttribute MemberDTO member) {
		return sqlSession.selectList("member.memberList", member);
	}

	// 회원에게 포인트 부여
	@Override
	public int addPoint(MemberDTO member) {
		return sqlSession.update("member.pointupdate", member);
	}

}