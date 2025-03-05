<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    /* 
        A 페이지 > (이동) > B 페이지
        
        1. HTML
        - < a href="URL">
        - 사용자가 클릭
        
        2. JavaScript
        - location.href = 'URL';
        - 자유롭게 프로그래밍으로 제어 가능
        - 클라이언트 코드
        
        3. Servlet/JSP
        - response.senfRedirect("URL");
        - 자유롭게 프로그래밍으로 제어 가능
        - 서버 코드
        
    
    */
    
    //response.sendRedirect("ex14_response_2.jsp");
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
	<!-- ex14_response_1.jsp -->
	<h1>첫번째 페이지</h1>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	   location.href='ex14_response_2.jsp';
	</script>
</body>
</html>