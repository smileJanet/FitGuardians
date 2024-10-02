package com.kh.fitguardians.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.kh.fitguardians.member.model.dao.MemberDao;
import com.kh.fitguardians.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao mDao = new MemberDao();
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MailSender mailsender;
	
	@Override
	public int checkId(String userId) {
		return mDao.checkId(sqlSession, userId);
	}

	@Override
	public int authEmail(String email) {
		int randomCode = (int)(Math.random()* 90000) + 10000;
		 String messageText = "안녕하세요!\n\n"
                 + "이메일 인증을 위한 요청이 접수되었습니다. 아래의 인증번호를 입력하여 인증을 완료해 주세요.\n\n"
                 + "인증번호: " + randomCode + "\n\n"
                 + "감사합니다!";
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setSubject("FitGuardians 인증번호 메일입니다.");
		message.setText(messageText);
		
		mailsender.send(message);
		return randomCode;
	}
	
	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}

	

}
