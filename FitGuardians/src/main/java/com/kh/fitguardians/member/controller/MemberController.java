package com.kh.fitguardians.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memberController {

	@RequestMapping("traineeDetail.me")
	public String memberDetailView() {
		return "Trainer/traineeDetailInfo";
	}
	
}
