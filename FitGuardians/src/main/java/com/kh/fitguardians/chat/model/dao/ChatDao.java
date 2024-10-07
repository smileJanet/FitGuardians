package com.kh.fitguardians.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.fitguardians.chat.model.vo.Message;

@Repository
public class ChatDao {
    
    // 메시지 전송
    public int sendMessage(SqlSessionTemplate session, Message message) {
	    int result = session.insert("ChatMapper.sendMessage", message);
	    return result;
    }

    // 특정 채팅방의 메시지 조회
    public ArrayList<Message> getMessages(SqlSessionTemplate session, int chNo) {
        return (ArrayList)session.selectList("ChatMapper.getMessages", chNo);
    }
    
    // 메시지 상태 업데이트 (추가 기능)
    public int updateMessageStatus(SqlSessionTemplate session, int msgNo, String status) {
        Map<String, Object> param = new HashMap<>();
        param.put("msgNo", msgNo);
        param.put("status", status);
        return session.update("ChatMapper.updateMessageStatus", param);
    }
}
