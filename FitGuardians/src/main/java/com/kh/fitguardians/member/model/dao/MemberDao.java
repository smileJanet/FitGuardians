package com.kh.fitguardians.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fitguardians.common.model.vo.QrInfo;
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

	public int insertQrInfo(SqlSessionTemplate sqlSession, QrInfo qr) {
		return sqlSession.insert("memberMapper.insertQrInfo", qr);
	}

	public QrInfo qrCheck(SqlSessionTemplate sqlSession, QrInfo qr) {
		return sqlSession.selectOne("memberMapper.qrCheck", qr);
	}

	public int updateAttendance(SqlSessionTemplate sqlSession, QrInfo qr) {
		return sqlSession.update("memberMapper.updateAttendance", qr);
	}

	public int updateAttStatus(SqlSessionTemplate sqlSession, QrInfo qrResult) {
		return sqlSession.update("memberMapper.updateAttStatus", qrResult);
	}

	public MemberInfo selectMemberInfo(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.selectMemberInfo", userNo);
	}

	public int updateDisease(SqlSessionTemplate sqlSession, MemberInfo mInfo) {
		return sqlSession.update("memberMapper.updateDisease", mInfo);
	}

	public int memberPwdCheck(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.memberPwdCheck", m);
	}

	public int updateMemberPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMemberPwd", m);
	}

	public int updateMemberEmail(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMemberEmail", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapper.deleteMember", userNo);
	}

}
