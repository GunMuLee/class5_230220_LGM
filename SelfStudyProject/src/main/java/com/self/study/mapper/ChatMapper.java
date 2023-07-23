package com.self.study.mapper;

import java.util.List;

import com.self.study.vo.AlarmVO;
import com.self.study.vo.ChatVO;
import com.self.study.vo.chatRoomVo;

public interface ChatMapper {

	chatRoomVo selectChatRoom(chatRoomVo chatRoom);

	List<chatRoomVo> selectChatList(String id);

	int insertChatRoom(chatRoomVo chatRoom);

	int insertChat(ChatVO chatVO);

	void insertAlarm(AlarmVO alarmVO);

}
