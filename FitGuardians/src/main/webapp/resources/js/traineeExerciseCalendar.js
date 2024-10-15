// 캘린더 데이터 관리
document.addEventListener('DOMContentLoaded', function() {
                
// 캘린더 설정화면	
const calendarEl = document.getElementById('calendar');
const isDetailView = document.querySelector('.detail-view') !== null;
    calendar = new FullCalendar.Calendar(calendarEl, {
    themeSystem: 'bootstrap5',
    height: '600px',
    initialView: 'dayGridMonth',
    navLinks: true,
    editable: true,
    nowIndicator: true,
    dayMaxEvents: true,
    selectable: true,
    weekNumbers: true,
    displayEventTime: false,
    headerToolbar: {
        start: 'dayGridMonth,dayGridWeek,dayGridDay',
        center: 'title',
        end: 'today prev,next'+(isDetailView?'': ',addEventButton')
    },
    locale: 'ko',
    events: [], // 조회 시 추가됨
    customButtons: {
        addEventButton: {
            text: '기록하기',
            click: function() {
                $("#calendarModal").modal("show");
            }
        }
    },
    eventClick: function(info) {
        
        let plan = info.event;
        
        // 난이도에 대한 switch문 
        switch (plan.extendedProps.difficulty) {
        case 'M':
            difficultyLabel = '중간';
            break;
        case 'L':
            difficultyLabel = '쉬움';
            break;
        case 'H':
            difficultyLabel = '어려움';
            break;
        default:
            difficultyLabel = '없음';
        }
        
        // 표적에 대한 switch문 
        switch (plan.extendedProps.workoutCategory) {
        case 'UE':
            category = '상체';
            break;
        case 'ABS':
            category = '복부, 코어';
            break;
        case 'LE':
            category = '하체';
            break;
        default:
            category = '없음';
        }
        
        // 값 찍기
        $('#modalExerciseNo').text(plan.extendedProps.exerciseNo);
        $('#modalWorkoutTitle').text('제목: ' + plan.title);
        $('#modalWorkoutCategory').text(' 운동 표적: '+ category);
        $('#modalDifficulty').text('운동 난이도: ' + difficultyLabel);
        $('#modalDescription').text('운동 설명: '+ plan.extendedProps.description);
        
        // Show the modal
        $('#eventModal').modal('show');

    },
}); // calendar 로드 스크립트

calendar.render();

$('.selectTrainee').change(function(){
    let userName = $(this).find('option:selected').text(); // 선택된 회원의 이름 표시. val()은 회원의 아이디 표시
    let userId = $(this).find('option:selected').val(); // 선택된 회원의 아이디

    $('#trainee').text(userName + "님의 운동 계획하기");
    $('#addExerciseList').text(userName + "님의 운동 플랜 등록하기");

    if(userId !== "none"){
        $.ajax({
            url: "selectWorkout.ex",
            method : "post",

            data : {userId : userId},
            success: function(response){
    
                showWorkouts(response);
                setWorkoutPlan(response);
                
            },
            error : function(){
                console.log("조회 실패");
            },
        })
    }
})

});// document.addEventListener('DOMContentLoaded', function