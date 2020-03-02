package com.dFrag.weddingHub.service.member;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dFrag.weddingHub.model.member.dao.MemberDAO;
import com.dFrag.weddingHub.model.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberDao;
	ModelAndView mav;
	SqlSessionTemplate sqlSession;
	
	// 로그인 프로세스
		@Override
		public MemberDTO login(MemberDTO member, HttpServletResponse response) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			// 등록된 아이디가 없을 경우 (memberMapper의 login. 즉, 아이디값만 DB조회)
			if(memberDao.check_id(member.getUserid()) == 0) {
				out.println("<script>");
				out.println("alert('등록되지 않은 아이디입니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			} else {
				// 입력받은 아이디가 회원 DB에 있을 경우, 로그인 폼에서 받은 비밀번호를 대조용으로 변수에 저장
				String pwd = member.getPassword();
				// 로그인 폼에서 입력받은 아이디를 매개로 DB에 쿼리하여 MEMBER 테이블에서 해당 유저의 데이터를 가져옴
				member = memberDao.search_id_from_db(member.getUserid());
				// 비밀번호가 틀릴 경우 ('유저가 입력한 비밀번호 값'과 '유저가 입력한 아이디로 조회한 DB의 비밀번호 값 '대조) 
				if(!member.getPassword().equals(pwd)) {
					out.println("<script>");
					out.println("alert('비밀번호가 틀립니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
					return null;
				// 이메일 인증이 완료되지 않은 채로 로그인을 시도할 경우
				}else if(!member.getApproval_status().equals("true")) {
					out.println("<script>");
					out.println("alert('이메일 인증이 완료되지 않았습니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
					return null;
		        // 모든 조건을 통과시 최근 로그인 일시를 기록			
				}else {
					memberDao.update_log(member.getUserid());
					return member;
				}
			}
		}
		
	// 로그아웃 (document.referrer는 단순히 이전 url로 되돌아가는 기능.)
	@Override
	public void logout(HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href=document.referrer;");
		out.println("</script>");
		out.close();
	}
	
	@Override
	public boolean loginCheck(MemberDTO member, HttpSession session) throws Exception {
		boolean result = memberDao.loginCheck(member);
		if(result) { //로그인 성공
			//세션변수에 값 저장
			MemberDTO member2 = viewMember(member.getUserid());
			//setAttribute(변수명,값)
			session.setAttribute("userid", member.getUserid());
			session.setAttribute("name", member2.getName());
			System.out.println(session.getAttribute("userid"));
			System.out.println(session.getAttribute("name"));
		} 
		return result;
	}
	@Override
	public void logout(HttpSession session) {
		//세션 초기화 (정확히는 세션에 저장된 attribute들을 삭제한다.)
		session.invalidate();
	}
	@Override
	public MemberDTO viewMember(String userid) throws Exception {
		return memberDao.viewMember(userid); 
	}
	// 회원가입 아이디 중복 체크(AJAX)
	@Override
	public void check_id(String userid, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(memberDao.check_id(userid));
		out.close();
	}
	// 회원가입 이메일 중복 체크(AJAX)
	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(memberDao.check_email(email));
		out.close();
	}
	// 회원가입 프로세스
	@Override
	public int join_member(MemberDTO member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (memberDao.check_id(member.getUserid()) == 1) {
			out.println("<script>");
			out.println("alert('입력하신 아이디는 이미 사용중입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else if (memberDao.check_email(member.getEmail()) == 1) {
			out.println("<script>");
			out.println("alert('입력하신 이메일 주소는 이미 사용중입니다');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else {
			//인증키 생성
			member.setApproval_key(create_key());
			memberDao.join_member(member);
			//인증키가 포함된 메일을 요청자에게 전송
			send_mail(member, "join");
			return 1;
		}
	}
	
	// 기업회원가입 프로세스
	@Override
	public int business_member(MemberDTO member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (memberDao.check_id(member.getUserid()) == 1) {
			out.println("<script>");
			out.println("alert('입력하신 아이디는 이미 사용중입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else if (memberDao.check_email(member.getEmail()) == 1) {
			out.println("<script>");
			out.println("alert('입력하신 이메일 주소는 이미 사용중입니다');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else {
			//인증키 생성
			member.setApproval_key(create_key());
			memberDao.business_member(member);
			//인증키가 포함된 메일을 요청자에게 전송
			send_mail(member, "join");
			return 1;
		}
	}
	// 인증 번호 무작위 생성
	@Override
	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();
		// 생성 자릿수 설정
		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}
	// 이메일 발송
	@Override
	public void send_mail(MemberDTO member, String div) throws Exception {
		// Mail Server 설정
		String charSet = "UTF-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "ID";            // 개인정보 포함!! 배포전 삭제 필수 !!
		String hostSMTPpwd = "PASSWORD";

		// 발신인 메일주소, 발신인 이름, 메일제목, 메일내용
		String fromEmail = "ID@naver.com";
		String fromName = "WeddingHub 관리자";
		String subject = "";
		String msg = "";

		if(div.equals("join")) {
		// 회원가입시 메일내용
			subject = "WeddingHub에서 당신을 환영합니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getUserid() + "님의 회원가입을 환영합니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "회원가입을 위한 이메일 인증 절차를 진행하시려면, 아래의 '인증' 버튼을 눌러주세요.</div><br/>";
			msg += "<form method='post' action='http://localhost:81/member/approval_member.do'>";     // 포트번호 설정 유의!!
			msg += "<input type='hidden' name='email' value='" + member.getEmail() + "'>";
			msg += "<input type='hidden' name='approval_key' value='" + member.getApproval_key() + "'>";
			msg += "<input type='submit' value='인증'></form><br/></div>";
		}else if(div.equals("find_pw")) {
			subject = "WeddingHub에서 요청하신 계정 암호찾기 안내입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getUserid() + "님께서 요청하신 비밀번호 찾기입니다.</h3>";
			msg += "<p>회원님의 비밀번호는 : ";
			msg += member.getPassword() + "</p></div>";
			}
		
		// 받는 사람 E-Mail 주소
		String mail = member.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}

	}
	
	
	// 회원 아이디 찾기
	@Override
	public String find_id(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String userid = memberDao.find_id(email);
				
		if (userid == null) {
			out.println("<script>");
			out.println("alert('일치하는 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return userid;
		}
	}
	// 비밀번호 찾기
	@Override
	public void find_pw(HttpServletResponse response, MemberDTO member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 아이디가 DB에 존재하지 않는 경우
		if(memberDao.check_id(member.getUserid()) == 0) {
			out.print("일치하는 아이디가 없습니다.");
			out.close();
		}
		// 아이디는 있지만 DB에 등록된 해당 회원의 이메일 주소가 아닌 경우
		else if(!member.getEmail().equals(memberDao.search_id_from_db(member.getUserid()).getEmail())) {
			out.print("회원정보와 이메일 주소가 일치하지 않습니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String password = "";
			// 임시 비밀번호 자릿수 설정 (문자열 번호)
			for (int i = 0; i < 12; i++) {
				password += (char) ((Math.random() * 26) + 97);
			}
			member.setPassword(password);
			// 생성된 비밀번호를 요청한 회원의 비밀번호로 설정
			memberDao.update_pw(member);
			// 생성된 비밀번호를 회원의 이메일로 전송
			send_mail(member, "find_pw");
			
			out.print("입력하신 이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
	// 마이페이지 수정
	@Override
	public MemberDTO update_mypage(MemberDTO member) throws Exception {
		memberDao.update_mypage(member);
		return memberDao.search_id_from_db(member.getUserid());
	}
	// 마이페이지에서 비밀번호 변경
	@Override
	public MemberDTO update_pw(MemberDTO member, String old_password, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//현재 비밀번호를 재확인하여 일치여부를 확인
		if(!old_password.equals(memberDao.search_id_from_db(member.getUserid()).getPassword())) {
			out.println("<script>");
			out.println("alert('현재 비밀번호가 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else {
			//비밀번호를 새 비밀번호로 변경
			memberDao.update_pw(member);
			return memberDao.search_id_from_db(member.getUserid());
		}
	}
	// 회원 탈퇴
	@Override
	public boolean withdrawal(MemberDTO member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(memberDao.withdrawal(member) != 1) {
			out.println("<script>");
			out.println("alert('회원 탈퇴가 진행되지 않았습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return false;
		}else {
			return true;
		}
	}

	// 회원 인증
	@Override
	public void approval_member(MemberDTO member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (memberDao.approval_member(member) == 0) { // 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("location.href='http://localhost/weddingHub/'");
			out.println("</script>");
			out.close();
		}
	}
	
	@Override
	public MemberDTO memberPoint(@RequestParam("userid")String userid) {
		return memberDao.memberPoint(userid);
	}
	
	/* 이후로 회원 포인트 조회 목록 관련 */
	
	// 관리자용 일반 회원 포인트 조회 목록 메소드
	@Override
	public ModelAndView memberList(HttpSession session, @ModelAttribute MemberDTO member) {
		mav = new ModelAndView();
		// memberList는 member 테이블을 전체 조회한 결과
		List<MemberDTO> memberList = memberDao.memberList(session,  member);
		System.out.println(memberList + "memberDao's memberList");
		mav.addObject("member_list", memberList);
		mav.setViewName("/member/showMemberList");
		return mav;
	}
	

	@Override
	public ModelAndView addPoint(@ModelAttribute MemberDTO member) {
		mav = new ModelAndView();
		int result = memberDao.addPoint(member);
		if (result == 0) {
		}
		mav.setViewName("index");
		return mav;
	}
}
