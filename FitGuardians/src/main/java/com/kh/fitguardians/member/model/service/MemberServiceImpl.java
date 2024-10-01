package com.kh.fitguardians.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitguardians.member.model.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao mDao = new MemberDao();
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int checkId(String userId) {
		return mDao.checkId(sqlSession, userId);
	}

}
