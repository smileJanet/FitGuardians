package com.kh.fitguardians.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.fitguardians.chat.model.vo.Message;
import com.kh.fitguardians.chat.model.vo.MessageParticipantDTO;
import com.kh.fitguardians.member.model.vo.Member;
import com.kh.fitguardians.chat.model.vo.MessageParticipantDTO;
import com.kh.fitguardians.member.model.vo.Member;

@Repository
public class ChatDao {
    
    // 메시지 전송
    public int sendMessage(SqlSessionTemplate session, Message message) {
	    int result = session.insert("ChatMapper.sendMessage", message);
	    return result;
    }

    // 특정 채팅방의 메시지 조회
    public ArrayList<Message> getMessages(SqlSessionTemplate session, int chNo, int senderNo, int receiverNo) {
        System.out.println("Received parameters - chNo: " + chNo + ", senderNo: " + senderNo + ", receiverNo: " + receiverNo);
        // SQL 쿼리를 사용하여 메시지를 조회
        Map<String, Object> params = new HashMap<>();
        params.put("chNo", chNo);
        params.put("senderNo", senderNo);
        params.put("receiverNo", receiverNo);
        
        // 메시지를 조회
        ArrayList<Message> messages = (ArrayList)session.selectList("ChatMapper.getMessages", params);

        // 쿼리 결과 로그 출력
        System.out.println("조회된 메시지: " + messages);
        
        return messages;
    }

    
    // 메시지 상태 업데이트 (추가 기능)
    public int updateMessageStatus(SqlSessionTemplate session, int msgNo, String status) {
        Map<String, Object> param = new HashMap<>();
        param.put("msgNo", msgNo);
        param.put("status", status);
        return session.update("ChatMapper.updateMessageStatus", param);
    }
}
