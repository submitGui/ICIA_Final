package com.dFrag.weddingHub.model.messanger.dto;

import java.util.Date;

public class MessengerDTO {
	private Date msg_time;
	private String msg_sender;
	private String msg_recipient; 
	private String msg_title;
	private String msg_content;
	
	public Date getMsg_time() {
		return msg_time;
	}
	public void setMsg_time(Date msg_time) {
		this.msg_time = msg_time;
	}
	public String getMsg_sender() {
		return msg_sender;
	}
	public void setMsg_sender(String msg_sender) {
		this.msg_sender = msg_sender;
	}
	public String getMsg_recipient() {
		return msg_recipient;
	}
	public void setMsg_recipient(String msg_recipient) {
		this.msg_recipient = msg_recipient;
	}
	public String getMsg_title() {
		return msg_title;
	}
	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	
	@Override
	public String toString() {
		return "MessengerDTO [msg_time=" + msg_time + ", msg_sender=" + msg_sender + ", msg_recipient=" + msg_recipient
				+ ", msg_title=" + msg_title + ", msg_content=" + msg_content + "]";
	}



}
