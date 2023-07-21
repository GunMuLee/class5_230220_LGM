package com.self.study.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class EchoHandler extends TextWebSocketHandler{


	private final Map<String, List<WebSocketSession>> chatRoomId = new HashMap<String, List<WebSocketSession>>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		String roomId = session.getUri().getQuery().split("=")[1];
		List<WebSocketSession> sessions = chatRoomId.getOrDefault(roomId, new ArrayList<WebSocketSession>());
		
        if (sessions.size() >= 2) {
            // 두 개 이상의 세션이 존재하면 클라이언트에게 메시지 보내기
            String message = "잘못된 접근입니다.";
            session.sendMessage(new TextMessage(message));
            session.close(CloseStatus.NORMAL.withReason("잘못된 접근입니다."));
            return;
        }
        
        sessions.add(session);
		chatRoomId.put(roomId, sessions);
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String roomId = session.getUri().getQuery().split("=")[1];
		
		List<WebSocketSession> sessionList = chatRoomId.getOrDefault(roomId, new ArrayList<WebSocketSession>());
		
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		String roomId = session.getUri().getQuery().split("=")[1];
		
		List<WebSocketSession> sessions = chatRoomId.getOrDefault(roomId, new ArrayList<WebSocketSession>());
		sessions.remove(session);
		chatRoomId.put(roomId, sessions);

		
	}
}