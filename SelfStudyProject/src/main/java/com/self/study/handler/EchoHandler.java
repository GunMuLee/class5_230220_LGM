package com.self.study.handler;

import java.net.http.WebSocket;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.self.study.service.ChatService;
import com.self.study.vo.AlarmVO;
import com.self.study.vo.ChatVO;

@Component
public class EchoHandler extends TextWebSocketHandler {

	@Autowired
	ChatService service;

	List<WebSocketSession> members = new ArrayList<WebSocketSession>();
	private final Map<String, List<WebSocketSession>> chatRoomId = new HashMap<String, List<WebSocketSession>>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		String url = session.getUri().getQuery();
		
		if (url != null) {
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
		} else {
			System.out.println("member 추가됨");
			members.add(session);
			System.out.println(members);
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println("member : " + members);
		
		String roomId = session.getUri().getQuery().split("=")[1];
		String receiver = session.getUri().getQuery().split("=")[2];
		
		
		String[] mes = message.getPayload().split(",");

		String type = mes[0];
		String sender = mes[1];
		String content = mes[2];
		String url = "chat?roomId=" + roomId;

		AlarmVO alarm = new AlarmVO(receiver, sender+"님의 새 메세지가 도착하였습니다.", url, 0);


		List<WebSocketSession> sessionList = chatRoomId.getOrDefault(roomId, new ArrayList<WebSocketSession>());


		for (WebSocketSession s : sessionList) {
			if (type.equals("message")) {
				
				System.out.println("message");
				
				int insertCount = service.addMessage(new ChatVO(roomId, sender, receiver, content));
				if (insertCount > 0) {
					if (sessionList.size() == 2) {
						s.sendMessage(new TextMessage(sender + "," + content));
					} else {
						s.sendMessage(new TextMessage(sender + "," + content));
						service.addAlarm(alarm);
						for (WebSocketSession member : members) {
							System.out.println("반복");
							String membername=(String)member.getAttributes().get("id");
							System.out.println(membername);
							
							if (membername.equals(receiver)) {
								member.sendMessage(new TextMessage(alarm.getContent()+","+url+"="+sender));
							}
						}
					}
				}
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		String url = session.getUri().getQuery();
		

		if (url == null) {
			members.remove(session);
		} else {
			String roomId = session.getUri().getQuery().split("=")[1];
			List<WebSocketSession> sessions = chatRoomId.getOrDefault(roomId, new ArrayList<WebSocketSession>());
			sessions.remove(session);
			chatRoomId.put(roomId, sessions);
		}

	}
}