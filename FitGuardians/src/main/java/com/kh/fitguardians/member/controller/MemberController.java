package com.kh.fitguardians.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.fitguardians.member.model.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService = new MemberServiceImpl() {
	};
	
	@RequestMapping("loginform.me")
	public String loginForm() {
		return "common/loginForm";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "common/enrollForm";
	}
	
	@ResponseBody
	@RequestMapping("checkId.me")
	public String memberCheckId(String userId) {
		int result = mService.checkId(userId);
		if(result > 0) {
			return "YYYN";
		}else {
			return "YYYI";
		}
	}
}
