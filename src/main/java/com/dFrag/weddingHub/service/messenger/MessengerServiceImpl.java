package com.dFrag.weddingHub.service.messenger;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dFrag.weddingHub.model.member.dto.MemberDTO;
import com.dFrag.weddingHub.model.messanger.dto.MessengerDTO;
import com.dFrag.weddingHub.model.messenger.dao.MessengerDAO;

@Service
public class MessengerServiceImpl implements MessengerService {
	
	@Autowired
	MessengerDAO msDao;
	SqlSessionTemplate sqlSession;
	MessengerDTO ms;
	MemberDTO mDto;
	ModelAndView mav;

	
	@Override
	public ModelAndView messageSend(@RequestParam("msg_sender")String msg_sender, MessengerDTO ms) {
		mav = new ModelAndView();
		
		//메세지 보내기 성공
		int result = msDao.messageSend(msg_sender, ms);
		if(result == 0) {
		}
		System.out.println("메세지 전송 성공!");
		//전송 성공시 메인페이지로 이동
		mav.setViewName("index");
		return mav;
	}

	@Override
	public ModelAndView messagelist(HttpSession session, @ModelAttribute MessengerDTO ms) {
		mav = new ModelAndView();
		//현재 유저의 아이디를 저장하고, 이를 매개로 조회함
		List<MessengerDTO> Messagelist = msDao.messagelist(session, ms);
		System.out.println(Messagelist + "MessengerService's MessageList");
		mav.addObject("MessageList", Messagelist);
		mav.setViewName("/messages/MessageList");
		return mav;
	}
	
	@Override
	public ModelAndView messageDetailView(String msg_title, MessengerDTO ms) {
		mav = new ModelAndView();
		System.out.println("메신저 디테일 서비스의 msg_title : " + msg_title);
		List<MessengerDTO> Messagedetail = msDao.messageDetailView(msg_title ,ms);
		mav.addObject("Messagedetail", Messagedetail);
		System.out.println("메신저 디테일 서비스의 Messagedetail : " + Messagedetail);
		mav.setViewName("/messages/messageDetailView");
		
		return mav;
	}

}
