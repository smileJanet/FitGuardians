package com.kh.fitguardians.exercise.controller;

import java.io.IOException;
import java.net.URI;
import java.net.URLDecoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.fitguardians.exercise.model.vo.ExercisePlan;

@Controller
public class ExerciseController {

	@RequestMapping("exercise.bo")
	public String showExercisePage() {
		return "exercise/trainerExercise";
	} // showExercisePage

	@ResponseBody
	@RequestMapping(value = "exercisePlan.bo", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
	public String autoExercisePlan(@RequestBody ExercisePlan ex) throws IOException, InterruptedException {

		// 인코딩을 하면 반드시 디코딩도 해야 한다.
		// 값이 안담겼던 이유 : jsp내 name(key값)과 ex의 필드부 이름이 달랐기 때문.
		// 값이 달라도 매핑 되는 방법 : 잭슨 라이브러리 다운받는다.

		String goal = URLDecoder.decode(ex.getExerciseGoal(), "UTF-8");
		String fitnessLevel = URLDecoder.decode(ex.getFitnessLevel(), "UTF-8");
		String exerciseType = URLDecoder.decode(ex.getExerciseType(), "UTF-8");
		String equipment = URLDecoder.decode(ex.getEquipment(), "UTF-8");
		String healthCondition = URLDecoder.decode(ex.getHealthCondition(), "UTF-8");
		int daysPerWeek = ex.getDaysPerWeek();
		int duration = ex.getDuration();
		int planDurationWeek = ex.getPlanDurationWeek();
		
		String plan = "{\"goal\":\""
				    + goal 
				    + " \","
					+ "	\"fitness_level\":\""
					+ fitnessLevel
					+ "\","
					+ "	\"preferences\":"
					+ "	{\"exercise_types\":[\""
					+ exerciseType
					+ "\"],"
					+ "	\"equipment_available\":[\""
					+ equipment 
					+ " \"]},"
					+ " \"health_conditions\":[\""
					+ healthCondition
					+ " \"],"
					+ " \"schedule\":{\"days_per_week\":"
					+ daysPerWeek 
					+ ","
					+ " \"session_duration\":"
					+ duration
					+ "},"
					+ " \"lang\":\"kor\","
					+ " \"plan_duration_weeks\":"
					+ planDurationWeek
					+ "}";
		
		 HttpRequest request = HttpRequest.newBuilder() 
		 .uri(URI.create("https://ai-workout-planner-exercise-fitness-nutrition-guide.p.rapidapi.com/generateWorkoutPlan?noqueue=1"))
		 .header("x-rapidapi-key", "3752bc4fb5mshdd408753dc51259p1f0f59jsn8e0983577c84")
		 .header("x-rapidapi-host", "ai-workout-planner-exercise-fitness-nutrition-guide.p.rapidapi.com")
		 .header("Content-Type", "application/json")
		 .method("POST", HttpRequest.BodyPublishers.ofString(plan)) 
		 .build();
		 
		 HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
		 
		 System.out.println(response.body()); 
		 return response.body();
		 
	} // autoExercisePlan

}
