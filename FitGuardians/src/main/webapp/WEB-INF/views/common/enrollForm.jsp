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
        <!-- sweetalert2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.1/dist/sweetalert2.all.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.1/dist/sweetalert2.min.css" rel="stylesheet">

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
                	<a href="#" id="signup">회원가입</a>
                </li>
                <li>
                    <a href="#" id="signup">트레이너</a>
                    <a href="#" id="signup">일반회원</a>
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
                    <span id="idcheck" class="btn btn-sm ml-4 mt-2" style="display:none"></span>
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
                    <span id="pwdCheck" class="btn btn-sm ml-4 mt-2" style="display:none"></span>
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
                <div class="form-check-inline">
                    <label class="form-check-label" for="Male">성별 : 남자
                        <input class="form-check-input" type="radio" name="gender" id="Male" value="M"/>
                    </label>
                    <label class="form-check-label" for="Female">여자
                        <input class="gender" type="radio" name="gender" id="Female" value="F">
                    </label>
                </div>
                <!-- 전화번호 -->
                <div class="input__block">
                    <input type="text" placeholder="전화번호" class="input" id="phone" name="phone"/>
                </div>
            	<input type="hidden" name="userLevel" value="1">
                <!-- 회원가입 버튼 -->
                <button id="enrollBtn" class="btn-primary btn-block btn disabled" disabled>회원가입</button>
            </form>
        </div>
        
        <script>
			$(()=>{
				timeoutTimer(new Date(Date.now() + 180000), 1000);
				let submit = $("#enrollBtn");
				// 아이디 유효성
				$("#userId").keyup(()=>{
					let id = $("#userId").val();
					const patter = /^[a-zA-Z][a-zA-Z0-9]{5,19}$/;
					
					if(patter.test(id)){
						
                        $.ajax({
                        	url:"checkId.me",
                        	data:{
                        		userId : $("#userId").val()
                        	},
                        	success:((result)=>{
                        		if(result === 'YYYI'){
                        			$("#idcheck").show();
                        			$("#idcheck").text("사용가능한 아이디입니다").css("color", "skyblue");
                        			submit.removeAttr("disabled");
                                    submit.removeClass("disabled");

                        		}else{
                        			$("#userId").focus();
                        			$("#idcheck").show();
                        			$("#idcheck").text("중복된 아이디입니다. 다시입력해주세요").css("color","red");
                        			submit.attr("disabled");
            						submit.addClass("disabled");
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
						submit.attr("disabled");
						submit.addClass("disabled");
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
                    let pwdCheck = $("#pwdCheck");
                    if(pwd === repeatPwd){
                        submit.removeAttr("disabled");
                        submit.removeClass("disabled");
                        pwdCheck.show();
                        pwdCheck.text("비밀번호가 일치합니다.")
                        
                        $("#repeat_password").blur(()=>{
                        	pwdCheck.hide();
                        })
                        
                    }else{
                    	pwdCheck.hide();
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
			   
			   // 이메일 인증
			   $("#emailBtn").click(()=>{
				   $.ajax({
					   url:"auth.email",
					   data:{
						   email:$("#email").val()
					   },
					   success:(num)=>{
						   setCookie("auth", num, 3);
						   Swal.fire({
							      icon: 'success',
							      title: '이메일인증',
							      text: "인증번호가 발송되었습니다. 이메일을 확인해 주세요",
							    });
						  
					   },
					   error:()=>{
						   console.log("auth email ajax failed");
					   }
				   })
			   })
			   
			   // 이메일로 전송된 번호와 입력된 번호 확인
			   $("#checkEmail").keyup(()=>{
				   let val = getCookie("auth");
				   let inputNum = $("#checkEmail").val();
				   if(inputNum.length > 4){
					  
					   if(val === inputNum){
						   console.log("인증")
						   Swal.fire({
							      icon: 'success',
							      title: '이메일인증',
							      text: "인증이 완료 되었습니다.",
							    });
						   $("#checkEmail").hide();
						   $("emainBtn").hide();
					   }else{
						   Swal.fire({
							      icon: 'warning',
							      title: '이메일인증',
							      text: "인증번호가 다릅니다.",
							    });
						   
					   }
				   }
			   })
			   
			})
			// 쿠키 생성 분으로
			function setCookie(name, value, time) {
				let date = new Date();
				date.setMinutes(date.getMinutes() + time);
				let cookie_value = escape(value) + ((time==null) ? '' : '; expires=' + date.toUTCString())
				document.cookie = name + "=" + cookie_value
			}
			// 쿠키네임의 쿠키value찾기
			function getCookie(cookie_name) {
				  var x, y;
				  var val = document.cookie.split(';');

				  for (var i = 0; i < val.length; i++) {
				    x = val[i].substr(0, val[i].indexOf('='));
				    y = val[i].substr(val[i].indexOf('=') + 1);
				    x = x.replace(/^\s+|\s+$/g, '');
				    if (x == cookie_name) {
				      return unescape(y);
				    }
				  }
				}
			
			function timeoutTimer(endTime, timeout){
				const now = Date.now();
				const end = endTime.getTime();
				const timeLeft = (end - now)/1000 ;
				console.log(`남은시간:\${timeLeft}sec`);
				
				if(timeLeft <= 0){
					console.log('타이머 종료');
					return;
				}
				
				setTimeout(()=>{
					timeoutTimer(endTime, timeout);
				}, timeout);
			}
			
		</script>
		
        <footer>
            <p>
                <!-- 테스트 -->
            </p>
        </footer>
    </body>
</html>