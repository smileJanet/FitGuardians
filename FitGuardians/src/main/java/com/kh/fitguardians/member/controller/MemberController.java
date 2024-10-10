package com.kh.fitguardians.member.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.kh.fitguardians.common.model.vo.QrInfo;
import com.kh.fitguardians.member.model.service.MemberServiceImpl;
import com.kh.fitguardians.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService = new MemberServiceImpl();
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; 
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping("main.co")
	public String goMain() {
		return "main";
	}
	
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
	
	
	@RequestMapping("enroll.me")
	public String memberEnroll(Member m, HttpServletRequest request) throws IOException {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		String profile = "";
		String gender = m.getGender();
		if(m.getProfilePic() == null) {
			switch (gender) {
			case "F":
				profile = "resources/profilePic/gymW.png";
				break;
			default:
				profile = "resources/profilePic/gymM.png";
				break;
			}
		}
		String type = m.getUserLevel().equals("1") ? "trainer" : "trainee";
		
		QrInfo qr = new QrInfo();
		if(m.getQr() == null) {
			qr.setId(m.getUserId());
			qr.setType(type);
			qr.setCreatedAt(LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));
			qr.setValidUntil(LocalDateTime.now().plusYears(1).format(DateTimeFormatter.ISO_DATE_TIME));
			ObjectMapper objectMapper = new ObjectMapper();
			
			String qrData = objectMapper.writeValueAsString(qr); 
			String fileName = m.getUserId() + ".png"; // 파일명 설정
		    String filePath = servletContext.getRealPath("/resources/qrCodes/" + fileName); // ServletContext를 이용해 경로 설정
		    // 디렉터리 존재 여부 확인
		    File dir = new File(servletContext.getRealPath("/resources/qrCodes/"));
		    if (!dir.exists()) {
		        dir.mkdirs(); // 디렉터리가 없으면 생성
		    }
		    
			QRCodeWriter qrCodeWriter = new QRCodeWriter();
			
			try {
				BitMatrix bitMatrix = qrCodeWriter.encode(qrData, BarcodeFormat.QR_CODE, 200, 200);
				Path path = FileSystems.getDefault().getPath(filePath);
				MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);
				m.setQr(filePath);
			} catch (WriterException e) {
				e.printStackTrace();
			}
		}
		
		m.setProfilePic(profile);
		int result2 = mService.insertQrInfo(qr);
		int result = mService.insertMember(m);
		 if(result > 0 && result2 > 0) { 
			 request.getSession().setAttribute("alertMsg","회원가입되었습니다. 환영합니다!"); 
			 return "Trainee/traineeDashboard"; 
		 }else { 
			 
			 return "common/loginForm"; 
		 }
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
	
	@RequestMapping("qrForm.me")
	public String qrCheckForm() {
		return "common/checkQr";
	}
	
	@ResponseBody
	@RequestMapping("qrCheck.me")
	public String MemberQrCheck(@RequestBody Map<String, String> request) {
		ObjectMapper objectMapper = new ObjectMapper();
		String qrData = request.get("qr");
		QrInfo qrInfo = null;
		int result1 = 0;
		int result2 = 0;
		try {
			qrInfo = objectMapper.readValue(qrData, QrInfo.class);
				// qr 일치 확인
				QrInfo qrResult = mService.qrCheck(qrInfo);
				LocalDateTime now = LocalDateTime.now();
				
				if(qrResult != null) {
					// 출석
					if(qrResult.getAttendance() == null) {
						qrResult.setAttendance(LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME));
						int upResult = mService.updateAttendance(qrResult);
						return "YYYQ";
					}else {
						
						LocalDateTime attendanceTime = LocalDateTime.parse(qrResult.getAttendance(), DateTimeFormatter.ISO_DATE_TIME); 
						Duration duration = Duration.between(attendanceTime, now);
						long hours = duration.toHours();
						System.out.println(hours);
						
						
						if(qrResult.getType().equals("trainee") && hours >= 1) {
							qrResult.setAttendance(now.toString());
							result1 = mService.updateAttStatus(qrResult);
						}else if(qrResult.getType().equals("trainer") && hours >= 6) {
							qrResult.setAttendance(now.toString());
							result2 = mService.updateAttStatus(qrResult);
						}
						
						
					}
				}
				
				
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		if(result1 > 0 || result2 > 0) {
			return "YYQQ";
		}else {
			return "NNQQ";
		}
	}
	
}
