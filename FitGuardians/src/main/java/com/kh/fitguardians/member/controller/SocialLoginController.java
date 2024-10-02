package com.kh.fitguardians.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SocialLoginController {
	
	@ResponseBody
	@RequestMapping(value = "socialLogin.me", produces = "text/plain; charset=UTF-8")
	// '일단은' produces 속성의 값을 일반 텍스트로 반환하게 만듬(text/plain)
	public String loginMember(String social) {
		
		// TODO: 해당 메소드들을 실행한 이후에 반환값을 이용해서 로그인하게 하는 기능 구현 필요
//		System.out.println(social);
		
		if(social.equals("kakao")) {
			kakaoLoginMember();
			return "카카오";
		}else if(social.equals("naver")){
			naverLoginMember();
			return "네이버";
		}else if(social.equals("google")){
			googleLoginMember();
			return "구글";
		}
		
		return "";
	}
	
	public void kakaoLoginMember() {
		
		String reqUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		reqUrl += "&client_id=" + "";
		reqUrl += "&redirect_uri=" + "";
		reqUrl += "&state=" + "";
		
		
		
	}
	
	public void naverLoginMember() {
		
	}
	
	public void googleLoginMember() {
		
	}
	
}
