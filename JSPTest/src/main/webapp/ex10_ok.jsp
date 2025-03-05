<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    //post로 보내면 인코딩 하기!1
    request.setCharacterEncoding("UTF-8");

    //request.getParameter(String key)
    //1. 컨트롤 값 입력하면 > 입력값 반환
    //2. 입력을 안하면 > "" 반환
    //3. key가 존재 안하면 > null 반환

    //텍스트 박스
    String txt1 = request.getParameter("txt1");
    
    System.out.println(txt1 == null); //false
    System.out.println(txt1 == "");   //true

    
    
    //암호상자
    String txt2 = request.getParameter("txt2");
    
    
    //멀티 텍스ㅌ트
    String txt3 = request.getParameter("txt3");
    txt3= txt3.replace("\r\n","<br>");
    
    
    //체크 박스
    //1. value 작성 O
    //  - 체크 O > value 전송, value없으면 on 전송
    //  - 체크 X > null
    String cb1 = request.getParameter("cb1");
    
    
    //체크 박스들
    String cb2 = request.getParameter("cb2");
    String cb3 = request.getParameter("cb3");
    String cb4 = request.getParameter("cb4");
    
    String temp = "";
    temp += cb2+",";
    temp += cb3+",";
    temp += cb4+",";
    
    //cb2 > cb3 > cb4
    for(int i=2; i<= 4; i++){
        temp += request.getParameter("cb" +i)+",";
    }
    
    
    
    //체크 박스들2 (cb5 3개)
    /* String cb5 = request.getParameter("cb5"); //첫번째 항목만 반환
    System.out.println(cb5); */
    
    //getParameterValues메서드 >  배열로 넘김
    String[] cb5 = request.getParameterValues("cb5");
    
    
    
    //라디오 벝튼
    String rb= request.getParameter("rb");
    
    
    
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
	
	</style>
</head>
<body>
	<!-- ex10_ok.jsp -->
	<h1>결과</h1>
	
	<h2>텍스트 박스</h2>
	<div><%= txt1 %></div>
	
	<h2>암호 상자</h2>
    <div><%= txt2 %></div>
    
	<h2>멀티 텍스트</h2>
    <div><%= txt3 %></div>
    
    <h2>체크박스</h2>
    <div><%= cb1 %></div>
    
    <h2>체크박스들</h2>
    <div><%= temp %></div>
    
    <h2>체크박스들2</h2>
    <div><%=Arrays.toString(cb5) %></div>
    
    <h2>라디오 버튼</h2>
    <div><%= rb %></div>
    
    
    
    
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>