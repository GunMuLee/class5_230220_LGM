package com.self.study.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@ServerEndpoint(value="/chatRoom/{roomId}")
public class WebSocketChat {
	

	private static final Map<String, List<Session>> chatRooms = new HashMap<>();
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
	
	public WebSocketChat() {
		System.out.println("웹소켓(서버) 객체 생성");
	}
	
	@OnOpen
	public void onOpen(Session session, @PathParam(value = "roomId") String roomId) {
	    logger.info("오픈 세션 아이디" + session.getId());
	    
	    System.out.println(roomId);

	    try {
	        final Basic basic = session.getBasicRemote();
	        basic.sendText("대화방에 연결 되었습니다."); // 새로 연결된 클라이언트에게 연결 성공 메시지를 보냅니다.
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    List<Session> chatRoomSessions = chatRooms.getOrDefault(roomId, new ArrayList<>());
	    chatRoomSessions.add(session);
	    chatRooms.put(roomId, chatRoomSessions);
	}

	private void sendAllSessionToMessage(Session self, String sender, String message, String roomId) {
	    
	    System.out.println(roomId);
	    
	    System.out.println(chatRooms);
	    
	    
	    try {
	        List<Session> chatRoomSessions = chatRooms.getOrDefault(roomId, new ArrayList<>());
	        
	        
	        for (Session session : chatRoomSessions) {
	            if (!self.getId().equals(session.getId())) {
	            	System.out.println(session.getId());
	                session.getBasicRemote().sendText(sender + " : " + message); // 현재 클라이언트가 속한 채팅방에 있는 세션들에게만 메시지 전송
	            }
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}


	@OnMessage
	public void onmessage(String message, Session session) {
	    String[] parts = message.split(","); // 메시지를 쉼표(,)로 분리하여 배열로 저장
	    String roomId = parts[2]; // 배열에서 roomId를 추출
	    String sender = parts[1]; // 배열에서 발신자 정보를 추출
	    String messageContent = parts[0]; // 배열에서 실제 메시지 내용을 추출

	    logger.info("Message From " + sender + ": " + messageContent); // 서버 콘솔에 수신된 메시지와 발신자를 로그로 출력합니다.
	    
	    
	    sendAllSessionToMessage(session, sender, messageContent, roomId); // 수신된 메시지를 현재 채팅방에 속한 클라이언트들에게 전송합니다. (단, 자신 제외)

	    try {
	        final Basic basic = session.getBasicRemote();
	        basic.sendText("<나> : " + messageContent); // 자신에게도 전달된 메시지를 보냅니다.
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}


	@OnError
	public void onError(Throwable e, Session session) {
	    // WebSocket 통신 중 에러가 발생하면 이 메서드가 호출됩니다.
	}

	@OnClose
	public void onClose(Session session, @PathParam("roomId") String roomId) {
	    logger.info("Session" + session.getId() + " has ended"); // 세션이 종료되면 해당 세션의 아이디를 로그로 출력합니다.
	    
	    List<Session> chatRoomSessions = chatRooms.getOrDefault(roomId, new ArrayList<>());
	    chatRoomSessions.remove(session);
	    chatRooms.put(roomId, chatRoomSessions); // 종료된 세션을 세션 리스트에서 제거합니다.
	}


	
    @PostMapping("createChatRoom")
    @ResponseBody
    public String createChatRoom() {
        String roomId = UUID.randomUUID().toString(); // 랜덤 UUID 생성
        return roomId;
    }
    
	
}

























