<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>트레이너 전용 운동 플랜 페이지</title>
    <!-- Custom fonts for this template -->
    <link href="resources/templates/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    
    <!-- FullCalendar cdn -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
    
    <!-- 외부 css파일 -->
    <link href="resources/css/trainerExercise.css" rel="stylesheet" type="text/css">
</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <jsp:include page="../common/sideTrainer.jsp" />
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <jsp:include page="../common/topBar.jsp" />
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <h1 class="h3 mb-4 text-gray-800" style="font-weight:600;"> 운동 플래너 </h1>
                    
                    <div class="card mb-4 py-3 border-bottom-warning">
                        <div style="display:flex;">
                            &nbsp; &nbsp; &nbsp;
                            <p>회원 선택 : </p>
                            &nbsp; &nbsp; &nbsp;
                            <select name="traineeExercise" style="width:130px; height:25px;">
                                <option value="none" autofocus> 회원 선택하기 </option>
                                <option value="user01">뫅두팔</option>
                                <option value="user02">강철혁</option>
                            </select>
                        </div>
                        
                        <div style="display:flex;">
                            <div class="card mb-3 py-2 border-bottom-info" style="width:50%; margin:50px; margin-right:25px;">
                                <h4 style="margin-left:10px; font-weight:600; padding:20px; margin:20px;" align="center">뫅두팔님 운동 계획하기</h4>
                                  <div class="prescription">
                                    <div class="exercisePrescription">
                                        <span>운동 목적</span>
                                        <select class="selectExercise" name="goal">
                                            <option value="체중_감량">체중 감량</option>
                                            <option value="근력_증가">근력 증가</option>
                                            <option value="수술_후_재활">수술 후 재활</option>
                                            <option value="유연성_운동">유연성 운동</option>
                                            <option value="균형_증가">균형 증가</option>
                                            <option value="심혈관_기능증진">심혈관 기능증진</option>
                                        </select>
                                    </div>
                                    <div class="exercisePrescription">
                                        <span>운동 강도</span>
                                        <select class="selectExercise" name="fitness_level">
                                            <option value="basic">초급</option>
                                            <option value="intermediate">중급</option>
                                            <option value="advanced">고급</option>
                                        </select>
                                    </div>
                                    <div class="exercisePrescription">
                                        <span>운동 유형</span>
                                        <select class="selectExercise" name="exercise_types">
                                            <option value="cardiovascular">심혈관 운동</option>
                                            <option value="aerobic">유산소 운동</option>
                                            <option value="weight_triaing">무산소 운동(웨이트 트레이닝)</option>
                                            <option value="stretching">유연성 운동</option>
                                            <option value="calisthenics">맨몸운동</option>
                                        </select>
                                    </div>
                                    <div class="exercisePrescription">
                                        <span>기구 선택</span>
                                        <select class="selectExercise" name="equipment_available">
                                            <option value="none">필요 없음</option>
                                            <option value="dumbbell">아령</option>
                                            <option value="barbell">바벨</option>
                                            <option value="kettlebell">케틀벨</option>
                                            <option value="ball">공</option>
                                            <option value="theraband">세라밴드</option>
                                            <option value="yoga_mat">요가매트</option>
                                            <option value="theraband">세라밴드</option>
                                            <option value="foam_roller">폼롤러</option>
                                            <option value="treadmill">런닝머신</option>
                                        </select>
                                    </div>
                                    <div class="exercisePrescription">
                                        <span>건강 상태</span>
                                        <select class="selectExercise" name="health_conditions">
                                            <option value="none">정상</option>
                                            <option value="혈압조절장애">혈압조절장애</option>
                                            <option value="고지혈증">고지혈증</option>
                                            <option value="당뇨">당뇨</option>
                                            <option value="대사증후군">대사증후군</option>
                                            <option value="디스크(목,허리)">디스크(목,허리)</option>
                                            <option value="천식">천식</option>
                                            <option value="심혈관_질환">심혈관 질환</option>
                                            <option value="골다공증">골다공증</option>
                                            <option value="관절염">관절염</option>
                                            <option value="편두통">편두통</option>
                                            <option value="갑상선_장애">갑상선 장애</option>
                                        </select>
                                    </div>
                                    <div class="exercisePrescription">
                                        <span>스케줄(주n회)</span>
                                        <select class="selectExercise" name="days_per_week">
                                            <option value="1">1회</option>
                                            <option value="2">2회</option>
                                            <option value="3">3회</option>
                                            <option value="4">4회</option>
                                            <option value="5">5회</option>
                                            <option value="6">6회</option>
                                            <option value="7">7회</option>
                                        </select>
                                    </div>
                                    <div class="exercisePrescription">
                                        <span>운동 지속시간</span>
                                        <select class="selectExercise" name="session_duration">
                                            <option value="40">40초</option>
                                            <option value="50">50초</option>
                                            <option value="60">60초</option>
                                            <option value="90">90초</option>
                                            <option value="120">120초</option>
                                            <option value="150">150초</option>
                                        </select>
                                    </div>
                                    <div class="exercisePrescription">
                                        <span>주차별 기준 운동 기간</span>
                                        <select class="selectExercise" name="plan_duration_weeks">
                                            <option value="4">4주</option>
                                            <option value="8">8주</option>
                                            <option value="12">12주</option>
                                            <option value="16">16주</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-info btn-icon-split" id="aiPlan">운동 처방 생성하기!</button>
                                </div>
                            </div>

                            <div class="card mb-4 py-3 border-bottom-primary" style="width:50%; margin:50px; margin-left:25px;">
                                <h4 style="margin-left:10px; font-weight:600; padding:20px; margin:20px;" align="center">AI가 추천해준 운동계획</h4>
                                <div class="prescription">
                                    <div class="aiRecommend">
                                        <span>운동 정보</span>
                                        <div>
                                        	<ul>
	                                        	<li>요일 : 매주 월요일</li>
	                                        	<li>지속 기간 : 4주</li>
	                                        	<li>난이도 : 보통</li>
	                                        	<li>운동 목적 : 체중 감량</li>
	                                        	<li>프로그램 설명 : 살뺴주는 프로그램입니당</li>
	                                        </ul>
                                        </div>
                                    </div>
                                    <div class="aiRecommend">
                                        <span>운동 프로그램</span>
                                        <div>
                                          <div class="planIndex">1회차 운동</div>
	                                        <ul>
	                                        	<li>지속 시간 : 20분</li>
	                                        	<li>기구 : 덤벨</li>
	                                        	<li>운동명 : 덤벨로우</li>
	                                        	<li>횟수 : 15-20회</li>
	                                        	<li>세트수 : 2회</li>
	                                        </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 주간 달력 생성 -->
                    <div class="col-md-2" style="display:inline;">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">뫅두팔님 운동 등록</h6>
                            </div>
                            <div class="card-body" id='calendar'>
                                
                            </div>
                        </div>
                    </div>

                    <script>

                    document.addEventListener('DOMContentLoaded', function() {
                    const calendarEl = document.getElementById('calendar')
                    const calendar = new FullCalendar.Calendar(calendarEl, {
                        initialView: 'dayGridWeek'
                    })
                    calendar.render()
                    })
            
                </script>

                </div>
                
                <script>
                $(function(){
                	
                	$("#aiPlan").click(function(){
                        $.ajax({
                		url:"exercisePlan.bo",
                		type:"POST",
                		contentType:"application/json; charset=utf-8",
                		data:JSON.stringify({
	                         goal: encodeURIComponent($('select[name="goal"]').val()),
	                         fitness_level : encodeURIComponent($('select[name="fitness_level"]').val()),
	                         exercise_types : encodeURIComponent($('select[name="exercise_types"]').val()),
	                         equipment_available : encodeURIComponent($('select[name="equipment_available"]').val()),
	                         health_conditions : encodeURIComponent($('select[name="health_conditions"]').val()),
	                         days_per_week : encodeURIComponent($('select[name="days_per_week"]').val()),
	                         session_duration : encodeURIComponent($('select[name="session_duration"]').val()),
	                         plan_duration_weeks : encodeURIComponent($('select[name="plan_duration_weeks"]').val()),
                		}),
                		success: function(result){
                			console.log(result);
                			
                			
                			
                			
                		},
                		error : function(){
                			console.log("ajax실패");
                		}
                	})
                    })
                })
                </script>
       
            </div>
        </div>
    </div>
</body>
</html>
