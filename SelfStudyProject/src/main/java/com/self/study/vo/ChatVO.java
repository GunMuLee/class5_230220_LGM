package com.self.study.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatVO {
	String roomId;
	String sender;
	String receiver;
	String content;	
}
