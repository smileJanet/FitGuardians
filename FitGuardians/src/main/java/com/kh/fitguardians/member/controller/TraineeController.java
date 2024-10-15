package com.kh.fitguardians.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.fitguardians.exercise.model.vo.TnWorkout;
import com.kh.fitguardians.member.model.service.TraineeServiceImpl;

@Controller
public class TraineeController {
	
	@Autowired
	private TraineeServiceImpl tnService;
	
	@RequestMapping("traineeExercisePlanner.tn")
	public String traineeExercisePlanner() {
		return "Trainee/traineeExerciseCalendar";
	}
	
	@ResponseBody
	@RequestMapping(value="addTraineeExPlan.tn", produces="application/json; charset=utf-8")
	public String addTraineeExPlan(@RequestBody TnWorkout tn) {
		// @JsonProperty로 키값을 매핑함 - json 객체가 되어버린다.
		// @RequestBody를 통해 json객체 -> java객체로 바꾼다. 
		// System.out.println("tn:" + tn);
		
		int result = tnService.addTraineeExPlan(tn);
		return result > 0 ? "success" : "error";
	}

}
