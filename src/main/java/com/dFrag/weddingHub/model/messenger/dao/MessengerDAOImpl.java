package com.dFrag.weddingHub.model.messenger.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.dFrag.weddingHub.model.messanger.dto.MessengerDTO;

@Repository
public class MessengerDAOImpl implements MessengerDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int messageSend(@RequestParam("msg_sender")String msg_sender, @ModelAttribute MessengerDTO ms) {
		return sqlSession.insert("Messenger.messageinsert", ms);
	}
	
	@Override
	public List<MessengerDTO> messagelist(HttpSession session, @ModelAttribute MessengerDTO ms) {
		return sqlSession.selectList("Messenger.messagelist", ms);
	}

	@Override
	public List<MessengerDTO> messageDetailView(String msg_title, @ModelAttribute MessengerDTO ms) {
		System.out.println("메신저 DAO messageDetailView의 msg_title " + msg_title);
		return sqlSession.selectList("Messenger.messageDetailView" , msg_title);
	}

}
