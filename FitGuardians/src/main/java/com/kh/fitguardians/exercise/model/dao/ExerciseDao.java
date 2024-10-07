package com.kh.fitguardians.exercise.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fitguardians.exercise.model.vo.Workout;


@Repository
public class ExerciseDao {

	public int addExercise(SqlSessionTemplate sqlSession, Workout workout) {
		return sqlSession.insert("exerciseMapper.addSchedule", workout);
	}

}
