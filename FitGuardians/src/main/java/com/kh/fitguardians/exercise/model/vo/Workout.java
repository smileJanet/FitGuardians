package com.kh.fitguardians.exercise.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Workout {

	// 트레이너 플랜
	
	private int exerciseNo;
	private int userNo;
	private String workoutDate;
	private String workoutCategory;
	private String difficulty;
	private String description;
	private String targetMuscle;
	private String tmImage;
	private int kcal;
	
	
}
