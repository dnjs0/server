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
	<!-- ex18_del.jsp -->
    <h1>세션값 삭제하기</h1>
    <%
       session.removeAttribute("data");
    
    /* 
        집합 > 요소 조작 > 메서드명 패턴
        - addXXXX() : 추가하기(append, 마지막에 추가)
        - insertXXX() : 추가하기(insert, 원하는 위치에 추가)
        - appendXXX() : 추가하기(append, 마지막에 추가)
        - prependXXX() : 추가하기(prepend, 맨앞에 추가)
        
        - setXXX() : 추가하기 or 수정하기
        - getXXX() : 가져오기
        
        - removeXXX() : 삭제하기
        - delXXX() : 잘 사용안함

        - isXXX() : 확인용(반환값 boolean)
        - containXX() : 확인용
    */
    %>
    <a href="ex18_session.jsp">돌아가기</a>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>