<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>FitGuardians</title>
        <link rel="stylesheet" href="resources/css/loginForm.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <!-- 카카오 api 로그인 구현용 -->
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    </head>
    <body>
        <div class="topLogoContainer">
            <img
                src="resources/images/FitGuardians로고-001.png"
                alt="">
        </div>
        <div class="container">
            <!-- 상위 버튼 -->
            <ul class="links">
                <li>
                    <a href="#" id="signin">로그인</a>
                </li>
                <li>
                    <a href="enrollForm.me" id="signup">회원가입</a>
                </li>
                <li>
                    <a href="#" id="reset">초기화</a>
                </li>
            </ul>

            <!-- 입력 폼 -->
            <form action="login.me" method="post">
                <!-- 아이디 -->
                <div class="first-input input__block first-input__block">
                    <input type="text" placeholder="아이디" class="input" id="userId" name="userId"/>
                </div>
                <!-- 비밀번호 -->
                <div class="input__block">
                    <input
                        type="password"
                        placeholder="비밀번호"
                        class="input"
                        id="userPwd"
                        name="userPwd"/>
                </div>
                <!-- 로그인 버튼 -->
                <button class="signin__btn">
                    로그인
                </button>
            </form>
            <!-- 구분선 -->
            <div class="separator">
                <p>OR</p>
            </div>
            <!-- 카카오 소셜 로그인 -->
            <button class="socialLogin__btn kakao__btn" value="kakao">
                카카오로 로그인하기
            </button>
            <!-- 네이버 소셜 로그인 -->
            <button class="socialLogin__btn naver__btn" value="naver">
                네이버로 로그인하기
            </button>
            <!-- 구글 소셜 로그인 -->
            <button class="socialLogin__btn google__btn" value="google">
                <!-- <img src="../resources/svg/web_neutral_rd_na.svg" alt=""/> -->
                구글로 로그인하기
            </button>
        </div>

        <footer>
            <p>
                <!-- 테스트 -->
            </p>
        </footer>
        <script>
            $(function(){
                //----------- 초기화 버튼 ---------------------
                let reset = $(".links").find("li").find("#reset"); 
                reset.on("click",function(e){
                    e.preventDefault();
                    $(this).parent().parent().siblings("form")
                    .find(".input__block").find(".input").val("");
                })

                // 와우! 버튼에도 value값을 설정할 수 있었다니!
                //----------- 소셜 로그인 버튼 ---------------------
                $(".socialLogin__btn").click(function(){

                    let btnValue = $(this).val()
					
                    // 팝업 창 크기 변수 설정
				    let popupWidth = 600; // 기본값
				    let popupHeight = 700; // 기본값
				
				    // 소셜 로그인 플랫폼에 따라 팝업 크기를 다르게 설정
				    if (btnValue === "kakao") {
				    	// 카카오 로그인 팝업 크기
				    	popupWidth = 400;
				        popupHeight = 500;
                        
                        // 비동기로 처리해야하므로 부득이하게 카카오만 자바스크립트 사용
                        // kakaoLogin();
                        
                        
				    } else if (btnValue === "naver") {
				    	// 네이버 로그인 팝업 크기
				    	popupWidth = 600;
				        popupHeight = 700;
				    } else if (btnValue === "google") {
				    	// 구글 로그인 팝업 크기
				    	popupWidth = 500;
				        popupHeight = 600;
				    }
				 	// 팝업 창 위치 설정 (화면 중앙에 맞추기)
				    let popupX = (window.screen.width / 2) - (popupWidth / 2);
				    let popupY = (window.screen.height / 2) - (popupHeight / 2);
                    
                    $.ajax({
                        url: 'socialLogin.me',
                        data: { social: btnValue },
                        success:function(data){
                        	// 팝업 창 열기
                            window.open(data, "Social Login", 
                                        'width=' + popupWidth + ',height=' + popupHeight + ',left=' + popupX + ',top=' + popupY);
                        },
                        error:function(){
                            
                        },
                    })
                    
                });

                // 카카오 로그인 / 회원가입 담당부
                // function kakaoLogin(){
                //     let kakaoJavaScriptKey = "서비스키";
                //     Kakao.init(kakaoJavaScriptKey);
                //     console.log(Kakao.isInitialized()); // sdk초기화여부판단
                //     console.log("먹고살기 힘들다");
                // };

            });
        </script>
    </body>
</html>