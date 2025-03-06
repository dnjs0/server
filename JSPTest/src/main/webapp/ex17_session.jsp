<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    //세션에 데이터 추가하기
    session.setAttribute("a", 10);//세션변수
    application.setAttribute("b", 20);//어플리케이션 변수
    
    
    application.setAttribute("id", "hr");//어플리케이션 변수
    application.setAttribute("pw", "java1234");//어플리케이션 변수
    
    //상태유지를 가능하게 하는 도구 중 하나 > 세션 객체
    
    
    //방문 카운트
    if(session.getAttribute("count")==null){
        session.setAttribute("count", 1);
    }else{
         //count = count + 1
        session.setAttribute("count", (int)session.getAttribute("count")+1);
    }
    
    
    
    
  //방문 카운트
    if(application.getAttribute("count")==null){
        application.setAttribute("count", 1);
    }else{
         //count = count + 1
        application.setAttribute("count", (int)application.getAttribute("count")+1);
    }
    
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
<body class="narrow">
	<!-- ex17_session.jsp & application  -->
	<h1>session</h1>
	<div>a : <%=session.getAttribute("a") %></div>
	<div>b : <%=application.getAttribute("b") %></div>
	
	<div>count : <%=session.getAttribute("count") %></div>
	<div>count2 : <%=application.getAttribute("count") %></div>
	
	<div>
	   <a href="ex17_session_2.jsp">다른페이지</a>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>