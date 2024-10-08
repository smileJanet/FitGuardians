package com.kh.fitguardians.chat.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.kh.fitguardians.chat.model.service.ChatService;
import com.kh.fitguardians.chat.model.vo.Message;

@RestController
@RequestMapping("/chat")
@CrossOrigin(origins = "*") // 모든 출처에서 요청 허용
public class ChatController {

    @Autowired
    private ChatService chatService;

    // 메시지 전송
    @PostMapping("/send")
    public int sendMessage(@RequestBody Message message) {
    	
        // 메시지 전송
        int result = chatService.sendMessage(message);
        

        return result;
    }

    // 메시지 조회
    @GetMapping("/messages/{chNo}")
    public ArrayList<Message> getMessages(@PathVariable int chNo) {
        return chatService.getMessage(chNo);
    }

    // 메시지 상태 업데이트
    @PutMapping("/messages/{msgNo}/status")
    public int updateMessageStatus(@PathVariable int msgNo, @RequestParam String status) {
        return chatService.updateMessageStatus(msgNo, status);
    }
}
