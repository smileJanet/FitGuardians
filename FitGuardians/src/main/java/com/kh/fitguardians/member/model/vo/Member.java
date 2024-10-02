package com.kh.fitguardians.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
// @AllArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	
	// 회원 vo, 추가 변동될 가능성 있음
	
	private int userNo;				// 회원번호
	private String userId;			// 회원아이디
	private String userPwd;			// 회원비밀번호
	private String userName;		// 회원이름
	private String email;			// 이메일
	private String phone;			// 전화번호
	private String gender;			// 성별
	private int age;				// 나이
	private String address;			// 주소
	private String enrollDate;		// 가입일
	private int userLevel;			// 회원분류(1:트레이너,2:회원)
	private String pt;				// 담당트레이너
	private String status;			// 상태(Y,N)
	private String api;				// api로그인
	private String qr;				// qr코드 발급후 저장경로(출석체크옹)
	private String profilePic;		// 프로필사진
	private String membership;		// 회원권
	
	// 회원 추가정보
	private int height;			// 키
	private int weight;			// 몸무게
	private String disease;		// 기저질환
	private String goal;		// 운동목표
	
	
	// 각각 회원에 대해 필요한 정보가 다를 수도 있으니 롬복 어노테이션 미사용 
	// 회원에 대한 모든 정보 필드부
	public Member(int userNo, String userId, String userPwd, String userName, String email, String phone, String gender,
			int age, String address, String enrollDate, int userLevel, String pt, String status, String api, String qr,
			String profilePic, String membership, int height, int weight, String disease, String goal) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.age = age;
		this.address = address;
		this.enrollDate = enrollDate;
		this.userLevel = userLevel;
		this.pt = pt;
		this.status = status;
		this.api = api;
		this.qr = qr;
		this.profilePic = profilePic;
		this.membership = membership;
		this.height = height;
		this.weight = weight;
		this.disease = disease;
		this.goal = goal;
	}
	
	// 추가정보 제외 필드부
	public Member(int userNo, String userId, String userPwd, String userName, String email, String phone, String gender,
			int age, String address, String enrollDate, int userLevel, String pt, String status, String api, String qr,
			String profilePic, String membership) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.age = age;
		this.address = address;
		this.enrollDate = enrollDate;
		this.userLevel = userLevel;
		this.pt = pt;
		this.status = status;
		this.api = api;
		this.qr = qr;
		this.profilePic = profilePic;
		this.membership = membership;
	}
	
	
	
	
}
