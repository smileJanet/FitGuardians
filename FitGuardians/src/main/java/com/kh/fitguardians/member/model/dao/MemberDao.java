package com.kh.fitguardians.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fitguardians.common.model.vo.QrInfo;
import com.kh.fitguardians.member.model.vo.Member;

@Repository
public class MemberDao {

	public int checkId(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.checkId", userId);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
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

}
