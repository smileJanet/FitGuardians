package com.kh.fitguardians.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fitguardians.exercise.model.vo.TnWorkout;

@Repository
public class TraineeDao {

	public int addTraineeExPlan(SqlSessionTemplate sqlSession, TnWorkout tn) {
		return sqlSession.insert("memberMapper.addTraineeExPlan", tn);
	}

}
