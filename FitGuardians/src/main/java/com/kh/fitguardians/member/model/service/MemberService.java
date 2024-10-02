package com.kh.fitguardians.member.model.service;

import com.kh.fitguardians.member.model.vo.Member;

public interface MemberService {
	
	// 아이디 중복 확인
	public int checkId(String userId);
	
	// 이메일 인증 번호
	public int authEmail(String email);
	
	// 회원가입
	public int insertMember(Member m);
	
}
