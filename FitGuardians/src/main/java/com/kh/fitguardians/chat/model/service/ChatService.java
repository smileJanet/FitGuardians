package com.kh.fitguardians.chat.model.service;

import java.util.ArrayList;

import com.kh.fitguardians.chat.model.vo.Message;

public interface ChatService {
	
	// 메시지 전송
	int sendMessage(Message message);
	
	// 특정 채팅방의 메시지 조회
	ArrayList<Message> getMessage(int chNo);
	
	// 읽었는지 여부 확인
	int updateMessageStatus(int msgNo, String status);


}
