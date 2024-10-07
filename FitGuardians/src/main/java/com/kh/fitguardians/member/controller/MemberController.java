package com.kh.fitguardians.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.fitguardians.member.model.service.MemberServiceImpl;
import com.kh.fitguardians.member.model.vo.Member;
import com.kh.fitguardians.member.model.vo.MemberInfo;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService = new MemberServiceImpl();
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; 
	
    @RequestMapping("traineeDetail.me")
    public String memberDetailView() {
        return "Trainer/traineeDetailInfo";
    }

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
	
	
	@RequestMapping(value = "enroll.me", produces = "text/html; charset=UTF-8")
	public String memberEnroll(Member m, String memberInfo, HttpServletRequest request) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		// 현재 사용불가
		// String profile = "";
		// String gender = m.getGender();
		// if(m.getProfilePic() == null) {
		// 		switch (gender) {
		//		case "F":
		//			System.out.println("여자");
		//			profile = "resources/profilePic/gymW.png";
		//			break;
		//		default:
		//			System.out.println("남자");
		//			profile = "resources/profilePic/gymM.png";
		//			break;
		//		}
		//	}
		// m.setProfilePic(profile);
		
		// 기본 프로필 사진 설정
        String profile = m.getProfilePic() == null ? 
            (m.getGender().equals("F") ? "resources/profilePic/gymW.png" : "resources/profilePic/gymM.png") : 
            m.getProfilePic();
        m.setProfilePic(profile);
		
		// 회원 추가 정보가 있는지 확인
        if (memberInfo != null && !memberInfo.isEmpty()) {
            // 추가 정보가 있으면 추가 정보 저장
            MemberInfo info = new Gson().fromJson(memberInfo, MemberInfo.class);
            int result = mService.insertMemberWithInfo(m, info);
            if (result > 0) {
                request.getSession().setAttribute("alertMsg", "회원가입이 완료되었습니다. 환영합니다!");
                return "Trainee/traineeDashboard";
            }
        } else {
            // 추가 정보가 없으면 기존 방식대로 회원가입 처리
            int result = mService.insertMember(m);
            if (result > 0) {
                request.getSession().setAttribute("alertMsg", "회원가입이 완료되었습니다. 환영합니다!");
                return "Trainee/traineeDashboard";
            }
        }
        request.getSession().setAttribute("errorMsg", "회원가입에 실패했습니다.");
        return "common/loginForm";
		 
        // 사용 노노
		// if(result > 0) { 
		// 		 request.getSession().setAttribute("alertMsg","회원가입되었습니다. 환영합니다!"); 
		// 		 return "Trainee/traineeDashboard"; 
		// }else { 
		//	 	
		//	 	 return "common/loginForm"; 
		// }
	}
	
	@RequestMapping("login.me")
	public String memberLogin(Member m, HttpServletRequest request) {
		Member loginUser = mService.loginMember(m);
		HttpSession session = request.getSession();
		if(loginUser != null) {
			if(bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
				session.setAttribute("loginUser", loginUser);
				return "main";
			}else {
				session.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다. 다시 입력해주세요!");
				return "redirect:loginform.me";
			}
			
		}else {
			session.setAttribute("errorMsg", "아이디가 틀렸습니다 다시 입력해주세요!");
			return "redirect:loginform.me";
		}
		
	}
	
	@RequestMapping("logout.me")
	public String memberlogOut(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}
	
}
