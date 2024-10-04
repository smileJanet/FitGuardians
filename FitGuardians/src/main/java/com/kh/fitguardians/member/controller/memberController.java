package com.kh.fitguardians.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitguardians.common.template.APIPropertiesSelecter;
import com.kh.fitguardians.member.model.service.MemberServiceImpl;
import com.kh.fitguardians.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("loginform.me")
	public String loginForm() throws IOException {
		return "common/loginForm";
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session , ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser == null) {
			// 로그인 실패
//			mv.addObject("errorMsg", "로그인 실패");
//			mv.setViewName(""); 					// 에러페이지 아직 없음
			System.out.println("로그인 실패");
			mv.setViewName("main");
		}else {
			// 로그인 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("main");
		}
		
		return mv;
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "common/enrollForm";
	}
	
	
}
