package com.dFrag.weddingHub.controller.messenger;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.dFrag.weddingHub.model.messanger.dto.MessengerDTO;
import com.dFrag.weddingHub.service.messenger.MessengerService;

@Controller // 컨트롤러 빈으로 등록
@SessionAttributes("loginid")
@RequestMapping("messenger/*") // 공통적인 url 매핑
public class MessengerController {

	@Autowired
	private MessengerService msm;
	private MessengerDTO ms;
	private ModelAndView mav;

	// 메세지 리스트 호출
	@RequestMapping(value = "/messagelist", method = RequestMethod.GET)
	public ModelAndView messageList(HttpSession session, @ModelAttribute MessengerDTO ms) {
		// 세션의 아이디를 변수에 담음.
		String savedId = (String) session.getAttribute("userid");
		if (ms == null) {
			System.out.println("MessengerCtrl value null.");
		} else {
			ms.setMsg_recipient(savedId);
			System.out.println(ms + " = MessengerCtrl received userid");
			// 받아온 아이디 값을 messenger dto의 msg_recipient로 설정
			// 메신저서비스의 메세지 리스트기능으로 유저 아이디를 매개변수로 보냄.
			mav = msm.messagelist(session, ms);
		}
		return mav;
	}

	// 메세지 새로 작성
	@RequestMapping(value = "/writeNewMessage", method = RequestMethod.GET)
	public String writeNewMessage() {
		// 이동될 View페이지 주소 값
		return "messages/writeNewMessageForm";
	}

	// 메세지 보내기
	@RequestMapping(value = "/messageSend", method = RequestMethod.POST)
	public ModelAndView message(@RequestParam("msg_sender") String msg_sender, MessengerDTO ms) {
		mav = msm.messageSend(msg_sender, ms);
		return mav;
	}

	// 메세지 상세보기
	@RequestMapping(value = "/messageDetailView", method = RequestMethod.GET)
	public ModelAndView messageDetail(@RequestParam("msg_title") String msg_title, MessengerDTO ms) {
		System.out.println("MessengerController-messageDetailView's msg_title" + msg_title);
		mav = msm.messageDetailView(msg_title, ms);
		return mav;
	}

	// 메세지 답장시 받는 사람 설정
	@RequestMapping(value = "/msgReply", method = RequestMethod.POST)
	public String msgReply(HttpSession session, @RequestParam("msg_recipient") String msg_recipient, @RequestParam("msg_sender") String msg_sender) {
		MessengerDTO ms = new MessengerDTO();
		// 보냈던사람 -> 받는 사람
		ms.setMsg_recipient(msg_sender);
		// 받은 사람 -> 보내는 사람
		ms.setMsg_sender(msg_recipient);
		System.out.println("MessengerController-msgReply's 받을 사람 설정됨 : " + ms.getMsg_recipient());
		System.out.println("MessengerController-msgReply's 보내는 사람 설정됨 : " + ms.getMsg_sender());
		// 이동될 View페이지 주소 값
		return "messages/messageReply";
	}
}