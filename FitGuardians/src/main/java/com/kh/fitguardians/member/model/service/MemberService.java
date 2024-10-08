package com.kh.fitguardians.member.model.service;

import java.util.ArrayList;

import com.kh.fitguardians.member.model.vo.BodyInfo;
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
	
	// 트레이너 - 멤버 구하기 + 정보 조회
	public ArrayList<Member> getTraineeList(String userId);
	
	// 회원 정보디테일 누적 조회
	public Member getTraineeDetails(String userId); 
	
	// 회원 신체정보 조회
	public ArrayList<BodyInfo> getTraineeBodyInfo(String userId);
	
	// 회원 추가정보 조회
	public MemberInfo getTraineeInfo(int userNo);
	
}
