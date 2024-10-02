package com.kh.fitguardians.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.fitguardians.member.model.service.MemberServiceImpl;
import com.kh.fitguardians.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService = new MemberServiceImpl();
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; 
	
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
	
	@ResponseBody
	@RequestMapping("auth.email")
	public String ajaxAuthEmail(String email) {
		int randomCode = mService.authEmail(email);
		return randomCode + "";
	}
	
	
	@RequestMapping("enroll.me")
	public String memberEnroll(Member m) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "main";
		}else {
			return "common/loginForm";
		}
	}
	
}
