package com.kh.fitguardians.exercise.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitguardians.exercise.model.dao.ExerciseDao;
import com.kh.fitguardians.exercise.model.vo.Workout;


@Service
public class ExerciseServiceImpl {

	@Autowired
	private ExerciseDao eDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int addExercise(Workout workout) {
		
		return eDao.addExercise(sqlSession, workout);
	}
	
}
