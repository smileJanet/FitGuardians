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

        <link rel="stylesheet" href="resources/css/loginForm.css">
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
            <form action="" method="post">
                <!-- 아이디 -->
                <div class="first-input input__block first-input__block">
                    <input type="text" placeholder="아이디" class="input" id="userId" name="userId"/>
                </div>
                <!-- 이메일 -->
                <div class="input__block">
                    <input type="email" placeholder="이메일" class="input" id="email" name="email"/>
                    <button class="btn btn-sm ml-4 mt-2">인증번호 발송</button>
                </div>
                <!-- 이메일 확인 -->
                <div class="input__block">
                    <input type="text" placeholder="인증번호입력" class="input" id="checkEmail" name=""/>
                </div>
                <!-- 비밀번호 -->
                <div class="input__block">
                    <input type="password" placeholder="비밀번호" class="input" id="userPwd" name="userPwd"/>
                </div>
                <!-- 비밀번호 확인 -->
                <div class="input__block">
                    <input type="password" placeholder="비밀번호 확인" class="input repeat__password" id="repeat__password"/>
                </div>
                <!-- 이름 -->
                <div class="input__block">
                    <input type="text" placeholder="이름" class="input" id="userName" name="userName"/>
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
                <button class="signin__btn">
                    회원가입
                </button>
            </form>
        </div>

        <footer>
            <p>
                <!-- 테스트 -->
            </p>
        </footer>
    </body>
</html>