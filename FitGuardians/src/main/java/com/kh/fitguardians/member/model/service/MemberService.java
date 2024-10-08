package com.kh.fitguardians.member.model.service;

import com.kh.fitguardians.member.model.vo.Member;
import com.kh.fitguardians.member.model.vo.MemberInfo;

public interface MemberService {
	
	// 아이디 중복 확인
	public int checkId(String userId);
	
	// 이메일 인증 번호
	public int authEmail(String email);
	
	// 회원가입
	public int insertMember(Member m);
	
	// 회원가입(추가정보포함)
	public int insertMemberWithInfo(Member m, MemberInfo info);
	
	// 로그인
	public Member loginMember(Member m);
}
