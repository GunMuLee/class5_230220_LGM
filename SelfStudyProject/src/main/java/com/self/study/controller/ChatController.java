package com.self.study.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.self.study.service.ChatService;
import com.self.study.vo.chatRoomVo;

@Controller
public class ChatController {
	
	@Autowired
	ChatService service;
	
	
	@PostMapping("createRoom")
	@ResponseBody	
	public String createRoom(@RequestParam String id, HttpSession session) {
		
		chatRoomVo ChatRoom = new chatRoomVo();
		ChatRoom.setId_1((String)session.getAttribute("id"));
		ChatRoom.setId_2(id);
		
		chatRoomVo isChatroom = service.getChatRoom(ChatRoom);
		
		if(isChatroom != null) {
			return isChatroom.getRoom_id();
		}
		
		return UUID.randomUUID().toString().split("-")[0];
	}
	
	@GetMapping("chatList")
	public String chatList(HttpSession session, Model model) {
		
		List<chatRoomVo> RoomList = service.getChatRoomList((String)session.getAttribute("id"));
		
		model.addAttribute("RoomList",RoomList);
		
		return "websoket/chatList";
	}
	
	
    @GetMapping("chat")
    public String chat() {
    	
    	return "websoket/chat";
    }

}
