package com.self.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.self.study.mapper.ChatMapper;
import com.self.study.vo.AlarmVO;
import com.self.study.vo.ChatVO;
import com.self.study.vo.chatRoomVo;

@Service
public class ChatService {
	
	@Autowired
	ChatMapper mapper;

	public chatRoomVo getChatRoom(chatRoomVo chatRoom) {
		return mapper.selectChatRoom(chatRoom);
	}

	public List<chatRoomVo> getChatRoomList(String id) {
		return mapper.selectChatList(id);
	}

	public int addChatRoom(chatRoomVo chatRoom) {
		return mapper.insertChatRoom(chatRoom);
	}

	public int addMessage(ChatVO chatVO) {
		return mapper.insertChat(chatVO);
	}

	public void addAlarm(AlarmVO alarmVO) {
		mapper.insertAlarm(alarmVO);
		
	}

	
	
}
