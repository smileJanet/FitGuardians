package com.kh.fitguardians.member.model.service;

import com.kh.fitguardians.common.model.vo.QrInfo;
import com.kh.fitguardians.member.model.vo.Member;

public interface MemberService {
	
	// 아이디 중복 확인
	public int checkId(String userId);
	
	// 이메일 인증 번호
	public int authEmail(String email);
	
	// 회원가입
	public int insertMember(Member m);
	// qr정보 insert
	public int insertQrInfo(QrInfo qr);
	
	// 로그인
	public Member loginMember(Member m);
	
	// 출첵 qr체크
	public QrInfo qrCheck(QrInfo qr);
	
	public int updateAttendance(QrInfo qr);
	
	public int updateAttStatus(QrInfo qr);
	
}
