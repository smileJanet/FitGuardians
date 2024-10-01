<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Enroll Form</title>
        <link href="./resources/templates/css/sb-admin-2.css" rel="stylesheet" />
        <!-- Bootstrap core JavaScript-->
        <script src="./resources/templates/vendor/jquery/jquery.min.js"></script>
        <script src="./resources/templates/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="resources/css/enrollForm.css">
    </head>
    <body>
        <div class="topLogoContainer">
            <img src="resources/images/FitGuardians로고-001.png" alt="">
        </div>
        <div class="container">
            <!-- 상위 버튼 -->
            <ul class="links">
                <li>
                </li>
                <li>
                    <a href="#" id="signup">회원가입</a>
                </li>
                <li>
                    <a href="#" id="reset">초기화</a>
                </li>
            </ul>

            <!-- 입력 폼 -->
            <form action="enroll.me" method="post">
                <!-- 아이디 -->
                <div class="first-input input__block first-input__block">
                    <input type="text" placeholder="영문으로 시작하는 6~20자리 아이디" class="input" id="userId" name="userId" required/>
                </div>
                <!-- 이메일 -->
                <div class="input__block">
                    <input type="email" placeholder="이메일" class="input" id="email" name="email" required/>
                    <button id="emailBtn" type="button" class="btn btn-sm ml-4 mt-2" style="display:none">인증번호 발송</button>
					
                </div>
                <!-- 이메일 확인 -->
                <div class="input__block">
                    <input type="text" placeholder="인증번호입력" class="input" id="checkEmail" name="checkEmail"/>
                </div>
                <!-- 비밀번호 -->
                <div class="input__block">
                    <input type="password" placeholder="비밀번호" class="input" id="userPwd" name="userPwd" required/>
                </div>
                <!-- 비밀번호 확인 -->
                <div class="input__block">
                    <input type="password" placeholder="비밀번호 확인" class="input repeat__password" id="repeat_password"/>
                </div>
                <!-- 이름 -->
                <div class="input__block">
                    <input type="text" placeholder="이름" class="input" id="userName" name="userName" required/>
                </div>
                <!-- 나이 -->
                <div class="input__block">
                    <input type="number" placeholder="나이" class="input" id="age" name="age"/>
                </div>
                <!-- 성별 -->
                <div class="input__block">
                    <input type="text" placeholder="성별" class="input" id="gender" name="gender"/>
                </div>
                <!-- 전화번호 -->
                <div class="input__block">
                    <input type="text" placeholder="전화번호" class="input" id="phone" name="phone"/>
                </div>
            
                <!-- 회원가입 버튼 -->
                <button id="enrollBtn" class="btn-primary btn-block btn disabled" disabled>회원가입</button>
            </form>
        </div>
        
        <script>
			$(()=>{
				let submit = $("#enrollBtn");
				// 아이디 유효성
				$("#userId").keyup(()=>{
					let id = $("#userId").val();
					const patter = /^[a-zA-Z][a-zA-Z0-9]{5,19}$/;
					
					if(patter.test(id)){
						submit.removeAttr("disabled");
                        submit.removeClass("disabled");
                        $.ajax({
                        	url:"checkId.me",
                        	data:{
                        		userId : $("#userId").val()
                        	},
                        	success:((result)=>{
                        		if(result === 'YYYI'){
                        			console.log("id ok")
                        		}else{
                        			$("#userId").val("");
                        			$("#userId").attr("placeholder", "중복된 아이디입니다. 다시입력해주세요")
                        		}
                        	}),
                        	error:(()=>{
                        		console.log("id check ajax failed");
                        	})
                        
                        })
					}else{
						submit.attr("disabled");
						submit.addClass("disabled");
					}
				})
				
				// 이메일 유효성
				$("#email").keyup(()=>{
					let email = $("#email").val()
					const pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
					
					if(pattern.test(email)){
						$("#emailBtn").show();
					}else{
						
					}
				})

				// 비밀번호 유효성
				$("#userPwd").keyup(()=>{
					let pwd = $("#userPwd").val();
					let reg = /^(?=.*[0-9])(?=.*[a-z])(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z0-9!@#$%^&*(),.?":{}|<>]{8,}$/;

                    if(reg.test(pwd)){
                        $("#repeat_password").attr("placeholder", "비밀번호 확인");
                    }else{
                        $("#repeat_password").attr("placeholder", "비밀번호는 8자 이상이어야 하며, 숫자/소문자/특수문자를 모두 포함해야 합니다.")
                    }
                    
				})
				
				// 비밀번호 일치 
                $("#repeat_password").keyup(()=>{
                    let pwd = $("#userPwd").val();
                    let repeatPwd = $("#repeat_password").val();
                    if(pwd === repeatPwd){
                        submit.removeAttr("disabled");
                        submit.removeClass("disabled");
                    }else{
                    	submit.attr("disabled");
						submit.addClass("disabled");
                    }
                })
                
                
			   //----------- reset ---------------------
                let reset  = $(".links").find("li").find("#reset")  ; 
			   reset.on("click",function(e){
			     e.preventDefault();
			     $(this).parent().parent().siblings("form")
			     .find(".input__block").find(".input").val("");
			   })
			})	
			
			
		</script>
		
        <footer>
            <p>
                <!-- 테스트 -->
            </p>
        </footer>
    </body>
</html>