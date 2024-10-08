package com.kh.fitguardians.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fitguardians.member.model.vo.BodyInfo;
import com.kh.fitguardians.member.model.vo.Member;
import com.kh.fitguardians.member.model.vo.MemberInfo;

@Repository
public class MemberDao {

	public int checkId(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.checkId", userId);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int selectUserNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectUserNo");
	}
	
	public int insertMemberInfo(SqlSessionTemplate sqlSession, MemberInfo info) {
		return sqlSession.insert("memberMapper.insertMemberInfo", info);
	}
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public ArrayList<Member> getTraineeList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("memberMapper.getTraineeList", userId);
	}

	public Member getTraineeDetails(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.getTraineeDetails", userId);
	}

	public ArrayList<BodyInfo> getTraineeBodyInfo(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("memberMapper.getTraineeBodyInfo", userId);
	}

	public MemberInfo getTraineeInfo(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.getTraineeInfo", userNo);
	}
	
	

}
