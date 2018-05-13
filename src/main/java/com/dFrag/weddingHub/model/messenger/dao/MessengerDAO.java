package com.dFrag.weddingHub.model.messenger.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.dFrag.weddingHub.model.messanger.dto.MessengerDTO;

public interface MessengerDAO {

	public int messageSend(@RequestParam("msg_sender")String msg_sender, @ModelAttribute MessengerDTO ms);

	public List<MessengerDTO> messagelist(HttpSession session, @ModelAttribute MessengerDTO ms);

	public List<MessengerDTO> messageDetailView(String msg_title, @ModelAttribute MessengerDTO ms);

}
