package com.self.study.mapper;

import java.util.List;

import com.self.study.vo.chatRoomVo;

public interface ChatMapper {

	chatRoomVo selectChatRoom(chatRoomVo chatRoom);

	List<chatRoomVo> selectChatRoom(String id);

}
