<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬스장 검색</title>
<!-- 카카오 맵 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=57f0695801af1e56dd83dfbbcc27ad69&libraries=services"></script>
<style>
    #map {
        width: 100%;
        height: 400px;
    }
    #autocomplete-list {
        position: absolute;
        border: 1px solid #ccc;
        max-height: 150px;
        overflow-y: auto;
        z-index: 9999;
        background-color: white;
    }
    .autocomplete-item {
        padding: 10px;
        cursor: pointer;
    }
    .autocomplete-item:hover {
        background-color: #f0f0f0;
    }

</style>
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
                        주소 입력을 통하여 주변 헬스장을 검색하는 것도 가능합니다!</p>

                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-lg-6">
                            <!-- 현재 위치 -->
                            <div class="card mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">현재 위치</h6>
                                </div>
                                <div class="card-body">
                                    서울 특별시 강남구 역삼 1동
                                </div>
                            </div>

                            <!-- 주소 입력 -->
                            <div class="card mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">주소 입력</h6>
                                </div>
                                <div class="card-body">
                                    <div class="input-group">
                                        <input type="text" id="addressInput" style="border: 1px solid #ccc; padding: 0.5rem; flex: 1;" placeholder="주소를 입력하세요." autocomplete="off">
                                        <button type="button" class="btn btn-primary ms-2" id="searchBtn">확인</button>
                                    </div>
                                    <ul id="autocomplete-list" style="list-style-type: none; padding: 0; margin: 0;"></ul>
                                </div>
                            </div>

                            <!-- 가까운 헬스장 3개 -->
							<div class="card mb-4">
							    <div class="card-header py-3">
							        <h6 class="m-0 font-weight-bold text-primary">가까운 헬스장</h6>
							    </div>
							    <div class="card-body">
							        <ul id="nearby-gyms-list" style="list-style-type: none; padding: 0; margin: 0;"></ul>
							    </div>
							</div>
                        </div>

                        <div class="col-lg-6">
                            <!-- 지도 정보 -->
                            <div class="card">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">지도 정보</h6>
                                </div>
                                <div class="card-body text-center">
                                    <div id="map"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>
    // 지도를 표시할 div
    var mapContainer = document.getElementById('map');
    var mapOptions = {
        center: new kakao.maps.LatLng(37.508091, 127.063504), // 서울 강남구 역삼동 좌표
        level: 3, // 지도의 확대 레벨
    };

    var map = new kakao.maps.Map(mapContainer, mapOptions); // 지도 생성
    var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 }); // InfoWindow 생성
    // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
    var mapTypeControl = new kakao.maps.MapTypeControl();

    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    var zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
    


    // 가까운 헬스장 배열 초기화
    let nearbyGyms = []; // 가까운 헬스장을 저장할 배열

    // 주소 검색 및 관련 주소 표시
    function searchAddress(keyword) {
        const geocoder = new kakao.maps.services.Geocoder();

        if (keyword.length < 2) {
            document.getElementById('autocomplete-list').innerHTML = ''; // 최소 2자 이상일 경우에만 검색
            return;
        }

        geocoder.addressSearch(keyword, (result, status) => {
            const autocompleteList = document.getElementById('autocomplete-list');
            autocompleteList.innerHTML = ''; // 이전 검색 결과 초기화

            if (status === kakao.maps.services.Status.OK) {
                result.forEach(item => {
                    const li = document.createElement('li');
                    li.className = 'autocomplete-item';
                    li.textContent = item.address_name; // 주소명 표시
                    li.onclick = () => {
                        document.getElementById('addressInput').value = item.address_name; // 클릭 시 입력창에 값 넣기
                        autocompleteList.innerHTML = ''; // 리스트 초기화
                        searchGyms(item.address_name); // 선택한 주소로 헬스장 검색
                    };
                    autocompleteList.appendChild(li);
                });
                autocompleteList.style.display = 'block'; // 목록 표시
            } else {
                autocompleteList.style.display = 'none'; // 결과가 없을 경우 목록 숨김
            }
        });
    }
    // 헬스장 마커 이미지 커스텀
    const markerImageSrc = '/fitguardians/resources/images/gymMarker.png';
    const markerImageSize = new kakao.maps.Size(25,25); // 이미지 크기 설정
    const markerImage = new kakao.maps.MarkerImage(markerImageSrc, markerImageSize);

    // 헬스장 검색 및 마커 표시
    function searchGyms(address) {
        const places = new kakao.maps.services.Places();
        places.keywordSearch(address + " 헬스장", (data, status) => {
            if (status === kakao.maps.services.Status.OK) {
                let bounds = new kakao.maps.LatLngBounds();
                nearbyGyms = []; // 헬스장 검색 시 배열 초기화
                data.forEach(place => {
                    const marker = new kakao.maps.Marker({
                        map: map,
                        position: new kakao.maps.LatLng(place.y, place.x),
                        image:markerImage // 변경된 마커 이미지
                    });
                    bounds.extend(marker.getPosition());
                    
                    // 마우스 호버 이벤트 추가
                    
					// 마커에 마우스오버 이벤트 추가
					kakao.maps.event.addListener(marker, 'mouseover', function() {
						infowindow.setContent(
						        '<div style="padding: 5px; font-size: 12px; max-width: 300px; min-width: 200px; white-space: nowrap;">' + 
						            '<strong>' + place.place_name + '</strong><br>' + 
						            place.address_name + 
						        '</div>'
						);
					    // 인포윈도우를 마커 위치에 표시
					    infowindow.open(map, marker);
					});


					
					// 마커에 마우스아웃 이벤트를 등록
					kakao.maps.event.addListener(marker, 'mouseout', function() {
					    infowindow.close();
					});


                    // 가까운 헬스장 배열에 추가
                    nearbyGyms.push({
                        name: place.place_name,
                        address: place.address_name,
                        lat: place.y,
                        lng: place.x
                    });
                });
                map.setBounds(bounds);
                // 가까운 헬스장 3개를 표시하는 함수 호출
                displayNearbyGyms(nearbyGyms);
            } else {
                alert('헬스장을 찾을 수 없습니다.');
            }
        });
    }

    // 가까운 헬스장 3개를 표시하는 함수
    function displayNearbyGyms(gyms) {
        // 가까운 헬스장을 거리 기준으로 정렬
        gyms.sort((a, b) => {
            const distanceA = calculateDistance(a.lat, a.lng);
            const distanceB = calculateDistance(b.lat, b.lng);
            return distanceA - distanceB;
        });

        // 가까운 헬스장 3개만 선택
        const closestGyms = gyms.slice(0, 3);
        
        // 리스트에 추가
        const nearbyGymsList = document.getElementById('nearby-gyms-list');
        nearbyGymsList.innerHTML = ''; // 리스트 초기화
        closestGyms.forEach(gym => {
            const li = document.createElement('li');
            li.textContent = gym.name + ' - ' + gym.address; // 헬스장 이름과 주소 표시
            nearbyGymsList.appendChild(li);
        });
    }

    // 두 좌표 간 거리 계산하는 함수
    function calculateDistance(lat, lng) {
        const userLat = map.getCenter().getLat(); // 현재 사용자 위치 (중심 좌표)
        const userLng = map.getCenter().getLng();
        
        const radLat1 = Math.PI * userLat / 180;
        const radLat2 = Math.PI * lat / 180;
        const radLng1 = Math.PI * userLng / 180;
        const radLng2 = Math.PI * lng / 180;
        
        const dLat = radLat1 - radLat2;
        const dLng = radLng1 - radLng2;

        const distance = 6371 * Math.acos(Math.cos(radLat1) * Math.cos(radLat2) * Math.cos(dLng) + Math.sin(radLat1) * Math.sin(radLat2));
        return distance; // 반환되는 값은 거리 (km 단위)
    }

    // 주소 입력 시 자동완성 기능
    document.getElementById('addressInput').addEventListener('input', () => {
        const address = document.getElementById('addressInput').value;
        searchAddress(address); // 주소 검색 함수 호출
    });

    // 주소 입력 후 검색 버튼 클릭 이벤트
    document.getElementById('searchBtn').addEventListener('click', () => {
        const address = document.getElementById('addressInput').value;
        searchGyms(address); // 헬스장 검색 함수 호출
    });
 	
    // 엔터 키 입력 이벤트
    document.getElementById('addressInput').addEventListener('keypress', (event) => {
        if (event.key === 'Enter') { // 엔터 키가 눌렸을 때
            const address = document.getElementById('addressInput').value;
            searchGyms(address); // 헬스장 검색 함수 호출
        }
    });

    // 초기 로드 시 기본 주소의 헬스장 검색
    searchGyms('서울 강남구 역삼 1동');

    // 외부 클릭 시 자동완성 리스트 숨기기
    document.addEventListener('click', (event) => {
        const autocompleteList = document.getElementById('autocomplete-list');
        const addressInput = document.getElementById('addressInput');
        // 클릭한 대상이 입력창이나 자동완성 리스트가 아닐 경우
        if (event.target !== addressInput && !autocompleteList.contains(event.target)) {
            autocompleteList.innerHTML = ''; // 자동완성 리스트 숨김
        }
    });
</script>








</body>
</html>
