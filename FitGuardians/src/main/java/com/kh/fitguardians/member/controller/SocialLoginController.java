package com.kh.fitguardians.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import static com.kh.fitguardians.common.template.APIPropertiesSelecter.*;

@Controller
public class SocialLoginController {
	
	@ResponseBody
	@RequestMapping(value = "socialLogin.me", produces = "text/plain; charset=UTF-8")
	// '일단은' produces 속성의 값을 일반 텍스트로 반환하게 만듬(text/plain)
	public String loginMember(String social) throws IOException {
		
		// TODO: 해당 메소드들을 실행한 이후에 반환값을 이용해서 로그인하게 하는 기능 구현 필요
//		System.out.println(social);
		
		if(social.equals("kakao")) {
			return kakaoLoginMember();
		}else if(social.equals("naver")){
			return naverLoginMember();
		}else if(social.equals("google")){
			return googleLoginMember();
		}else {
			return "";
		}
	}
	
	// TODO: 맹글어
//	public void getKakaoKeys() throws IOException {
//		
//		Properties prop = properties();
//		
//		String kakaoJavaScriptKey = prop.getProperty("kakaoJavaScriptKey");
//        String kakaoRestApi = prop.getProperty("kakaoRestApi");
//        
//	}
	
	public String kakaoLoginMember() {
		
		return "";
	}
	
	public String naverLoginMember() throws IOException {
		
		Properties prop = properties();

	    String clientId = prop.getProperty("naverClientId");
	    String clientSecret = prop.getProperty("naverClientSecret");
	    String redirectUrl = prop.getProperty("naverRedirectUrl");
	    String encodedRedirectUrl = URLEncoder.encode(redirectUrl, "UTF-8");

	    if (clientId == null || clientSecret == null || redirectUrl == null) {
	        throw new IllegalArgumentException("Property 파일이 존재하지만, 네이버 클라이언트 설정 값들을 확인할 수 없습니다.");
	    }

	    String reqUrl = "https://nid.naver.com/oauth2.0/authorize"
	                    + "?response_type=code"
	                    + "&client_id=" + clientId
	                    + "&redirect_uri=" + encodedRedirectUrl
	                    + "&state=" + "naverState";

	    return reqUrl;
	}
	
	public String googleLoginMember() {
		
		return "";
	}
	
}
