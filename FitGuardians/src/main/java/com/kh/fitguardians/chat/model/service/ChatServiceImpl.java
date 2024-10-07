package com.kh.fitguardians.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitguardians.chat.model.dao.ChatDao;
import com.kh.fitguardians.chat.model.vo.Message;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao chatDao;
	
	// 메시지 전송
	@Override
	public int sendMessage(Message message) {
		if (message.getMsgStatus() == null) {
	        message.setMsgStatus("U"); // 기본값 설정
	    }
	    int result = chatDao.sendMessage(sqlSession, message);
	    
	    return result;
	}

	@Override
	public ArrayList<Message> getMessage(int chNo) {
		
		return chatDao.getMessages(sqlSession, chNo);
	}

	@Override
	public int updateMessageStatus(int msgNo, String status) {
		
		return chatDao.updateMessageStatus(sqlSession, msgNo, status);
	}

}
