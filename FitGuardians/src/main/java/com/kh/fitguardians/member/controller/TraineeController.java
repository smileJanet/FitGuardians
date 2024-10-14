package com.kh.fitguardians.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.fitguardians.member.model.service.TraineeServiceImpl;

@Controller
public class TraineeController {
	
	@Autowired
	private TraineeServiceImpl tnService;

}
