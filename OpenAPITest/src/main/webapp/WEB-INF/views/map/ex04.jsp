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
    <!-- ex04.jsp -->
    <h1>Kakao Map</h1>
    
    <div>
       <div id="map"></div>
    </div>
    <hr>
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
        
        //DB의 좌표 > 자바스크리브 배열
        const mlist = [
        	/* { 이 스타일로 만들기 ~
        		seq : 1,
        		lat : 37.49933,
        		lng : 127.033181
        	} */
        ];
        
        <c:forEach items="${list}" var="dto">
        //${dto.seq}, ${dto.lat}, ${dto.lng}
        mlist.push({
        	seq : ${dto.seq}, 
        	lat : ${dto.lat}, 
        	lng : ${dto.lng}
        });
        </c:forEach>
        
        
        mlist.forEach(item => {
            const m = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(item.lat, item.lng)
            });
            m.setMap(map);
        });
        
      //현재 보이는 지도상(영역)의 나타난 마커의 개수 세기
        let count;
        
        function countMarker() {
            
            count = 0;
            
            mlist.forEach(item => {
                if (containMarker(item)) {
                    count++;
                }                   
            });
            
            $('.message').text(`현재 보이는 마커의 개수는 \${count}개입니다.`);
            
        }
        
        function containMarker(item) {
            
            //현재 지도의 범위?
            const sw = map.getBounds().getSouthWest(); //LatLng
            const ne = map.getBounds().getNorthEast();
            
            if (item.lat >= sw.getLat()
                && item.lat <= ne.getLat()
                && item.lng >= sw.getLng()
                && item.lng <= ne.getLng()) {
                
                return true;
            }
            
            return false;           
        }
        
        countMarker();
        
        
        //지도 이벤트(드래그)
        kakao.maps.event.addListener(map, 'dragend', function(evt) {
            countMarker();
        });
        
        //지도 이벤트(줌 인/아웃)
        kakao.maps.event.addListener(map, 'zoom_changed', function(evt) {
            countMarker();
        });
        

    </script>
</body>
</html>
















