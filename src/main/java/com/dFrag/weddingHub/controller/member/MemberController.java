package com.dFrag.weddingHub.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dFrag.weddingHub.model.member.dao.MemberDAO;
import com.dFrag.weddingHub.model.member.dto.MemberDTO;
import com.dFrag.weddingHub.service.member.MemberService;

@Controller //컨트롤러 빈으로 등록
@RequestMapping("member/*") //공통적인 url 매핑
public class MemberController {
 
	//로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//의존관계 주입
	@Inject
	MemberService memberService;
	MemberDAO memberDao;
	SqlSessionTemplate sqlSession;
	
	private ModelAndView mav;
	
	// 고객지원 페이지 이동
	@RequestMapping(value = "/supportView.do")
	public String supportView() throws Exception{
		return "support/supportView";
	}
	
	// 회원 가입 폼 이동
	@RequestMapping(value = "/memberJoinForm.do")
	public String memberJoinForm() throws Exception{
		return "member/memberJoinForm";
	}
	// 회원 가입 폼 이동
	@RequestMapping(value = "/businessJoinForm.do")
	public String businessJoinForm() throws Exception{
		return "member/businessJoinForm";
	}
	
	// 회원가입 아이디 중복처리(AJAX)
	@RequestMapping(value = "/check_id.do", method = RequestMethod.POST)
	public void check_id(@RequestParam("userid") String userid, HttpServletResponse response) throws Exception{
		memberService.check_id(userid, response);
	}
	
	// 회원가입 이메일 중복처리(AJAX)
	@RequestMapping(value = "/check_email.do", method = RequestMethod.POST)
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
		memberService.check_email(email, response);
	}
	
	// 클라이언트회원가입 프로세스
	@RequestMapping(value = "/join_member.do", method = RequestMethod.POST)
	public String join_member(@ModelAttribute MemberDTO member, RedirectAttributes rttr, HttpServletResponse response) throws Exception{
		rttr.addFlashAttribute("result", memberService.join_member(member, response));
		// 가입 완료후 메인으로 이동
		return "index";
	}
	// 기업회원가입 프로세스
	@RequestMapping(value = "/business_member.do", method = RequestMethod.POST)
	public String business_member(@ModelAttribute MemberDTO member, RedirectAttributes rttr, HttpServletResponse response) throws Exception{
		rttr.addFlashAttribute("result", memberService.business_member(member, response));
		// 가입 완료후 메인으로 이동
		return "index";
	}
	
	//주소검색
	@RequestMapping("/address.do")
	public String address() {
		return "member/join";
	}
	
	// 회원 이메일 인증 발송
	@RequestMapping(value = "/approval_member.do", method = RequestMethod.POST)
	public void approval_member(@ModelAttribute MemberDTO member, HttpServletResponse response) throws Exception{
		memberService.approval_member(member, response);
	}
	
	// 로그인 폼 이동
	@RequestMapping("/login_form.do") //세부적인 url 매핑
	public String login_form() throws Exception {
		return "/member/loginForm"; // loginForm.jsp로 이동
	}
	
	// 로그인 요청 처리 프로세스
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO member, HttpSession session, HttpServletResponse response) throws Exception{
		member = memberService.login(member, response);
		//메뉴 - 일반 사용자 인식용 세션변수
		session.setAttribute("member", member);
		session.setAttribute("userid", member.getUserid());
		session.setAttribute("name", member.getName());
		session.setAttribute("member_type", member.getMember_type());
		session.setAttribute("member_point", member.getMember_point());
		return "index";
	}
	
	// 로그인 여부 체크 프로세스. 
	@RequestMapping("/login_check.do")
	public ModelAndView login_check(MemberDTO member, HttpSession session, ModelAndView mav) throws Exception {
		//로그인 성공 true, 실패 false
		boolean result = memberService.loginCheck(member, session);
		if(result) { //로그인 성공
			mav.setViewName("index"); //뷰의 이름
		}else { //로그인 실패
			mav.setViewName("member/loginForm");
			//뷰에 전달할 값
			mav.addObject("message", "error");
		}
		return mav;
	}
	
	// 로그아웃 프로세스
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		//세션 초기화 시키는 서비스로 연결
		memberService.logout(session);
		// 로그인 페이지로 이동
		mav.setViewName("index");
		mav.addObject("message","logout");
		return mav;
	}
	
	// 회원 아이디 찾기 페이지로 이동
	@RequestMapping(value = "/find_id_form.do")
	public String find_id_form() throws Exception{
		return "/member/find_id_form";
	}
	
	// 회원 아이디 찾기 프로세스
	@RequestMapping(value = "/find_id.do", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception{
		md.addAttribute("id", memberService.find_id(response, email));
		return "/member/find_id";
	}

	// 회원 비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "/find_pw_form.do")
	public String find_pw_form() throws Exception{
		return "/member/find_pw_form";
	}
	
	// 회원 비밀번호 찾기 프로세스
	@RequestMapping(value = "/find_pw.do", method = RequestMethod.POST)
	public String find_pw(@ModelAttribute MemberDTO member, HttpServletResponse response) throws Exception{
		memberService.find_pw(response, member);
		return "redirect:/member/loginForm";
	}

	// 마이페이지로 이동
	@RequestMapping(value = "/mypage.do")
	public String mypage() throws Exception{
		return "/member/mypage";
	}
	
	// 마이페이지에서 데이터 갱신 프로세스
	@RequestMapping(value = "/update_mypage.do", method = RequestMethod.POST)
	public String update_mypage(@ModelAttribute MemberDTO member, HttpSession session, RedirectAttributes rttr) throws Exception{
		session.setAttribute("member", memberService.update_mypage(member));
		rttr.addFlashAttribute("msg", "회원정보 수정 완료");
		return "redirect:/member/mypage.do";
	}
	
	// 마이페이지에서 회원 비밀번호 갱신 프로세스
	@RequestMapping(value = "/update_pw.do", method = RequestMethod.POST)
	public String update_pw(@ModelAttribute MemberDTO member, @RequestParam("old_pw") String old_password, HttpSession session, HttpServletResponse response, RedirectAttributes rttr) throws Exception{
		session.setAttribute("member", memberService.update_pw(member, old_password, response));
		rttr.addFlashAttribute("msg", "비밀번호 갱신 완료");
		return "redirect:/member/mypage.do";
	}
	
	// 회원 탈퇴 프로세스
	@RequestMapping(value = "/withdrawal.do", method = RequestMethod.POST)
	public String withdrawal_form(@ModelAttribute MemberDTO member, HttpSession session, HttpServletResponse response) throws Exception{
		if(memberService.withdrawal(member, response)) {
			//회원 탈퇴가 종료되면 현재 세션값을 날림
			session.invalidate();
		}
		return "index";
	}
	
	/* 이후 포인트 관리 관련 */
	
	//회원 포인트 조회목록(admin 접속인경우)
		@RequestMapping(value = "/memberList", method = RequestMethod.GET)
		public ModelAndView memberList(HttpSession session,@ModelAttribute MemberDTO member) {
			//혹시라도 관리자가 아닐경우 차단하는 과정
			 member = (MemberDTO) session.getAttribute("login_member");
			if(member == null || !member.getUserid().equals("admin")) {
				mav = new ModelAndView();
				mav.setViewName("/member/login_form.do");
			}
			//관리자가 정상적으로 접속한 경우
			mav = memberService.memberList(session,  member);

			return mav;
		}
	
	// 포인트 조회 폼 이동
	@RequestMapping(value = "/pointPageForm.do")
	public String pointPageForm() throws Exception{
		return "member/pointPageForm";
	}
	
	//회원포인트 주기
		@RequestMapping(value="/addPoint" , method = RequestMethod.POST)
		public ModelAndView addPoint(MemberDTO member) {
			mav = memberService.addPoint(member);
			return mav;
		}
		//회원포인트 페이지 이동
		@RequestMapping(value="/pointPage" , method= RequestMethod.GET)
		public String pointpage(@RequestParam("userid")String userid) {
			MemberDTO member = new MemberDTO();
			member.setUserid(userid);
			mav = new ModelAndView();
			mav.addObject(userid);
			mav.setViewName("/member/pointPageForm.do");
			return "member/pointPageForm";
		}

		/*여기서부터 이용안내 관련*/
		@RequestMapping(value="/locationView.do", method= RequestMethod.GET)
		public String locationView() {
			return "location/locationView";
		}
}