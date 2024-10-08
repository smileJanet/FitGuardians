<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<!-- Custom fonts for this template-->
    <link href="resources/templates/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- FullCalendar cdn -->
    <script src="
    https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js
    "></script>

    <!-- 외부 css -->
    <link href="resources/css/traineeDetailInfo.css" rel="stylesheet" type="text/css">

</head>



    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
         <jsp:include page="../common/sideTrainer.jsp" />
         <div id="content-wrapper" class="d-flex flex-column">
         <!-- Main Content -->
             <div id="content">
                 <jsp:include page="../common/topBar.jsp"/>
                 <!-- Begin Page Content -->
                    <div class="container-fluid">
                        
                <!-- Page Heading -->
                <h1 class="h3 mb-4 text-gray-800" style="font-weight:600;"> ${m.userName}님 관리페이지</h1>

                <div class="row">

                    <div class="col-lg-6">
                       <!-- 회원정보 -->
                       <div class="card mb-3 py-4 border-left-primary">
                           <div class="card-body"  style="display:flex;">
                               <div style="margin-left:30px;">
                                   <div style="border-radius:50%; border:1px solid royalblue; width:150px; height:150px; overflow:hidden;">
                                       <img src="${ pageContext.request.contextPath }/resources/uploadFiles/manprofile.PNG" style="max-width:100%; max-height:100%; object-fit:cover;"/>
                                   </div>
                               </div>
                               <div style="margin-left:30px;">
                                   <div class = "traineeName">${m.userName}</div>
                                   <br/>
                                   <span>나이 : ${m.age}살</span> &nbsp;&nbsp;&nbsp;&nbsp; <span>성별: ${m.gender}</span> <br/>
                                   <span>키 : ${mi.height} cm</span> &nbsp;&nbsp;&nbsp;&nbsp; <span>몸무게 : ${mi.weight}kg</span> <br/>
                                   <span>골격근량 : ${lastSmm}&#37;</span> &nbsp;&nbsp;&nbsp;&nbsp; <span>BMI(체질량지수) : ${lastBmi}&#37;</span> &nbsp;&nbsp;&nbsp;&nbsp; <span>체지방량 :${lastFat} &#37;</span> <br/>
                                   <span>운동 목표 : ${mi.goal} </span> <br/>
                               </div>
                           </div>
                       </div>

                    <!-- 운동, 식단 플래너 -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">${m.userName}님의 운동, 식단 플래너</h6>
                        </div>
                        <div class="card-body">
                            <div style="height:165px;">
                                <span class="planner">운동 플래너</span>
                                <ul>
                                    <li>
                                        상체 : 깔쌈하게 운동하기(5회 5세트)
                                    </li>
                                    <li>
                                        코어 : 깔쌈하게 운동하기(5회 5세트)
                                    </li>
                                    <li>
                                        하체 : 깔쌈하게 운동하기(5회 5세트)
                                    </li>
                                </ul>
                            </div>
                            <br/>
                            <div style="height:165px;">
                                <span class="planner">식단 플래너</span>
                                <ul>
                                    <li>
                                        아침 : 깔쌈하게 운동하기(5회 5세트)
                                    </li>
                                    <li>
                                        점심 : 깔쌈하게 운동하기(5회 5세트)
                                    </li>
                                    <li>
                                        간식 : 깔쌈하게 운동하기(5회 5세트)
                                    </li>
                                    <li>
                                        저녁 : 깔쌈하게 운동하기(5회 5세트)
                                    </li>
                                </ul>
                            </div>
                            
                        </div>
                    </div>

                   </div>

                   <!-- 회원 PT스케줄 -->
                   <div class="col-lg-6" style="display:inline;">
                       <div class="card shadow mb-4">
                           <div class="card-header py-3">
                               <h6 class="m-0 font-weight-bold text-primary">${m.userName}님의 스케줄</h6>
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
                   
               <!-- 회원 신체 정보 -->
               <div class="card shadow mb-8">
                   <!-- Card Header - Dropdown -->
                   <div
                       class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                       <h6 class="m-0 font-weight-bold text-primary">${m.userName}님의 신체정보 관리</h6>
                  	  <button class="btn btn-info btn-circle" data-toggle="modal" data-target="#updateModal"><i class="fas fa-info-circle"></i></button>
                   </div>
                   <!-- Card Body -->
                   <div class="card-body">
                       
                       <div class="info-title">골격근량</div>
                       <div style="height:165px;"></div>

                       <div class="info-title">BMI(체질량지수) </div>
                       <div style="height:165px;"></div>

                       <div class="info-title">체지방량</div>
                       <div style="height:165px;"></div>

                   </div>
               </div>
               
               <!-- 키, 몸무게 입력 모달창 -->
               <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true" >
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title" id="updateModalLabel">측정하기</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body">
				                <form id="updateForm">
				                    <div class="form-group">
				                        <label for="height">키 (cm)</label>
				                        <input type="number" class="form-control" id="height" placeholder="키를 입력하세요">
				                    </div>
				                    <div class="form-group">
				                        <label for="weight">몸무게 (kg)</label>
				                        <input type="number" class="form-control" id="weight" placeholder="몸무게를 입력하세요">
				                    </div>
				                  <div class="bodyResult">
				                  
				                  </div>
				                </form>
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				                <button type="button" class="btn btn-primary" id="saveButton">측정하기</button>
				            </div>
				        </div>
				    </div>
				</div>
				
				<!-- 모달창 띄우기 스크립트 -->
				<script>
				
				$(document).ready(function(){
					
					// 데이터 출력하는 메소드
					$("#saveButton").on("click",function(){
						
						let traineeName = '${m.userName}';
						let traineeGender = '${m.gender}';
						let traineeAge = ${m.age};
						
						let height = $("#height").val();
						let heightMeter = height/100;
						let weight = $("#weight").val();
						
						
						console.log('키:', height);
						console.log('몸무게:', weight);
						
						if(traineeGender == 'F'){ // 여자 측정
							// smm - 골격근량
							let smm = 0.252 * weight + 0.473 * height - 48.3;
							// bmi - 체질량지수
							let bmi = weight / (heightMeter ** 2);
							// fat - 체지방량
							let fat = 1.20 * bmi + 0.23 * traineeAge - 5.4;
							
							let value = traineeName + "의 측정 결과입니다. <br />"
								       + "<span class='result' style='margin:10px'> · 골격근량 : </span> <span>" + smm.toFixed(1) + " </span> <br/> "
								       + "<span class='result' style='margin:10px'> · BMI(체질량지수) : </span> <span>" + bmi.toFixed(1) + " </span> <br/>"
								       + "<span class='result' style='margin:10px'> · 체지방량 : </span> <span>" + fat.toFixed(1) + " </span> ";
									   
							$('.bodyResult').attr('id', 'bodyResult');
							$('#bodyResult').html(value);
							$('#saveButton').text('저장하기');
							
							
						}else{ // 남자 측정
							// smm - 골격근량
							let smm = 0.407 * weight + 0.267 * height - 19.2;
							// bmi - 체질량지수
							let bmi = weight / (height ** 2);
							// fat - 체지방량
							let fat = 1.20 * bmi + 0.23 * traineeAge - 16.2;

							let value = traineeName + "의 측정 결과입니다. <br />"
								       + "<span class='result' style='margin:10px'> · 골격근량 : </span> <span>" + smm.toFixed(1) + " </span> <br/> "
								       + "<span class='result' style='margin:10px'> · BMI(체질량지수) : </span> <span>" + bmi.toFixed(1) + " </span> <br/>"
								       + "<span class='result' style='margin:10px'> · 체지방량 : </span> <span>" + fat.toFixed(1) + " </span> ";
									   
							$('.bodyResult').attr('id', 'bodyResult');
							$('#bodyResult').html(value);
							$('#saveButton').text('저장하기');
							
						}
						
					});
					
					// 데이터 DB에 저장하는 ajax
					
					
					
				})
				
				</script>

               </div>
             
             </div>
         </div>
        </div>
    </body>


</html>