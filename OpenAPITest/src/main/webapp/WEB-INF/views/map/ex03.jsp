<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
    <style>
       #map{
           width : 770px;
           height : 500px;
       }
    </style>
</head>
<body>
    <!-- ex03.jsp -->
    <h1>Kakao Map<small>클릭 이벤트 + 마커 표시</small></h1>
    
    <div>
       <div id="map"></div>
    </div>
    <div class="message">&nbsp</div>
    
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://bit.ly/4cMuheh"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ddcd9c70e0695d62e0641186b159d71"></script>
    <script>
        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(37.499332, 127.033246), //지도의 중심좌표.
            level: 3 //지도의 레벨(확대, 축소 정도)
        };
    
        const map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
        
        //지도 클릭 이벤ㅌ트
        //당연히 안됨>카카오에서 만든게 잇음
        /* map.onclick = function(){
        	alert();
        }; */
        
        
        //마커 삭제하기 1단ㄱㅖ
        let m1 = null;
        let info = null;
        
        
        
        kakao.maps.event.addListener(map,'click',function(evt) {
        	//alert();
        	//alert(evt.latLng); 위도 &경도
        	
        	//클릭 좌표 표시
        	let msg = `클릭한 위치는 위도(\${evt.latLng.getLat()}), 경도(\${evt.latLng.getLng()}) 입니다.`;
        	$('.message').text(msg);
        	
        	//클릭 좌표  + 마커 표시
        	if(m1 != null){
        		//기존 마커가 존재O > 삭제
        		m1.setMap(null);
        		//info.open(null, null);
        	}
        	
        	m1 = new kakao.maps.Marker({
                position : evt.latLng
            });
        	
        	
        	//m1.setTitle('풍선도움말');
        	
        	
        	//이미지 마커
            const path = '/api/marker/default.png';
            const size = new kakao.maps.Size(64, 64);
            const op = {
                offset: new kakao.maps.Point(32, 64)
            };
            const img = new kakao.maps.MarkerImage(path, size, op);
            
            
            m1.setImage(img);
            m1.setMap(map); 
        	
        	
        	m1.setImage(img);
            m1.setMap(map);
        	//인포 윈도우
        	/* const info = new kakao.maps.InfoWindow({
        		//content : '정보창',
        		content : '<div style="padding : 5px; text-align : center;">정보창</div>',
        		position : evt.latLng
        	});
        	
        	info.open(map,m1);
 */
            
        });
        
        //지도에 마커 등록
        /* const m1 = new kakao.maps.Marker({
        	position : new kakao.maps.LatLng(37.499332, 127.033246)
        });
        
        //마커와 맵 연결
        //맵이 먼저 태어났으니까 마커가 맵을 선택
        m1.setMap(map); */
        
    </script>
</body>
</html>
















