package com.kh.fitguardians.member.model.service;

import com.kh.fitguardians.exercise.model.vo.TnWorkout;

public interface TraineeService {

	// 회원이 입력한 데이터 삽입 메소드
	int addTraineeExPlan(TnWorkout tn);
	
	
	
}
