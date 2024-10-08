package com.kh.fitguardians.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
