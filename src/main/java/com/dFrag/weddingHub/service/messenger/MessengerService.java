package com.dFrag.weddingHub.service.messenger;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.dFrag.weddingHub.model.messanger.dto.MessengerDTO;

public interface MessengerService {
	
	ModelAndView messageDetailView(String msg_title, MessengerDTO ms);

	ModelAndView messageSend(String msg_sender, MessengerDTO ms);

	ModelAndView messagelist(HttpSession session, MessengerDTO ms);

}
