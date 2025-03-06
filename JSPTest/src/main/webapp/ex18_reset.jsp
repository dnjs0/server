<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
	div > a{display:block; margin-bottom:5px;}
	</style>
</head>
<body>
	<h1>세션값 초기화</h1>
    <%
        //내가 사용중인 세션 객체로 소멸 > 새로운 세션 객체를 할당
        session.invalidate();
    %>
    <a href="ex18_session.jsp">돌아가기</a>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>