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
    <!-- ex02.jsp -->
    <h1>Kakao Map</h1>
    
    <div>
       <div id="map"></div>
    </div>
    
    <hr>
    
    <div>
        <input type="button" value="한독빌딩으로 이동하기" id="btn1">
        <input type="button" value="상암경기장으로 이동하기" id="btn2">
        <input type="button" value="역삼역으로 이동하기" id="btn3">
    </div>
    <hr>
    <div>
        <input type="button" value="확대하기" id="btn4">
        <input type="button" value="축소하기" id="btn5">
    </div>
    
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
        
        map.setDraggable(false);
        map.setZoomable(false);
        
        $('#btn1').click(()=>{
        	const pos = new kakao.maps.LatLng(37.499332, 127.033246);
            //map.setCenter(pos);
        	map.panTo(pos);
        });
        $('#btn2').click(()=>{
        	const pos = new kakao.maps.LatLng(37.568402, 126.897378);
        	//map.setCenter(pos);
        	map.panTo(pos);
        });
        $('#btn3').click(()=>{
        	const pos = new kakao.maps.LatLng(37.500126, 127.035378);
            //map.setCenter(pos);
        	map.panTo(pos);
        });
        $('#btn4').click(()=>{
            //map.setLevel(1);
            map.setLevel(map.getLevel()-1);
        });
        
        $('#btn5').click(()=>{
            //map.setLevel(14);
            map.setLevel(map.getLevel()+1);
        });
        
    </script>
</body>
</html>
















