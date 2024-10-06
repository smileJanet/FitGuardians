package com.kh.fitguardians.exercise.model.vo;

import java.util.ArrayList;

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
public class ExerciseInfo {
	
	private Schedule schedule;
    private ArrayList<ExerciseDetails> exercise;
	
	
}
