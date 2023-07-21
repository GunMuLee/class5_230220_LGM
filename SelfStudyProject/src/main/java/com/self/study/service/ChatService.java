package com.self.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.self.study.mapper.ChatMapper;
import com.self.study.vo.chatRoomVo;

@Service
public class ChatService {
	
	@Autowired
	ChatMapper mapper;

	public chatRoomVo getChatRoom(chatRoomVo chatRoom) {
		return mapper.selectChatRoom(chatRoom);
	}

	public List<chatRoomVo> getChatRoomList(String id) {
		return mapper.selectChatRoom(id);
	}

	
	
}
