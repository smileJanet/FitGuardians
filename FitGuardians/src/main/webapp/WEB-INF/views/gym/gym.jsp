<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬스장 검색</title>
</head>
<body id="page-top">
	<!-- Page Wrapper -->
    <div id="wrapper">
     <jsp:include page="../common/sideTrainee.jsp" />
     <div id="content-wrapper" class="d-flex flex-column">
     <!-- Main Content -->
     	<div id="content">
     		<jsp:include page="../common/topBar.jsp"/>
     		<!-- Begin Page Content -->
                <div class="container-fluid">
					 <!-- Page Heading -->
                    <h1 class="h3 mb-1 text-gray-800">주변 헬스장 정보</h1><br>
                    <p class="mb-4">회원님의 위치 정보를 이용하여 주변 헬스장을 찾아보세요!<br>
                        주소 입력을 통하여 주변 헬스장을 검색 하는 것도 가능합니다!</p>

                    <!-- Content Row -->
                    <div class="row">

                        <div class="col-lg-6">

                            <!-- Overflow Hidden -->
                            <div class="card mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">현재 위치</h6>
                                </div>
                                <div class="card-body">
                                    서울 특별시 강남구 역삼 1동
                                </div>
                            </div>

                            <!-- Progress Small -->
                            <div class="card mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">주소 입력</h6>
                                </div>
                                <div class="card-body">
                                    <div class="input-group">
                                        <input type="text" style="border: 1px solid #ccc; padding: 0.5rem; flex: 1;" placeholder="주소를 입력하세요.">
                                        <button type="button" class="btn btn-primary ms-2">확인</button> <!-- 확인 버튼 추가 -->
                                    </div>
                                </div>
                            </div>
                            

                            <div class="card mb-4">
						    <div class="card-header py-3">
						        <h6 class="m-0 font-weight-bold text-primary">추천 헬스장</h6>
						    </div>
						    <div class="card-body">
						        <ul>
						            <li>헬스장 A</li>
						            <li>헬스장 B</li>
						            <li>헬스장 C</li>
						        </ul>
						    </div>
						</div>

                        </div>

                        <div class="col-lg-6">

                            <!-- Roitation Utilities -->
                            <div class="card">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">지도 정보</h6>
                                </div>
                                <div class="card-body text-center">
                                    <iframe 
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.8354345096325!2d144.95373531531745!3d-37.8162799797516!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad642af0f11a55b%3A0x5045675218ceed34!2sMelbourne%20CBD%2C%20Victoria%2C%20Australia!5e0!3m2!1sen!2sin!4v1617184454375!5m2!1sen!2sin" 
                                    width="100%" 
                                    height="400" 
                                    style="border:0;" 
                                    allowfullscreen="" 
                                    loading="lazy"></iframe>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
                </div>
     	
     	
     	</div>
     </div>
    </div>
</body>
</html>